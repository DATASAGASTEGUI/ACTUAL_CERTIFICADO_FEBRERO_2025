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
    fecha           TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CREAR EL TRIGGER

DELIMITER //

CREATE TRIGGER after_update_producto
AFTER UPDATE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO registro (producto_id, nombre_anterior, nombre_actual, precio_anterior, precio_actual, usuario, fecha)
    VALUES (OLD.id, OLD.nombre, NEW.nombre, OLD.precio, NEW.precio, USER(), NOW());
END//

DELIMITER ;

*******************
***   APUNTES   ***
*******************

--------------------------------------------------------------------------------
Ejemplo de un trigger en MySQL que registra las actualizaciones realizadas en la
tabla Producto en la tabla de Registro

Este   trigger   se   activará  después de que se actualice una fila en la tabla
Producto. Registra en la tabla de Registro los   detalles   de la actualización,
incluyendo el ID del producto, el nombre anterior y el  nuevo  nombre, el precio
anterior y   el   nuevo  precio, así como el nombre de  usuario  que  realiza la
actualización. La  función  USER()  se utiliza para obtener el nombre de usuario
actual.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Consulta de prueba que actualiza un producto en la tabla Producto y activará  el
trigger que hemos creado para registrar la actualización en la tabla de registro.

Esta consulta actualiza el nombre y el precio del producto con ID 1 en la  tabla
Producto. Después de ejecutar esta consulta, el trigger se activará y registrará
los detalles de la actualización en la tabla de registro. Puedes  verificar  los
registros en la tabla de registro para  ver si se  ha  registrado  correctamente
la actualización.
--------------------------------------------------------------------------------

-- Actualizar el nombre y el precio del Producto con id 1

UPDATE Producto
SET nombre = 'Nuevo Producto A', precio = 25.00
WHERE id = 1;

-- Actualizar el precio del Producto con nombre 'Producto B'

UPDATE Producto
SET precio = 30.50
WHERE nombre = 'Producto B';

*****************
***   ERROR   ***
*****************

UPDATE Producto
SET precio = 30.50
WHERE nombre = 'Producto B';

--------------------------------------------------------------------------------
El error que has recibido es debido a que estás intentando realizar una 
actualización en la tabla Producto sin especificar una cláusula WHERE que 
utilice una columna clave (KEY column). Este error es común en entornos de MySQL
con el "modo de actualización segura" habilitado, que evita actualizaciones 
accidentales o peligrosas.

Para resolver este problema, puedes desactivar el modo de actualización segura
temporalmente ejecutando el siguiente comando SQL:
--------------------------------------------------------------------------------

SET SQL_SAFE_UPDATES = 0;

--------------------------------------------------------------------------------
Después   de   ejecutar   este   comando,   intenta   nuevamente  la consulta de 
actualización que proporcioné   anteriormente. Una   vez que hayas terminado tus
operaciones de actualización, es recomendable   volver   a   activar  el modo de 
actualización segura ejecutando:
--------------------------------------------------------------------------------

SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------
Es importante tener en cuenta que   desactivar   el modo de actualización segura
puede ser peligroso en entornos de producción, ya  que  permite  actualizaciones
sin   restricciones   en   las tablas. Asegúrate   de entender completamente las 
consecuencias antes de deshabilitar esta configuración.
--------------------------------------------------------------------------------

****************
***   0001   ***
****************

DROP DATABASE IF EXISTS DBTRIGGER_2;
CREATE DATABASE IF NOT EXISTS DBTRIGGER_2;
USE DBTRIGGER_2;

CREATE TABLE IF NOT EXISTS Producto (
    id     INT            PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

INSERT INTO Producto (nombre, precio) VALUES
('Producto A', 10.50),
('Producto B', 20.75),
('Producto C', 15.00);

CREATE TABLE registro (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    producto_id     INT,
    nombre_anterior VARCHAR(100),
    nombre_actual   VARCHAR(100),
    precio_anterior DECIMAL(10, 2),
    precio_actual   DECIMAL(10, 2),
    usuario         VARCHAR(100), -- Nueva columna para almacenar el nombre de usuario
    fecha           TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //

CREATE TRIGGER after_update_producto
AFTER UPDATE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO registro (producto_id, nombre_anterior, nombre_actual, precio_anterior, precio_actual, usuario, fecha)
    VALUES (OLD.id, OLD.nombre, NEW.nombre, OLD.precio, NEW.precio, USER(), NOW());
END//

DELIMITER ;





