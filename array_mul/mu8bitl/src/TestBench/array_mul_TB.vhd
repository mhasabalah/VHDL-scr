library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity array_mul_tb is
end array_mul_tb;

architecture TB_ARCHITECTURE of array_mul_tb is
	-- Component declaration of the tested unit
	component array_mul
	port(
		X : in BIT_VECTOR(7 downto 0);
		Y : in BIT_VECTOR(7 downto 0);
		P : out BIT_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal X : BIT_VECTOR(7 downto 0);
	signal Y : BIT_VECTOR(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal P : BIT_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : array_mul
		port map (
			X => X,
			Y => Y,
			P => P
		);

	-- Add your stimulus here ... 
	
PROCESS
	BEGIN
		X <= "11110000";
		Y <= "11111111";
	
		WAIT FOR 10 ns;
	 
		X <= "10101010";
		Y <= "01110111";
	 
		WAIT FOR 10 ns;
	 
		X <= "10001000";
		Y <= "10011001"; 
	 
		WAIT FOR 10 ns; 
	 
		X <= "10001000";
		Y <= "00011001"; 
	 
		WAIT FOR 10 ns;
	WAIT;
 
END PROCESS;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_array_mul of array_mul_tb is
	for TB_ARCHITECTURE
		for UUT : array_mul
			use entity work.array_mul(array_mul);
		end for;
	end for;
end TESTBENCH_FOR_array_mul;

