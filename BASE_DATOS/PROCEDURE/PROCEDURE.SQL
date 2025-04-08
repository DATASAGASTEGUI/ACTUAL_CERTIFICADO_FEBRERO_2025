


-- FUNCTION: SELECT, CALCULOS, UN SOLO RESULTADO
-- PROCEDURE: INSERT, UPDATE, DELETE, SELECT, MOSTRAR EN PANTALLA VARIOS RESULTADOS
-- IMPLEMENTACION
DROP PROCEDURE IF EXISTS mostrar_registros;
DELIMITER //
CREATE PROCEDURE mostrar_registros()
BEGIN
   SELECT * FROM Pedido; 
END;
//
DELIMITER ;
-- LLAMAR
CALL mostrar_registros();

-- CREAR UNA TABLA 
DROP PROCEDURE IF EXISTS crear_tabla;
DELIMITER //
CREATE PROCEDURE crear_tabla(IN x INT) 
BEGIN
  IF x = 1 THEN
	  CREATE TABLE TPrueba (
		 id INT PRIMARY KEY auto_increment,
		 nombre VARCHAR(30) NOT NULL
	  ) ENGINE = InnoDB;
      SELECT 'OK CREATE TABLE' AS Mensaje;
  ELSE 
     DROP TABLE TPrueba;
     SELECT 'OK DROP TABLE' AS Mensaje;
  END IF;
  
END;
//
DELIMITER ;

CALL crear_tabla(1);


-- IMPLEMENTAR UN PROCEDURE PARA INSERTAR REGISTROS
-- EN LA TABLA TPRUEBA

DROP PROCEDURE IF EXISTS insertar_registros;
DELIMITER //
CREATE PROCEDURE insertar_registros(IN p_nombre1 VARCHAR(30),
                                    IN p_nombre2 VARCHAR(30),
								    IN p_nombre3 VARCHAR(30))
BEGIN
   INSERT INTO TPrueba (nombre) VALUES 
   (p_nombre1),
   (p_nombre2),
   (p_nombre3);
   SELECT 'OK: INSERT';
END;
//
DELIMITER ;

CALL insertar_registros('Carmen','Delly','Susana');


SELECT * FROM tprueba;

-- IMPLEMENTAR UN PROCEDURE SUMAR 2 NUMEROS
-- Y MOSTRAR EL RESULTADO DE LA SUMA
DROP PROCEDURE IF EXISTS sumar_dos_numeros;
DELIMITER //
CREATE PROCEDURE sumar_dos_numeros(IN a INT, IN b INT, OUT c INT) 
BEGIN
   SET c = a + b;    
END;
//
DELIMITER ;
CALL sumar_dos_numeros(5,6,@c);

SELECT @c AS Resultado;

-- IMPLEMENTAR UN CURSOR
DROP PROCEDURE IF EXISTS mostrar_pedidos;
DELIMITER //
CREATE PROCEDURE mostrar_pedidos()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_cantidad INT;
  DECLARE v_importe DOUBLE;

  DECLARE pedido_cursor CURSOR FOR SELECT cantidad, importe FROM Pedido;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  OPEN pedido_cursor;
  
  mi_bucle: LOOP
     FETCH pedido_cursor INTO v_cantidad, v_importe;
     -- Si no hay más filas, salir del bucle
     IF done THEN
        LEAVE mi_bucle;
     END IF;
     
     
     SELECT v_cantidad, v_importe;
  END LOOP;
  
  CLOSE pedido_cursor;
END;
//
DELIMITER ;

CALL mostrar_pedidos();

DESCRIBE PEDIDO;






SELECT * FROM Pedido;