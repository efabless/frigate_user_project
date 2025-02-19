from caravel_cocotb.caravel_interfaces import Caravel_env
from cocotb.handle import SimHandleBase
import cocotb
from collections.abc import Iterable
from cocotb.handle import Release
from cocotb.triggers import ClockCycles, Timer
from cocotb.handle import Force, Release

class Frigate_env(Caravel_env):
    def __init__(self, dut: SimHandleBase):
        super().__init__(dut)
        self.active_gpios_num = 72

    async def start_up(self):
        """Start carvel by insert power then reset"""
        await self.power_up()
        await self.reset()

    async def reset(self):
        """Reset caravel"""
        # initial value of reset is x
        cocotb.log.info(" [caravel] start resetting")
        self.dut.resetb_tb.value = Force(0)
        await Timer(20*3, "ns")
        # await ClockCycles(self.clk, 20)
        self.dut.resetb_tb.value = Force(1)
        await ClockCycles(self.clk, 1)
        # await Timer(20, "ns")
        cocotb.log.info(" [caravel] finish resetting")

    def set_vdd(self, value: bool):
        self.dut.vccd0_0.value = value
        self.dut.vccd0_1.value = value
        self.dut.vccd1_0.value = value
        self.dut.vccd1_1.value = value
        self.dut.vccd1_2.value = value
        self.dut.vccd2_0.value = value
        self.dut.vccd2_1.value = value
        self.dut.vccd2_2.value = value
        self.dut.vdda0_0.value = value
        self.dut.vdda1_0.value = value
        self.dut.vdda2_0.value = value
        self.dut.vdda2_1.value = value
        self.dut.vdda3_0.value = value
        self.dut.vddio_0.value = value
        self.dut.vddio_1.value = value
        self.dut.vddio_2.value = value
        self.dut.vddio_3.value = value
        self.dut.vddio_4.value = value
        self.dut.vddio_5.value = value
        self.dut.vddio_6.value = value
        self.dut.vddio_7.value = value
        self.dut.vddio_8.value = value
        self.dut.vddio_9.value = value
        self.dut.vssd0_0.value = 0
        self.dut.vssd0_1.value = 0
        self.dut.vssd1_0.value = 0
        self.dut.vssd1_1.value = 0
        self.dut.vssd1_2.value = 0
        self.dut.vssd2_0.value = 0
        self.dut.vssd2_1.value = 0
        self.dut.vssd2_2.value = 0
        self.dut.vssa0_0.value = 0
        self.dut.vssa1_0.value = 0
        self.dut.vssa1_1.value = 0
        self.dut.vssa2_0.value = 0
        self.dut.vssa2_1.value = 0
        self.dut.vssa3_0.value = 0
        self.dut.vssio_0.value = 0
        self.dut.vssio_1.value = 0
        self.dut.vssio_2.value = 0
        self.dut.vssio_3.value = 0
        self.dut.vssio_4.value = 0
        self.dut.vssio_5.value = 0
        self.dut.vssio_6.value = 0
        self.dut.vssio_7.value = 0
        self.dut.vssio_8.value = 0
        self.dut.vssio_9.value = 0


    def monitor_gpio(self, h_bit, l_bit=None) -> cocotb.binary.BinaryValue:
        if isinstance(h_bit, Iterable):
            l_bit = h_bit[1]
            h_bit = h_bit[0]
        if l_bit is None:
            l_bit = h_bit
        range_size = h_bit - l_bit + 1
        bin_str = ""
        for i in range(range_size):
            bin_str += self._monitor_io(l_bit + i).binstr
        mprj_out = cocotb.binary.BinaryValue(value=bin_str)
        return mprj_out

    def _monitor_io(self, io_num):
        return self.dut._id(f"gpio{io_num}", False).value

    def drive_gpio_in(self, bits, data) -> None:
        is_list = isinstance(bits, Iterable)
        if is_list:
            data_bits = cocotb.binary.BinaryValue(
                value=data, n_bits=bits[0] - bits[1] + 1, bigEndian=(bits[0] < bits[1])
            )
            for i, bits2 in enumerate(range(bits[1], bits[0] + 1)):
                self._drive_io(bits2, data_bits[i])
        else:
            self._drive_io(bits, data)

    def _drive_io(self, io_num, bit):
        self.dut._id(f"gpio{io_num}", False).value = bit

    def release_gpio(self, bits):
        is_list = isinstance(bits, Iterable)
        if is_list:
            for i, bits2 in enumerate(range(bits[1], bits[0] + 1)):
                self._release_io(bits2)
        else:
            self._release_io(bits)

    def _release_io(self, io_num):
        cocotb.log.debug(f"Releasing gpio{io_num}")
        # self._drive_io(io_num, 0)
        self.dut._id(f"gpio{io_num}", False) <= Release()
