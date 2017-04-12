
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name spi_2phase -dir "C:/Users/yingyu/Desktop/ISEproj/spi_2phase/spi_2phase/planAhead_run_1" -part xc6slx9ftg256-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/yingyu/Desktop/ISEproj/spi_2phase/spi_2phase/spi_host.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/yingyu/Desktop/ISEproj/spi_2phase/spi_2phase} {ipcore_dir} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "spi_host.ucf" [current_fileset -constrset]
add_files [list {spi_host.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
