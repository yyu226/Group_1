
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name mSp_adaptive -dir "C:/Users/yingyu/Desktop/ISEproj/mSp_adaptive/mSp_adaptive/planAhead_run_1" -part xc6slx25ftg256-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/yingyu/Desktop/ISEproj/mSp_adaptive/mSp_adaptive/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/yingyu/Desktop/ISEproj/mSp_adaptive/mSp_adaptive} {ipcore_dir} }
add_files [list {ipcore_dir/fifo_8to1.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo_vga.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
