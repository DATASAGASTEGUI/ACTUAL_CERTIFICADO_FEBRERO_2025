-- 1. CREAR FUNCION
DELIMITER //

CREATE FUNCTION sumar_dos_numeros(a INT, b INT) RETURNS INT
DETERMINISTIC
BEGIN
   RETURN a + b;
END//
DELIMITER ;
-- 2. LLAMAR FUNCION
SELECT sumar_dos_numeros(2,3) AS Resultado;

-- ----------------------------------------------------------------------------
-- 1. CREAR FUNCION
DELIMITER //
CREATE FUNCTION sumar_dos_numeros_constantes() RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE a INT DEFAULT 5;
   DECLARE b INT DEFAULT 3;
   DECLARE c INT;
   SET c = a + b;
   RETURN c;
END//
DELIMITER ;
-- 2. LLAMAR FUNCION
SELECT sumar_dos_numeros_constantes() AS Resultado;
-- ----------------------------------------------------------------------------
-- 1. CREAR FUNCION
DELIMITER //
CREATE FUNCTION contar_numero_registros_tabla_cliente_pedidos() RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
   DECLARE cantidadClientes INT;
   DECLARE cantidadPedidos INT;
   SELECT COUNT(*) INTO cantidadClientes FROM Cliente;
   SELECT COUNT(*) INTO cantidadPedidos FROM Pedido;
   RETURN CONCAT(cantidadClientes,',',cantidadPedidos);
END//
DELIMITER ;
-- 2. LLAMAR FUNCION
SELECT contar_numero_registros_tabla_cliente_pedidos() AS Resultado;


SELECT COUNT(*) FROM Cliente;
-- --------------------

USE FACTORIA;
SELECT idPedido, pe.idFabrica, pe.idProducto, descripcion, cantidad, precio, calcular_importe(cantidad,precio) AS ImporteCalculo, importe 
FROM Producto pr
JOIN Pedido pe ON pr.idFabrica = pe.idFabrica AND pr.idProducto = pe.idProducto;


DROP FUNCTION IF EXISTS calcular_importe;
DELIMITER //

CREATE FUNCTION calcular_importe(cantidad INT, precio DOUBLE) RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE importe DOUBLE;
    SET importe = cantidad * precio;
    return importe;
END//
DELIMITER ;



