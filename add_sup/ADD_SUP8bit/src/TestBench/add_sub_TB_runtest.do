SetActiveLib -work
comp -include "$dsn\src\addersubtractor.vhd" 
comp -include "$dsn\src\TestBench\add_sub_TB.vhd" 
asim +access +r TESTBENCH_FOR_add_sub 
wave 
wave -noreg M
wave -noreg A
wave -noreg B
wave -noreg CARRY
wave -noreg SUM
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\add_sub_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_add_sub 
