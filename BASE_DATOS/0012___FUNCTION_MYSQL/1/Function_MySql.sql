************************************************************
***   FUNCIONES PROPIAS DE MYSQL PARA MANEJO DE FECHAS   ***
************************************************************
--------------------------------------------------------------------------------
1. OBTENER LA FECHA Y HORA ACTUAL
--------------------------------------------------------------------------------
FUNCION		DESCRIPCION				EJEMPLO			    RESULTADO

NOW()		Fecha y hora actual		SELECT NOW();		2025-04-25 12:34:56
CURDATE()	Solo la fecha actual	SELECT CURDATE();	2025-04-25
CURTIME()	Solo la hora actual		SELECT CURTIME();	12:34:56
--------------------------------------------------------------------------------
2. EXTRAER PARTE DE UNA FECHA Y HORA
--------------------------------------------------------------------------------
FUNCION			DESCRIPCION		EJEMPLO			    				 RESULTADO

YEAR(fecha)		Año				SELECT YEAR('2025-04-27');      	 2025
								SELECT YEAR(NOW());                  2025
								SELECT YEAR(CURDATE());              2025
								
MONTH(fecha)	Mes				SELECT MONTH('2025-04-27');     	 4

DAY(fecha)		Día del mes		SELECT DAY('2025-04-27');       	 27

HOUR(hora)      Hora			SELECT HOUR('2025-04-27 12:34:56');	  12
								SELECT HOUR(NOW());                   12
								SELECT HOUR(CURTIME());               12
								
MINUTE(hora)    Minuto			SELECT MINUTE('2025-04-27 12:34:56'); 46

SECOND(hora)    Segundo			SELECT SECOND('2025-04-27 12:34:56'); 34


WEEK(fecha)		Semana del año	SELECT WEEK('2025-04-27');            17
                                SELECT WEEK('2025-04-27 12:34:56');   17
                                SELECT WEEK(NOW());				      17
								SELECT WEEK(CURDATE());               17
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. OPERACIONES CON FECHA
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
FUNCIÓN 							| DESCRIPCIÓN 			                | EJEMPLO 											| RESULTADO EJEMPLO (aproximado)

DATE_ADD(fecha, INTERVAL n tipo) 	| Suma a la fecha 		                | SELECT DATE_ADD(NOW(), INTERVAL 7 DAY); 			| 2025-05-04 (si hoy es 2025-04-27)
DATE_SUB(fecha, INTERVAL n tipo) 	| Resta a la fecha 		                | SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH); 		| 2025-03-27 (si hoy es 2025-04-27)
DATEDIFF(fecha1, fecha2) 			| Diferencia en días 	                | SELECT DATEDIFF('2025-05-01', '2025-04-25'); 		| 6 días
TIMESTAMPDIFF(tipo, fecha1, fecha2) | Diferencia en años, meses, días, etc. | SELECT TIMESTAMPDIFF(YEAR, '2000-01-01', NOW()); 	| 25 años (en 2025)
                                                                              SELECT TIMESTAMPDIFF(MONTH, '2000-01-01', NOW()); | 303 meses
																			  SELECT TIMESTAMPDIFF(DAY, '2000-01-01', NOW());   | 9248 dias
------------------------------------------------------------------------------------------------------------------------------
4. CONVERSION DE TIPOS
------------------------------------------------------------------------------------------------------------------------------
FUNCION 						DESCRIPCION 						EJEMPLO 										RESULTADO

STR_TO_DATE(cadena, formato) 	Convierte texto a fecha 			SELECT STR_TO_DATE('25-04-2025', '%d-%m-%Y'); 	2025-04-25
DATE_FORMAT(fecha, formato) 	Convierte fecha a texto con formato SELECT DATE_FORMAT(NOW(), '%d/%m/%Y'); 			27/04/2025
------------------------------------------------------------------------------------------------------------------------------------------
5. OTRAS UTILES
------------------------------------------------------------------------------------------------------------------------------------------
FUNCION 							DESCRIPCION 							EJEMPLO 											RESULTADO

