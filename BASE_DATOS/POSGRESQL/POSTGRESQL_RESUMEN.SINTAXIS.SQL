**************************
***   TIPOS DE DATOS   ***
**************************
-------------------
---   NUMEROS   ---
-------------------
---------------------------------------------------------------------------------------------------------------
TIPO DE DATO        ALIAS / ALTERNATIVA       DESCRIPCIÓN                             EJEMPLO
---------------------------------------------------------------------------------------------------------------
smallint                                      Entero de 2 bytes (−32,768 a 32,767)    edad SMALLINT
integer             int                       Entero de 4 bytes                       edad INTEGER
bigint                                        Entero de 8 bytes                       total BIGINT
decimal(p,s)        numeric(p,s)              Números exactos con precisión           precio DECIMAL(10,2)
real                                          Números de punto flotante de 4 bytes    nota REAL
double precision                              Punto flotante de 8 bytes               promedio DOUBLE PRECISION
serial                                        Entero auto-incremental de 4 bytes      id SERIAL
bigserial                                     Entero auto-incremental de 8 bytes      id BIGSERIAL
---------------------------------------------------------------------------------------------------------------
----------------------------
---   CADENAS DE TEXTO   ---
----------------------------
----------------------------------------------------------------------------
TIPO DE DATO        DESCRIPCIÓN                           EJEMPLO
----------------------------------------------------------------------------
char(n)             Cadena de longitud fija               codigo CHAR(5)
varchar(n)          Cadena de longitud variable (máx. n)  nombre VARCHAR(50)
text                Cadena de longitud ilimitada          descripcion TEXT
----------------------------------------------------------------------------
---------------------
---   BOOLEANOS   ---
---------------------
-------------------------------------------------------
TIPO DE DATO        VALORES POSIBLES     EJEMPLO
-------------------------------------------------------
boolean             TRUE, FALSE, NULL    activo BOOLEAN
-------------------------------------------------------
--------------------------
---   FECHAS Y HORAS   ---
--------------------------
------------------------------------------------------------------------------------------------
TIPO DE DATO                DESCRIPCIÓN                          EJEMPLO
------------------------------------------------------------------------------------------------
date                       Fecha (AAAA-MM-DD)                    nacimiento DATE
time                       Hora (sin zona horaria)               hora TIME
time with time zone        Hora con zona horaria                 hora TIME WITH TIME ZONE
timestamp                  Fecha y hora (sin zona horaria)       creado TIMESTAMP
timestamp with time zone   Fecha y hora con zona horaria         creado TIMESTAMP WITH TIME ZONE
interval                   Periodo de tiempo (días, meses, etc.) duracion INTERVAL
------------------------------------------------------------------------------------------------
------------------
---   MONEDA   ---
------------------
---------------------------------------------------------------------------
TIPO DE DATO        DESCRIPCIÓN                                EJEMPLO
---------------------------------------------------------------------------
money               Valor monetario (con símbolo y decimales)  sueldo MONEY
---------------------------------------------------------------------------
------------------------
---   JSON / JSONB   ---
------------------------
----------------------------------------------------------------------------------
TIPO DE DATO        DESCRIPCIÓN                                        EJEMPLO
----------------------------------------------------------------------------------
json                Guarda texto JSON (sin validación interna)         datos JSON
jsonb               Guarda JSON en formato binario (más eficiente)     datos JSONB
----------------------------------------------------------------------------------
------------------------------------
---   ARRAY Y OTROS COMPUESTOS   ---
------------------------------------
------------------------------------------------------------------------
TIPO DE DATO        DESCRIPCIÓN                      EJEMPLO
------------------------------------------------------------------------
tipo[]              Array de cualquier tipo (int[])  notas INTEGER[]
composite           Tipo definido por el usuario     direccion composite
------------------------------------------------------------------------
-----------------------------
---   ENUMERADOS (ENUM)   ---
-----------------------------
----------------------------------------------------------------------
ENUMERADO (ENUM)    DEFINICIÓN                           EJEMPLO
----------------------------------------------------------------------
                    CREATE TYPE estado AS ENUM           estado ESTADO
                    ('activo', 'inactivo', 'pendiente');
