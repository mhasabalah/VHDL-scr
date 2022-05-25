LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY non_restoring_div IS
	PORT (
		M         : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		Q         : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		quotient  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		reminder  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END non_restoring_div;
ARCHITECTURE non_restoring_div_arch OF non_restoring_div IS
	SIGNAL temp_carry : STD_LOGIC;
BEGIN
	PROCESS (Q, M, temp_carry)
	VARIABLE A : std_logic_vector(3 DOWNTO 0);
	VARIABLE B : std_logic_vector(3 DOWNTO 0);
	VARIABLE C : std_logic_vector(3 DOWNTO 0);
	BEGIN
		A := "0000";
		B := Q;
		C := M;
		FOR i IN 0 TO 3 LOOP

			IF A(3) = '1' THEN
				A := A(2 DOWNTO 0) & B(3);
				A := A + C;
			ELSE
				A := A(2 DOWNTO 0) & B(3);
				A := A - C;
			END IF;
			IF A(3) = '1' THEN
				B := B(2 DOWNTO 0) & '0';
			ELSE
				B := B(2 DOWNTO 0) & '1';
			END IF;

		END LOOP;
		IF A(3) = '1' THEN
			A := A + C;
		END IF;
		quotient <= B;
		reminder <= A;
	END PROCESS;

END non_restoring_div_arch;
