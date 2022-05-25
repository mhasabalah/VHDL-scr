library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FullAdder is
	 port(
		 X : in bit;
		 Y : in bit;
		 Cin : in bit;
		 Cout : out bit;
		 Sum : out bit
	     );
end FullAdder;
architecture FullAdder_arch of FullAdder is
begin
 Sum<=(X XOR Y) XOR Cin;
 Cout<=(X AND Y) OR ((X XOR Y) AND Cin);
end FullAdder_arch;