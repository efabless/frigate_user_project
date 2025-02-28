###############################################################################
# Created by write_sdc
###############################################################################
current_design ahb_counter
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 23.0000 [get_ports {HCLK}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_clock_latency -source -min 2.2200 [get_clocks {clk}]
set_clock_latency -source -max 5.0500 [get_clocks {clk}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[0]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[0]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[10]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[10]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[11]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[11]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[12]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[12]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[13]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[13]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[14]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[14]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[15]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[15]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[16]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[16]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[17]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[17]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[18]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[18]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[19]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[19]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[1]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[1]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[20]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[20]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[21]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[21]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[22]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[22]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[23]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[23]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[24]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[24]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[25]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[25]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[26]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[26]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[27]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[27]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[28]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[28]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[29]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[29]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[2]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[2]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[30]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[30]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[31]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[31]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[3]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[3]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[4]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[4]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[5]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[5]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[6]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[6]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[7]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[7]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[8]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[8]}]
set_input_delay 0.7000 -clock [get_clocks {clk}] -min -add_delay [get_ports {HADDR[9]}]
set_input_delay 9.8100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HADDR[9]}]
set_input_delay 1.1800 -clock [get_clocks {clk}] -min -add_delay [get_ports {HREADY}]
set_input_delay 4.5800 -clock [get_clocks {clk}] -max -add_delay [get_ports {HREADY}]
set_input_delay 2.3300 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRESETn}]
set_input_delay 4.0100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRESETn}]
set_input_delay 0.8300 -clock [get_clocks {clk}] -min -add_delay [get_ports {HSIZE[0]}]
set_input_delay 8.7500 -clock [get_clocks {clk}] -max -add_delay [get_ports {HSIZE[0]}]
set_input_delay 0.8300 -clock [get_clocks {clk}] -min -add_delay [get_ports {HSIZE[1]}]
set_input_delay 8.7500 -clock [get_clocks {clk}] -max -add_delay [get_ports {HSIZE[1]}]
set_input_delay 0.8300 -clock [get_clocks {clk}] -min -add_delay [get_ports {HSIZE[2]}]
set_input_delay 8.7500 -clock [get_clocks {clk}] -max -add_delay [get_ports {HSIZE[2]}]
set_input_delay 0.8700 -clock [get_clocks {clk}] -min -add_delay [get_ports {HTRANS[0]}]
set_input_delay 7.2400 -clock [get_clocks {clk}] -max -add_delay [get_ports {HTRANS[0]}]
set_input_delay 0.8700 -clock [get_clocks {clk}] -min -add_delay [get_ports {HTRANS[1]}]
set_input_delay 7.2400 -clock [get_clocks {clk}] -max -add_delay [get_ports {HTRANS[1]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[0]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[0]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[10]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[10]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[11]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[11]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[12]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[12]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[13]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[13]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[14]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[14]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[15]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[15]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[16]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[16]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[17]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[17]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[18]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[18]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[19]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[19]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[1]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[1]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[20]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[20]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[21]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[21]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[22]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[22]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[23]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[23]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[24]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[24]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[25]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[25]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[26]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[26]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[27]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[27]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[28]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[28]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[29]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[29]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[2]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[2]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[30]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[30]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[31]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[31]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[3]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[3]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[4]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[4]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[5]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[5]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[6]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[6]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[7]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[7]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[8]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[8]}]
set_input_delay 1.0500 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWDATA[9]}]
set_input_delay 6.1100 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWDATA[9]}]
set_input_delay 0.6400 -clock [get_clocks {clk}] -min -add_delay [get_ports {HWRITE}]
set_input_delay 8.0600 -clock [get_clocks {clk}] -max -add_delay [get_ports {HWRITE}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[0]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[0]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[10]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[10]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[11]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[11]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[12]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[12]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[13]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[13]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[14]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[14]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[15]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[15]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[16]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[16]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[17]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[17]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[18]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[18]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[19]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[19]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[1]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[1]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[20]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[20]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[21]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[21]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[22]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[22]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[23]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[23]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[24]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[24]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[25]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[25]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[26]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[26]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[27]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[27]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[28]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[28]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[29]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[29]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[2]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[2]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[30]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[30]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[31]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[31]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[3]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[3]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[4]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[4]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[5]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[5]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[6]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[6]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[7]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[7]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[8]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[8]}]
set_output_delay 0.0100 -clock [get_clocks {clk}] -min -add_delay [get_ports {HRDATA[9]}]
set_output_delay 5.7700 -clock [get_clocks {clk}] -max -add_delay [get_ports {HRDATA[9]}]
set_output_delay 0.8300 -clock [get_clocks {clk}] -min -add_delay [get_ports {HREADYOUT}]
set_output_delay 8.1400 -clock [get_clocks {clk}] -max -add_delay [get_ports {HREADYOUT}]
set_multicycle_path -hold\
    -through [list [get_ports {HADDR[0]}]\
           [get_ports {HADDR[10]}]\
           [get_ports {HADDR[11]}]\
           [get_ports {HADDR[12]}]\
           [get_ports {HADDR[13]}]\
           [get_ports {HADDR[14]}]\
           [get_ports {HADDR[15]}]\
           [get_ports {HADDR[16]}]\
           [get_ports {HADDR[17]}]\
           [get_ports {HADDR[18]}]\
           [get_ports {HADDR[19]}]\
           [get_ports {HADDR[1]}]\
           [get_ports {HADDR[20]}]\
           [get_ports {HADDR[21]}]\
           [get_ports {HADDR[22]}]\
           [get_ports {HADDR[23]}]\
           [get_ports {HADDR[24]}]\
           [get_ports {HADDR[25]}]\
           [get_ports {HADDR[26]}]\
           [get_ports {HADDR[27]}]\
           [get_ports {HADDR[28]}]\
           [get_ports {HADDR[29]}]\
           [get_ports {HADDR[2]}]\
           [get_ports {HADDR[30]}]\
           [get_ports {HADDR[31]}]\
           [get_ports {HADDR[3]}]\
           [get_ports {HADDR[4]}]\
           [get_ports {HADDR[5]}]\
           [get_ports {HADDR[6]}]\
           [get_ports {HADDR[7]}]\
           [get_ports {HADDR[8]}]\
           [get_ports {HADDR[9]}]]\
    -through [list [get_ports {HRDATA[0]}]\
           [get_ports {HRDATA[10]}]\
           [get_ports {HRDATA[11]}]\
           [get_ports {HRDATA[12]}]\
           [get_ports {HRDATA[13]}]\
           [get_ports {HRDATA[14]}]\
           [get_ports {HRDATA[15]}]\
           [get_ports {HRDATA[16]}]\
           [get_ports {HRDATA[17]}]\
           [get_ports {HRDATA[18]}]\
           [get_ports {HRDATA[19]}]\
           [get_ports {HRDATA[1]}]\
           [get_ports {HRDATA[20]}]\
           [get_ports {HRDATA[21]}]\
           [get_ports {HRDATA[22]}]\
           [get_ports {HRDATA[23]}]\
           [get_ports {HRDATA[24]}]\
           [get_ports {HRDATA[25]}]\
           [get_ports {HRDATA[26]}]\
           [get_ports {HRDATA[27]}]\
           [get_ports {HRDATA[28]}]\
           [get_ports {HRDATA[29]}]\
           [get_ports {HRDATA[2]}]\
           [get_ports {HRDATA[30]}]\
           [get_ports {HRDATA[31]}]\
           [get_ports {HRDATA[3]}]\
           [get_ports {HRDATA[4]}]\
           [get_ports {HRDATA[5]}]\
           [get_ports {HRDATA[6]}]\
           [get_ports {HRDATA[7]}]\
           [get_ports {HRDATA[8]}]\
           [get_ports {HRDATA[9]}]] 1
