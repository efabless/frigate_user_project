from caravel_cocotb.scripts.verify_cocotb.RunTest import RunTest, bcolors
import os
import shlex
import shutil
import caravel_cocotb


class UserRunTest(RunTest):
    def __init__(self, args, paths, test, logger) -> None:
        super().__init__(args, paths, test, logger)

    def hex_generate(self) -> str:
        # get the test path from dv/cocotb
        test_path = self.test_path()
        # Create a new hex_files directory because it does not exist
        if not os.path.exists(f"{self.paths.SIM_PATH}/hex_files"):
            os.makedirs(f"{self.paths.SIM_PATH}/hex_files")
        self.hex_dir = f"{self.paths.SIM_PATH}/hex_files/"
        self.c_file = f"{test_path}/{self.test.name}.c"
        command = self.hex_riscv_command_gen()

        docker_dir = f"-v {self.hex_dir}:{self.hex_dir} -v {self.paths.RUN_PATH}:{self.paths.RUN_PATH} -v {self.paths.FRIGATE_ROOT}:{self.paths.FRIGATE_ROOT} -v {self.paths.MCW_ROOT}:{self.paths.MCW_ROOT} -v {self.test.test_dir}:{self.test.test_dir} {' '.join([f'-v {link}:{link} ' for link in self.get_ips_fw()])} "
        docker_dir = (docker_dir + f"-v {self.paths.USER_PROJECT_ROOT}:{self.paths.USER_PROJECT_ROOT}")
        docker_command = self.docker_command_str(docker_image="efabless/dv:cocotb_hazard", docker_dir=docker_dir, command=command)
        # don't run with docker with arm
        cmd = command if self.args.cpu_type == "ARM" else docker_command
        hex_gen_state = self.run_command_write_to_file(cmd, self.test.hex_log, self.logger, quiet=False if self.args.verbosity == "debug" else True)
        self.firmware_log = open(self.test.hex_log, "a")
        if hex_gen_state != 0:
            # open(self.test.firmware_log, "w").write(stdout)
            raise RuntimeError(
                f"{bcolors.FAIL}Error:{bcolors.ENDC} Fail to compile the C code for more info refer to {bcolors.OKCYAN }{self.test.hex_log}{bcolors.ENDC } "
            )
        self.firmware_log.write("Pass: hex generation")
        self.firmware_log.close()
        # move hex file to the test
        shutil.copyfile(f"{self.test.hex_dir}/{self.test.name}.hex", f"{self.test.test_dir}/firmware.hex")
        return "hex_generated"
    
    def hex_riscv_command_gen(self):
        FIRMWARE_PATH = f"{self.paths.FRIGATE_ROOT}/verilog/dv/firmware"
        test_name = f"{self.test.name}"
        GCC_PATH = "/opt/riscv/bin"
        GCC_PREFIX = "riscv32-unknown-elf"
        GCC_COMPILE = f"{GCC_PATH}/{GCC_PREFIX}"
        if self.test.name in ["conv2d", "mfcc_frame_compute"]:
            STARTUP_SCRIPT = f"{FIRMWARE_PATH}/crt0_sram_32K.S"
        else:
            STARTUP_SCRIPT = f"{FIRMWARE_PATH}/crt0.S"
        if self.test.name in ["sram1_sequential", "sram1_inversion"]:
            LINKER_SCRIPT = f"-Wl,-Bstatic,-T,{FIRMWARE_PATH}/linker_sram0.ld,--strip-debug"
        elif self.test.name in ["ram_as_flash", "clk_transition", "sleep_transition", "float_measure"]:
            LINKER_SCRIPT = f"-Wl,-Bstatic,-T,{FIRMWARE_PATH}/linker_no_flash.ld,--strip-debug"
        elif self.test.name in ["conv2d", "mfcc_frame_compute"]:
            LINKER_SCRIPT = f"-Wl,-Bstatic,-T,{FIRMWARE_PATH}/linker_user_sram32K.ld,--strip-debug"
        else:
            LINKER_SCRIPT = f"-Wl,--verbose,-Bstatic,-T,{FIRMWARE_PATH}/linker.ld,--strip-debug"
        CPUFLAGS = [
            "-g",
            "-march=rv32imc_zicsr",
            "-mabi=ilp32",
            "-D__vexriscv__",
            "-ffreestanding",
            "-nostdlib",
            "-fno-math-errno",
            "-O2"
        ]
        includes = [
            f"-I{ip}" for ip in self.get_ips_fw()
        ] + [
            f"-I{FIRMWARE_PATH}",
            f"-I{FIRMWARE_PATH}/APIs",
            f"-I{FIRMWARE_PATH}/APIs/copied",
            f"-I{self.paths.USER_PROJECT_ROOT}/verilog/dv/cocotb",
            f"-I{self.paths.USER_PROJECT_ROOT}/verilog/dv/cocotb/stress_tests",
        ]
        startup_command = [
            f"{GCC_COMPILE}-gcc",
            *includes,
            *CPUFLAGS,
            LINKER_SCRIPT,
            "-c", "-o", f"{self.hex_dir}/crt0.o",
            STARTUP_SCRIPT,
        ]
        c_command = [
            f"{GCC_COMPILE}-gcc",
            *includes,
            *CPUFLAGS,
            LINKER_SCRIPT,
            "-c", "-o", f"{self.hex_dir}/{test_name}.o",
            self.c_file
        ]
        elf_command = [
            f"{GCC_COMPILE}-gcc",
            *includes,
            *CPUFLAGS,
            LINKER_SCRIPT,
            "-o", f"{self.hex_dir}/{test_name}.elf",
            f"{self.hex_dir}/{test_name}.o", f"{self.hex_dir}/crt0.o",
            "-L/opt/riscv/riscv32-unknown-elf/lib/rv32i/ilp32/",
            "-lm",
            "-L/opt/riscv/lib/gcc/riscv32-unknown-elf/12.2.0/rv32i/ilp32/",
            "-lgcc",
        ]
        
        lst_command = [
            f"{GCC_COMPILE}-objdump",
            "-D",
            "-S",
            "-x",
            "-g",
            f"{self.hex_dir}/{test_name}.elf",
        ]
        lst_out = f" > '{self.hex_dir}/{test_name}.lst'"
        
        bin_command = [
            f"{GCC_COMPILE}-objcopy",
            "-O",
            "binary",
            f"{self.hex_dir}/{test_name}.elf",
            f"{self.hex_dir}/{test_name}.bin",
        ]

        hex_command = [
            f"{GCC_COMPILE}-objcopy",
            "-O",
            "verilog",
            f"{self.hex_dir}/{test_name}.elf",
            f"{self.hex_dir}/{test_name}.hex",
        ]
        
        sed_command = [
            "sed",
            "-ie",
            "s/@10/@00/g",
            f"{self.hex_dir}/{test_name}.hex",
        ]

        return " && ".join([
            shlex.join(c_command),
            shlex.join(startup_command),
            shlex.join(elf_command),
            shlex.join(lst_command) + lst_out,
            shlex.join(hex_command),
            shlex.join(sed_command),
            shlex.join(bin_command),
            
        ])

        return [elf_command, lst_command, hex_command, sed_command, bin_command]

        
    def get_ips_fw(self, flag_type="-I"):
        fw_list = []
        for file in os.listdir(f"{self.paths.FRIGATE_ROOT}/ip"):
            if os.path.isdir(f"{self.paths.FRIGATE_ROOT}/ip/{file}"):
                for f in os.listdir(f"{self.paths.FRIGATE_ROOT}/ip/{file}"):
                    if f == "fw":
                        fw_list.append(os.path.realpath(f"{self.paths.FRIGATE_ROOT}/ip/{file}/{f}"))
        # send it as string
        # ips_fw = f"{flag_type}" + f" {flag_type}".join(fw_list)
        return fw_list

    def write_vcs_includes_file(self):
        self.vcs_dirs = f'+incdir+\\"{self.paths.FRIGATE_ROOT}/verilog/rtl\\" +incdir+\\"{self.paths.FRIGATE_ROOT}/verilog/rtl/hazard3/includes\\" ' if self.test.sim == "RTL" else ""
        self.test.set_user_project()

    def write_iverilog_includes_file(self):
        self.iverilog_dirs = f'-I {self.paths.FRIGATE_ROOT}/verilog/rtl -I {self.paths.FRIGATE_ROOT}/verilog/rtl/hazard3/includes' if self.test.sim == "RTL" else ""
        self.test.set_user_project()
        
    def _iverilog_docker_command_str(self, command=""):
        self.find_symbolic_links(self.paths.USER_PROJECT_ROOT)
        """the docker command without the command that would run"""
        env_vars = f"-e COCOTB_RESULTS_FILE={os.getenv('COCOTB_RESULTS_FILE')} -e FRIGATE_ROOT={self.paths.FRIGATE_ROOT} -e VERILOG_PATH={self.paths.VERILOG_PATH} -e PDK_ROOT={self.paths.PDK_ROOT} -e PDK={self.paths.PDK} -e USER_PROJECT_VERILOG={self.paths.USER_PROJECT_ROOT}/verilog"
        local_caravel_cocotb_path = caravel_cocotb.__file__.replace("__init__.py", "")
        docker_caravel_cocotb_path = "/usr/local/lib/python3.8/dist-packages/caravel_cocotb/"
        docker_dir = f"-v {self.paths.RUN_PATH}:{self.paths.RUN_PATH} -v {self.paths.FRIGATE_ROOT}:{self.paths.FRIGATE_ROOT} -v {self.paths.MCW_ROOT}:{self.paths.MCW_ROOT} -v {self.paths.PDK_ROOT}:{self.paths.PDK_ROOT} -v {local_caravel_cocotb_path}:{docker_caravel_cocotb_path} "
        docker_dir += (f"-v {self.paths.USER_PROJECT_ROOT}:{self.paths.USER_PROJECT_ROOT}")
        docker_dir += " ".join([f' -v {link}:{link} ' for link in self.find_symbolic_links(self.paths.FRIGATE_ROOT)])
        if os.path.exists("/mnt/scratch/"):
            docker_dir += " -v /mnt/scratch/cocotb_runs/:/mnt/scratch/cocotb_runs/ "
        display = " -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/.Xauthority --network host --security-opt seccomp=unconfined "
        command = self.docker_command_str(docker_image="efabless/dv:cocotb", docker_dir=docker_dir, env_vars=env_vars, addtional_switchs=display, command=command)
        return command

    def iverilog_compile(self):
        macros = " -D" + " -D".join(self.test.macros)
        compile_command = (
            f"cd {self.test.compilation_dir} &&"
            f"iverilog -g2012 -Ttyp {macros} {self.iverilog_dirs} -o {self.test.compilation_dir}/sim.vvp -s caravel_top"
            f" {self.paths.FRIGATE_ROOT}/verilog/vip/toplevel_cocotb.v"
        )
        docker_compilation_command = self._iverilog_docker_command_str(compile_command)
        self.run_command_write_to_file(
            docker_compilation_command if not self.args.no_docker else compile_command,
            self.test.compilation_log,
            self.logger,
            quiet=False if self.args.verbosity == "debug" else True
        )


    def vcs_compile(self):
        macros = " +define+" + " +define+".join(self.test.macros)
        vlogan_cmd = f"cd {self.test.compilation_dir}; vlogan -full64 -negdelay -sverilog +error+30 {self.paths.FRIGATE_ROOT}/verilog/vip/toplevel_cocotb.v {self.vcs_dirs}  {macros}   -l {self.test.compilation_dir}/analysis.log -o {self.test.compilation_dir} "
        self.run_command_write_to_file(vlogan_cmd, self.test.compilation_log, self.logger, quiet=False if self.args.verbosity == "debug" else True)
        lint = "+lint=all" if self.args.lint else ""
        ignored_errors = " -error=noZMMCM "
        vcs_cmd = f"cd {self.test.compilation_dir};  vcs -negdelay {lint} +lint=TFIPC-L {self.vcs_coverage_command} {ignored_errors}-debug_access+all +error+50 +vcs+loopreport+1000000 -diag=sdf:verbose +sdfverbose +neg_tchk -debug_access -full64  -l {self.test.compilation_dir}/test_compilation.log  caravel_top -Mdir={self.test.compilation_dir}/csrc -o {self.test.compilation_dir}/simv +vpi -P pli.tab -load $(cocotb-config --lib-name-path vpi vcs)"
        self.run_command_write_to_file(
            vcs_cmd,
            self.test.compilation_log,
            self.logger,
            quiet=False if self.args.verbosity == "debug" else True
        )

    def find_symbolic_links(self, directory):
        sym_links = []
        for root, dirs, files in os.walk(directory):
            for dir_name in dirs:
                dir_path = os.path.join(root, dir_name)
                if os.path.islink(dir_path):
                    sym_links.append(dir_path)
        return sym_links
