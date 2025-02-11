#include <cheetah_regs.h>
#include <EF_GPIO8.h>
#include <EF_GPIO8.c>
#include <clk_rst.h>
#include <bitbang.h>

void main(){
    CLK_RST_GCLK_EN(0b111); // enable pclk 
    bb_configureAllGpios(GPIO_MODE_MGMT_STD_BIDIRECTIONAL); // configure all gpio as mgmt
    EF_GPIO8_setPinDirection(PORT_B, 0, GPIO8_OUTPUT); // use GPIOB 0 as indicator
    EF_GPIO8_writeAllDirection(PORT_A,0x55);
    for (int i = 0; i < 10; i++) {
        EF_GPIO8_writeData(PORT_B ,1); // provide the input
        dummyDelay(3);
        int read_portA = EF_GPIO8_readData(PORT_A) >> 1;
        EF_GPIO8_writeData(PORT_A ,read_portA);
        EF_GPIO8_writeData(PORT_B ,0); // read data 
    }

    EF_GPIO8_writeAllDirection(PORT_A,0xAA);
    for (int i = 0; i < 10; i++) {
        EF_GPIO8_writeData(PORT_B ,1); // provide the input 
        dummyDelay(3);
        int read_portA = EF_GPIO8_readData(PORT_A) << 1 ;
        EF_GPIO8_writeData(PORT_A ,read_portA);
        EF_GPIO8_writeData(PORT_B ,0); // read data 
    }
}