set_multicycle_path -setup\
    -through [list [get_ports {HADDR[0]}]\
           [get_ports {HADDR[10]}]\
           [get_ports {HADDR[11]}]\
           [get_ports {HADDR[12]}]\
           [get_ports {HADDR[13]}]\
           [get_ports {HADDR[14]}]\
           [get_ports {HADDR[15]}]\
           [get_ports {HADDR[16]}]\
           [get_ports {HADDR[17]}]\
           [get_ports {HADDR[18]}]\
           [get_ports {HADDR[19]}]\
           [get_ports {HADDR[1]}]\
           [get_ports {HADDR[20]}]\
           [get_ports {HADDR[21]}]\
           [get_ports {HADDR[22]}]\
           [get_ports {HADDR[23]}]\
           [get_ports {HADDR[24]}]\
           [get_ports {HADDR[25]}]\
           [get_ports {HADDR[26]}]\
           [get_ports {HADDR[27]}]\
           [get_ports {HADDR[28]}]\
           [get_ports {HADDR[29]}]\
           [get_ports {HADDR[2]}]\
           [get_ports {HADDR[30]}]\
           [get_ports {HADDR[31]}]\
           [get_ports {HADDR[3]}]\
           [get_ports {HADDR[4]}]\
           [get_ports {HADDR[5]}]\
           [get_ports {HADDR[6]}]\
           [get_ports {HADDR[7]}]\
           [get_ports {HADDR[8]}]\
           [get_ports {HADDR[9]}]]\
    -through [list [get_ports {HRDATA[0]}]\
           [get_ports {HRDATA[10]}]\
           [get_ports {HRDATA[11]}]\
           [get_ports {HRDATA[12]}]\
           [get_ports {HRDATA[13]}]\
           [get_ports {HRDATA[14]}]\
           [get_ports {HRDATA[15]}]\
           [get_ports {HRDATA[16]}]\
           [get_ports {HRDATA[17]}]\
           [get_ports {HRDATA[18]}]\
           [get_ports {HRDATA[19]}]\
           [get_ports {HRDATA[1]}]\
           [get_ports {HRDATA[20]}]\
           [get_ports {HRDATA[21]}]\
           [get_ports {HRDATA[22]}]\
           [get_ports {HRDATA[23]}]\
           [get_ports {HRDATA[24]}]\
           [get_ports {HRDATA[25]}]\
           [get_ports {HRDATA[26]}]\
           [get_ports {HRDATA[27]}]\
           [get_ports {HRDATA[28]}]\
           [get_ports {HRDATA[29]}]\
           [get_ports {HRDATA[2]}]\
           [get_ports {HRDATA[30]}]\
           [get_ports {HRDATA[31]}]\
           [get_ports {HRDATA[3]}]\
           [get_ports {HRDATA[4]}]\
           [get_ports {HRDATA[5]}]\
           [get_ports {HRDATA[6]}]\
           [get_ports {HRDATA[7]}]\
           [get_ports {HRDATA[8]}]\
           [get_ports {HRDATA[9]}]] 2
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.2900 [get_ports {HREADYOUT}]
set_load -pin_load 0.2900 [get_ports {HRDATA[31]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[30]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[29]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[28]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[27]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[26]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[25]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[24]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[23]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[22]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[21]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[20]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[19]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[18]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[17]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[16]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[15]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[14]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[13]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[12]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[11]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[10]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[9]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[8]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[7]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[6]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[5]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[4]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[3]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[2]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[1]}]
set_load -pin_load 0.2900 [get_ports {HRDATA[0]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[15]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[14]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[13]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[12]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[11]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[10]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[9]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[8]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[7]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[6]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[5]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[4]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[3]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[2]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[1]}]
set_load -pin_load 0.2900 [get_ports {gpio_oeb[0]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[15]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[14]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[13]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[12]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[11]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[10]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[9]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[8]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[7]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[6]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[5]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[4]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[3]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[2]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[1]}]
set_load -pin_load 0.2900 [get_ports {gpio_out[0]}]
set_input_transition 1.3700 [get_ports {HCLK}]
set_input_transition -min 0.2800 [get_ports {HREADY}]
set_input_transition -max 0.1300 [get_ports {HREADY}]
set_input_transition -min 0.2700 [get_ports {HRESETn}]
set_input_transition -max 0.6200 [get_ports {HRESETn}]
set_input_transition 0.2600 [get_ports {HWRITE}]
set_input_transition -min 0.0400 [get_ports {HADDR[31]}]
set_input_transition -max 0.6700 [get_ports {HADDR[31]}]
set_input_transition -min 0.0400 [get_ports {HADDR[30]}]
set_input_transition -max 0.6700 [get_ports {HADDR[30]}]
set_input_transition -min 0.0400 [get_ports {HADDR[29]}]
set_input_transition -max 0.6700 [get_ports {HADDR[29]}]
set_input_transition -min 0.0400 [get_ports {HADDR[28]}]
set_input_transition -max 0.6700 [get_ports {HADDR[28]}]
set_input_transition -min 0.0400 [get_ports {HADDR[27]}]
set_input_transition -max 0.6700 [get_ports {HADDR[27]}]
set_input_transition -min 0.0400 [get_ports {HADDR[26]}]
set_input_transition -max 0.6700 [get_ports {HADDR[26]}]
set_input_transition -min 0.0400 [get_ports {HADDR[25]}]
set_input_transition -max 0.6700 [get_ports {HADDR[25]}]
set_input_transition -min 0.0400 [get_ports {HADDR[24]}]
set_input_transition -max 0.6700 [get_ports {HADDR[24]}]
set_input_transition -min 0.0400 [get_ports {HADDR[23]}]
set_input_transition -max 0.6700 [get_ports {HADDR[23]}]
set_input_transition -min 0.0400 [get_ports {HADDR[22]}]
set_input_transition -max 0.6700 [get_ports {HADDR[22]}]
set_input_transition -min 0.0400 [get_ports {HADDR[21]}]
set_input_transition -max 0.6700 [get_ports {HADDR[21]}]
set_input_transition -min 0.0400 [get_ports {HADDR[20]}]
set_input_transition -max 0.6700 [get_ports {HADDR[20]}]
set_input_transition -min 0.0400 [get_ports {HADDR[19]}]
set_input_transition -max 0.6700 [get_ports {HADDR[19]}]
set_input_transition -min 0.0400 [get_ports {HADDR[18]}]
set_input_transition -max 0.6700 [get_ports {HADDR[18]}]
set_input_transition -min 0.0400 [get_ports {HADDR[17]}]
set_input_transition -max 0.6700 [get_ports {HADDR[17]}]
set_input_transition -min 0.0400 [get_ports {HADDR[16]}]
set_input_transition -max 0.6700 [get_ports {HADDR[16]}]
set_input_transition -min 0.0400 [get_ports {HADDR[15]}]
set_input_transition -max 0.6700 [get_ports {HADDR[15]}]
set_input_transition -min 0.0400 [get_ports {HADDR[14]}]
set_input_transition -max 0.6700 [get_ports {HADDR[14]}]
set_input_transition -min 0.0400 [get_ports {HADDR[13]}]
set_input_transition -max 0.6700 [get_ports {HADDR[13]}]
set_input_transition -min 0.0400 [get_ports {HADDR[12]}]
set_input_transition -max 0.6700 [get_ports {HADDR[12]}]
set_input_transition -min 0.0400 [get_ports {HADDR[11]}]
set_input_transition -max 0.6700 [get_ports {HADDR[11]}]
set_input_transition -min 0.0400 [get_ports {HADDR[10]}]
set_input_transition -max 0.6700 [get_ports {HADDR[10]}]
set_input_transition -min 0.0400 [get_ports {HADDR[9]}]
set_input_transition -max 0.6700 [get_ports {HADDR[9]}]
set_input_transition -min 0.0400 [get_ports {HADDR[8]}]
set_input_transition -max 0.6700 [get_ports {HADDR[8]}]
set_input_transition -min 0.0400 [get_ports {HADDR[7]}]
set_input_transition -max 0.6700 [get_ports {HADDR[7]}]
set_input_transition -min 0.0400 [get_ports {HADDR[6]}]
set_input_transition -max 0.6700 [get_ports {HADDR[6]}]
set_input_transition -min 0.0400 [get_ports {HADDR[5]}]
set_input_transition -max 0.6700 [get_ports {HADDR[5]}]
set_input_transition -min 0.0400 [get_ports {HADDR[4]}]
set_input_transition -max 0.6700 [get_ports {HADDR[4]}]
set_input_transition -min 0.0400 [get_ports {HADDR[3]}]
set_input_transition -max 0.6700 [get_ports {HADDR[3]}]
set_input_transition -min 0.0400 [get_ports {HADDR[2]}]
set_input_transition -max 0.6700 [get_ports {HADDR[2]}]
set_input_transition -min 0.0400 [get_ports {HADDR[1]}]
set_input_transition -max 0.6700 [get_ports {HADDR[1]}]
set_input_transition -min 0.0400 [get_ports {HADDR[0]}]
set_input_transition -max 0.6700 [get_ports {HADDR[0]}]
set_input_transition -min 0.1200 [get_ports {HSIZE[2]}]
set_input_transition -max 0.2400 [get_ports {HSIZE[2]}]
set_input_transition -min 0.1200 [get_ports {HSIZE[1]}]
set_input_transition -max 0.2400 [get_ports {HSIZE[1]}]
set_input_transition -min 0.1200 [get_ports {HSIZE[0]}]
set_input_transition -max 0.2400 [get_ports {HSIZE[0]}]
set_input_transition 0.3200 [get_ports {HTRANS[1]}]
set_input_transition 0.3200 [get_ports {HTRANS[0]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[31]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[31]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[30]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[30]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[29]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[29]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[28]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[28]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[27]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[27]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[26]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[26]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[25]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[25]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[24]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[24]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[23]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[23]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[22]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[22]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[21]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[21]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[20]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[20]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[19]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[19]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[18]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[18]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[17]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[17]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[16]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[16]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[15]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[15]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[14]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[14]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[13]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[13]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[12]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[12]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[11]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[11]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[10]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[10]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[9]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[9]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[8]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[8]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[7]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[7]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[6]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[6]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[5]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[5]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[4]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[4]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[3]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[3]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[2]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[2]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[1]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[1]}]
set_input_transition -min 0.0400 [get_ports {HWDATA[0]}]
set_input_transition -max 0.4900 [get_ports {HWDATA[0]}]
set_case_analysis 1 [get_ports {HSEL}]
set_case_analysis 0 [get_ports {HTRANS[0]}]
set_timing_derate -early 0.9200
set_timing_derate -late 1.0800
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
