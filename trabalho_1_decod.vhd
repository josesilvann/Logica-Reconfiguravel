--Nome Projeto: trabalho_1_decod
--Data: 24/10/2024
--Nome: José Vitor Montanger Ribeiro da Silva 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--Declaração INS E OUTS usando variaveis unitarias e vetores.
ENTITY trabalho_1_decod IS
	PORT (EN : IN STD_LOGIC;
		SEL : IN STD_LOGIC;
		I : IN STD_LOGIC_VECTOR (0 TO 2);
		O : OUT STD_LOGIC_VECTOR (0 TO 7));
END trabalho_1_decod;

--Construção arquitetura utilizando 3 SIGNALS para guardar possíveis saídas.
ARCHITECTURE logica OF trabalho_1_decod IS
SIGNAL X: STD_LOGIC_VECTOR(0 TO 7);
SIGNAL X2: STD_LOGIC_VECTOR(0 TO 7);
SIGNAL SAIDA: STD_LOGIC_VECTOR(0 TO 7);
BEGIN
--Primeiro WITH-SELECT-WHEN para formar a possível saída de input formato Binário.
	WITH I SELECT
		X <= "00000001" WHEN "000",
				"00000010" WHEN "001",
				"00000100" WHEN "010",
				"00001000" WHEN "011",
				"00010000" WHEN "100",
				"00100000" WHEN "101",
				"01000000" WHEN "110",
				"10000000" WHEN "111";
--Segundo WITH-SELECT-WHEN para formar a possível saída input formato Gray.
	WITH I SELECT 
		X2 <= "00000001" WHEN "000",
				"00000010" WHEN "001",
				"00000100" WHEN "011",
				"00001000" WHEN "010",
				"00010000" WHEN "110",
				"00100000" WHEN "111",
				"01000000" WHEN "101",
				"10000000" WHEN "100";
-- WHEN-ELSE utilizado para escolher qual das saídas apresentar conforme a variável SEL
	SAIDA <= X WHEN SEL = '0' ELSE X2;
-- TERCEIRO WITH-SELECT-WHEN para filtrar quando EN estiver pressionado. 	
	WITH EN SELECT 
		O <= SAIDA WHEN '1',
				"00000000" WHEN OTHERS;
END logica;
				
		