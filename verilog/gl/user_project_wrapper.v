module user_project_wrapper (HCLK,
    HREADY,
    HREADYOUT,
    HRESETn,
    HSEL,
    HWRITE,
    adc0,
    adc1,
    comp_n,
    comp_p,
    dac0,
    dac1,
    gpio3_0_analog,
    gpio3_1_analog,
    gpio3_2_analog,
    gpio3_3_analog,
    gpio3_4_analog,
    gpio3_5_analog,
    gpio3_6_analog,
    gpio3_7_analog,
    gpio4_0_analog,
    gpio4_1_analog,
    gpio4_2_analog,
    gpio4_3_analog,
    gpio4_4_analog,
    gpio4_5_analog,
    gpio4_6_analog,
    gpio4_7_analog,
    ibias100,
    ibias50,
    left_vref,
    right_vref,
    tempsense,
    ulpcomp_n,
    ulpcomp_p,
    vbgsc,
    vbgtc,
    vinref,
    voutref,
    vssd2,
    vccd2,
    vssd1,
    vccd1,
    vssa2,
    vdda2,
    vssa1,
    vdda1,
    HADDR,
    HRDATA,
    HSIZE,
    HTRANS,
    HWDATA,
    gpio0_in,
    gpio0_oeb,
    gpio0_out,
    gpio1_in,
    gpio1_oeb,
    gpio1_out,
    gpio2_in,
    gpio2_oeb,
    gpio2_out,
    gpio3_in,
    gpio3_oeb,
    gpio3_out,
    gpio4_in,
    gpio4_oeb,
    gpio4_out,
    gpio5_in,
    gpio5_oeb,
    gpio5_out,
    gpio6_in,
    gpio6_oeb,
    gpio6_out,
    gpio7_in,
    gpio7_oeb,
    gpio7_out,
    sio_in,
    sio_oeb,
    sio_out,
    user_irq);
 input HCLK;
 input HREADY;
 output HREADYOUT;
 input HRESETn;
 input HSEL;
 input HWRITE;
 inout adc0;
 inout adc1;
 inout comp_n;
 inout comp_p;
 inout dac0;
 inout dac1;
 inout gpio3_0_analog;
 inout gpio3_1_analog;
 inout gpio3_2_analog;
 inout gpio3_3_analog;
 inout gpio3_4_analog;
 inout gpio3_5_analog;
 inout gpio3_6_analog;
 inout gpio3_7_analog;
 inout gpio4_0_analog;
 inout gpio4_1_analog;
 inout gpio4_2_analog;
 inout gpio4_3_analog;
 inout gpio4_4_analog;
 inout gpio4_5_analog;
 inout gpio4_6_analog;
 inout gpio4_7_analog;
 inout ibias100;
 inout ibias50;
 inout left_vref;
 inout right_vref;
 inout tempsense;
 inout ulpcomp_n;
 inout ulpcomp_p;
 inout vbgsc;
 inout vbgtc;
 inout vinref;
 inout voutref;
 inout vssd2;
 inout vccd2;
 inout vssd1;
 inout vccd1;
 inout vssa2;
 inout vdda2;
 inout vssa1;
 inout vdda1;
 input [31:0] HADDR;
 output [31:0] HRDATA;
 input [2:0] HSIZE;
 input [1:0] HTRANS;
 input [31:0] HWDATA;
 input [7:0] gpio0_in;
 output [7:0] gpio0_oeb;
 output [7:0] gpio0_out;
 input [7:0] gpio1_in;
 output [7:0] gpio1_oeb;
 output [7:0] gpio1_out;
 input [7:0] gpio2_in;
 output [7:0] gpio2_oeb;
 output [7:0] gpio2_out;
 input [7:0] gpio3_in;
 output [7:0] gpio3_oeb;
 output [7:0] gpio3_out;
 input [7:0] gpio4_in;
 output [7:0] gpio4_oeb;
 output [7:0] gpio4_out;
 input [7:0] gpio5_in;
 output [7:0] gpio5_oeb;
 output [7:0] gpio5_out;
 input [7:0] gpio6_in;
 output [7:0] gpio6_oeb;
 output [7:0] gpio6_out;
 input [7:0] gpio7_in;
 output [7:0] gpio7_oeb;
 output [7:0] gpio7_out;
 input [1:0] sio_in;
 output [1:0] sio_oeb;
 output [1:0] sio_out;
 output [15:0] user_irq;


 ahb_counter frigate_prj (.HCLK(HCLK),
    .HREADY(HREADY),
    .HREADYOUT(HREADYOUT),
    .HRESETn(HRESETn),
    .HSEL(HSEL),
    .HWRITE(HWRITE),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .HADDR({HADDR[31],
    HADDR[30],
    HADDR[29],
    HADDR[28],
    HADDR[27],
    HADDR[26],
    HADDR[25],
    HADDR[24],
    HADDR[23],
    HADDR[22],
    HADDR[21],
    HADDR[20],
    HADDR[19],
    HADDR[18],
    HADDR[17],
    HADDR[16],
    HADDR[15],
    HADDR[14],
    HADDR[13],
    HADDR[12],
    HADDR[11],
    HADDR[10],
    HADDR[9],
    HADDR[8],
    HADDR[7],
    HADDR[6],
    HADDR[5],
    HADDR[4],
    HADDR[3],
    HADDR[2],
    HADDR[1],
    HADDR[0]}),
    .HRDATA({HRDATA[31],
    HRDATA[30],
    HRDATA[29],
    HRDATA[28],
    HRDATA[27],
    HRDATA[26],
    HRDATA[25],
    HRDATA[24],
    HRDATA[23],
    HRDATA[22],
    HRDATA[21],
    HRDATA[20],
    HRDATA[19],
    HRDATA[18],
    HRDATA[17],
    HRDATA[16],
    HRDATA[15],
    HRDATA[14],
    HRDATA[13],
    HRDATA[12],
    HRDATA[11],
    HRDATA[10],
    HRDATA[9],
    HRDATA[8],
    HRDATA[7],
    HRDATA[6],
    HRDATA[5],
    HRDATA[4],
    HRDATA[3],
    HRDATA[2],
    HRDATA[1],
    HRDATA[0]}),
    .HSIZE({HSIZE[2],
    HSIZE[1],
    HSIZE[0]}),
    .HTRANS({HTRANS[1],
    HTRANS[0]}),
    .HWDATA({HWDATA[31],
    HWDATA[30],
    HWDATA[29],
    HWDATA[28],
    HWDATA[27],
    HWDATA[26],
    HWDATA[25],
    HWDATA[24],
    HWDATA[23],
    HWDATA[22],
    HWDATA[21],
    HWDATA[20],
    HWDATA[19],
    HWDATA[18],
    HWDATA[17],
    HWDATA[16],
    HWDATA[15],
    HWDATA[14],
    HWDATA[13],
    HWDATA[12],
    HWDATA[11],
    HWDATA[10],
    HWDATA[9],
    HWDATA[8],
    HWDATA[7],
    HWDATA[6],
    HWDATA[5],
    HWDATA[4],
    HWDATA[3],
    HWDATA[2],
    HWDATA[1],
    HWDATA[0]}),
    .gpio_oeb({gpio6_oeb[7],
    gpio6_oeb[6],
    gpio6_oeb[5],
    gpio6_oeb[4],
    gpio6_oeb[3],
    gpio6_oeb[2],
    gpio6_oeb[1],
    gpio6_oeb[0],
    gpio1_oeb[7],
    gpio1_oeb[6],
    gpio1_oeb[5],
    gpio1_oeb[4],
    gpio1_oeb[3],
    gpio1_oeb[2],
    gpio1_oeb[1],
    gpio1_oeb[0]}),
    .gpio_out({gpio6_out[7],
    gpio6_out[6],
    gpio6_out[5],
    gpio6_out[4],
    gpio6_out[3],
    gpio6_out[2],
    gpio6_out[1],
    gpio6_out[0],
    gpio1_out[7],
    gpio1_out[6],
    gpio1_out[5],
    gpio1_out[4],
    gpio1_out[3],
    gpio1_out[2],
    gpio1_out[1],
    gpio1_out[0]}));
endmodule
