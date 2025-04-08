****************
***   0001   ***   ESTRUCTURA CALCULO   
****************
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS sumar_dos_numeros_recibidos;

-- Cambiamos el delimitador temporalmente a //
DELIMITER //

CREATE FUNCTION sumar_dos_numeros_recibidos(a INT, b INT) RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a + b;
END // -- Aquí usamos el nuevo delimitador //

-- Volvemos al delimitador original
DELIMITER ;

-- 2. LLAMAR

SELECT sumar_dos_numeros_recibidos(10, 5) AS Resultado; 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS sumar_dos_numeros_aleatorios;
DELIMITER //

CREATE FUNCTION sumar_dos_numeros_aleatorios() RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE a INT;
    DECLARE b INT;
    SET a = FLOOR(RAND() * 100); -- número aleatorio entre 0 y 99
    SET b = FLOOR(RAND() * 100);
    RETURN a + b;
END //

DELIMITER ;

-- 2. LLAMAR

SELECT sumar_dos_numeros_aleatorios() AS Resultado; 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS sumar_dos_numeros_constantes;

DELIMITER //

CREATE FUNCTION sumar_dos_numeros_constantes() RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE a INT DEFAULT 5;
    DECLARE b INT DEFAULT 6;
    RETURN a + b;
END //

DELIMITER ;

-- 2. LLAMAR

SELECT sumar_dos_numeros_constantes() AS Resultado;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS sumar_dos_numeros_recibidos;

DELIMITER //

