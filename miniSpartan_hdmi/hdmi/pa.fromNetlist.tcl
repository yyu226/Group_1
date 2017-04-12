
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name hdmi -dir "C:/Users/yingyu/Desktop/ISEproj/miniSpartan_hdmi/hdmi/planAhead_run_1" -part xc6slx25ftg256-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/yingyu/Desktop/ISEproj/miniSpartan_hdmi/hdmi/hdmi_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/yingyu/Desktop/ISEproj/miniSpartan_hdmi/hdmi} {ipcore_dir} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "hdmi_top.ucf" [current_fileset -constrset]
add_files [list {hdmi_top.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design