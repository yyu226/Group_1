
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name SPI_HOST -dir "C:/Users/yingyu/Desktop/ISEproj/SPI_ctrl/SPI_HOST/planAhead_run_1" -part xc6slx9ftg256-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top spi_host $srcset
set_property target_constrs_file "spi_host.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ipcore_dir/dcm.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/dcm/example_design/dcm_exdes.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {xmit_shift.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Rcv_shift.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {spi_host.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files [list {spi_host.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9ftg256-3
