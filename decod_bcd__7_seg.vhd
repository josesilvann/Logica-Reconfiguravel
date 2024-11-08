--Aula Case - When 06/11
--Decod BCD 7 SEG

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY case_when IS
PORT( SW : IN STD_LOGIC_VECTOR (0 TO 3);
	HEX0 : OUT STD_LOGIC_VECTOR (0 TO 6));
END case_when;

ARCHITECTURE logica OF case_when IS
BEGIN 

PROCESS (SW)
BEGIN
	CASE SW IS 
		WHEN "0000" => HEX0 <= "0000001";
		WHEN "0001" => HEX0 <= "1001111";
		WHEN "0010" => HEX0 <= "0010010";
		WHEN "0011" => HEX0 <= "0000110";
		WHEN "0100" => HEX0 <= "1001100";
		WHEN "0101" => HEX0 <= "0100100";
		WHEN "0110" => HEX0 <= "0100000";
		WHEN "0111" => HEX0 <= "0001111";
		WHEN "1000" => HEX0 <= "0000000";
		WHEN "1001" => HEX0 <= "0000100";
		WHEN OTHERS => HEX0 <= "0110000";
	END CASE;
END PROCESS;

END logica;