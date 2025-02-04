// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper (
`ifdef USE_POWER_PINS
    inout wire vccd1,    // User area 1 1.8V supply
    inout wire vccd2,    // User area 2 1.8v supply
    inout wire vssd1,    // User area 1 digital ground
    inout wire vssd2,    // User area 2 digital ground
    inout wire vdda1,    // User area 1 3.3V supply
    inout wire vdda2,    // User area 2 3.3V supply
    inout wire vssa1,    // User area 1 analog ground
    inout wire vssa2,    // User area 2 analog ground
`endif


    input  wire         HCLK,
    input  wire         HRESETn,
    input  wire         HSEL,
    input  wire [31:0]  HADDR,
    input  wire [31:0]  HWDATA,
    input  wire         HREADY,
    input  wire         HWRITE,
    input  wire [1:0]   HTRANS,
    input  wire [2:0]   HSIZE,
    output wire [31:0]  HRDATA,
    output wire         HREADYOUT,

    // GPIOs
    input  wire [7:0]   gpio1_in,
    input  wire [7:0]   gpio2_in,
    input  wire [7:0]   gpio3_in,
    input  wire [7:0]   gpio4_in,
    input  wire [7:0]   gpio5_in,
    input  wire [7:0]   gpio6_in,
    input  wire [7:0]   gpio7_in,
    input  wire [7:0]   gpio0_in,

    output wire [7:0]   gpio1_out,
    output wire [7:0]   gpio2_out,
    output wire [7:0]   gpio3_out,
    output wire [7:0]   gpio4_out,
    output wire [7:0]   gpio5_out,
    output wire [7:0]   gpio6_out,
    output wire [7:0]   gpio7_out,
    output wire [7:0]   gpio0_out,

    output wire [7:0]   gpio1_oeb,
    output wire [7:0]   gpio2_oeb,
    output wire [7:0]   gpio3_oeb,
    output wire [7:0]   gpio4_oeb,
    output wire [7:0]   gpio5_oeb,
    output wire [7:0]   gpio6_oeb,
    output wire [7:0]   gpio7_oeb,
    output wire [7:0]   gpio0_oeb,

    input  wire [1:0]   sio_in,
    output wire [1:0]   sio_out,
    output wire [1:0]   sio_oeb,

    // User maskable interrupt signals
    output wire [15:0]  user_irq,

    // Analog connections to the analog macro
    inout  wire voutref,        // SIO voltage reference 1 input
    inout  wire vinref,         // SIO voltage reference 2 input
    inout  wire left_vref,      // GPIO OVT voltage reference 1 input
    inout  wire right_vref,     // GPIO OVT voltage reference 2 input
    inout  wire tempsense,      // temperature sensor input
    inout  wire dac0,           // DAC0 input
    inout  wire dac1,           // DAC1 input
    inout  wire vbgtc,          // Bandgap scaled input 1
    inout  wire vbgsc,          // Bandgap scaled input 2
    inout  wire adc0,           // ADC0 output
    inout  wire adc1,           // ADC1 output
    inout  wire comp_n,         // Comparator negative output
    inout  wire comp_p,         // Comparator positive output
    inout  wire ulpcomp_n,      // ULP comparator negative output
    inout  wire ulpcomp_p,      // ULP comparator positive output
    inout  wire gpio3_0_analog, // GPIO analog in/out
    inout  wire gpio3_1_analog, // GPIO analog in/out
    inout  wire gpio3_2_analog, // GPIO analog in/out
    inout  wire gpio3_3_analog, // GPIO analog in/out
    inout  wire gpio3_4_analog, // GPIO analog in/out
    inout  wire gpio3_5_analog, // GPIO analog in/out
    inout  wire gpio3_6_analog, // GPIO analog in/out
    inout  wire gpio3_7_analog, // GPIO analog in/out
    inout  wire gpio4_0_analog, // GPIO analog in/out
    inout  wire gpio4_1_analog, // GPIO analog in/out
    inout  wire gpio4_2_analog, // GPIO analog in/out
    inout  wire gpio4_3_analog, // GPIO analog in/out
    inout  wire gpio4_4_analog, // GPIO analog in/out
    inout  wire gpio4_5_analog, // GPIO analog in/out
    inout  wire gpio4_6_analog, // GPIO analog in/out
    inout  wire gpio4_7_analog, // GPIO analog in/out   
    inout  wire ibias50,        // Bias current source 50nA
    inout  wire ibias100        // Bias current source 100nA
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

ahb_counter frigate_prj (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
    .HCLK(HCLK),
    .HRESETn(HRESETn),
    .HSEL(HSEL),
    .HREADY(HREADY),
    .HWRITE(HWRITE),
    .HADDR(HADDR),
    .HWDATA(HWDATA),
    .HSIZE(HSIZE),
    .HTRANS(HTRANS),
    .HREADYOUT(HREADYOUT),
    .HRDATA(HRDATA),
    .gpio_out({gpio6_out, gpio1_out}),
    .gpio_oeb({gpio6_oeb, gpio1_oeb})
);

endmodule// user_project_wrapper
