library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FA is
	 port(
		 X : in STD_LOGIC;
		 Y : in STD_LOGIC;
		 Z : in STD_LOGIC;
		 S : out STD_LOGIC;
		 C : out STD_LOGIC
	     );
end FA;
architecture FAARCH of FA is
begin
 S<=(X XOR Y) XOR Z;
 C<=(X AND Y)OR ((X XOR Y)AND Z);
end FAARCH;
