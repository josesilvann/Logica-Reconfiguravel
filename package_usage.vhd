--Aula 05/12
--Package usage 
--Sum package and sub package

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.sum_a_b.all;
USE work.sub_a_b.all;

ENTITY aula_function IS 
	PORT( A, B : IN INTEGER RANGE 0 TO 7;
		C : OUT INTEGER RANGE 0 TO 14;
		D : OUT INTEGER RANGE -7 TO 7);
END ENTITY;

ARCHITECTURE logica OF aula_function IS
BEGIN 
	C <= work.sum_a_b.soma(A,B);
	D <= work.sub_a_b.sub(A,B);
END logica;