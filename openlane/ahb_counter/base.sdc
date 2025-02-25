
#------------------------------------------#
# Pre-defined Constraints
#------------------------------------------#

# Clock network
if {[info exists ::env(CLOCK_PORT)] && $::env(CLOCK_PORT) != ""} {
	set clk_input $::env(CLOCK_PORT)
	create_clock [get_ports $clk_input] -name clk -period $::env(CLOCK_PERIOD)
	puts "\[INFO\]: Creating clock {clk} for port $clk_input with period: $::env(CLOCK_PERIOD)"
} else {
	set clk_input __VIRTUAL_CLK__
	create_clock -name clk -period $::env(CLOCK_PERIOD)
	puts "\[INFO\]: Creating virtual clock with period: $::env(CLOCK_PERIOD)"
}
if { ![info exists ::env(SYNTH_CLK_DRIVING_CELL)] } {
	set ::env(SYNTH_CLK_DRIVING_CELL) $::env(SYNTH_DRIVING_CELL)
}
if { ![info exists ::env(SYNTH_CLK_DRIVING_CELL_PIN)] } {
	set ::env(SYNTH_CLK_DRIVING_CELL_PIN) $::env(SYNTH_DRIVING_CELL_PIN)
}

# Clock non-idealities
set_propagated_clock [all_clocks]
set_clock_uncertainty $::env(CLOCK_UNCERTAINTY_CONSTRAINT) [get_clocks {clk}]
puts "\[INFO\]: Setting clock uncertainity to: $::env(CLOCK_UNCERTAINTY_CONSTRAINT)"
set_clock_transition $::env(CLOCK_TRANSITION_CONSTRAINT) [get_clocks {clk}]
puts "\[INFO\]: Setting clock transition to: $::env(CLOCK_TRANSITION_CONSTRAINT)"

# Maximum transition time for the design nets
set_max_transition $::env(MAX_TRANSITION_CONSTRAINT) [current_design]
puts "\[INFO\]: Setting maximum transition to: $::env(MAX_TRANSITION_CONSTRAINT)"

# Maximum fanout
set_max_fanout $::env(MAX_FANOUT_CONSTRAINT) [current_design]
puts "\[INFO\]: Setting maximum fanout to: $::env(MAX_FANOUT_CONSTRAINT)"

# Timing paths delays derate
set_timing_derate -early [expr {1-$::env(TIME_DERATING_CONSTRAINT)/100}]
set_timing_derate -late [expr {1+$::env(TIME_DERATING_CONSTRAINT)/100}]
puts "\[INFO\]: Setting timing derate to: $::env(TIME_DERATING_CONSTRAINT) %"

#------------------------------------------#
# Retrieved Constraints
#------------------------------------------#

# Clock source latency
set clk_max_latency 4.85
set clk_min_latency 2.22
set_clock_latency -source -max $clk_max_latency [get_clocks {clk}]
set_clock_latency -source -min $clk_min_latency [get_clocks {clk}]
puts "\[INFO\]: Setting clock latency range: $clk_min_latency : $clk_max_latency"

# Clock input Transition
set clk_tran 1.37
set_input_transition $clk_tran [get_ports $clk_input]
puts "\[INFO\]: Setting clock transition: $clk_tran"

# Input delays
set_input_delay -max 10.38  -clock [get_clocks {clk}] [get_ports {HTRANS[*]}]
set_input_delay -max 10.97  -clock [get_clocks {clk}] [get_ports {HWRITE}]
set_input_delay -max 11.76  -clock [get_clocks {clk}] [get_ports {HSIZE[*]}]
set_input_delay -max 12.12  -clock [get_clocks {clk}] [get_ports {HADDR[*]}]
set_input_delay -max 4.01   -clock [get_clocks {clk}] [get_ports {HRESETn}]
set_input_delay -max 4.58   -clock [get_clocks {clk}] [get_ports {HREADY}]
set_input_delay -max 6.11   -clock [get_clocks {clk}] [get_ports {HWDATA[*]}]
set_input_delay -min 0.63   -clock [get_clocks {clk}] [get_ports {HWRITE}]
set_input_delay -min 0.7    -clock [get_clocks {clk}] [get_ports {HADDR[*]}]
set_input_delay -min 0.83   -clock [get_clocks {clk}] [get_ports {HSIZE[*]}]
set_input_delay -min 0.87   -clock [get_clocks {clk}] [get_ports {HTRANS[*]}]
set_input_delay -min 1.05   -clock [get_clocks {clk}] [get_ports {HWDATA[*]}]
set_input_delay -min 1.18   -clock [get_clocks {clk}] [get_ports {HREADY}]
set_input_delay -min 2.33   -clock [get_clocks {clk}] [get_ports {HRESETn}]

# Input Transition
set_input_transition -max 0.12 [get_ports {HSIZE[*]}]
set_input_transition -max 0.13 [get_ports {HREADY}]
set_input_transition -max 0.26 [get_ports {HWRITE}]
set_input_transition -max 0.32 [get_ports {HTRANS[*]}]
set_input_transition -max 0.49 [get_ports {HWDATA[*]}]
set_input_transition -max 0.62 [get_ports {HRESETn}]
set_input_transition -max 0.67 [get_ports {HADDR[*]}]
set_input_transition -min 0.04 [get_ports {HADDR[*]}]
set_input_transition -min 0.04 [get_ports {HWDATA[*]}]
set_input_transition -min 0.12 [get_ports {HSIZE[*]}]
set_input_transition -min 0.26 [get_ports {HWRITE}]
set_input_transition -min 0.27 [get_ports {HRESETn}]
set_input_transition -min 0.28 [get_ports {HREADY}]
set_input_transition -min 0.32 [get_ports {HTRANS[*]}]

# Output delays
set_output_delay -max 7.54   -clock [get_clocks {clk}] [get_ports {HRDATA[*]}]
set_output_delay -max 9.8    -clock [get_clocks {clk}] [get_ports {HREADYOUT}]
set_output_delay -min 0.01   -clock [get_clocks {clk}] [get_ports {HRDATA[*]}]
set_output_delay -min 0.83   -clock [get_clocks {clk}] [get_ports {HREADYOUT}]

# Output loads
set avg_load 0.10
set max_load 0.29
set_load $max_load [all_outputs]
