
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name xula2_sdram -dir "C:/Users/yingyu/Desktop/ISEproj/xula2_sdram/xula2_sdram/planAhead_run_1" -part xc6slx9ftg256-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top vga_top $srcset
set_property target_constrs_file "vga_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ipcore_dir/dcm.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/dcm/example_design/dcm_exdes.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {vcntr.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rsff.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rgboen.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {hcntr.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {vga_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files [list {vga_top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9ftg256-3
