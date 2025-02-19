import cocotb
from cocotb.triggers import ClockCycles
from cocotb.binary import BinaryValue


class GPIOsPort:
    def __init__(self,caravelEnv, pins):
        self.pins = pins
        self.caravelEnv = caravelEnv

    async def wait_gpio_pin(self, pin, data: int) -> None:
        is_list = isinstance(pin, (list, tuple))
        data_s = str(data) if not is_list else format(data, f'0{pin[0] - pin[1] + 1}b')
        while True:
            if is_list:
                if data_s == self.monitor_gpio(pin[0], pin[1]).binstr:
                    break
            else:
                if data_s == self.monitor_gpio(pin).binstr:
                    break
            await ClockCycles(self.caravelEnv.clk, 1)

    def monitor_gpio(self, h_bit, l_bit=None) -> BinaryValue:
        if l_bit is None:
            return self.caravelEnv.monitor_gpio(self.pins[h_bit])
        else:
            bins_arr = [self.pins[i] for i in range(h_bit, l_bit-1, -1)]
            return cocotb.binary.BinaryValue(value=self.caravelEnv.monitor_discontinuous_gpios(bins_arr))

    def drive_gpio_in(self, pins, data: int):
        is_list = isinstance(pins, (list, tuple))
        if is_list:
            cocotb.log.debug(f"[{self.__class__.__name__}] drive gpio in ({self.pins[pins[0]]}, {self.pins[pins[1]]}) with data {data}")
            self.caravelEnv.drive_gpio_in((self.pins[pins[0]], self.pins[pins[1]]), data)
        else:
            cocotb.log.debug(f"[{self.__class__.__name__}] drive gpio in ({self.pins[pins]}) with data {data}")
            self.caravelEnv.drive_gpio_in(self.pins[pins], data)

    def release_gpio(self, pins):
        is_list = isinstance(pins, (list, tuple))
        if is_list:
            self.caravelEnv.release_gpio((self.pins[pins[0]], self.pins[pins[1]]))
        else:
            self.caravelEnv.release_gpio(self.pins[pins])



class GPIOsPortA(GPIOsPort):
    def __init__(self, caravelEnv):
        super().__init__(caravelEnv, pins=[8, 9, 10, 11, 12, 13, 14, 15])


class GPIOsPortB(GPIOsPort):
    def __init__(self, caravelEnv):
        super().__init__(caravelEnv, pins=[16, 17, 18, 19, 20, 21, 22, 23])

class GPIOsPortC(GPIOsPort):
    def __init__(self, caravelEnv):
        super().__init__(caravelEnv, pins=[24, 25, 26, 27, 28, 29, 30, 31])

class GPIOsPortD(GPIOsPort):
    def __init__(self, caravelEnv):
        super().__init__(caravelEnv, pins=[32, 33, 34, 35, 36, 37, 38, 39])


class GPIOsPortE(GPIOsPort):
    def __init__(self, caravelEnv):
        super().__init__(caravelEnv, pins=[40, 41, 42, 43, 44, 45, 46, 47])

class GPIOsPortF(GPIOsPort):
    def __init__(self, caravelEnv):
        super().__init__(caravelEnv, pins=[48, 49, 50, 51, 52, 53, 54, 55])


class GPIOsPortG(GPIOsPort):
    def __init__(self, caravelEnv):
        super().__init__(caravelEnv, pins=[56, 57, 58, 59, 60, 61, 62, 63])


class GPIOsPortH(GPIOsPort):
    def __init__(self, caravelEnv):
        super().__init__(caravelEnv, pins=[None, None, None, None, None, None, None,  71])


class GPIOsPortI(GPIOsPort):
    def __init__(self, caravelEnv):
        super().__init__(caravelEnv, pins=[73, 72, None, None, None, None, None, None])
