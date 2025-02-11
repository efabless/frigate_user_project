from caravel_cocotb.caravel_interfaces import test_configure
from cocotb.handle import Force, Release
from cocotb.triggers import RisingEdge, ClockCycles
import cocotb
from cocotb.clock import Clock
import oyaml as yaml
from all_tests.cheetah_env import Cheetah_env

def read_config_file():
    config_file = f"{cocotb.plusargs['SIM_DIR']}/configs.yaml".replace('"', "")

    with open(config_file) as file:
        # The FullLoader parameter handles the conversion from YAML
        # scalar values to Python the dictionary format
        configs = yaml.load(file, Loader=yaml.FullLoader)

        # print(configs)
        return configs

async def test_configure_ml(dut, timeout_cycles=3346140, reset_jtag=True, modify_flash_ctr=True, start_up=True):
    if "GL" not in cocotb.plusargs:
        caravelEnv = await test_configure(dut, timeout_cycles=timeout_cycles, start_up=False, num_error=200,)
        cheetah_env = Cheetah_env(dut)
        cheetah_env.clock_obj = caravelEnv.clock_obj
        caravelEnv = cheetah_env
        # await clock_generated(dut)
        if start_up:
            await caravelEnv.power_up()
            await caravelEnv.reset()
        # await caravelEnv.disable_bins(ignore_bins=[])
        # configure_ext_jtag_clk(dut, caravelEnv.get_clock_obj().period/1000, reset_jtag)
        # CPU_Model(caravelEnv)
        # change soft number of cycles for the counters 
        if modify_flash_ctr:
            dut.uut.frigate_core.soc.flash_ctrl.FC.RESET.counter.value = 950
        # TODO: remove this when Tim connected analog signal
    else:
        # configure_ext_jtag_clk(dut, read_config_file()['clock'], reset_jtag)
        caravelEnv = await test_configure(dut, timeout_cycles=timeout_cycles, start_up=False, num_error=200,)
        cheetah_env = Cheetah_env(dut)
        cheetah_env.clock_obj = caravelEnv.clock_obj
        caravelEnv = cheetah_env
        # if "GL_SDF" in cocotb.plusargs:
        #     force_fork = await cocotb.start(gl_forces(caravelEnv))
            # caravelEnv.dut.resetb_tb.value = 0
        await caravelEnv.power_up()
        await caravelEnv.reset()
        # await caravelEnv.disable_bins([25, 34])
        # caravelEnv.drive_gpio_in(33, 0)
        # caravelEnv.drive_gpio_in((36, 35), 0)
        # caravelEnv.drive_gpio_in(2, 0)
        counter_start = 950
        # dut.uut.frigate_core.soc_flash_ctrl_FC_RESET_counter.value = counter_start
        # dut.uut.frigate_core.soc_flash_ctrl_FC_RESET_N49.value = counter_start & 1
        # dut.uut.frigate_core.soc_flash_ctrl_FC_RESET_N50.value = (counter_start >> 1) & 1
        if modify_flash_ctr:
            reset_flash_ctrl(caravelEnv)
            for i in range(10):
                # dut.uut.frigate_core.soc_flash_ctrl._id(fr"\FC_RESET_counter[{i}] ", False).value = (counter_start >> i) & 1
                dut.uut.frigate_core._id(fr"\soc.flash_ctrl .\FC_RESET_counter[{i}] ", False).value = (counter_start >> i) & 1

    dut.uut.frigate_core.sio_vohref.value = 1
    caravelEnv.user_hdl = caravelEnv.dut.uut.frigate_core.user_project
    return caravelEnv


def reset_flash_ctrl(caravelEnv):
    for i in range(4096):
        # caravelEnv.dut.uut.frigate_core.soc_flash_ctrl._id(fr"\CACHE_LINES[{i}] ", False).value = 0
        caravelEnv.dut.uut.frigate_core._id(fr"\soc.flash_ctrl .\CACHE_LINES[{i}] ", False).value = 0
    for i in range(448):
        # caravelEnv.dut.uut.frigate_core.soc_flash_ctrl._id(fr"\CACHE_LINES[{i}] ", False).value = 0
        caravelEnv.dut.uut.frigate_core._id(fr"\soc.flash_ctrl .\CACHE_LINES[{i}] ", False).value = 0


