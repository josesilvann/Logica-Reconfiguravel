
--Component of 7 seg for trabalho 3.

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sete_segmentos IS
PORT(zero_menos: IN INTEGER RANGE 0 TO 8;
	  um_mais: IN INTEGER RANGE 0 TO 8;
	  um_todos: IN INTEGER RANGE 0 TO 8;
	  saida_zero_menos: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	  saida_um_mais: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	  saida_um_todos: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END sete_segmentos;

ARCHITECTURE logica OF sete_segmentos IS
BEGIN
WITH zero_menos SELECT
		saida_zero_menos <= "1000000" when 0,
                          "1111001" when 1,
                          "0100100" when 2,
                          "0110000" when 3,
                          "0011001" when 4,
                          "0010010" when 5,
                          "0000010" when 6,
                          "1111000" when 7,
                          "0000000" when 8,
								  "0000110" when others;

WITH um_mais SELECT
		saida_um_mais <= "1000000" when 0,
                          "1111001" when 1,
                          "0100100" when 2,
                          "0110000" when 3,
                          "0011001" when 4,
                          "0010010" when 5,
                          "0000010" when 6,
                          "1111000" when 7,
                          "0000000" when 8,
								  "0000110" when others;
			

WITH um_todos SELECT
		saida_um_todos <= "1000000" when 0,
                          "1111001" when 1,
                          "0100100" when 2,
                          "0110000" when 3,
                          "0011001" when 4,
                          "0010010" when 5,
                          "0000010" when 6,
                          "1111000" when 7,
                          "0000000" when 8,
								  "0000110" when others;

END logica;