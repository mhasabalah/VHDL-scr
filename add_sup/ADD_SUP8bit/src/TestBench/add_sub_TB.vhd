library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity add_sub_tb is
end add_sub_tb;

architecture TB_ARCHITECTURE of add_sub_tb is
	-- Component declaration of the tested unit
	component add_sub
	port(
		M : in STD_LOGIC;
		A : in STD_LOGIC_VECTOR(7 downto 0);
		B : in STD_LOGIC_VECTOR(7 downto 0);
		CARRY : out STD_LOGIC;
		SUM : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal M : STD_LOGIC;
	signal A : STD_LOGIC_VECTOR(7 downto 0);
	signal B : STD_LOGIC_VECTOR(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal CARRY : STD_LOGIC;
	signal SUM : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : add_sub
		port map (
			M => M,
			A => A,
			B => B,
			CARRY => CARRY,
			SUM => SUM
		);

PROCESS
	BEGIN
	
		A <= "11110000";
		B <= "11111111";
		M <= '0';
	
		WAIT FOR 10 ns;
	
		A <= "10101010";
		B <= "01110111";
		M <= '1';
	
		WAIT FOR 10 ns;
	
		A <= "10001000";
		B <= "10011001";
		M <= '1';
		WAIT FOR 10 ns;
	WAIT;

END PROCESS;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_add_sub of add_sub_tb is
	for TB_ARCHITECTURE
		for UUT : add_sub
			use entity work.add_sub(add_sub_arch);
		end for;
	end for;
end TESTBENCH_FOR_add_sub;

