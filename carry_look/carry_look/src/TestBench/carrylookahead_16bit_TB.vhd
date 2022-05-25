library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity carrylookahead_16bit_tb is
end carrylookahead_16bit_tb;

architecture TB_ARCHITECTURE of carrylookahead_16bit_tb is
	-- Component declaration of the tested unit
	component carrylookahead_16bit
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		Cin : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR(15 downto 0);
		Cout : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	signal Cin : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal S : STD_LOGIC_VECTOR(15 downto 0);
	signal Cout : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : carrylookahead_16bit
		port map (
			A => A,
			B => B,
			Cin => Cin,
			S => S,
			Cout => Cout
		);

	process
		begin
			A <= "1110000011110000";
			B <= "0011100011111111";
			Cin <= '0';
			
			wait for 10 ns;
			
			A <= "0000000010101010";
			B <= "0111011100000000";
			Cin <= '1';
			
			wait for 10 ns;
			
			A <= "1001011000001000";
			B <= "1001100111000111";
			Cin <= '1';
			
			wait for 10 ns;
		wait;
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_carrylookahead_16bit of carrylookahead_16bit_tb is
	for TB_ARCHITECTURE
		for UUT : carrylookahead_16bit
			use entity work.carrylookahead_16bit(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_carrylookahead_16bit;

