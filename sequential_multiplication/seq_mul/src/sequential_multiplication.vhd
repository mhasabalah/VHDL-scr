LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL; 
USE ieee.std_logic_arith.ALL; 
USE ieee.std_logic_unsigned.ALL;
ENTITY seq_mul IS
	PORT (
		M       : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Q       : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		result  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		clk     : IN std_logic
	);
END seq_mul;

ARCHITECTURE seq_mul_arch OF seq_mul IS 

BEGIN
	PROCESS (clk)
	VARIABLE A : std_logic_vector(8 DOWNTO 0); 
	VARIABLE B : std_logic_vector(7 DOWNTO 0);
	VARIABLE C : std_logic_vector(8 DOWNTO 0);
	VARIABLE temp_add : std_logic_vector(8 DOWNTO 0);
	BEGIN
		A := "000000000";
		B := Q;
		C := '0' & M; 
		IF clk = '1' AND clk'EVENT THEN
			FOR i IN 0 TO 7 LOOP
				IF B(0) = '1' THEN
					A := A + C;
				END IF;
				B := A(0) & B(7 DOWNTO 1);
				A := '0' & A(8 DOWNTO 1);
			END LOOP;
 
			result <= A(7 DOWNTO 0) & B;
 
		ELSE
			result <= "0000000000000000";
		END IF;
	END PROCESS;

END seq_mul_arch;
