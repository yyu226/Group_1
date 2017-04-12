
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name vga_test -dir "C:/Users/yingyu/Desktop/ISEproj/VGA_v1.0/vga_test/planAhead_run_1" -part xc3s400aft256-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top vga_test $srcset
set_property target_constrs_file "vga_test.ucf" [current_fileset -constrset]
add_files [list {ipcore_dir/ddsc.ngc}]
set hdlfile [add_files [list {ipcore_dir/ddsc.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {dcmip.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../vcntr.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../rsff.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../rgboen.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../hcntr.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../vga_test.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files [list {vga_test.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ddsc.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/dds_compiler_v4_0.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s400aft256-4
