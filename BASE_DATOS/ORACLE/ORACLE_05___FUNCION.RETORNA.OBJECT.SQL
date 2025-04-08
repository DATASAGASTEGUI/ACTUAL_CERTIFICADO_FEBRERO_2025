****************
***   0001   ***
****************

-- 1. Crear un tipo objeto simple:

CREATE OR REPLACE TYPE cliente_info_obj AS OBJECT (
  empresa         VARCHAR2(20),
  idVendedor      INTEGER,
  limite_credito  NUMBER(10,2)
);
/

-- 2. Crear la función que retorna un objeto:

CREATE OR REPLACE FUNCTION funcion_retorna_cliente(p_id NUMBER)
  RETURN cliente_info_obj
IS
  v_empresa         Cliente.empresa%TYPE;
  v_idVendedor      Cliente.idVendedor%TYPE;
  v_limite_credito  Cliente.limite_credito%TYPE;
BEGIN
  SELECT empresa, idVendedor, limite_credito
  INTO v_empresa, v_idVendedor, v_limite_credito
  FROM Cliente
  WHERE idCliente = p_id;

  RETURN cliente_info_obj(v_empresa, v_idVendedor, v_limite_credito);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('❌ Cliente con ID ' || p_id || ' no existe.');
    RETURN NULL;
END;
/

-- 3. Usarla dentro de un bloque PL/SQL:

DECLARE
  v_cliente cliente_info_obj;
BEGIN
  v_cliente := funcion_retorna_cliente(1);  -- Cambia el ID por uno válido

  IF v_cliente IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('❌ Cliente con ID 1 no existe.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('✅ Empresa: ' || v_cliente.empresa);
    DBMS_OUTPUT.PUT_LINE('🧑 ID Vendedor: ' || v_cliente.idVendedor);
    DBMS_OUTPUT.PUT_LINE('💰 Límite crédito: ' || v_cliente.limite_credito);
  END IF;
END;
/

/*
Esta versión no sirve directamente en un SELECT ... FROM ..., pero sí funciona perfecto en PL/SQL.

Es ideal cuando solo necesitas obtener un único objeto por código.
*/