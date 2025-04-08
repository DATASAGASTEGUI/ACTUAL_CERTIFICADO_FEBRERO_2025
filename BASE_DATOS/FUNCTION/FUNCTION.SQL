-- FUNCTION PROPIAS DE MYSQL

SELECT YEAR('2025-04-30');

-- FUNCTION PROPIAS DEL USUARIO

-- EJEMPLO 1
USE FACTORIA;
-- 1. IMPLEMENTAR
DELIMITER //
CREATE FUNCTION sumar_dos_numeros(a INT, b INT) RETURNS INT
DETERMINISTIC
BEGIN
   RETURN a + b;
END;
//
DELIMITER ;
-- 2. LLAMARLA

SELECT sumar_dos_numeros(2,3) AS Resultado;

-- EJEMPLO 2
USE FACTORIA;
-- 1. IMPLEMENTAR
DELIMITER //
CREATE FUNCTION sumar_dos_numeros_constantes() RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE a INT DEFAULT 5;
   DECLARE b INT DEFAULT 3;
   DECLARE c INT;
   SET c = a + b;
   RETURN c;
END;
//
DELIMITER ;
-- 2. LLAMARLA

SELECT sumar_dos_numeros_constantes() AS Resultado;

SELECT *, sumar_dos_numeros_constantes() AS Resultado FROM Cliente;

-- CREAR LA FUNCION QUE RECIBA EL LIMITE DEL CREDITO Y MUESTRE
-- EL MENSAJE SI ES MENOR A 35000 BAJO EN CASO CONTRARIO ALTO 

DELIMITER //
CREATE FUNCTION mensaje_limite_credito(limite_credito INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
   IF limite_credito < 35000 THEN
      RETURN 'Bajo';
   ELSE
      RETURN 'Alto';
   END IF;
END;
//
DELIMITER ;

SELECT *, mensaje_limite_credito(limite_credito) AS Resultado FROM Cliente;

-- SENTENCIA CONDICIONAL MULTIPLE

-- EVALUAR UN NUMERO Y DETERMINAR SI ES POSITIVO, NEGATIVO O CERO

DELIMITER $$
CREATE FUNCTION evaluar_numero_entero(numero INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF numero > 0 THEN
       RETURN 'Positivo';
	ELSEIF numero < 0 THEN
       RETURN 'Negativo';
	ELSE
       RETURN 'Cero';
    END IF;
END;
$$

DELIMITER ;

SELECT evaluar_numero_entero(0) AS Resultado;

-- CONDICIONAL MULTIPLE USANDO CASE

-- EVALUAR UNA NOTA  
-- 0-4.9 (Suspenso), 5-6.9 (Aprobado), 
-- 7-8.9 (Notable), 9-10 (Sobresaliente). 

DROP FUNCTION IF EXISTS evaluar_nota;

DELIMITER $$
CREATE FUNCTION evaluar_nota(nota INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    RETURN CASE
       WHEN nota >= 0 AND nota < 5 THEN 'Suspenso'
       WHEN nota >= 5 AND nota < 7 THEN 'Aprobado'
       WHEN nota >= 7 AND nota < 9 THEN 'Notable'
       WHEN nota >= 9 AND nota <= 10 THEN 'Sobresaliente'
       ELSE 'Nota no valida'
	END;
END;
$$

DELIMITER ;

SELECT evaluar_nota(16) AS Resultado;

DROP FUNCTION evaluar_nota;

-- BUCLE WHILE

DROP FUNCTION IF EXISTS sumar_serie;
DELIMITER ##
CREATE FUNCTION sumar_serie(n INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE suma INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    WHILE i <= n DO
       SET suma = suma + i;
       SET i = i + 1; 
	END WHILE;
    RETURN suma;
END ##

DELIMITER ;

SELECT sumar_serie(5) AS Resultado;

-- BUCLE LOOP
-- n = 5     1 2 3 4 5 = 6 suma de los pares
-- n = 10    1 2 3 4 5 6 7 8 9 10 = 30 suma de los pares
DROP FUNCTION IF EXISTS sumar_serie_par;
DELIMITER ##
CREATE FUNCTION sumar_serie_par(n INT) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE suma INT DEFAULT 0;
    mi_bucle: LOOP
       IF i > n THEN
          LEAVE mi_bucle;
	   END IF;
       IF MOD(i,2) = 0 THEN
          SET suma = suma + i;
	   END IF;
       SET i = i + 1;
    END LOOP;
    RETURN suma;
END ##

DELIMITER ;

SELECT sumar_serie_par(10) AS Resultado;

DROP FUNCTION IF EXISTS cantidad_clientes_credito_65000;
DELIMITER %%
CREATE FUNCTION cantidad_clientes_credito_65000() RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
	SELECT COUNT(*) INTO cantidad FROM CLIENTE WHEre limite_credito = 65000;
    RETURN cantidad;
    -- RETURN (SELECT COUNT(*) FROM CLIENTE WHEre limite_credito = 65000);
END;
%%
DELIMITER ;

SELECT cantidad_clientes_credito_65000() AS Resultado;

SELECT * FROM Oficina;

SELECT Objetivo FROM Oficina WHERE idOficina = 12;

-- CREAR UNA FUNCION QUE RECIBA EL IDOFICINA Y RETORNA
-- UN BOOLEAN SI CUMPLIO OBJETIVO (TRUE) Y SI NO CUMPLE (FALSE)
DROP FUNCTION IF EXISTS verificar_objetivo;
DELIMITER //
CREATE FUNCTION verificar_objetivo(id INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
   DECLARE v_objetivo INT;
   DECLARE v_ventas INT;
   SELECT objetivo, ventas INTO v_objetivo, v_ventas
   FROM Oficina
   WHERE idOficina = id;
   
   RETURN v_ventas >= v_objetivo;

END;
//
DELIMITER ;

SELECT verificar_objetivo(11) AS Resultado;

SELECT *, verificar_objetivo(idOficina) AS Cumple FROM Oficina;

DROP FUNCTION IF EXISTS verificar_objetivo1;
DELIMITER //
CREATE FUNCTION verificar_objetivo1(id INT) RETURNS VARCHAR(3)
DETERMINISTIC
BEGIN
   DECLARE v_objetivo INT;
   DECLARE v_ventas INT;
   SELECT objetivo, ventas INTO v_objetivo, v_ventas
   FROM Oficina
   WHERE idOficina = id;
   IF v_ventas >= v_objetivo THEN
      RETURN 'Si';
   ELSE 
      RETURN 'No';
   END IF;
END;
//
DELIMITER ;

SELECT *, verificar_objetivo1(idOficina) AS Cumple FROM Oficina;

SELECT * FROM Oficina;

SELECT SUM(ventas) FROM Oficina;

DROP FUNCTION IF EXISTS suma_total_ventas;
DELIMITER //
CREATE FUNCTION suma_total_ventas() RETURNS INT
DETERMINISTIC
BEGIN
   RETURN (SELECT SUM(ventas) FROM Oficina);
END;
//
DELIMITER ;

SELECT SUMA_TOTAL_VENTAS();