CREATE FUNCTION sumar_dos_numeros_recibidos(a INT, b INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE c INT;
	SET c = a + b;
    RETURN c;
END //

DELIMITER ;

-- 2. LLAMAR

SELECT sumar_dos_numeros_recibidos(10, 5) AS Resultado; 
--------------------------------------------------------------------------------
****************
***   0002   ***   ESTRUCTURA CONDICIONAL BINARIO   
****************
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS clasificar_numero;

DELIMITER $$

CREATE FUNCTION clasificar_numero(numero INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(20);

    IF MOD(numero, 2) = 0 THEN
       SET resultado = 'Par';
    ELSE
       SET resultado = 'Impar';
    END IF;

    RETURN resultado;
END $$

DELIMITER ;

-- 2. LLAMAR

SELECT clasificar_numero(4) AS Resultado; 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS clasificar_numero;

DELIMITER $$

CREATE FUNCTION clasificar_numero(numero INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF MOD(numero, 2) = 0 THEN
       RETURN 'Par';
    ELSE
       RETURN 'Impar';
    END IF;
END $$

DELIMITER ;

-- 2. LLAMAR

SELECT clasificar_numero(4) AS Resultado; 
****************
***   0003   ***   ESTRUCTURA CONDICIONAL MULTIPLE
****************
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS clasificar_numero;

DELIMITER //

CREATE FUNCTION clasificar_numero(numero INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  RETURN CASE
    WHEN nota >= 90 THEN 'A'
    WHEN nota >= 80 THEN 'B'
    WHEN nota >= 70 THEN 'C'
    WHEN nota >= 60 THEN 'D'
    ELSE 'F'
  END;
END //

DELIMITER ;

-- 2. LLAMAR

SELECT clasificar_numero(75) AS Resultado; 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS clasificar_numero_entero;

DELIMITER $$

CREATE FUNCTION clasificar_numero_entero(numero INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF numero > 0 THEN
       RETURN 'Positivo';
	ELSEIF numero < 0 THEN
       RETURN 'Negativo';
	ELSE
       RETURN 'Cero';
    END IF;
END $$

DELIMITER ;

-- 2. LLAMAR

SELECT clasificar_numero_entero(0) AS Resultado;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

-- 0-4.9 (Suspenso)
-- 5-6.9 (Aprobado) 
-- 7-8.9 (Notable)
-- 9-10 (Sobresaliente)

DROP FUNCTION IF EXISTS clasificar_nota;

DELIMITER $$

CREATE FUNCTION clasificar_nota(nota INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    RETURN CASE
       WHEN nota >= 0 AND nota < 5 THEN 'Suspenso'
       WHEN nota >= 5 AND nota < 7 THEN 'Aprobado'
       WHEN nota >= 7 AND nota < 9 THEN 'Notable'
       WHEN nota >= 9 AND nota <= 10 THEN 'Sobresaliente'
       ELSE 'Nota no valida'
	END;
END $$

DELIMITER ;

-- 2. LLAMAR

SELECT clasificar_nota(16) AS Resultado; 
--------------------------------------------------------------------------------
****************
***   0004   ***   ESTRUCTURA ITERATIVA WHILE
****************
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS sumar_serie;

DELIMITER //

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
END //

DELIMITER ;

-- 2. LLAMAR

SELECT sumar_serie(5) AS Resultado; 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CREATE FUNCTION factorial(n INT) RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE resultado INT DEFAULT 1;
  DECLARE i INT DEFAULT 1;

  WHILE i <= n DO
    SET resultado = resultado * i;
    SET i = i + 1;
  END WHILE;

  RETURN resultado;
END //

DELIMITER ;

-- 2. LLAMAR

SELECT factorial(5) AS Resultado; 
****************
***   0005   ***   ESTRUCTURA ITERATIVA REPEAT (DO...WHILE)
****************
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS sumar_serie;

DELIMITER //

CREATE FUNCTION sumaHastaRepeat(n INT) RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE suma INT DEFAULT 0;
  DECLARE i INT DEFAULT 1;

  REPEAT
    SET suma = suma + i;
    SET i = i + 1;
  UNTIL i > n
  END REPEAT;

  RETURN suma;
END //

DELIMITER ;

-- 2. LLAMAR

SELECT sumar_serie(5) AS Resultado; 
--------------------------------------------------------------------------------
****************
***   0006   ***   ESTRUCTURA ITERATIVA LOOP + LEAVE (SIMILAR FOR CON BREAK)
****************
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS contar_pares;

DELIMITER //

CREATE FUNCTION contar_pares(n INT) RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE contador INT DEFAULT 0;

  mi_bucle: LOOP
    IF i > n THEN
      LEAVE mi_bucle;
    END IF;

    IF MOD(i, 2) = 0 THEN
      SET contador = contador + 1;
    END IF;

    SET i = i + 1;
  END LOOP;

  RETURN contador;
END //

DELIMITER ;

-- 2. LLAMAR

SELECT contar_pares(5) AS Resultado;
--------------------------------------------------------------------------------
****************
***   0007   ***   USO DE FUNCIONES DEL SISTEMA
****************
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS dias_transcurridas; 

DELIMITER //

CREATE FUNCTION dias_transcurridas(fecha DATE) RETURNS INT
DETERMINISTIC
BEGIN
  RETURN DATEDIFF(CURDATE(), fecha);
END //

DELIMITER ;

-- 2. LLAMAR

SELECT dias_transcurridas('1969-02-11') AS Resultado;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION

DROP FUNCTION IF EXISTS años_transcurridos;  

DELIMITER //

CREATE FUNCTION años_transcurridos(fecha DATE) RETURNS INT
DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(YEAR, fecha, CURDATE());  -- Calcula la diferencia en años
END //

DELIMITER ;

-- 2. LLAMAR

SELECT años_transcurridos('1969-02-11') AS Resultado;
*****************
***   NOTAS   ***
*****************
--------------------------------------------------------------------------------
Cursores: No válidos en FUNCTION

En  funciones  NO  puedes usar CURSOR, ya que están pensados para recorrer filas 
(es decir, implican  acceso  a  múltiples  datos  y  acciones), lo cual viola la 
restricción de pureza de funciones en MySQL.

Usa CURSOR únicamente en PROCEDURE, por ejemplo:
-- Esto solo va en PROCEDURE, no en FUNCTION
DECLARE mi_cursor CURSOR FOR SELECT nombre FROM empleados;
--------------------------------------------------------------------------------




































