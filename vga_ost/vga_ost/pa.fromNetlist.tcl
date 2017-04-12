
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name vga_ost -dir "C:/Users/yingyu/Desktop/ISEproj/vga_ost/vga_ost/planAhead_run_2" -part xc3s400aft256-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/yingyu/Desktop/ISEproj/vga_ost/vga_ost/vga_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/yingyu/Desktop/ISEproj/vga_ost/vga_ost} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "vga_top.ucf" [current_fileset -constrset]
add_files [list {vga_top.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
