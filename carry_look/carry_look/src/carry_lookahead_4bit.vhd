LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Carry_Look_Ahead IS
	PORT (
		A    : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		B    : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		Cin  : IN  STD_LOGIC;
		S    : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		PF    : OUT STD_LOGIC;
		GF    : OUT STD_LOGIC);
END Carry_Look_Ahead;

ARCHITECTURE Behavioral OF Carry_Look_Ahead IS

	COMPONENT Partial_Full_Adder
		PORT (
			A   : IN  STD_LOGIC;
			B   : IN  STD_LOGIC;
			Cin : IN  STD_LOGIC;
			S   : OUT STD_LOGIC;
			P   : OUT STD_LOGIC;
			G   : OUT STD_LOGIC);
	END COMPONENT;

	SIGNAL c1, c2, c3 : STD_LOGIC;
	SIGNAL P, G : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

	PFA1 : Partial_Full_Adder PORT MAP(A(0), B(0), Cin, S(0), P(0), G(0));
	PFA2 : Partial_Full_Adder PORT MAP(A(1), B(1), c1, S(1), P(1), G(1));
	PFA3 : Partial_Full_Adder PORT MAP(A(2), B(2), c2, S(2), P(2), G(2));
	PFA4 : Partial_Full_Adder PORT MAP(A(3), B(3), c3, S(3), P(3), G(3));

	c1 <= G(0) OR (P(0) AND Cin);
	c2 <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
	c3 <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin); 
	
	PF <= P(3) AND P(2) AND P(1) AND P(0);
	GF <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0));
END Behavioral;