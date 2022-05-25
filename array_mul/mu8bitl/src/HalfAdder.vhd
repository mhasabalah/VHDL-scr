library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity HalfAdder is
	 port(
		 X : in bit;
		 Y : in bit;
		 Cout : out bit;
		 Sum : out bit
	     );
end HalfAdder;

architecture HalfAdder_arch of HalfAdder is
begin
	Sum<=X XOR Y;
	Cout<=X AND Y;
end HalfAdder_arch;
