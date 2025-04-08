**********************************
***   CREAR LA BASE DE DATOS   ***
**********************************

-- ELIMINAR LA BASE DE DATOS SI EXISTE

DROP DATABASE IF EXISTS DBTRIGGER_2;

-- CREAR LA BASE DE DATOS SI NO EXISTE

CREATE DATABASE IF NOT EXISTS DBTRIGGER_2;

-- SELECCIONAR LA BASE DE DATOS PARA SU USO

USE DBTRIGGER_2;

-- CREAR LA TABLA PRODUCTO

CREATE TABLE IF NOT EXISTS Producto (
    id     INT            PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

-- INSERTAR DATOS EN LA TABLA PRODUCTO

INSERT INTO Producto (nombre, precio) VALUES
('Producto A', 10.50),
('Producto B', 20.75),
('Producto C', 15.00);

-- CREAR LA TABLA REGISTRO PARA ALMACENAR LOS REGISTROS DE ACTUALIZACION

CREATE TABLE registro (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    producto_id     INT,
    nombre_anterior VARCHAR(100),
    nombre_actual   VARCHAR(100),
    precio_anterior DECIMAL(10, 2),
    precio_actual   DECIMAL(10, 2),
    usuario         VARCHAR(100), -- Nueva columna para almacenar el nombre de usuario
    fecha           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	accion          VARCHAR(10)
);

-- CREAR EL TRIGGER

-- 1. PARA INSERT

DELIMITER //

CREATE TRIGGER after_insert_product
AFTER INSERT ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO registro (producto_id, nombre_anterior, nombre_actual, precio_anterior, precio_actual, usuario, fecha, accion)
    VALUES (NEW.id, NULL, NEW.nombre, NULL, NEW.precio, USER(), NOW(), 'INSERT');
END//

DELIMITER ;

-- 2. PARA UPDATE

DELIMITER //

CREATE TRIGGER after_update_product
AFTER UPDATE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO registro (producto_id, nombre_anterior, nombre_actual, precio_anterior, precio_actual, usuario, fecha, accion)
    VALUES (OLD.id, OLD.nombre, NEW.nombre, OLD.precio, NEW.precio, USER(), NOW(), 'UPDATE');
END//

DELIMITER ;

-- 3. PARA DELETE

DELIMITER //

CREATE TRIGGER after_delete_product
AFTER DELETE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO registro (producto_id, nombre_anterior, nombre_actual, precio_anterior, precio_actual, usuario, fecha, accion)
    VALUES (OLD.id, OLD.nombre, NULL, OLD.precio, NULL, USER(), NOW(), 'DELETE');
END//

DELIMITER ;

********************************************
***   CONSULTAS PARA LANZAR EL TRIGGER   ***
********************************************

--------------------------------------------------------------------------------
Este   trigger   se   activará   después   de  cualquier operación de inserción,
actualización o eliminación en la tabla Producto. Registra  los  detalles  de la
acción realizada (inserción, actualización o eliminación), así como  los valores
antiguos y nuevos de los campos afectados, en la tabla de registro.

Después   de   ejecutar  cualquiera de estas consultas, el trigger se activará y
registrará la acción realizada en  la  tabla  de  registro. Puedes verificar los 
registros en la tabla de registro para ver  cómo se han registrado las acciones.

En MySQL, no puedes tener un único trigger para múltiples acciones
(INSERT, UPDATE, DELETE). Necesitas crear un trigger separado para  cada acción.
Aquí tienes los triggers corregidos para INSERT, UPDATE y DELETE:

Estos triggers  deberían  funcionar  correctamente ahora. Cada  uno  registra la
acción  correspondiente  en  la  tabla  de  registro  según  sea  una inserción, 
actualización o eliminación en la tabla Producto.
--------------------------------------------------------------------------------

-- EJEMPLO DE INSERCION

INSERT INTO Producto (nombre, precio) VALUES ('Nuevo Producto', 30.00);

-- EJEMPLO DE ACTUALIZACION

UPDATE Producto SET precio = 25.00 WHERE nombre = 'Producto A';

-- EJEMPLO DE ELIMINACION

DELETE FROM Producto WHERE id = 2;

***********************************************
***   AGREGAR UN NUEVO TRIGGER Y LANZARLO   ***
***********************************************

-- AGREGAR EL SIGUIENTE TRIGGER

DELIMITER //
CREATE TRIGGER after_delete_producto_1
AFTER DELETE ON Producto
FOR EACH ROW
BEGIN
    DELETE FROM registro WHERE producto_id = OLD.id;
END//
DELIMITER ;

-- LANZAAR EL TRIGGER

DELETE FROM Producto WHERE id = 1;

--------------------------------------------------------------------------------
Aquí   tienes   un ejemplo   de un  trigger que se activa después de eliminar un
registro en la tabla Producto y elimina  un registro correspondiente en la tabla 
registro

Esta consulta eliminará el registro en la tabla   Producto  con un ID específico 
(en este caso, el ID 1). Al ejecutar esta consulta, se   activará   el   trigger
after_delete_producto_1 que hemos  definido  previamente, y eliminará  cualquier 
registro en la tabla registro que  tenga el  mismo  producto_id  que el registro 
eliminado en la tabla Producto.

Este trigger borra cualquier registro en la tabla registro que   tenga  el mismo
producto_id que el registro eliminado en la tabla Producto.

Asegúrate de ejecutar este código SQL   después  de haber creado  la  estructura
de la base de datos y los otros   triggers. Una   vez   creado, cada  vez que se
elimine un registro en la tabla Producto, este trigger se activará  y  eliminará
el registro correspondiente en la tabla registro.
--------------------------------------------------------------------------------

