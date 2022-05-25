SetActiveLib -work
comp -include "$dsn\src\CarryLookAhead_16bit.vhd" 
comp -include "$dsn\src\TestBench\carrylookahead_16bit_TB.vhd" 
asim +access +r TESTBENCH_FOR_carrylookahead_16bit 
wave 
wave -noreg A
wave -noreg B
wave -noreg Cin
wave -noreg S
wave -noreg Cout
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\carrylookahead_16bit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_carrylookahead_16bit 
