library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity seq_mul_tb is
end seq_mul_tb;

architecture TB_ARCHITECTURE of seq_mul_tb is
	-- Component declaration of the tested unit
	component seq_mul
	port(
		M : in STD_LOGIC_VECTOR(7 downto 0);
		Q : in STD_LOGIC_VECTOR(7 downto 0);
		result : out STD_LOGIC_VECTOR(15 downto 0);
		clk : in STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal M : STD_LOGIC_VECTOR(7 downto 0);
	signal Q : STD_LOGIC_VECTOR(7 downto 0);
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal result : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : seq_mul
		port map (
			M => M,
			Q => Q,
			result => result,
			clk => clk
		);

	-- Add your stimulus here ... 
	
PROCESS
	BEGIN
		M <= "11110000";
		Q <= "11111111";
		clk <= '1';
		WAIT FOR 10 ns;
		
		M <= "10101010";
		Q <= "01110111";
		clk <= '0';
		WAIT FOR 10 ns;
		
		M <= "10001000";
		Q <= "10011001";
		clk <= '1';
		WAIT FOR 10 ns;
	 
	WAIT;
END PROCESS;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_seq_mul of seq_mul_tb is
	for TB_ARCHITECTURE
		for UUT : seq_mul
			use entity work.seq_mul(seq_mul_arch);
		end for;
	end for;
end TESTBENCH_FOR_seq_mul;