DATE_ADD(fecha, INTERVAL n tipo) 	Suma a la fecha 						SELECT DATE_ADD(NOW(), INTERVAL 7 DAY); 			2025-05-04
DATE_SUB(fecha, INTERVAL n tipo) 	Resta a la fecha 						SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH); 			2025-03-27
DATEDIFF(fecha1, fecha2) 			Diferencia en días 						SELECT DATEDIFF('2025-05-01', '2025-04-25'); 		6
TIMESTAMPDIFF(tipo, fecha1, fecha2) Diferencia en años, meses, días, etc. 	SELECT TIMESTAMPDIFF(YEAR, '2000-01-01', NOW());	25
STR_TO_DATE(cadena, formato) 		Convierte texto a fecha 				SELECT STR_TO_DATE('25-04-2025', '%d-%m-%Y'); 		2025-04-25
DATE_FORMAT(fecha, formato) 		Convierte fecha a texto con formato 	SELECT DATE_FORMAT(NOW(), '%d/%m/%Y'); 				27/04/2025
LAST_DAY(fecha) 					Último día del mes 						SELECT LAST_DAY('2025-04-10'); 						2025-04-30
DAYOFWEEK(fecha) 					Día de la semana (1=Domingo) 			SELECT DAYOFWEEK('2025-04-25'); 					6
WEEKDAY(fecha) 						Día de la semana (0=Lunes) 				SELECT WEEKDAY('2025-04-25'); 						4
NOW() BETWEEN fecha1 AND fecha2 	Verifica si está entre fechas 			SELECT NOW() BETWEEN '2025-04-01' AND '2025-04-30'; 1
------------------------------------------------------------------------------------------------------------------------------------------
**************************************************
***   FUNCIONES PROPIAS DE USUARIO CON MYSQL   ***
**************************************************
----------------------------------
---   FUNCION SIN PARAMETROS   ---
----------------------------------
--------------------------------------------------------------------------------
EJEMPLO 1

Supongamos  que  quieres  una  función  que  devuelva  simplemente  el número de 
oficinas.
--------------------------------------------------------------------------------
(1) VERSION 1

-- 1. IMPLEMENTACION

USE FACTORIA;
DROP FUNCTION IF EXISTS contar_oficinas;

DELIMITER //

CREATE FUNCTION contar_oficinas() RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;
  SELECT COUNT(*) INTO total FROM Oficina;
  RETURN total;
END//

DELIMITER ;

-- 2. LLAMAR

SELECT contar_oficinas() AS Cantidad;

-- 3. SALIDA

+----------+
| Cantidad |
+----------+
|        5 |
+----------+

(2) VERSION 2

-- 1. IMPLEMENTACION

USE FACTORIA;
DROP FUNCTION IF EXISTS contar_oficinas;

DELIMITER //

CREATE FUNCTION contar_oficinas() RETURNS INT
DETERMINISTIC
BEGIN
  RETURN (SELECT COUNT(*) FROM Oficina);
END//

DELIMITER ;

-- 2. LLAMAR

SELECT contar_oficinas() AS Cantidad;

-- 3. SALIDA

+----------+
| Cantidad |
+----------+
|        5 |
+----------+
----------------------------------
---   FUNCION CON PARAMETROS   ---
----------------------------------
--------------------------------------------------------------------------------
EJEMPLO 1

Función que reciba una ciudad y te devuelva cuántas oficinas hay en esa ciudad.
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION 

USE FACTORIA;
DROP FUNCTION IF EXISTS contar_oficinas_ciudad;

DELIMITER //