async def gl_forces(caravelEnv):
    clk_rst_inst = r"\soc.ahb0_sys.clk_rst_manager.inst_to_wrap "
    caravelEnv.user_hdl._id(clk_rst_inst, False).por_fb_in.value = Force(0)
    for j in range(4):
        for i in range(16):
            caravelEnv.user_hdl._id(clk_rst_inst, False)._id(f"\PoR.shift_reg{j}[{i}] ", False).value = Force(0)
    for i in range(8):
        caravelEnv.user_hdl._id(clk_rst_inst, False)._id(f"\PoR.clk_div[{i+1}] ", False).value = Force(0)

    # caravelEnv.user_hdl._id(clk_rst_inst, False)._id("sel_mux0", False).value = Force(0)
    # caravelEnv.user_hdl._id(clk_rst_inst, False)._id("sel_mux1", False).value = Force(0)
    # caravelEnv.user_hdl._id(clk_rst_inst, False)._id("sel_mux2", False).value = Force(0)
    caravelEnv.user_hdl._id(clk_rst_inst, False)._id("_016_", False).value = Force(0)
    caravelEnv.user_hdl._id(clk_rst_inst, False)._id("_015_", False).value = Force(0)
    caravelEnv.user_hdl._id(clk_rst_inst, False)._id("net47", False).value = Force(0)
    await ClockCycles(caravelEnv.clk, 20)
    # await Timer(250, units='ns')
    caravelEnv.user_hdl._id(clk_rst_inst, False).por_fb_in.value = Release()
    await ClockCycles(caravelEnv.clk, 20)
    # await Timer(100, units='ns')
    for i in range(8):
        caravelEnv.user_hdl._id(clk_rst_inst, False)._id(f"\PoR.clk_div[{i+1}] ", False).value = Release()
    cocotb.log.info("[gl_forces] release clk div")
    await ClockCycles(caravelEnv.clk, 40)
    # await Timer(2000, units='ns')
    for j in range(4):
        for i in range(16):
            caravelEnv.user_hdl._id(clk_rst_inst, False)._id(f"\PoR.shift_reg{j}[{i}] ", False).value = Release()
    # for i in range(4):
    #     caravelEnv.user_hdl._id(clk_rst_inst, False)._id(f"\PoR.cmp{i} ", False).value = Force(1)
    # caravelEnv.user_hdl._id(clk_rst_inst, False)._id("\RST_SYNC.rst_sync[2] ", False).value = Force(1)

    cocotb.log.info("[gl_forces] release shift regs")
    await RisingEdge(caravelEnv.user_hdl._id(clk_rst_inst, False).rst_n)
    cocotb.log.info("[gl_forces] release rst_n")
    # await Timer(200, units='ns')
    caravelEnv.user_hdl._id(clk_rst_inst, False)._id("_016_", False).value = Release()
    caravelEnv.user_hdl._id(clk_rst_inst, False)._id("_015_", False).value = Release()
    caravelEnv.user_hdl._id(clk_rst_inst, False)._id("net47", False).value = Release()


    # force MUV.por_fb_in = 0;
    # force MUV.\PoR.shift_reg0[0] = 0;

    # force MUV.\PoR.clk_div[1]  = 0;

    # force MUV._016_ = 0;
    # force MUV._015_ = 0;
    # force MUV._017_ = 0;
    # #100;
    # release MUV.por_fb_in;
    # #100;
    # release MUV.\PoR.clk_div[1] ;
    # #2000;
    # release MUV.\PoR.shift_reg0[0] ;
    # wait(rst_n == 1);
    # #200;
    # release MUV._016_;
    # release MUV._015_;
    # release MUV._017_;


def configure_ext_jtag_clk(dut, period_clk=25, reset_jtag=True):
    cocotb.log.info(f"[configure_ext_jtag_clk] set ext clk to {period_clk}ns")
    clk = dut.gpio56
    clock_obj = Clock(clk, period_clk, "ns")  # Create a 25ns period clock on port clk
    cocotb.start_soon(clock_obj.start())  # Start the clock

    if reset_jtag:
        cocotb.log.info("[configure_ext_jtag_clk] reset jtag")
        dut.gpio57.value = 0
    return clock_obj

async def clock_generated(dut):
    clock_500k = dut.uut.frigate_core.soc.ahb0_sys.clk_sys.instance_to_wrap.rcosc_500k
    clock_16m  = dut.uut.frigate_core.soc.ahb0_sys.clk_sys.instance_to_wrap.rcosc_16m
    clock_hsxo = dut.uut.frigate_core.soc.ahb0_sys.clk_sys.instance_to_wrap.hsxo 
    clock_lsxo = dut.uut.frigate_core.soc.ahb0_sys.clk_sys.instance_to_wrap.lsxo
    cocotb.start_soon(Clock(clock_500k, 2000, 'ns').start())
    cocotb.start_soon(Clock(clock_16m,  62.5, 'ns').start())
    cocotb.start_soon(Clock(clock_hsxo, 62.5, 'ns').start())
    cocotb.start_soon(Clock(clock_lsxo, 31250, 'ns').start())
