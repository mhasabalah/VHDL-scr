library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ADD_SUB is
	 port(
		 M : in STD_LOGIC;
		 A : in STD_LOGIC_VECTOR(7 downto 0);
		 B : in STD_LOGIC_VECTOR(7 downto 0);
		 CARRY : out STD_LOGIC;
		 SUM : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end ADD_SUB;					 


architecture ADD_SUB_ARCH of ADD_SUB is	
component xorgate is
	 port(
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 C : out STD_LOGIC
	     );
end component; 
COMPONENT Ripple_Adder is
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		Cin : IN std_logic;
		S : OUT std_logic_vector(3 downto 0);
		Cout : OUT std_logic
		);
END COMPONENT;

signal C:std_logic;
signal temp:std_logic_vector (7 downto 0);
begin
XOR_G1:	xorgate port map(M,B(0),temp(0)); 
XOR_G2:	xorgate port map(M,B(1),temp(1));
XOR_G3:	xorgate port map(M,B(2),temp(2));
XOR_G4:	xorgate port map(M,B(3),temp(3));
XOR_G5:	xorgate port map(M,B(4),temp(4)); 
XOR_G6:	xorgate port map(M,B(5),temp(5)); 
XOR_G7:	xorgate port map(M,B(6),temp(6)); 
XOR_G8:	xorgate port map(M,B(7),temp(7)); 		 

RA_G1:Ripple_Adder port map(A(3 downto 0), temp(3 downto 0),M ,SUM(3 downto 0) ,C);	
RA_G2:Ripple_Adder port map(A(7 downto 4), temp(7 downto 4),C ,SUM(7 downto 4) ,CARRY);	

end ADD_SUB_ARCH;