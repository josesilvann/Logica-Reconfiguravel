-- Package function sum 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE sum_a_b  IS
	FUNCTION soma (A, B : INTEGER) RETURN INTEGER;
END sum_a_b;

PACKAGE BODY sum_a_b IS
	FUNCTION soma (A, B : INTEGER) RETURN INTEGER IS
	BEGIN
		RETURN (A + B);
	END soma;
END sum_a_b;