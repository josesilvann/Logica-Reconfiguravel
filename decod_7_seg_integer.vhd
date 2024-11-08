--Aula Case - When 06/11
-- Decodificador 7 segmentos usando integer
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY case_when IS
PORT( KEY : IN STD_LOGIC_VECTOR(0 TO 0);
	HEX0 : OUT STD_LOGIC_VECTOR (0 TO 6));
END case_when;

ARCHITECTURE logica OF case_when IS
BEGIN 

PROCESS (KEY(0))
VARIABLE COUNT : INTEGER RANGE 0 TO 15 := 0;
BEGIN
	IF(KEY(0)'EVENT AND KEY(0) = '0') THEN 
		CASE COUNT IS 
			WHEN 0 => HEX0 <= "0000001";
			WHEN 1 => HEX0 <= "1001111";
			WHEN 2 => HEX0 <= "0010010";
			WHEN 3 => HEX0 <= "0000110";
			WHEN 4 => HEX0 <= "1001100";
			WHEN 5 => HEX0 <= "0100100";
			WHEN 6 => HEX0 <= "0100000";
			WHEN 7 => HEX0 <= "0001111";
			WHEN 8 => HEX0 <= "0000000";
			WHEN 9 => HEX0 <= "0000100";
			WHEN OTHERS => HEX0 <= "0110000";
		END CASE;
	COUNT := COUNT + 1;
	END IF;
END PROCESS;

END logica;