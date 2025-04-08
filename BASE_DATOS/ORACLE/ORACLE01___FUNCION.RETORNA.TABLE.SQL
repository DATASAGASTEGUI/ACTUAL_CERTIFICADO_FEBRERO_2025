****************
***   0001   ***   TABLA DE UN SOLO REGISTRO
****************

SET SERVEROUTPUT ON;

-- 1. Crear un tipo objeto que contenga los datos a retornar:

CREATE OR REPLACE TYPE cliente_info AS OBJECT (
  empresa         VARCHAR2(20),
  idVendedor      INTEGER,
  limite_credito  NUMBER(10,2)
);
/

-- 2. Crear un tipo tabla de ese objeto:

CREATE OR REPLACE TYPE cliente_info_tab AS TABLE OF cliente_info;
/

-- 3. Crear la función que retorna esa tabla (aunque sea un solo valor, devuelve un TABLE):

CREATE OR REPLACE FUNCTION funcion_retorna_varios_valores(p_id NUMBER)
  RETURN cliente_info_tab
  PIPELINED
IS
  v_empresa         Cliente.empresa%TYPE;
  v_idVendedor      Cliente.idVendedor%TYPE;
  v_limite_credito  Cliente.limite_credito%TYPE;
BEGIN
  SELECT empresa, idVendedor, limite_credito
  INTO v_empresa, v_idVendedor, v_limite_credito
  FROM Cliente
  WHERE idCliente = p_id;

  PIPE ROW(cliente_info(v_empresa, v_idVendedor, v_limite_credito));
  
  RETURN;
END;
/

-- 4. Llamar a la función desde una consulta:

-- Aunque devuelva una sola fila, Oracle lo necesita estructurado así para que sea usable en SQL como "tabla".
SELECT * FROM TABLE(funcion_retorna_varios_valores(2111));

/*
Notas:
Si el idCliente no existe, la función lanzará una excepción (NO_DATA_FOUND).  Si 
quieres evitar eso, puedo ayudarte a manejarlo.

Aunque solo devuelva un resultado, se usa PIPELINED y PIPE ROW(...) para  que la
función pueda ser usada en SQL como una tabla.

La palabra clave PIPELINED no es obligatoria en todas las funciones  en  Oracle,
pero sí es obligatoria cuando quieres que una función  retorne una  tabla  (tipo 
colección) y sea utilizada como si fuera una tabla en una consulta SELECT * FROM
TABLE(...).
*/


SELECT object_name, status
FROM user_objects
WHERE object_type IN ('FUNCTION', 'TYPE')
AND object_name IN (
  'CLIENTE_INFO', 'CLIENTE_INFO_TAB', 'FUNCION_RETORNA_VARIOS_VALORES'
);

SET SERVEROUTPUT ON;
SELECT empresa, idVendedor, limite_credito
FROM Cliente
WHERE idCliente = 104;

****************
***   0002   ***   TABLA CON MAS DE UN REGISTRO
****************

-- 1. Tipos (correctos como ya los tienes):

CREATE OR REPLACE TYPE cliente_info AS OBJECT (
  empresa         VARCHAR2(20),
  idVendedor      INTEGER,
  limite_credito  NUMBER(10,2)
);
/

CREATE OR REPLACE TYPE cliente_info_tab AS TABLE OF cliente_info;
/

-- 2. Función corregida (recorre todas las filas):

CREATE OR REPLACE FUNCTION funcion_retorna_varios_valores
  RETURN cliente_info_tab
  PIPELINED
IS
BEGIN
  FOR cliente_rec IN (SELECT empresa, idVendedor, limite_credito FROM Cliente) LOOP
    PIPE ROW(cliente_info(cliente_rec.empresa, cliente_rec.idVendedor, cliente_rec.limite_credito));
  END LOOP;

  RETURN;
END;
/

-- 3. Consulta para ver los resultados:

SELECT * FROM TABLE(funcion_retorna_varios_valores);

/*
Usamos un FOR cliente_rec IN (...) LOOP para recorrer todas las filas de la tabla Cliente.

En cada iteración hacemos PIPE ROW(...) para añadir una fila al resultado.

Ya no usamos SELECT ... INTO porque eso solo sirve para una fila.
*/