CREATE FUNCTION contar_oficinas_ciudad(nombre_ciudad VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;
  SELECT COUNT(*) INTO total
  FROM Oficina
  WHERE ciudad = nombre_ciudad;
  RETURN total;
END//

DELIMITER ;

DROP FUNCTION IF EXISTS contar_oficinas_ciudad;
DELIMITER //

CREATE FUNCTION contar_oficinas_ciudad(nombre_ciudad VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN (SELECT COUNT(*)
  FROM Oficina
  WHERE ciudad = nombre_ciudad);
END//

DELIMITER ;

-- 2. LLAMAR

SELECT contar_oficinas_ciudad('Chicago') AS Cantidad;

-- 3. SALIDA

+----------+
| Cantidad |
+----------+
|        1 |
+----------+

---------------------------------------------------------
---   FUNCION QUE DEVUELVE DISTINTOS TIPOS DE DATOS   ---
---------------------------------------------------------
--------------------------------------------------------------------------------
EJEMPLO 1

Función que devuelve un VARCHAR (texto) en vez de un número.
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION 

USE FACTORIA;
DROP FUNCTION IF EXISTS obtener_region;

DELIMITER //

CREATE FUNCTION obtener_region(ciudad_oficina VARCHAR(20))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  DECLARE region_nombre VARCHAR(20);
  SELECT region INTO region_nombre
  FROM Oficina
  WHERE ciudad = ciudad_oficina
  LIMIT 1;
  RETURN region_nombre;
END//

DELIMITER ;

-- 2. LLAMAR

SELECT obtener_region('Denver') AS Ciudad;

-- 3. SALIDA

+--------+
| Ciudad |
+--------+
| Oeste  |
+--------+
----------------------------------------------------------
---   FUNCION QUE USA ESTRUCTURA CONDICIONAL BINARIO   ---
---------------------------------------------------------- 
--------------------------------------------------------------------------------
EJEMPLO 1

Función que determinar si una oficina ha alcanzado su objetivo de ventas.
--------------------------------------------------------------------------------
-- VERSION 1

-- 1. IMPLEMENTACION 

USE FACTORIA;
DROP FUNCTION IF EXISTS verificar_objetivo;

-- (1) VERSION

DELIMITER //

CREATE FUNCTION verificar_objetivo(pin_id_oficina INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  DECLARE v_resultado VARCHAR(20);
  DECLARE v_ventas DOUBLE;
  DECLARE v_objetivo DOUBLE;

  SELECT ventas, objetivo INTO v_ventas, v_objetivo
  FROM Oficina
  WHERE idOficina = pin_id_oficina;

  IF v_ventas >= v_objetivo THEN
    SET v_resultado = 'Cumplido';
  ELSE
    SET v_resultado = 'No Cumplido';
  END IF;

  RETURN v_resultado;
END//

DELIMITER ;

-- (2) VERSION

DELIMITER //

CREATE FUNCTION verificar_objetivo(pin_id_oficina INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
  DECLARE v_resultado BOOLEAN;
  DECLARE v_ventas DOUBLE;
  DECLARE v_objetivo DOUBLE;

  SELECT ventas, objetivo INTO v_ventas, v_objetivo
  FROM Oficina
  WHERE idOficina = pin_id_oficina;

  IF v_ventas >= v_objetivo THEN
    SET v_resultado = 1;
  ELSE
    SET v_resultado = 0;
  END IF;

  RETURN v_resultado;
END//

DELIMITER ;

-- 2. LLAMAR

SELECT verificar_objetivo(13) AS ObjetivoCumplido;

-- MOSTRAR EL CODIGO DE UNA FUNCTION

SHOW CREATE FUNCTION verificar_objetivo; 

-- 3. SALIDA

+------------------+
| ObjetivoCumplido |
+------------------+
| No Cumplido      |
+------------------+

-- VERSION 2

-- 1. IMPLEMENTACION 

USE FACTORIA;
DROP FUNCTION IF EXISTS verificar_objetivo;

DELIMITER //

CREATE FUNCTION verificar_objetivo(pin_id_oficina INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
  DECLARE v_ventas DOUBLE;
  DECLARE v_objetivo DOUBLE;

  SELECT ventas, objetivo INTO v_ventas, v_objetivo
  FROM Oficina
  WHERE idOficina = pin_id_oficina;

  -- Si no encontró registros, devuelve NULL
  IF ROW_COUNT() = 0 THEN
    RETURN NULL;
  END IF;
  
  -- Devuelve TRUE si ventas >= objetivo, FALSE en caso contrario
  RETURN v_ventas >= v_objetivo;
END//

DELIMITER ;

-- 2. LLAMAR

SELECT verificar_objetivo(13) AS ObjetivoCumplido;

SELECT 
  idOficina,
  ventas,
  objetivo,
  verificar_objetivo(idOficina) AS ObjetivoCumplido
FROM Oficina;

-- 3. SALIDA

+------------------+
| ObjetivoCumplido |
+------------------+
|                1 |
+------------------+

+-----------+--------+----------+------------------+
| idOficina | ventas | objetivo | ObjetivoCumplido |
+-----------+--------+----------+------------------+
|        11 | 692637 |   575000 | Cumplido         |
|        12 | 735042 |   800000 | No Cumplido      |
|        13 | 367911 |   350000 | Cumplido         |
|        21 | 835915 |   725000 | Cumplido         |
|        22 | 186042 |   300000 | No Cumplido      |
+-----------+--------+----------+------------------+
--------------------------------------------------------------------------------
EJEMPLO 2

Función que retorna el calculo del porcentaje de ventas de una oficina.
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION 

USE FACTORIA;
DROP FUNCTION IF EXISTS PorcentajeVentasOficina;

DELIMITER //

CREATE FUNCTION PorcentajeVentasOficina(p_id_oficina INT)
RETURNS DECIMAL(10,2)  -- Cambiado a DECIMAL para manejar 2 decimales
DETERMINISTIC
BEGIN
  DECLARE v_ventas DOUBLE;
  DECLARE v_objetivo DOUBLE;
  DECLARE v_porcentaje DECIMAL(10,2);  -- Variable para el resultado redondeado
  
  -- Obtenemos los valores de la oficina
  SELECT ventas, objetivo INTO v_ventas, v_objetivo
  FROM Oficina
  WHERE idOficina = p_id_oficina;
  
  -- Verificamos si se encontró la oficina
  IF ROW_COUNT() = 0 THEN
    RETURN NULL; -- Oficina no encontrada
  END IF;
  
  -- Manejo de división por cero y redondeo a 2 decimales
  IF v_objetivo = 0 THEN
    SET v_porcentaje = 0.00;
  ELSE
    SET v_porcentaje = ROUND((v_ventas / v_objetivo) * 100, 2);  -- Función ROUND con 2 decimales
  END IF;
  
  RETURN v_porcentaje;
END //

DELIMITER ;

-- 2. LLAMAR

SELECT PorcentajeVentasOficina(13) AS Porcentaje;

-- Prueba con oficinas existentes
SELECT 
  idOficina,
  ciudad,
  ventas,
  objetivo,
  PorcentajeVentasOficina(idOficina) AS porcentaje
FROM Oficina;

-- Prueba con una oficina específica
SELECT PorcentajeVentasOficina(12) AS porcentaje_chicago;

-- Prueba con oficina que no existe
SELECT PorcentajeVentasOficina(99) AS oficina_inexistente;

-- 3. SALIDA

+------------+
| Porcentaje |
+------------+
|     105.12 |
+------------+

+-----------+-------------+--------+----------+------------+
| idOficina | ciudad      | ventas | objetivo | porcentaje |
+-----------+-------------+--------+----------+------------+
|        11 | New York    | 692637 |   575000 |     120.46 |
|        12 | Chicago     | 735042 |   800000 |      91.88 |
|        13 | Atlanta     | 367911 |   350000 |     105.12 |
|        21 | Los Angeles | 835915 |   725000 |     115.30 |
|        22 | Denver      | 186042 |   300000 |      62.01 |
+-----------+-------------+--------+----------+------------+

+--------------------+
| porcentaje_chicago |
+--------------------+
|              91.88 |
+--------------------+

+---------------------+
| oficina_inexistente |
+---------------------+
|                NULL |
+---------------------+
-----------------------------------------------------------
---   FUNCION QUE USA ESTRUCTURA CONDICIONAL MULTIPLE   ---
-----------------------------------------------------------
--------------------------------------------------------------------------------
EJEMPLO 1

Función  que  devuelve  el  mensaje  (Alto,Medio,Bajo) rendimiento al evaluar un
vendedor por su identificador.
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION 

USE FACTORIA;
DROP FUNCTION IF EXISTS estado_vendedor;

DELIMITER //

CREATE FUNCTION estado_vendedor(id_vendedor_in INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
  DECLARE ventas_actuales DOUBLE;

  SELECT ventas INTO ventas_actuales
  FROM Vendedor
  WHERE idVendedor = id_vendedor_in;

  RETURN CASE 
           WHEN ventas_actuales >= 300000 THEN 'Alto Rendimiento'
           WHEN ventas_actuales >= 150000 THEN 'Rendimiento Medio'
           ELSE 'Bajo Rendimiento'
         END;
END//

DELIMITER ;

-- 2. LLAMAR

SELECT estado_vendedor(104) AS Evaluar;

-- 3. SALIDA

+------------------+
| Evaluar          |
+------------------+
| Bajo Rendimiento |
+------------------+
------------------------------------------------------
---   FUNCION QUE USA ESTRUCTURA ITERATIVA WHILE   ---
------------------------------------------------------
--------------------------------------------------------------------------------
EJEMPLO 1

Función  que  devuelve la suma de todos los objetivos de oficinas.
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION 

USE FACTORIA;
DROP FUNCTION IF EXISTS sumar_objetivos;

DELIMITER //

CREATE FUNCTION sumar_objetivos()
RETURNS DOUBLE
DETERMINISTIC
BEGIN
  DECLARE suma DOUBLE DEFAULT 0;
  DECLARE id INT DEFAULT 0;
  DECLARE objetivo_actual DOUBLE;
  
  WHILE id <= (SELECT MAX(idOficina) FROM Oficina) DO
    SELECT objetivo INTO objetivo_actual
    FROM Oficina
    WHERE idOficina = id;
    
    IF objetivo_actual IS NOT NULL THEN
      SET suma = suma + objetivo_actual;
    END IF;
    
    SET id = id + 1;
  END WHILE;

  RETURN suma;
END//

DELIMITER ;

-- 2. LLAMAR

SELECT sumar_objetivos() AS SumaObjetivos;

-- 3. SALIDA

+---------------+
| SumaObjetivos |
+---------------+
|       5200000 |
+---------------+
------------------------------------------------------
---   FUNCION QUE USA ESTRUCTURA ITERATIVA WHILE   ---
------------------------------------------------------
--------------------------------------------------------------------------------
EJEMPLO 1

Función  que  devuelve la suma de todos los objetivos de oficinas.
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION 

USE FACTORIA;
DROP FUNCTION IF EXISTS sumar_objetivos;

DELIMITER //

CREATE FUNCTION sumar_objetivos()
RETURNS DOUBLE
DETERMINISTIC
BEGIN
  DECLARE suma DOUBLE DEFAULT 0;
  DECLARE id INT DEFAULT 0;
  DECLARE objetivo_actual DOUBLE;
  
  WHILE id <= (SELECT MAX(idOficina) FROM Oficina) DO
    SELECT objetivo INTO objetivo_actual
    FROM Oficina
    WHERE idOficina = id;
    
    IF objetivo_actual IS NOT NULL THEN
      SET suma = suma + objetivo_actual;
    END IF;
    
    SET id = id + 1;
  END WHILE;

  RETURN suma;
END//

DELIMITER ;

-- 2. LLAMAR

SELECT sumar_objetivos() AS SumaObjetivos;

-- 3. SALIDA

+---------------+
| SumaObjetivos |
+---------------+
|       5200000 |
+---------------+
-------------------------------------
---   FUNCION QUE USA UN CURSOR   ---
-------------------------------------
--------------------------------------------------------------------------------
EJEMPLO 1

Aunque normalmente cursores se usan más en  procedimientos  almacenados, también 
puedes simularlo en funciones
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION 

USE FACTORIA;
DROP FUNCTION IF EXISTS total_ventas_oficinas;

DELIMITER //

CREATE FUNCTION total_ventas_oficinas()
RETURNS DOUBLE
DETERMINISTIC
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE ventas_actual DOUBLE;
  DECLARE suma DOUBLE DEFAULT 0;
  
  DECLARE cur CURSOR FOR SELECT ventas FROM Oficina;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  
  read_loop: LOOP
    FETCH cur INTO ventas_actual;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SET suma = suma + ventas_actual;
  END LOOP;

  CLOSE cur;

  RETURN suma;
END//

DELIMITER ;

-- 2. LLAMAR

SELECT total_ventas_oficinas() AS TotalVentas;

-- 3. SALIDA

+-------------+
| TotalVentas |
+-------------+
|     2817547 |
+-------------+
-------------------------------------
---   FUNCION QUE USA UN CURSOR   ---
-------------------------------------
--------------------------------------------------------------------------------
EJEMPLO 1

Aunque normalmente cursores se usan más en  procedimientos  almacenados, también 
puedes simularlo en funciones
--------------------------------------------------------------------------------
-- 1. IMPLEMENTACION 

USE FACTORIA;
DROP FUNCTION IF EXISTS total_ventas_oficinas;

DELIMITER //

CREATE FUNCTION total_ventas_oficinas()
RETURNS DOUBLE
DETERMINISTIC
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE ventas_actual DOUBLE;
  DECLARE suma DOUBLE DEFAULT 0;
  
  DECLARE cur CURSOR FOR SELECT ventas FROM Oficina;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  
  read_loop: LOOP
    FETCH cur INTO ventas_actual;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SET suma = suma + ventas_actual;
  END LOOP;

  CLOSE cur;

  RETURN suma;
END//

DELIMITER ;

-- 2. LLAMAR

SELECT total_ventas_oficinas() AS TotalVentas;

-- 3. SALIDA

+-------------+
| TotalVentas |
+-------------+
|     2817547 |
+-------------+
*****************
***   NOTAS   ***
*****************
-----------------------------------------------------------------------------------------------------------------------------------------------
RECURSO 		| ¿SE PUEDE EN FUNCIONES? 											| NOTA
-----------------------------------------------------------------------------------------------------------------------------------------------
IF/ELSE 		| ✅ Sí 															| 
CASE 			| ✅ Sí 															| 
WHILE 			| ✅ Sí 															| 
CURSOR 			| 🚫 (En funciones a veces no es lo ideal, mejor en procedimientos)	| Solo en versiones modernas o de manera controlada.
DECLARE var 	| ✅ Sí 															| Declarar variables internas.
SELECT INTO 	| ✅ Sí 															| Asignar valores a variables.
INSERT, UPDATE 	| 🚫 No 															| ¡OJO! Las funciones solo deben leer, no modificar datos.
-----------------------------------------------------------------------------------------------------------------------------------------------
************************************************************
***   DIFERENTES SINTAXIS USADOS EN FUNCTION CON MYSQL   ***
************************************************************
--------------------------------------------------------------------------------
1. CREAR UNA FUNCION (CREATE FUNCTION)
--------------------------------------------------------------------------------
Permite definir una función que devuelve un valor único. Se usa para  encapsular 
lógica que puede reutilizarse.

DELIMITER //

CREATE FUNCTION obtenerEdad(fecha_nac DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE edad INT;
  SET edad = TIMESTAMPDIFF(YEAR, fecha_nac, CURDATE());
  RETURN edad;
END //

DELIMITER ;

Claves:

RETURNS tipo: define el tipo de dato que devuelve.

DETERMINISTIC: si siempre devuelve el mismo resultado para los mismos parámetros.

BEGIN ... END: bloque de código.

RETURN valor: devuelve el resultado.
--------------------------------------------------------------------------------
2. LLAMAR A UNA FUNCION EN UNA CONSULTA
--------------------------------------------------------------------------------
Las funciones definidas por el usuario pueden usarse en SELECT, WHERE, ORDER BY, etc.

SELECT nombre, obtenerEdad(fecha_nac) AS edad FROM Persona;
--------------------------------------------------------------------------------
3. VER LAS FUNCIONES EXISTENTES (SHOW FUNCTION STATUS)
--------------------------------------------------------------------------------
Para listar funciones creadas en una base de datos:

SHOW FUNCTION STATUS WHERE Db = 'mi_basedatos';
--------------------------------------------------------------------------------
4. ELIMINAR UNA FUNCION (DROP FUNCTION)
--------------------------------------------------------------------------------
Para eliminar una función definida previamente:

DROP FUNCTION IF EXISTS obtenerEdad;
--------------------------------------------------------------------------------
5. VARIABLES DENTRO DE FUNCIONES
--------------------------------------------------------------------------------
Puedes declarar variables locales dentro del bloque BEGIN ... END:

DECLARE total INT;
SET total = valor1 + valor2;
--------------------------------------------------------------------------------
6. CONDICIONALES DENTRO DE FUNCIONES
--------------------------------------------------------------------------------
IF valor > 100 THEN
   SET resultado = 'Alto';
ELSE
   SET resultado = 'Bajo';
END IF;
--------------------------------------------------------------------------------
7. BUCLES DENTRO DE FUNCIONES (WHILE, REPEAT, LOOP)
--------------------------------------------------------------------------------
Ejemplo con WHILE:

WHILE contador < 10 DO
   SET contador = contador + 1;
END WHILE;
8. Tipos de retorno válidos

RETURNS INT | VARCHAR(n) | DATE | DECIMAL(p,s) | BOOLEAN | etc.
--------------------------------------------------------------------------------
9. RESTRICCIONES IMPORTANTES
--------------------------------------------------------------------------------
No se pueden usar sentencias que modifiquen datos (INSERT, UPDATE, DELETE) dentro de una FUNCTION.

Las funciones deben devolver un solo valor escalar.
--------------------------------------------------------------------------------
10. USAR FUNCIONES DEL SISTEMA EN TUS FUNCIONES
--------------------------------------------------------------------------------
Puedes usar funciones internas como NOW(), CURDATE(), CONCAT(), LENGTH(), etc.

RETURN CONCAT(nombre, ' ', apellidos);
--------------------------------------------------------------------------------
******************************************************************************
***   TODAS LAS ESTRUCTURAS DE CONTROL QUE SE APLICA A FUNCTION EN MYSQL   ***
******************************************************************************
--------------------------------------------------------------------------------
Perfecto, como profesor, te será útil un conjunto  de  ejemplos  didácticos  que 
muestren todas las estructuras de control disponibles dentro  de una FUNCTION en
MySQL. A continuación te presento ejemplos simples, educativos y variados usando:

IF

CASE

WHILE

REPEAT (equivale a do-while)

LOOP / LEAVE

FOR (emulado)

CURSOR (aunque los cursores solo están permitidos en procedimientos, no en funciones, te explico esto abajo)

Otros elementos útiles: DECLARE, RETURN, etc.

NOTA IMPORTANTE

En  MySQL,  los  cursores, FOR EACH y sentencias de modificación (INSERT, UPDATE, 
etc.) no se permiten en FUNCTION, solo en procedimientos almacenados (PROCEDURE).
Por   lo  tanto,   solo   pueden   usarse   estructuras   de   control   lógicas 
(condicionales y bucles) dentro de funciones.
--------------------------------------------------------------------------------
EJEMPLOS COMPLETOS
--------------------------------------------------------------------------------
1. IF - CLASIFICAR NUMERO

DELIMITER //

CREATE FUNCTION clasificarNumero(n INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF n < 0 THEN
    RETURN 'Negativo';
  ELSEIF n = 0 THEN
    RETURN 'Cero';
  ELSE
    RETURN 'Positivo';
  END IF;
END //

DELIMITER ;

2. CASE - CALIFICAR NOTA

DELIMITER //

CREATE FUNCTION calificarNota(nota INT)
RETURNS VARCHAR(10)
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

3. WHILE - SUMAR 1 + 2 + ... + N

DELIMITER //

CREATE FUNCTION sumaHasta(n INT)
RETURNS INT
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

4. REPEAT (COMO DO-WHILE) - MISMO EJEMPLO

DELIMITER //

CREATE FUNCTION sumaHastaRepeat(n INT)
RETURNS INT
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

5. LOOP + LEAVE (SIMULAR FOR CON BREAK)

DELIMITER //

CREATE FUNCTION contarParesHasta(n INT)
RETURNS INT
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

6. FOR (EMULADO CON WHILE)

DELIMITER //

CREATE FUNCTION factorial(n INT)
RETURNS INT
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
--------------------------------------------------------------------------------
❌ Cursores: No válidos en FUNCTION

En  funciones  NO  puedes usar CURSOR, ya que están pensados para recorrer filas 
(es  decir, implican  acceso  a  múltiples  datos  y acciones), lo cual viola la 
restricción de pureza de funciones en MySQL.

Usa CURSOR únicamente en PROCEDURE, por ejemplo:
--------------------------------------------------------------------------------
-- Esto solo va en PROCEDURE, no en FUNCTION

DECLARE mi_cursor CURSOR FOR SELECT nombre FROM empleados;

BONUS: Uso de funciones del sistema

DELIMITER //

CREATE FUNCTION diasDesde(fecha DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN DATEDIFF(CURDATE(), fecha);
END //

DELIMITER ;
--------------------------------------------------------------------------------
















