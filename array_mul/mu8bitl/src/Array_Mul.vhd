LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Array_Mul IS
	PORT (
		X : IN  bit_vector(7 DOWNTO 0);
		Y : IN  bit_vector(7 DOWNTO 0);
		P : OUT bit_VECTOR(15 DOWNTO 0)
	);
END Array_Mul;

ARCHITECTURE Array_Mul OF Array_Mul IS

	SIGNAL C1, C2, C3, C4, C5, C6, C7 : bit_vector(7 DOWNTO 0);
	SIGNAL S1, S2, S3, S4, S5, S6, S7 : bit_vector(7 DOWNTO 0);
	SIGNAL XY0, XY1, XY2, XY3, XY4, XY5, XY6, XY7 : bit_vector(7 DOWNTO 0);

	COMPONENT HalfAdder IS
		PORT (
			X    : IN  BIT;
			Y    : IN  BIT;
			Cout : OUT BIT;
			Sum  : OUT BIT
		);
	END COMPONENT;

	COMPONENT FullAdder IS
		PORT (
			X    : IN  BIT;
			Y    : IN  BIT;
			Cin  : IN  BIT;
			Cout : OUT BIT;
			Sum  : OUT BIT
		);
	END COMPONENT;

BEGIN

	-- Frist layer AndGate.	
	XY0(0) <= X(0)AND Y(0); XY1(0) <= X(0) AND Y(1);
	XY0(1) <= X(1)AND Y(0); XY1(1) <= X(1) AND Y(1);
	XY0(2) <= X(2)AND Y(0); XY1(2) <= X(2) AND Y(1);
	XY0(3) <= X(3)AND Y(0); XY1(3) <= X(3) AND Y(1);
	XY0(4) <= X(4)AND Y(0); XY1(4) <= X(4) AND Y(1);
	XY0(5) <= X(5)AND Y(0); XY1(5) <= X(5) AND Y(1);
	XY0(6) <= X(6)AND Y(0); XY1(6) <= X(6) AND Y(1);
	XY0(7) <= X(7)AND Y(0); XY1(7) <= X(7) AND Y(1);

	-- Second & Third  layer AndGate.
	XY2(0) <= X(0)AND Y(2); XY3(0) <= X(0) AND Y(3);
	XY2(1) <= X(1)AND Y(2); XY3(1) <= X(1) AND Y(3);
	XY2(2) <= X(2)AND Y(2); XY3(2) <= X(2) AND Y(3);
	XY2(3) <= X(3)AND Y(2); XY3(3) <= X(3) AND Y(3);
	XY2(4) <= X(4)AND Y(2); XY3(4) <= X(4) AND Y(3);
	XY2(5) <= X(5)AND Y(2); XY3(5) <= X(5) AND Y(3);
	XY2(6) <= X(6)AND Y(2); XY3(6) <= X(6) AND Y(3);
	XY2(7) <= X(7)AND Y(2); XY3(7) <= X(7) AND Y(3);

	-- Fourth & Fifth layer AndGate.
	XY4(0) <= X(0)AND Y(4); XY5(0) <= X(0) AND Y(5);
	XY4(1) <= X(1)AND Y(4); XY5(1) <= X(1) AND Y(5);
	XY4(2) <= X(2)AND Y(4); XY5(2) <= X(2) AND Y(5);
	XY4(3) <= X(3)AND Y(4); XY5(3) <= X(3) AND Y(5);
	XY4(4) <= X(4)AND Y(4); XY5(4) <= X(4) AND Y(5);
	XY4(5) <= X(5)AND Y(4); XY5(5) <= X(5) AND Y(5);
	XY4(6) <= X(6)AND Y(4); XY5(6) <= X(6) AND Y(5);
	XY4(7) <= X(7)AND Y(4); XY5(7) <= X(7) AND Y(5);

	-- Sixth & Seventh layer AndGate.
	XY6(0) <= X(0)AND Y(6); XY7(0) <= X(0) AND Y(7);
	XY6(1) <= X(1)AND Y(6); XY7(1) <= X(1) AND Y(7);
	XY6(2) <= X(2)AND Y(6); XY7(2) <= X(2) AND Y(7);
	XY6(3) <= X(3)AND Y(6); XY7(3) <= X(3) AND Y(7);
	XY6(4) <= X(4)AND Y(6); XY7(4) <= X(4) AND Y(7);
	XY6(5) <= X(5)AND Y(6); XY7(5) <= X(5) AND Y(7);
	XY6(6) <= X(6)AND Y(6); XY7(6) <= X(6) AND Y(7);
	XY6(7) <= X(7)AND Y(6); XY7(7) <= X(7) AND Y(7);

	----------------------------------------------------

	-- Frist layer FullAdder.
	FA1 : FullAdder PORT MAP(XY0(2), XY1(1), C1(0), C1(1), S1(1));
	FA2 : FullAdder PORT MAP(XY0(3), XY1(2), C1(1), C1(2), S1(2));
	FA3 : FullAdder PORT MAP(XY0(4), XY1(3), C1(2), C1(3), S1(3));
	FA4 : FullAdder PORT MAP(XY0(5), XY1(4), C1(3), C1(4), S1(4));
	FA5 : FullAdder PORT MAP(XY0(6), XY1(5), C1(4), C1(5), S1(5));
	FA6 : FullAdder PORT MAP(XY0(7), XY1(6), C1(5), C1(6), S1(6));

	-- Second layer FullAdder.
	FA7 : FullAdder PORT MAP(S1(2), XY2(1), C2(0), C2(1), S2(1));
	FA8 : FullAdder PORT MAP(S1(3), XY2(2), C2(1), C2(2), S2(2));
	FA9 : FullAdder PORT MAP(S1(4), XY2(3), C2(2), C2(3), S2(3));
	FA10 : FullAdder PORT MAP(S1(5), XY2(4), C2(3), C2(4), S2(4));
	FA11 : FullAdder PORT MAP(S1(6), XY2(5), C2(4), C2(5), S2(5));
	FA12 : FullAdder PORT MAP(S1(7), XY2(6), C2(5), C2(6), S2(6));
	FA13 : FullAdder PORT MAP(C1(7), XY2(7), C2(6), C2(7), S2(7));

	-- Third layer FullAdder.
	FA14 : FullAdder PORT MAP(S2(2), XY3(1), C3(0), C3(1), S3(1));
	FA15 : FullAdder PORT MAP(S2(3), XY3(2), C3(1), C3(2), S3(2));
	FA16 : FullAdder PORT MAP(S2(4), XY3(3), C3(2), C3(3), S3(3));
	FA17 : FullAdder PORT MAP(S2(5), XY3(4), C3(3), C3(4), S3(4));
	FA18 : FullAdder PORT MAP(S2(6), XY3(5), C3(4), C3(5), S3(5));
	FA19 : FullAdder PORT MAP(S2(7), XY3(6), C3(5), C3(6), S3(6));
	FA20 : FullAdder PORT MAP(c2(7), XY3(7), C3(6), C3(7), S3(7));

	-- Fourth layer FullAdder.
	FA21 : FullAdder PORT MAP(S3(2), XY4(1), C4(0), C4(1), S4(1));
	FA22 : FullAdder PORT MAP(S3(3), XY4(2), C4(1), C4(2), S4(2));
	FA23 : FullAdder PORT MAP(S3(4), XY4(3), C4(2), C4(3), S4(3));
	FA24 : FullAdder PORT MAP(S3(5), XY4(4), C4(3), C4(4), S4(4));
	FA25 : FullAdder PORT MAP(S3(6), XY4(5), C4(4), C4(5), S4(5));
	FA26 : FullAdder PORT MAP(S3(7), XY4(6), C4(5), C4(6), S4(6));
	FA27 : FullAdder PORT MAP(C3(7), XY4(7), C4(6), C4(7), S4(7));

	-- Fifth layer FullAdder.
	FA28 : FullAdder PORT MAP(S4(2), XY5(1), C5(0), C5(1), S5(1));
	FA29 : FullAdder PORT MAP(S4(3), XY5(2), C5(1), C5(2), S5(2));
	FA30 : FullAdder PORT MAP(S4(4), XY5(3), C5(2), C5(3), S5(3));
	FA31 : FullAdder PORT MAP(S4(5), XY5(4), C5(3), C5(4), S5(4));
	FA32 : FullAdder PORT MAP(S4(6), XY5(5), C5(4), C5(5), S5(5));
	FA33 : FullAdder PORT MAP(S4(7), XY5(6), C5(5), C5(6), S5(6));
	FA34 : FullAdder PORT MAP(C4(7), XY5(7), C5(6), C5(7), S5(7));

	-- Sixth layer FullAdder.
	FA35 : FullAdder PORT MAP(S5(2), XY6(1), C6(0), C6(1), S6(1));
	FA36 : FullAdder PORT MAP(S5(3), XY6(2), C6(1), C6(2), S6(2));
	FA37 : FullAdder PORT MAP(S5(4), XY6(3), C6(2), C6(3), S6(3));
	FA38 : FullAdder PORT MAP(S5(5), XY6(4), C6(3), C6(4), S6(4));
	FA39 : FullAdder PORT MAP(S5(6), XY6(5), C6(4), C6(5), S6(5));
	FA40 : FullAdder PORT MAP(S5(7), XY6(6), C6(5), C6(6), S6(6));
	FA41 : FullAdder PORT MAP(C5(7), XY6(7), C6(6), C6(7), S6(7));

	-- Seventh layer FullAdder.
	FA42 : FullAdder PORT MAP(S6(2), XY7(1), C7(0), C7(1), S7(1));
	FA43 : FullAdder PORT MAP(S6(3), XY7(2), C7(1), C7(2), S7(2));
	FA44 : FullAdder PORT MAP(S6(4), XY7(3), C7(2), C7(3), S7(3));
	FA45 : FullAdder PORT MAP(S6(5), XY7(4), C7(3), C7(4), S7(4));
	FA46 : FullAdder PORT MAP(S6(6), XY7(5), C7(4), C7(5), S7(5));
	FA47 : FullAdder PORT MAP(S6(7), XY7(6), C7(5), C7(6), S7(6));
	FA48 : FullAdder PORT MAP(C6(7), XY7(7), C7(6), C7(7), S7(7));

	-- Half Adder Gates.
	HA1 : HalfAdder PORT MAP(XY0(2), XY1(1), C1(0), S1(0));
	HA2 : HalfAdder PORT MAP(XY1(7), C1(6), C1(7), S1(7));
	HA3 : HalfAdder PORT MAP(S1(1), XY2(0), C2(0), S2(0));
	HA4 : HalfAdder PORT MAP(S2(1), XY3(0), C3(0), S3(0));
	HA5 : HalfAdder PORT MAP(S3(1), XY4(0), C4(0), S4(0));
	HA6 : HalfAdder PORT MAP(S4(1), XY5(0), C5(0), S5(0));
	HA7 : HalfAdder PORT MAP(S5(1), XY6(0), C6(0), S6(0));
	HA8 : HalfAdder PORT MAP(S6(1), XY7(0), C7(0), S7(0)); 
	
	P(0) <= XY0(0);
	P(1) <= S1(0);
	P(2) <= S2(0);
	P(3) <= S3(0);
	P(4) <= S4(0);
	P(5) <= S5(0);
	P(6) <= S6(0);
	P(7) <= S7(0);
	P(8) <= S7(1);
	P(9) <= S7(2);
	P(10) <= S7(3);
	P(11) <= S7(4);
	P(12) <= S7(5);
	P(13) <= S7(6);
	P(14) <= S7(7);
	P(15) <= C7(7);

END Array_Mul;
