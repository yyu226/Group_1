
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name ext_pwr -dir "C:/Users/yingyu/Desktop/ISEproj/lx9_extclk/ext_pwr/planAhead_run_2" -part xc6slx9ftg256-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/yingyu/Desktop/ISEproj/lx9_extclk/ext_pwr/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/yingyu/Desktop/ISEproj/lx9_extclk/ext_pwr} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
