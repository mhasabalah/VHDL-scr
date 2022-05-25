library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity non_restoring_div_tb is
end non_restoring_div_tb;

architecture TB_ARCHITECTURE of non_restoring_div_tb is
	-- Component declaration of the tested unit
	component non_restoring_div
	port(
		M : in STD_LOGIC_VECTOR(3 downto 0);
		Q : in STD_LOGIC_VECTOR(3 downto 0);
		quotient : out STD_LOGIC_VECTOR(3 downto 0);
		reminder : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal M : STD_LOGIC_VECTOR(3 downto 0);
	signal Q : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal quotient : STD_LOGIC_VECTOR(3 downto 0);
	signal reminder : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : non_restoring_div
		port map (
			M => M,
			Q => Q,
			quotient => quotient,
			reminder => reminder
		);

	-- Add your stimulus here ...	 
PROCESS
	BEGIN
		Q <= "1000";
		M <= "0011";
		WAIT FOR 10 ns;
		
		Q <= "0100";
		M <= "0010";
		WAIT FOR 10 ns;
		
		Q <= "1000";
		M <= "0010";
		WAIT FOR 10 ns;	
		
		Q <= "1000";
		M <= "1000";
		WAIT FOR 10 ns;
	WAIT;
END PROCESS;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_non_restoring_div of non_restoring_div_tb is
	for TB_ARCHITECTURE
		for UUT : non_restoring_div
			use entity work.non_restoring_div(non_restoring_div_arch);
		end for;
	end for;
end TESTBENCH_FOR_non_restoring_div;

