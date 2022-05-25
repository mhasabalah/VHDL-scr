SetActiveLib -work
comp -include "$dsn\src\Array_Mul.vhd" 
comp -include "$dsn\src\TestBench\array_mul_TB.vhd" 
asim +access +r TESTBENCH_FOR_array_mul 
wave 
wave -noreg X
wave -noreg Y
wave -noreg P
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\array_mul_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_array_mul 
