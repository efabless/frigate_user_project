
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
set_clock_uncertainty 0.1 [get_clocks {clk}]
puts "\[INFO\]: Setting clock uncertainity to: 0.1"

# Maximum fanout
set_max_fanout $::env(MAX_FANOUT_CONSTRAINT) [current_design]
puts "\[INFO\]: Setting maximum fanout to: $::env(MAX_FANOUT_CONSTRAINT)"

# Timing paths delays derate
set_timing_derate -early [expr {1-5.0/100}]
set_timing_derate -late [expr {1+5.0/100}]
puts "\[INFO\]: Setting timing derate to: 5.0 %"
# Multicycle paths
set_multicycle_path -setup 2 -through [get_ports {HADDR*}] -through [get_ports {HRDATA*}]
set_multicycle_path -hold 1  -through [get_ports {HADDR*}] -through [get_ports {HRDATA*}]

# Constant Ports
set_case_analysis 1 [get_ports {HSEL}]
set_case_analysis 0 [get_ports {HTRANS[0]}]

#------------------------------------------#
# Retrieved Constraints
#------------------------------------------#

# Clock source latency
set clk_max_latency 5.05
set clk_min_latency 2.22
set_clock_latency -source -max $clk_max_latency [get_clocks {clk}]
set_clock_latency -source -min $clk_min_latency [get_clocks {clk}]
puts "\[INFO\]: Setting clock latency range: $clk_min_latency : $clk_max_latency"

# Clock input Transition
set clk_tran 1.37
set_input_transition $clk_tran [get_ports $clk_input]
puts "\[INFO\]: Setting clock transition: $clk_tran"

# Input delays
set_input_delay -max 3.61   -clock [get_clocks {clk}] [get_ports {HRESETn}]
set_input_delay -max 4.18   -clock [get_clocks {clk}] [get_ports {HREADY}]
set_input_delay -max 5.71   -clock [get_clocks {clk}] [get_ports {HWDATA[*]}]
set_input_delay -max 6.84   -clock [get_clocks {clk}] [get_ports {HTRANS[*]}]
set_input_delay -max 7.66   -clock [get_clocks {clk}] [get_ports {HWRITE}]
set_input_delay -max 8.35   -clock [get_clocks {clk}] [get_ports {HSIZE[*]}]
set_input_delay -max 9.41   -clock [get_clocks {clk}] [get_ports {HADDR[*]}]
set_input_delay -min 1.04   -clock [get_clocks {clk}] [get_ports {HWRITE}]
set_input_delay -min 1.10   -clock [get_clocks {clk}] [get_ports {HADDR[*]}]
set_input_delay -min 1.23   -clock [get_clocks {clk}] [get_ports {HSIZE[*]}]
set_input_delay -min 1.27   -clock [get_clocks {clk}] [get_ports {HTRANS[*]}]
set_input_delay -min 1.45   -clock [get_clocks {clk}] [get_ports {HWDATA[*]}]
set_input_delay -min 1.58   -clock [get_clocks {clk}] [get_ports {HREADY}]
set_input_delay -min 2.73   -clock [get_clocks {clk}] [get_ports {HRESETn}]

# Input Transition
set_input_transition -max 0.13 [get_ports {HREADY}]
set_input_transition -max 0.24 [get_ports {HSIZE[*]}]
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
set_output_delay -max 5.37   -clock [get_clocks {clk}] [get_ports {HRDATA[*]}]
set_output_delay -max 7.74   -clock [get_clocks {clk}] [get_ports {HREADYOUT}]
set_output_delay -min 0.41   -clock [get_clocks {clk}] [get_ports {HRDATA[*]}]
set_output_delay -min 1.23   -clock [get_clocks {clk}] [get_ports {HREADYOUT}]

# Output loads
set avg_load 0.10
set max_load 0.29
set_load $max_load [all_outputs]
