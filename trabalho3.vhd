-- Nome Projeto: trabalho3
-- Data: 04/12/2024
-- Nome: EDUARDO BOMBONATTO LORENZETTI 
-- 		JOSE VITOR MONTANGER 

-- Counter of ones, most significant ones and less significant zeros.

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY trabalho3 IS
PORT(SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	  HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --NUMERO INTEIRO DE TODOS OS 0'S MENOS SIGNIFICATIVOS
     HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --NUMERO INTEIRO DE TODOS OS 1'S MAIS SIGNIFICATIVOS
	  HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); --NUMERO INTEIRO DE TODOS OS 1'S NA ENTRADA
END trabalho3;

ARCHITECTURE logica OF trabalho3 IS

SIGNAL saida_zero: integer range 0 to 8 := 0;
SIGNAL saida_um_msb: integer range 0 to 8 := 0;
SIGNAL saida_um_total: integer range 0 to 8 := 0;

COMPONENT sete_segmentos IS
	PORT(zero_menos: IN INTEGER RANGE 0 TO 8;
	  um_mais: IN INTEGER RANGE 0 TO 8;
	  um_todos: IN INTEGER RANGE 0 TO 8;
	  saida_zero_menos: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	  saida_um_mais: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	  saida_um_todos: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;
	
BEGIN

	PROCESS (SW)
	variable count_zero_menos: integer range 0 to 8 := 0;
	variable count_um_mais : integer range 0 to 8 := 0;
	variable count_um_total : integer range 0 to 8 := 0;
	
	BEGIN
		zero_menos: FOR i IN 0 to 7 LOOP
			CASE SW(i) IS
				WHEN '0' => count_zero_menos := count_zero_menos + 1;
				WHEN OTHERS => EXIT;
			END CASE;
		END LOOP;
		saida_zero <= count_zero_menos;
		count_zero_menos := 0;
		
		um_mais: FOR y IN 7 DOWNTO 0 LOOP
			CASE SW(y) IS
				WHEN '1' => count_um_mais := count_um_mais + 1;
				WHEN OTHERS => EXIT;
			END CASE;
		END LOOP;
		saida_um_msb <= count_um_mais;
		count_um_mais := 0;
		
		um_todos: FOR z IN 7 DOWNTO 0 LOOP
			CASE SW(z) IS
				WHEN '1' => count_um_total := count_um_total + 1;
				WHEN OTHERS => NULL;
			END CASE;
		END LOOP;
		saida_um_total <= count_um_total;
		count_um_total := 0;
		
	END PROCESS;
	
	saida: sete_segmentos PORT MAP(saida_zero, saida_um_msb, saida_um_total, HEX0, HEX1, HEX2);

END logica;