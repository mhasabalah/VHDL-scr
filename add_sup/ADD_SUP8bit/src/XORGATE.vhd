library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xorgate is
	 port(
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 C : out STD_LOGIC
	     );
end xorgate;
architecture xorarch of xorgate is
begin
C<= A XOR B;
end xorarch;