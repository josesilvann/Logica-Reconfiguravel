--Aula Case - When 06/11
--Sequencial de led

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY case_when IS
PORT( KEY : IN STD_LOGIC_VECTOR(0 TO 0);
LEDR : OUT STD_LOGIC_VECTOR (0 TO 3));
END case_when;

ARCHITECTURE logica OF case_when IS
BEGIN 

PROCESS (KEY(0))
VARIABLE COUNT : INTEGER RANGE 0 TO 3 := 0;
BEGIN
	IF(KEY(0)'EVENT AND KEY(0) = '0') THEN 
		CASE COUNT IS 
			WHEN 0 => LEDR <= "1000";
			WHEN 1 => LEDR <= "0100";
			WHEN 2 => LEDR <= "0010";
			WHEN 3 => LEDR <= "0001";
			WHEN OTHERS => LEDR <= "0000";
		END CASE;
	COUNT := COUNT + 1;
	END IF;
END PROCESS;

END logica;