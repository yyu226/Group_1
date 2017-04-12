
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name vga_test -dir "C:/Users/yingyu/Desktop/ISEproj/VGA_v1.0/vga_test/planAhead_run_1" -part xc3s400aft256-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/yingyu/Desktop/ISEproj/VGA_v1.0/vga_test/vga_test.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/yingyu/Desktop/ISEproj/VGA_v1.0/vga_test} {ipcore_dir} }
add_files [list {ipcore_dir/ddsc.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/dds_compiler_v4_0.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "vga_test.ucf" [current_fileset -constrset]
add_files [list {vga_test.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
