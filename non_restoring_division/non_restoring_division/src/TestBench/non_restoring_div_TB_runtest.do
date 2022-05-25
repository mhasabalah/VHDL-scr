SetActiveLib -work
comp -include "$dsn\src\non_div.vhd" 
comp -include "$dsn\src\TestBench\non_restoring_div_TB.vhd" 
asim +access +r TESTBENCH_FOR_non_restoring_div 
wave 
wave -noreg M
wave -noreg Q
wave -noreg quotient
wave -noreg reminder
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\non_restoring_div_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_non_restoring_div 
