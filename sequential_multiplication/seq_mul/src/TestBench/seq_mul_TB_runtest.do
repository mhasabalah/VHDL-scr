SetActiveLib -work
comp -include "$dsn\src\sequential_multiplication.vhd" 
comp -include "$dsn\src\TestBench\seq_mul_TB.vhd" 
asim +access +r TESTBENCH_FOR_seq_mul 
wave 
wave -noreg M
wave -noreg Q
wave -noreg result
wave -noreg clk
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\seq_mul_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_seq_mul 