----------------------------------------------------------------------					
----------------
---   UUID   ---
----------------					
---------------------------------------------------------
TIPO DE DATO        DESCRIPCIÓN                   EJEMPLO
---------------------------------------------------------
uuid                Identificador único universal id UUID
---------------------------------------------------------
**********************
***   OPERADORES   ***
**********************
------------------------------
---   OPERADORES LÓGICOS   ---
------------------------------
-------------------------------------------------------------------------------------------
OPERADOR    DESCRIPCION                             EJEMPLO
-------------------------------------------------------------------------------------------
AND			Verdadero si ambos son verdaderos		WHERE edad > 18 AND activo = true
OR			Verdadero si al menos uno es verdadero	WHERE nombre = 'Ana' OR nombre = 'Luis'
NOT			Niega el valor lógico					WHERE NOT activo
-------------------------------------------------------------------------------------------
-------------------------------------
---   OPERADORES DE COMPARACIÓN   ---
-------------------------------------
----------------------------------------------------------------------
OPERADOR    DESCRIPCION             EJEMPLO
----------------------------------------------------------------------
=	        Igual a					WHERE salario = 1000
!= ó <>		Distinto de				WHERE ciudad <> 'Madrid'
<			Menor que				WHERE edad < 30
>			Mayor que				WHERE puntos > 50
<=			Menor o igual que		WHERE descuento <= 10
>=			Mayor o igual que		WHERE nota >= 5
BETWEEN		Dentro de un rango		WHERE edad BETWEEN 18 AND 30
IN			En una lista			WHERE pais IN ('España', 'México')
LIKE		Patrón con comodines	WHERE nombre LIKE 'J%'
IS NULL		Es nulo					WHERE direccion IS NULL
----------------------------------------------------------------------
----------------------------------
---   OPERADORES ARITMÉTICOS   ---
----------------------------------
---------------------------------------------
OPERADOR   	DESCRIPCION     	EJEMPLO
---------------------------------------------
+			Suma				SELECT 5 + 3
-			Resta				SELECT 10 - 4
*			Multiplicación		SELECT 6 * 7
/			División			SELECT 15 / 3
%			Módulo (residuo)	SELECT 10 % 3
---------------------------------------------
********************************
***   OPERADORES DE CADENA   ***
********************************
----------------------------------------------------------------------------------------------
OPERADOR    DESCRIPCION           				EJEMPLO			SALIDA
----------------------------------------------------------------------------------------------		`
LIKE		Comparación con comodines			'Ana%' 			→ nombres que empiezan con Ana
ILIKE		LIKE sin distinguir mayúsculas		'ana%' 			→ encuentra Ana, ANA, etc.
~			Coincidencia con expresión regular	'abc' ~ '^a' 	→ TRUE
!~			No coincide con expresión regular	'abc' !~ 'z$' 	→ TRUE
----------------------------------------------------------------------------------------------
*******************************
***   OPERADORES DE ARRAY   ***
*******************************
--------------------------------------------------------------------------
OPERADOR    DESCRIPCION           		EJEMPLO						SALIDA
--------------------------------------------------------------------------
@>			Contiene					ARRAY[1,2,3] @> ARRAY[2] 	→ TRUE
<@			Está contenido en			ARRAY[2] <@ ARRAY[1,2,3] 	→ TRUE
&&			Tienen elementos en común	ARRAY[1,2] && ARRAY[2,3] 	→ TRUE
--------------------------------------------------------------------------
**************************************
***   OPERADORES DE JSON / JSONB   ***
**************************************
---------------------------------------------------------------------------------
OPERADOR    DESCRIPCION           				EJEMPLO			
---------------------------------------------------------------------------------
->			Obtiene valor JSON (como JSON)		json_col -> 'nombre'
->>			Obtiene valor JSON (como texto)		json_col ->> 'nombre'
#>			Obtiene valor de ruta JSON			json_col #> '{direccion,ciudad}'
#>>			Obtiene valor de ruta como texto	json_col #>> '{direccion,ciudad}'
@>			Contiene JSON						json_col @> '{"activo": true}'
<@			Está contenido en					'{"activo": true}' <@ json_col
---------------------------------------------------------------------------------
********************************
***   OPERADORES BIT A BIT   ***
********************************
----------------------------------------------------------------------
OPERADOR    DESCRIPCION           				EJEMPLO			SALIDA
----------------------------------------------------------------------
&			AND bit a bit						5 & 3 	 		1
|			OR bit a bit						5 | 3			7
#			XOR bit a bit						5 # 3 			6
~			NOT bit a bit						~5 				-6
<<			Desplaza bits a la izquierda		1 << 2 			4
>>			Desplaza bits a la derecha			4 >> 1 			2
----------------------------------------------------------------------
**********************************
***   OPERADORES GEOMÉTRICOS   ***
********************************** 
Si usas tipos geométricos como point, box, etc.
------------------------------------------------------------------------------------------------------------------------------------------------- 
 OPERADOR  DESCRIPCIÓN                                        EJEMPLO                                     SALIDA                                    
------------------------------------------------------------------------------------------------------------------------------------------------- 
 @>        El lado izquierdo contiene al derecho (centro de)  circle '((0,0),5)' @> point '(1,2)'         true (el punto está dentro del círculo) 
 ~=        Igualdad geométrica                                box '((0,0),(2,2))' ~= box '((0,0),(2,2))'  true (las cajas son iguales)            
 &&        Se superponen (overlap)                            box '((0,0),(2,2))' && box '((1,1),(3,3))'  true (las cajas se superponen)   
-------------------------------------------------------------------------------------------------------------------------------------------------
*************************************
***   OPERADOR DE CONCATENACION   ***
*************************************
En PostgreSQL, el operador || significa concatenación de cadenas.
Combina dos (o más) valores de texto (strings) en uno solo.

Ejemplo:

SELECT 'Hola' || ' ' || 'mundo';

Resultado:

Hola mundo

Uso común:

También puedes concatenar columnas en una consulta:

SELECT nombre || ' ' || apellido AS nombre_completo
FROM empleados;

Esto uniría el nombre y el apellido de cada empleado con un espacio entre ellos.
******************************************
***   OPERADOR DE CONVERSION DE TIPO   ***
******************************************
-- Conversión de texto a número:
SELECT '123'::INT;  -- Convierte el string '123' a entero

-- Conversión de fecha:
SELECT '2023-01-15'::DATE;  -- Convierte string a fecha

-- Conversión a booleano:
SELECT 'true'::BOOLEAN;  -- Convierte string a booleano

-- Sin conversión (devuelve NUMERIC):
SELECT floor(random() * 1000);

-- Con conversión a INT:
SELECT floor(random() * 1000)::INT;
****************************
***   FUNCIONES UTILES   ***
****************************
-------------------------------------------------------------------------------------------------
FUNCION   	DESCRIPCION   						EJEMPLO
-------------------------------------------------------------------------------------------------
NOW()		Fecha y hora actuales				SELECT NOW();
AGE()		Diferencia entre fechas				SELECT AGE(NOW(), fecha_nacimiento);
LOWER()		Convierte a minúsculas				SELECT LOWER('HOLA');
UPPER()		Convierte a mayúsculas				SELECT UPPER('hola');
LENGTH()	Longitud de una cadena				SELECT LENGTH('PostgreSQL');
ROUND()		Redondeo de números					SELECT ROUND(10.56789, 2);
COALESCE()	Devuelve el primer valor no nulo	SELECT COALESCE(nombre, 'Desconocido');
COUNT()		Cuenta filas						SELECT COUNT(*) FROM empleados;
SUM()		Suma valores						SELECT SUM(salario) FROM empleados;
AVG()		Promedio							SELECT AVG(edad) FROM empleados;
MAX()/MIN()	Mayor o menor valor					SELECT MAX(salario), MIN(salario) FROM empleados;
-------------------------------------------------------------------------------------------------
*****************************
***   FUNCIONES CADENAS   ***
*****************************
------------------------------------------------------------------------------------------------------------------
FUNCION   					DESCRIPCION   								EJEMPLO                     	SALIDA
------------------------------------------------------------------------------------------------------------------
LENGTH(string)  			Devuelve la longitud de la cadena 			SELECT LENGTH('PostgreSQL'); 	10 
CHAR_LENGTH(string)  		Similar a LENGTH, cuenta caracteres 		SELECT CHAR_LENGTH('Hola'); 	4 
UPPER(string)  				Convierte a mayúsculas 						SELECT UPPER('hola'); 			HOLA 
LOWER(string)  				Convierte a minúsculas 						SELECT LOWER('HOLA'); 			hola 
INITCAP(string)  			Primera letra de cada palabra en mayúscula 	SELECT INITCAP('hola mundo'); 	Hola Mundo 
CONCAT(str1, str2, ...) 	Concatena cadenas 							SELECT CONCAT('Post','greSQL'); PostgreSQL 
str1 \\ str2 			 	Operador de concatenación 					SELECT 'Post' \\ 'greSQL'; 		PostgreSQL 
REVERSE(string)  			Invierte la cadena 							SELECT REVERSE('abc'); 			cba 
------------------------------------------------------------------------------------------------------------------
**********************************************
***   FUNCIONES DE BUSQUEDA Y EXTRACCION   ***
**********************************************
----------------------------------------------------------------------------------------------------------------------------------
FUNCION   									DESCRIPCION   					EJEMPLO                     					SALIDA
----------------------------------------------------------------------------------------------------------------------------------
 POSITION(substr IN str)  					Posición de la subcadena  		SELECT POSITION('ql' IN 'PostgreSQL');  		8 
 STRPOS(str, substr)  						Similar a POSITION  			SELECT STRPOS('PostgreSQL', 'SQL');  			5 
 SUBSTRING(str FROM start [FOR length])  	Extrae parte de la cadena  		SELECT SUBSTRING('PostgreSQL' FROM 5 FOR 3);  	gre 
 LEFT(str, n)  								Primeros n caracteres  			SELECT LEFT('PostgreSQL', 4);  					Post 
 RIGHT(str, n)  							Últimos n caracteres  			SELECT RIGHT('PostgreSQL', 3);  				SQL 
 SPLIT_PART(str, delimiter, field)  		Divide cadena y extrae campo  	SELECT SPLIT_PART('a-b-c', '-', 2);  			b 
----------------------------------------------------------------------------------------------------------------------------------
*************************************
***   FUNCIONES DE MANIPULACION   ***
*************************************
---------------------------------------------------------------------------------------------------------------------------------------------------------------

FUNCION   										DESCRIPCION   						EJEMPLO                     								SALIDA
---------------------------------------------------------------------------------------------------------------------------------------------------------------
 TRIM([LEADING\TRAILING\BOTH]chars FROM str)  	Elimina caracteres de los extremos  	SELECT TRIM(BOTH 'x' FROM 'xxHOLxxAxx');  				HOLxxA 
 LTRIM(str, chars)  							Elimina caracteres del inicio  			SELECT LTRIM('xxxHOLA', 'x');  							HOLA 
 RTRIM(str, chars)  							Elimina caracteres del final  			SELECT RTRIM('HOLAxxx', 'x');  							HOLA 
 REPLACE(str, from, to)  						Reemplaza subcadenas  					SELECT REPLACE('Hola mundo', 'mundo', 'PostgreSQL');  	Hola PostgreSQL 
 REGEXP_REPLACE(str, pattern, replacement)  	Reemplazo con expresiones regulares  	SELECT REGEXP_REPLACE('Hola123', '[0-9]', '', 'g');  	Hola 
 LPAD(str, length, fill)  						Rellena por la izquierda  				SELECT LPAD('Hola', 6, '*');  							**Hola 
 RPAD(str, length, fill)  						Rellena por la derecha  				SELECT RPAD('Hola', 6, '*');  							Hola** 
 REPEAT(str, n)  								Repite la cadena n veces  				SELECT REPEAT('Ha', 3);  								HaHaHa 
---------------------------------------------------------------------------------------------------------------------------------------------------------------
***********************************
***   FUNCIONES DE CONVERSION   ***
***********************************
----------------------------------------------------------------------------------------------------------
FUNCION   				 DESCRIPCION   						EJEMPLO                     			SALIDA
----------------------------------------------------------------------------------------------------------
 TO_CHAR(value, format)  Convierte a cadena con formato  	SELECT TO_CHAR(123.45, '999D99');  		123.45 
 TO_NUMBER(str, format)  Convierte cadena a número  		SELECT TO_NUMBER('123.45', '999D99');  	123.45 
 ASCII(char)  			 Código ASCII del carácter  		SELECT ASCII('A');  					65 
 CHR(code)  			 Carácter del código ASCII  		SELECT CHR(65);  						A 
-----------------------------------------------------------------------------------------------------------
*******************************
***   FUNCIONES AVANZADAS   ***
*******************************
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FUNCION   											DESCRIPCION   						EJEMPLO                     							SALIDA
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 FORMAT(formatstr, args...)  						Formatea como printf  				SELECT FORMAT('Hola %s, tienes %s años', 'Juan', 25);  	Hola Juan, tienes 25 años 
 TRANSLATE(str, from, to)  							Reemplaza caracteres según mapeo  	SELECT TRANSLATE('12345', '143', 'axz');  				a2z5 
 OVERLAY(str PLACING new FROM start [FOR length])  	Reemplaza parte de la cadena  		SELECT OVERLAY('PostgreSQL' PLACING 'SQL' FROM 5);  	PostSQL 
 MD5(str)  											Hash MD5 de la cadena  				SELECT MD5('hola');  									4d186321c1a7f0f354b297e8914ab240 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*******************************************
***   SCRIPT PROBANDO TIPO DATO ARRAY   ***
*******************************************
--------------------------------------------------------------------------------
-- CREAR UNA BASE DE DATOS
--------------------------------------------------------------------------------
-- Conectarse a la base de datos principal (solo en psql)
\c postgres

-- Eliminar y crear la base de datos ESCUELA
DROP DATABASE IF EXISTS escuela;
CREATE DATABASE escuela;

-- Conectarse a la base de datos ESCUELA
\c escuela

-- 2. CREAR TABLA
DROP TABLE IF EXISTS Alumno;

CREATE TABLE Alumno (
    id_alumno SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    asignaturas TEXT[] NOT NULL
);

-- 3. INSERTAR DATOS
INSERT INTO Alumno (nombre, asignaturas)
VALUES
('Ana', ARRAY['Matemáticas', 'Lengua', 'Historia']),
('Luis', ARRAY['Biología', 'Química']),
('María', ARRAY['Física', 'Matemáticas', 'Inglés']),
('Pedro', ARRAY['Arte']),
('Lucía', ARRAY['Lengua', 'Historia']);

--------------------------------------------------------------------------------
-- CONSULTAS
--------------------------------------------------------------------------------

-- a) Mostrar todos los alumnos con sus asignaturas
SELECT * FROM Alumno;

-- b) Mostrar solo alumnos que tienen 'Matemáticas'
SELECT * FROM Alumno
WHERE 'Matemáticas' = ANY(asignaturas);

-- c) Mostrar alumnos que tienen más de 2 asignaturas
SELECT * FROM Alumno
WHERE cardinality(asignaturas) > 2;

-- d) Mostrar nombre y número de asignaturas por alumno
SELECT nombre, cardinality(asignaturas) AS num_asignaturas
FROM Alumno;

-- e) Expandir array: una fila por asignatura
SELECT id_alumno, nombre, unnest(asignaturas) AS asignatura
FROM Alumno;

-- f) Buscar alumnos que tienen exactamente 'Lengua' y 'Historia' (sin importar orden)
SELECT * FROM Alumno
WHERE asignaturas @> ARRAY['Lengua', 'Historia']
AND cardinality(asignaturas) = 2;

***********************************************************************************
***   DIFERENTES ESTRUCTURAS QUE SE PUEDEN USAR EN UNA FUNCTION EN POSTGRESQL   ***
***********************************************************************************
-----------------------------------------------------------
---   (01) SINTAXIS GENERAL DE UNA FUNCION POSTGRESQL   ---
-----------------------------------------------------------
-- SINTAXIS

DROP FUNCTION nombre_funcion;

CREATE OR REPLACE FUNCTION nombre_funcion(
    parametro1 tipo1,
    parametro2 tipo2,
    ...
)
RETURNS tipo_de_retorno AS $$
DECLARE
    -- Declaraciones de variables locales (opcional)
    variable1 tipo;
    variable2 tipo := valor_inicial;
BEGIN
    -- Lógica de la función
    -- (puede incluir IF, CASE, LOOP, FOR, etc.)
    
    RETURN valor_o_resultado;
END;
$$ LANGUAGE plpgsql;
--------------------------------------------------------------------------------
-- EXPLICACION

 CREATE OR REPLACE FUNCTION  Crea una función nueva o reemplaza una existente con el mismo nombre.                      
 nombre_funcion(parámetros)  Nombre de la función y sus parámetros de entrada con sus tipos.                            
 RETURNS tipo_de_retorno     Define el tipo de dato que devuelve la función (por ejemplo: INT, TEXT, TABLE).      
 AS $$ ... $$                Delimitador del cuerpo de la función. El código va entre los símbolos $$.                
 DECLARE                     (Opcional) Sección para declarar variables internas que solo se usan dentro de la función. 
 variable tipo [:= valor];   Declaración de variable (puede tener un valor inicial).                                    
 BEGIN ... END;              Bloque principal del código donde va la lógica de la función.                              
 RETURN valor;               Indica el valor que se devolverá como resultado de la función.                             
 LANGUAGE plpgsql;           Lenguaje que se está utilizando (en este caso, plpgsql, el lenguaje de PostgreSQL).
-------------------------------------------------------------------------------- 
No necesitas usar DROP FUNCTION si usas CREATE OR REPLACE FUNCTION correctamente.

Pero en tu caso, el DROP es necesario solo  si  cambiaste la firma (parámetros o 
tipo de retorno) y PostgreSQL no puede reconciliarla con la versión anterior.

CREATE OR REPLACE FUNCTION reemplaza el cuerpo de una función con la misma firma 
(nombre, parámetros y tipo de retorno).

Pero si cambias algo en la firma, como de RETURNS  RECORD  a RETURNS TABLE(...), 
entonces  PostgreSQL  considera  que  es  otra  función, y no puede reemplazarla 
directamente.
--------------------------------------------------------------------------------
-----------------------------------------------
---   (02) ESTRUCTURA CONDICIONAL BINARIA   ---
-----------------------------------------------
-- (1)

-- CREAR

CREATE OR REPLACE FUNCTION es_par(p_numero INT)
RETURNS TEXT
AS $$
BEGIN
    IF p_numero % 2 = 0 THEN
        RETURN 'Es par';
    ELSE
        RETURN 'Es impar';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- LLAMAR

SELECT es_par(2) AS Resultado;  -- Resultado: Es par

-- (2)

-- CREAR

CREATE OR REPLACE FUNCTION es_par(p_numero INT)
RETURNS TEXT
AS $$
DECLARE
    v_resultado TEXT;
BEGIN
    IF p_numero % 2 = 0 THEN
        v_resultado := 'Es par';
    ELSE
        v_resultado := 'Es impar';
    END IF;

    RETURN v_resultado;
END;
$$ LANGUAGE plpgsql;

-- LLAMAR

SELECT es_par(2) AS Resultado;  -- Resultado: Es par

-- (3)

-- CREAR

CREATE OR REPLACE FUNCTION generar_y_evaluar_numero_aleatorio()
RETURNS TEXT
AS $$
DECLARE
    v_numero_aleatorio INT;
    v_resultado TEXT;
BEGIN
    -- Genera un número aleatorio entre 1 y 1000
    v_numero_aleatorio := floor(random() * 1000)::INT + 1;
    
    -- Determina si es par o impar
    IF v_numero_aleatorio % 2 = 0 THEN
        v_resultado := 'El número ' || v_numero_aleatorio || ' es par';
    ELSE
        v_resultado := 'El número ' || v_numero_aleatorio || ' es impar';
    END IF;

    RETURN v_resultado;
END;
$$ LANGUAGE plpgsql;

-- LLAMAR

SELECT generar_y_evaluar_numero_aleatorio();
------------------------------------------------
---   (03) ESTRUCTURA CONDICIONAL MULTIPLE   ---
------------------------------------------------
-- (1) IF...THEN...ELSIF...ELSE...

CREATE OR REPLACE FUNCTION evaluar_nota(p_nota INT) RETURNS TEXT AS $$
BEGIN
    IF p_nota >= 90 THEN
        RETURN 'Excelente';
    ELSIF p_nota >= 70 THEN
        RETURN 'Aprobado';
    ELSE
        RETURN 'Reprobado';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- (2) CASE

CREATE OR REPLACE FUNCTION evaluar_nota(p_nota INT)
RETURNS TEXT
AS $$
DECLARE
    v_resultado TEXT;
BEGIN
    v_resultado := CASE
        WHEN p_nota >= 90 THEN 'Excelente'
        WHEN p_nota >= 70 THEN 'Aprobado'
        ELSE 'Reprobado'
    END;

    RETURN v_resultado;
END;
$$ LANGUAGE plpgsql;

-- (3) CASE

CREATE OR REPLACE FUNCTION categoria_producto(p_precio NUMERIC)
RETURNS TEXT AS $$
BEGIN
    RETURN CASE
        WHEN p_precio < 10 THEN 'Barato'
        WHEN p_precio BETWEEN 10 AND 100 THEN 'Moderado'
        ELSE 'Caro'
    END;
END;
$$ LANGUAGE plpgsql;
--------------------------------------
---   (04) ESTRUCTURA BUCLE LOOP   ---
--------------------------------------
-- (1) LOOP / EXIT

-- Bucle indefinido que se puede salir con EXIT.

CREATE OR REPLACE FUNCTION contar_hasta_5()
RETURNS VOID AS $$
DECLARE
    i INT := 1;
BEGIN
    LOOP
        RAISE NOTICE 'i = %', i;
        i := i + 1;
        EXIT WHEN i > 5;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
---------------------------------------
---   (05) ESTRUCTURA BUCLE WHILE   ---
---------------------------------------
--  (1) 

-- Bucle que se repite mientras una condición sea verdadera.

CREATE OR REPLACE FUNCTION imprimir_pares()
RETURNS VOID AS $$
DECLARE
    i INT := 2;
BEGIN
    WHILE i <= 10 LOOP
        RAISE NOTICE 'Par: %', i;
        i := i + 2;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Notas

Este tipo de función es útil para depurar o para realizar tareas internas sin retornar datos.

Si estás usando pgAdmin, los NOTICE también se mostrarán en la pestaña de mensajes.
--------------------------------------------
---   (06) ESTRUCTURA BUCLE FOR...LOOP   ---
--------------------------------------------
-- (1)

-- Bucle definido por un rango.

CREATE OR REPLACE FUNCTION imprimir_numeros()
RETURNS VOID AS $$
BEGIN
    FOR i IN 1..5 LOOP
        RAISE NOTICE 'Número: %', i;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
-------------------------------------------------
---   (07) ESTRUCTURA BUCLE FOR...IN SELECT   ---
-------------------------------------------------
-- (1) FOR...IN SELECT

-- Iterar sobre un conjunto de resultados de una consulta.

CREATE OR REPLACE FUNCTION mostrar_empleados()
RETURNS VOID AS $$
DECLARE
    emp RECORD;
BEGIN
    FOR emp IN SELECT nombre, salario FROM empleados LOOP
        RAISE NOTICE 'Empleado: %, Salario: %', emp.nombre, emp.salario;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
-----------------------
---   (08) RETURN   ---
-----------------------
--------------------------------------------------------------------------------
RETURN : Devuelve un valor (puede ser escalar, tabla, registro, etc.).
--------------------------------------------------------------------------------
-- (1) ESCALAR: RETURNS INT
--------------------------------------------------------------------------------
-- CREAR

CREATE OR REPLACE FUNCTION sumar(a INT, b INT)
RETURNS INT AS $$
BEGIN
    RETURN a + b;
END;
$$ LANGUAGE plpgsql;

-- LLAMAR

SELECT sumar(5,7);  -- Resultado: 12
--------------------------------------------------------------------------------
-- CREAR

CREATE OR REPLACE FUNCTION obtener_diez()
RETURNS INT AS $$
BEGIN
    RETURN 10;
END;
$$ LANGUAGE plpgsql;

-- LLAMAR

SELECT obtener_diez(10);  -- Resultado: 10
--------------------------------------------------------------------------------
-- 2. SETOF ESCALAR: RETURNS SETOF INT
--------------------------------------------------------------------------------
-- CREAR

CREATE OR REPLACE FUNCTION listar_numeros()
RETURNS SETOF INT AS $$
BEGIN
    RETURN NEXT 1;
    RETURN NEXT 2;
    RETURN NEXT 3;
END;
$$ LANGUAGE plpgsql;

-- LLAMAR

SELECT * FROM listar_numeros();  -- Resultado: 1, 2, 3
--------------------------------------------------------------------------------
-- 3. RECORD (UNA SOLA FILA SIN ESTRUCTURA FIJA)
--------------------------------------------------------------------------------
-- CREAR

CREATE OR REPLACE FUNCTION obtener_empleado()
RETURNS RECORD AS $$
DECLARE
    resultado RECORD;
BEGIN
    SELECT id, nombre INTO resultado FROM empleados LIMIT 1;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- LLAMAR

SELECT * FROM obtener_empleado() AS t(id INT, nombre TEXT);
--------------------------------------------------------------------------------
-- CREAR
DROP FUNCTION obtener_persona;
CREATE OR REPLACE FUNCTION obtener_persona()
RETURNS TABLE(nombre TEXT, edad INT) AS $$
BEGIN
    RETURN QUERY SELECT 'Ana', 25;
END;
$$ LANGUAGE plpgsql;
-- LLAMAR
SELECT * FROM obtener_persona();
--------------------------------------------------------------------------------
 -- CREAR
DROP FUNCTION obtener_persona;
CREATE OR REPLACE FUNCTION obtener_persona()
RETURNS TABLE(nombre TEXT, edad INT) AS $$
DECLARE
    nombre TEXT DEFAULT 'María';
	edad INT DEFAULT 23;
BEGIN
    RETURN QUERY SELECT nombre, edad;
END;
$$ LANGUAGE plpgsql;
-- LLAMAR
SELECT * FROM obtener_persona();
--------------------------------------------------------------------------------
-- CREAR
DROP FUNCTION obtener_persona;
CREATE OR REPLACE FUNCTION obtener_persona()
RETURNS TABLE(nombre TEXT, edad INT) AS $$
DECLARE
    nombre TEXT;
	edad INT;
BEGIN
    nombre := 'Arturo';
	edad := 43;
    RETURN QUERY SELECT nombre, edad;
END;
$$ LANGUAGE plpgsql;
-- LLAMAR
SELECT * FROM obtener_persona();
--------------------------------------------------------------------------------
-- 4. SETOF RECORD (VARIAS FILAS SIN ESTRUCTURA FIJA)
--------------------------------------------------------------------------------
-- CREAR
CREATE OR REPLACE FUNCTION empleados_sin_definir()
RETURNS SETOF RECORD AS $$
BEGIN
    RETURN QUERY SELECT id_alumno, nombre FROM alumno;
END;
$$ LANGUAGE plpgsql;
-- LLAMAR
SELECT * FROM empleados_sin_definir() AS t(id_alumno INT, nombre VARCHAR(100));
--------------------------------------------------------------------------------
-- 5. TABLE (ESTRUCTURA DEFINIDA EN LA FUNCION)
--------------------------------------------------------------------------------
-- ELIMINAR
DROP FUNCTION IF EXISTS alumnos_tabla();
-- CREAR
CREATE OR REPLACE FUNCTION alumnos_tabla()
RETURNS TABLE(id_alumno INT, nombre VARCHAR(100)) AS $$
BEGIN
    RETURN QUERY
    SELECT a.id_alumno, a.nombre FROM alumno a;
END;
$$ LANGUAGE plpgsql;
-- LLAMAR
SELECT * FROM alumnos_tabla();
--------------------------------------------------------------------------------
-- ELIMINAR LA FUNCIÓN SI EXISTE
DROP FUNCTION IF EXISTS obtener_personas();

-- CREAR LA FUNCIÓN
CREATE OR REPLACE FUNCTION obtener_personas()
RETURNS TABLE(id_alumno INT, nombre TEXT) AS $$ -- Tiene que ser text y no varchar(100)
BEGIN
    RETURN QUERY
    SELECT 1, 'Ana'
    UNION ALL
    SELECT 2, 'Luis'
    UNION ALL
    SELECT 3, 'María';
END;
$$ LANGUAGE plpgsql;
-- LLAMAR
SELECT * FROM obtener_personas();

-- SALIDA

 nombre  edad 
 ------  ---- 
 Ana     25   
 Luis    30   
 María   28 

-- EXPLICACION

 PARTE                                   SIGNIFICADO                                                                                          
 --------------------------------------  ------------------------------------------------------------------- 
 RETURNS TABLE(nombre TEXT, edad INT)    Especifica que se devolverán **múltiples filas** con esas columnas. 
 RETURN QUERY                            Permite devolver el resultado de una consulta directamente.         
 SELECT ... UNION ALL                    Simula varias filas, como si vinieran de una tabla.                 
 
--------------------------------------------------------------------------------
-- 6. VOID (NO RETORNA NADA)
--------------------------------------------------------------------------------
-- CREAR

CREATE OR REPLACE FUNCTION registrar_log(mensaje TEXT)
RETURNS void AS $$
BEGIN
    INSERT INTO logs(mensaje, fecha) VALUES (mensaje, NOW());
    -- No hay RETURN con valor.
END;
$$ LANGUAGE plpgsql;

-- LLAMAR

SELECT registrar_log('Inicio del sistema');
--------------------------------------------------------------------------------
-------------------------------------------------
--   (09) RAISE NOTICE / WARNING / EXCEPTION   --
-------------------------------------------------
-- Para mostrar mensajes o lanzar errores.

CREATE OR REPLACE FUNCTION demo_aviso()
RETURNS VOID AS $$
BEGIN
    RAISE NOTICE 'Esto es un mensaje informativo.';
    RAISE WARNING 'Esto es una advertencia.';
    RAISE EXCEPTION 'Esto es un error.';
END;
$$ LANGUAGE plpgsql;
************************
***   RETURN TABLE   ***
************************
--------------------------------------------------------------------------------
-- Paso 1: Crear la tabla Persona
--------------------------------------------------------------------------------
-- Primero, crea una tabla Persona con algunos datos de ejemplo:
CREATE TABLE Persona (
    id     SERIAL PRIMARY KEY,
    nombre TEXT,
    edad   INT
);
-- Insertar datos de ejemplo
INSERT INTO Persona (nombre, edad) VALUES
('Ana', 25),
('Luis', 30),
('María', 28);

CREATE TABLE Ciudad (
    id             SERIAL PRIMARY KEY,
    nombre         TEXT,
    persona_nombre TEXT  -- nombre que coincide con Persona.nombre
);

-- Insertamos datos de ejemplo
INSERT INTO Ciudad (nombre, persona_nombre) VALUES
('Madrid', 'Ana'),
('Barcelona', 'Luis'),
('Sevilla', 'María');

--------------------------------------------------------------------------------
-- Paso 2: Crear la función que retorna datos desde la tabla
--------------------------------------------------------------------------------
-- CREAR

CREATE OR REPLACE FUNCTION obtener_personas()
RETURNS TABLE(nombre TEXT, edad INT) AS $$
BEGIN
    RETURN QUERY
    SELECT nombre, edad
    FROM Persona;
END;
$$ LANGUAGE plpgsql;
--------------------------------------------------------------------------------
-- Paso 3: Llamar la función
--------------------------------------------------------------------------------
SELECT * FROM obtener_personas();

-- Resultado esperado

nombre	edad
Ana	    25
Luis	30
María	28

-- Resumen

Elemento								Propósito
RETURNS TABLE(nombre TEXT, edad INT)	La función devolverá múltiples filas con esas columnas.
RETURN QUERY SELECT ... FROM Persona	Extrae directamente los datos de la tabla Persona.
--------------------------------------------------------------------------------
SELECT p.nombre, p.edad, c.nombre AS ciudad
FROM obtener_personas() AS p
JOIN Ciudad c ON p.nombre = c.persona_nombre;
-----------------------------------------------------------------------------------
 Caso                                        Sintaxis                                 
--------------------------------------  ------------------------------------------- 
 Usar toda la tabla que devuelve la función  SELECT * FROM funcion() AS alias;      
 Filtrar resultados                          WHERE sobre el alias de la función     
 Combinar con otras tablas                   JOIN entre la función y una tabla real 

*****************************************************
***   SCRIPT DE UNA BASE DE DATOS EN POSTGRESQL   ***
*****************************************************
-- Crear la base de datos
CREATE DATABASE instituto;

-- Cambiar a la base de datos
\c instituto

-- Crear tipo ENUM para estado de matrícula
CREATE TYPE estado_matricula AS ENUM ('activo', 'pendiente', 'suspendido');

-- Crear tabla de personas (usa UUID y jsonb)
CREATE TABLE Persona (
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre           VARCHAR(100) NOT NULL,
    apellido         VARCHAR(100),
    edad             SMALLINT CHECK (edad >= 0),
    casado           BOOLEAN DEFAULT FALSE,
    fecha_nacimiento DATE,
    datos_contacto   JSONB
);

-- Tabla de Pasaporte (relación UNO A UNO con Persona)
CREATE TABLE Pasaporte (
    id               SERIAL PRIMARY KEY,
    id_persona       UUID UNIQUE REFERENCES Persona(id),
    numero           VARCHAR(20) UNIQUE NOT NULL,
    fecha_emision    DATE NOT NULL,
    fecha_expiracion DATE NOT NULL
);

-- Tabla Departamento (UNO A MUCHOS con Estudiante)
CREATE TABLE Departamento (
    id     SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla Estudiante (pertenece a un Departamento)
CREATE TABLE Estudiante (
    id SERIAL PRIMARY KEY,
    id_persona UUID UNIQUE REFERENCES Persona(id),
    id_departamento INTEGER REFERENCES Departamento(id),
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    promedio NUMERIC(4,2) CHECK (promedio >= 0 AND promedio <= 10),
    estado estado_matricula
);

-- Tabla Curso
CREATE TABLE Curso (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INTEGER CHECK (creditos > 0),
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla intermedia Estudiante_Curso (MUCHOS A MUCHOS)
CREATE TABLE Estudiante_Curso (
    id_estudiante INTEGER REFERENCES Estudiante(id),
    id_curso INTEGER REFERENCES Curso(id),
    nota REAL CHECK (nota >= 0 AND nota <= 10),
    PRIMARY KEY (id_estudiante, id_curso)
);

-- Insertar personas
INSERT INTO Persona (nombre, apellido, edad, casado, fecha_nacimiento, datos_contacto)
VALUES 
    ('Ana', 'Pérez', 20, FALSE, '2004-03-21', '{"email": "ana@example.com", "telefono": "123456789"}'),
    ('Luis', 'García', 25, TRUE, '1999-07-10', '{"email": "luis@example.com", "telefono": "987654321"}');

-- Insertar pasaporte (relación 1 a 1)
INSERT INTO Pasaporte (id_persona, numero, fecha_emision, fecha_expiracion)
SELECT id, 'X123456', '2022-01-01', '2032-01-01'
FROM Persona
WHERE nombre = 'Ana';

-- Insertar departamentos
INSERT INTO Departamento (nombre)
VALUES ('Informática'), ('Matemáticas'), ('Biología');

-- Insertar estudiantes
INSERT INTO Estudiante (id_persona, id_departamento, promedio, estado)
SELECT id, 1, 8.5, 'activo' FROM Persona WHERE nombre = 'Ana';

INSERT INTO Estudiante (id_persona, id_departamento, promedio, estado)
SELECT id, 2, 7.3, 'pendiente' FROM Persona WHERE nombre = 'Luis';

-- Insertar cursos
INSERT INTO Curso (nombre, creditos)
VALUES ('Bases de Datos', 5),
       ('Álgebra', 4),
       ('Biología Molecular', 6);

-- Insertar estudiante_curso (relación muchos a muchos)
INSERT INTO Estudiante_Curso (id_estudiante, id_curso, nota)
VALUES 
    (1, 1, 9.2),
    (1, 2, 7.5),
    (2, 2, 6.8),
    (2, 3, 8.0);
	
---------------------
---   CONSULTAS   ---
---------------------

SELECT * FROM ESTUDIANTE;

SELECT * FROM PERSONA;

SELECT e.*, p.*, ec.id_curso, c.nombre
FROM Estudiante e
JOIN Persona p ON e.id_persona = p.id
JOIN ESTUDIANTE_CURSO ec ON ec.id_estudiante = e.id
JOIN Curso c ON c.id = ec.id_curso; 


SELECT p.nombre, c.nombre
FROM Estudiante e
JOIN Persona p ON e.id_persona = p.id
JOIN ESTUDIANTE_CURSO ec ON ec.id_estudiante = e.id
JOIN Curso c ON c.id = ec.id_curso
WHERE p.nombre = 'Ana';


SELECT * FROM Curso;





