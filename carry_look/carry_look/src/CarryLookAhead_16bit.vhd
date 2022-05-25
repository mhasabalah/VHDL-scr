LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CarryLookAhead_16bit IS
	PORT (
		A    : IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
		B    : IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
		Cin  : IN  STD_LOGIC;
		S    : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		Cout : OUT STD_LOGIC);
END CarryLookAhead_16bit;

ARCHITECTURE Behavioral OF CarryLookAhead_16bit IS
	component Carry_Look_Ahead IS
		PORT (
			A    : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
			B    : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
			Cin  : IN  STD_LOGIC;
			S    : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			PF    : OUT STD_LOGIC;
			GF    : OUT STD_LOGIC);
	END component;

	SIGNAL c4, c8, c12 : STD_LOGIC;
	SIGNAL P, G : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
	CLH1 : Carry_Look_Ahead PORT MAP(A(3 downto 0), B(3 downto 0), Cin, S(3 downto 0), P(0), G(0));
	CLH2 : Carry_Look_Ahead PORT MAP(A(7 downto 4), B(7 downto 4), c4, S(7 downto 4), P(1), G(1));
	CLH3 : Carry_Look_Ahead PORT MAP(A(11 downto 8), B(11 downto 8), c8, S(11 downto 8), P(2), G(2));
	CLH4 : Carry_Look_Ahead PORT MAP(A(15 downto 12), B(15 downto 12), c12, S(15 downto 12), P(3), G(3));

	c4 <= G(0) OR (P(0) AND Cin);
	c8 <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
	c12 <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin);
	Cout <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin);

END Behavioral;