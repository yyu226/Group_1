
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name vga_ost -dir "C:/Users/yingyu/Desktop/ISEproj/vga_ost/vga_ost/planAhead_run_2" -part xc3s400aft256-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top vga_top $srcset
set_property target_constrs_file "vga_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {vga_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files [list {vga_top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s400aft256-4
