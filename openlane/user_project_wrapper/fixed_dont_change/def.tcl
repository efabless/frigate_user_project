lef read /home/passant/OpenLane/pdks/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
gds read user_project_wrapper.gds
load user_project_wrapper
select top cell
port vdda1 use power
port vdda2 use power
port vssa1 use ground
port vssa2 use ground
def write tmp
quit
