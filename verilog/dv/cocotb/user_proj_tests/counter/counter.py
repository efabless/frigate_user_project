from caravel_cocotb.caravel_interfaces import report_test
import cocotb
from common import test_configure_ml
import random
from frigate_test.gpio import GPIOsPortB, GPIOsPortA, GPIOsPortH

@cocotb.test()
@report_test
async def counter(dut):
    caravelEnv = await test_configure_ml(dut, timeout_cycles=78129)
    cocotb.log.info("[TEST] Start counter test")
    counter_gpio = GPIOsPortA(caravelEnv) # RTL connects user counter value to GPIOA
    gpio_port_b = GPIOsPortB(caravelEnv) # for monitoring value read from software
    gpio_port_h = GPIOsPortH(caravelEnv) # new value indicator
    shift = 0
    old_counter_val = 0
    old_software_val = 0
    for i in range(10):
        await gpio_port_h.wait_gpio_pin(7, 1)
        counter_val = counter_gpio.monitor_gpio(7, 0).integer
        software_val = gpio_port_b.monitor_gpio(7, 0).integer
        cocotb.log.info(f"[TEST] counter_val: {counter_val}, software_val: {software_val} shift {counter_val - software_val}")
        if i == 0:
            shift = counter_val - software_val
            old_counter_val = counter_val
            old_software_val = software_val
        else:
            if counter_val - software_val != shift:
                cocotb.log.error(f"[TEST] shift error shift = {counter_val - software_val} expected shift = {shift}")
            if counter_val <= old_counter_val:
                cocotb.log.error(f"[TEST] counting direction error counter_val: {counter_val} <= old_counter_val: {old_counter_val}")
            if software_val <= old_software_val:
                cocotb.log.error(f"[TEST] counting direction error software_val: {software_val} <= old_software_val: {old_software_val}")
        await gpio_port_h.wait_gpio_pin(7, 0)
