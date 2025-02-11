from caravel_cocotb.caravel_interfaces import report_test
import cocotb
from all_tests.common import test_configure_ml
import random
from all_tests.gpio import GPIOsPortB, GPIOsPortA

@cocotb.test()
@report_test
async def gpio_portA(dut):
    caravelEnv = await test_configure_ml(dut, timeout_cycles=78129)
    cocotb.log.info("[TEST] Start gpio_portA test")
    gpio_port_b = GPIOsPortB(caravelEnv)
    gpio_port_a = GPIOsPortA(caravelEnv)
    for _ in range(10):
        await gpio_port_b.wait_gpio_pin(0, 1)
        random_4 = [random.randint(0, 1) for _ in range(4)]
        gpio_port_a.drive_gpio_in(1, random_4[0])
        gpio_port_a.drive_gpio_in(3, random_4[1])
        gpio_port_a.drive_gpio_in(5, random_4[2])
        gpio_port_a.drive_gpio_in(7, random_4[3])
        await gpio_port_b.wait_gpio_pin(0, 0)
        gpios = gpio_port_a.monitor_gpio(7, 0)
        cocotb.log.info(f"[TEST]test 1 gpios: {gpios}")
        for i in range(4):
            if gpio_port_a.monitor_gpio(i*2).integer != random_4[i]:
                cocotb.log.error(f"[TEST] gpios: {gpios} != {random_4}")
                return
    
    gpio_port_a.release_gpio(1)
    gpio_port_a.release_gpio(3)
    gpio_port_a.release_gpio(7)
    gpio_port_a.release_gpio(5)

    for _ in range(10):
        await gpio_port_b.wait_gpio_pin(0, 1)
        random_4 = [random.randint(0, 1) for _ in range(4)]
        gpio_port_a.drive_gpio_in(0, random_4[0])
        gpio_port_a.drive_gpio_in(2, random_4[1])
        gpio_port_a.drive_gpio_in(4, random_4[2])
        gpio_port_a.drive_gpio_in(6, random_4[3])
        await gpio_port_b.wait_gpio_pin(0, 0)
        gpios = gpio_port_a.monitor_gpio(7, 0)
        cocotb.log.info(f"[TEST] test2 gpios: {gpios}")
        for i in range(4):
            if gpio_port_a.monitor_gpio(i*2+1).integer != random_4[i]:
                cocotb.log.error(f"[TEST] gpios: {gpios} != {random_4} mismatch at {i*2+1} actual {gpio_port_a.monitor_gpio(i*2+1).integer} expected {random_4[i]}")
                return

    

