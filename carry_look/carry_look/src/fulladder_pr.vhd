LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Partial_Full_Adder IS
	PORT (
		A   : IN  STD_LOGIC;
		B   : IN  STD_LOGIC;
		Cin : IN  STD_LOGIC;
		S   : OUT STD_LOGIC;
		P   : OUT STD_LOGIC;
		G   : OUT STD_LOGIC);
END Partial_Full_Adder;

ARCHITECTURE Behavioral OF Partial_Full_Adder IS

BEGIN

	S <= A XOR B XOR Cin;
	P <= A XOR B;
	G <= A AND B;

END Behavioral;
