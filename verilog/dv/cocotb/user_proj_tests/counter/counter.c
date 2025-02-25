#include <frigate_regs.h>
#include <EF_GPIO8.h>
#include <EF_GPIO8.c>
#include <clk_rst.h>
#include "user_counter.h"
#include <system_regs.h>

/*
test sequence eable the counter 
read the counter value and write it at GPIOB (port3)
*/
void main(){
    CLK_RST_GCLK_EN(0b111); // enable pclk 
    CLK_RST_USER_CLK_CTRL(1); // enable user clock
    SYSREG_setUserAHBEn(1); // enable user interface
    EF_GPIO8_setGclkEnable(PORT_H, 1); // required in design with clock gating.
    EF_GPIO8_setPinDirection(PORT_H, 7, GPIO8_OUTPUT); // use GPIOH 0 as indicator
    EF_GPIO8_writeAllDirection(PORT_B,0xFF); // configure port as output
    // enable counter 
    EF_USER_COUNTER_enable(USER_COUNTER);
    while (1) {
        EF_GPIO8_writeData(PORT_H ,0);
        int count_val = read_count(USER_COUNTER);
        EF_GPIO8_writeData(PORT_B ,count_val);
        EF_GPIO8_writeData(PORT_H ,0xFF); // read data 
    }
}