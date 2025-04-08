****************
***   0001   ***
****************

-- Crear base de datos
DROP DATABASE IF EXISTS TIENDAONLINE;
CREATE DATABASE IF NOT EXISTS TIENDAONLINE;
USE TIENDAONLINE;

-- Tabla principal
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    stock INT,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla de auditoría
CREATE TABLE auditoria (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(255),
    tabla_afectada VARCHAR(100),
    id_registro INT,
    precio_anterior DECIMAL(10,2),
    precio_nuevo DECIMAL(10,2),
    usuario VARCHAR(100),
    fecha DATETIME DEFAULT NOW()
);

INSERT INTO Producto (nombre, precio, stock) VALUES
('Mouse', 25.00, 10),
('Teclado', 40.00, 5),
('Monitor', 150.00, 3);


****************
***   0002   ***
****************

-- TRIGGER AFTER UPDATE

DROP TRIGGER IF EXISTS after_update_producto;
DELIMITER //
CREATE TRIGGER after_update_producto
AFTER UPDATE ON Producto
FOR EACH ROW
BEGIN
    IF OLD.stock != NEW.stock OR OLD.precio != NEW.precio THEN
        INSERT INTO auditoria (
            accion,
            tabla_afectada,
            id_registro,
            precio_anterior,
            precio_nuevo,
            usuario
        )
        VALUES (
            'Producto actualizado',
            'Producto',
            NEW.id_producto,
            OLD.precio,
            NEW.precio,
            CURRENT_USER()
        );
    END IF;
END //
DELIMITER ;

****************
***   0003   ***
****************

-- PRUEBA:

-- Cambiar precio y stock del producto 'Mouse'
UPDATE Producto SET stock = 8, precio = 30.50 WHERE nombre = 'Mouse';

-- Ver los cambios registrados en auditoría
SELECT * FROM auditoria;
