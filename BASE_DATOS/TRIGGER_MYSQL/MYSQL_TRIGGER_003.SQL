***************************************
***   INTRODUCCION A LOS TRIGGERS   ***
***************************************
--------------------------------------------------------------------------------
(1) ¿QUE ES UN TRIGGER?

Un trigger (o "disparador" en español) es un bloque de código SQL que se ejecuta 
automáticamente antes o después de que ocurra un evento específico en  una tabla 
(como INSERT, UPDATE o DELETE).

Ejemplo cotidiano: Imagina un  vigilante  en un  edificio (la base de datos) que 
actúa cuando alguien intenta entrar, modificar algo o salir (eventos en la tabla).
--------------------------------------------------------------------------------
(2) ¿PARA QUE SIRVE?

Los triggers se usan principalmente para:

✅ Validar datos:

Ejemplo: Evitar que se ingrese un salario negativo en una tabla de empleados.

✅ Automatizar procesos:

Ejemplo: Actualizar automáticamente la fecha de modificación cuando un registro cambie.

✅ Registrar auditorías:

Ejemplo: Guardar en otra tabla quién eliminó un dato importante.

✅ Mantener integridad referencial:

Ejemplo: Si se borra un cliente, borrar también sus pedidos asociados.
--------------------------------------------------------------------------------
(3) VENTAJAS Y DESVENTAJAS

-- VENTAJAS

✔ Automatización: Reducen la necesidad de escribir código repetitivo en la aplicación.
✔ Seguridad: Permiten aplicar reglas de negocio directamente en la base de datos.
✔ Consistencia: Aseguran que ciertas acciones siempre se ejecuten (ej: auditorías).

-- DESVENTAJAS

❌ Dificultad para depurar: Si hay un error en un trigger, puede ser complicado rastrearlo.
❌ Impacto en el rendimiento: Si son muy complejos, pueden hacer lenta la base de datos.
❌ Dependencia oculta: Alguien que modifique la tabla podría no saber que hay un trigger asociado.
--------------------------------------------------------------------------------
(4) EJEMPLO CON UNA ANALOGIA

Piensa en un trigger como un bot de WhatsApp que:

Se activa cuando recibes un mensaje (evento INSERT).
Verifica si el mensaje tiene palabras prohibidas (BEFORE INSERT).
Guarda un registro de quién lo envió (AFTER INSERT).

Los triggers son como "guardianes automáticos" de tu base de datos. Son  útiles, 
pero deben usarse con cuidado para no complicar el sistema.
--------------------------------------------------------------------------------
*****************************************
***   SINTAXIS BASICA DE UN TRIGGER   ***
*****************************************
--------------------------------------------------------------------------------
CREATE TRIGGER nombre_trigger
BEFORE/AFTER INSERT/UPDATE/DELETE ON tabla
FOR EACH ROW
BEGIN
    -- Código a ejecutar
END;
--------------------------------------------------------------------------------
*****************************
***   TIPOS DE TRIGGERS   ***
*****************************
--------------------------------------------------------------------------------
-- TIPOS DE TRIGGERS

Según el momento de ejecución:

BEFORE (antes de la operación).

AFTER (después de la operación).

Según la operación que lo activa:

INSERT (al insertar datos).

UPDATE (al actualizar datos).

DELETE (al eliminar datos).
--------------------------------------------------------------------------------
-- RESUMEN DE COMBINACIONES

---------------------------------------------------------------
MOMENTO		OPERACION   	USO TIPICO
---------------------------------------------------------------
BEFORE		INSERT			Validar datos antes de guardar.
AFTER		INSERT			Registrar en logs o auditoría.
BEFORE		UPDATE			Actualizar campos automáticamente.
AFTER		UPDATE			Registrar cambios importantes.
BEFORE		DELETE			Evitar eliminaciones no permitidas.
AFTER		DELETE			Guardar respaldo de datos borrados.
---------------------------------------------------------------
--------------------------------------------------------------------------------
*****************************************************
***   BASE DE DATOS PARA LOS EJEMPLOS PRACTICOS   ***
*****************************************************

-- Crear la base de datos
DROP DATABASE IF EXISTS TIENDAONLINE;
CREATE DATABASE IF NOT EXISTS TIENDAONLINE;
USE TIENDAONLINE;

-- Tabla de productos
CREATE TABLE Producto (
    id_producto         INT                     AUTO_INCREMENT PRIMARY KEY,
    nombre              VARCHAR(100)   NOT NULL,
    precio              DECIMAL(10, 2) NOT NULL,
    stock               INT            NOT NULL,
    fecha_actualizacion TIMESTAMP      
);

-- Tabla de pedidos
CREATE TABLE Pedido (
    id_pedido    INT                                          AUTO_INCREMENT PRIMARY KEY,
    id_producto  INT                                 NOT NULL,
    cantidad     INT                                 NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                 FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- Tabla de auditoría (para triggers AFTER)
CREATE TABLE Auditoria (
    id_auditoria   INT                   AUTO_INCREMENT PRIMARY KEY,
    accion         VARCHAR(100) NOT NULL,
    tabla_afectada VARCHAR(50)  NOT NULL,
    id_registro    INT          NOT NULL,
    fecha          TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de respaldo para productos eliminados
CREATE TABLE Productos_Eliminados (
    id                INT,
    nombre            VARCHAR(100),
    precio            DECIMAL(10, 2),
    fecha_eliminacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
*********************************************************
***   EJEMPLOS DE TRIGGERS PARA LAS 6 COMBINACIONES   ***
*********************************************************
--------------------------------------------------------------------------------
-- 1. BEFORE INSERT → VALIDAR DATOS ANTES DE INSERTAR

-- OBJETIVO: ASEGURAR QUE EL PRECIO DE UN PRODUCTO NO SEA NEGATIVO

DROP TRIGGER before_insert_producto;
DELIMITER //
CREATE TRIGGER before_insert_producto
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: El precio no puede ser negativo';
    END IF;
END //
DELIMITER ;

-- PRUEBA:

INSERT INTO Producto (nombre, precio, stock) VALUES ('Laptop', -1000, 5); -- Error Esto lanza un error y no inserta el registro
INSERT INTO Producto (nombre, precio, stock) VALUES ('Laptop', 1000, 5);  -- Correcto

-- EXPLICACION:

 DELIMITER //
¿Qué hace?: Cambia el delimitador de comandos de ; a //.

¿Por qué?: Para poder escribir todo el trigger (que contiene múltiples ;) como una única unidad de código, sin que MySQL lo ejecute antes de terminar.

🔹 CREATE TRIGGER before_insert_producto
¿Qué hace?: Comienza la creación de un trigger llamado before_insert_producto.

¿Cuándo se activa?: Antes de insertar una fila en la tabla Producto.

🔹 BEFORE INSERT ON Producto
¿Qué hace?: Especifica que el trigger se ejecutará antes (BEFORE) de una operación de inserción (INSERT) en la tabla Producto.

🔹 FOR EACH ROW
¿Qué hace?: Indica que el trigger se aplica a cada fila que se quiera insertar (es decir, fila por fila).

🔹 BEGIN ... END
¿Qué hace?: Marca el bloque de instrucciones que se ejecutarán cuando se active el trigger.

🔹 IF NEW.precio < 0 THEN
¿Qué hace?: Verifica si el valor del campo precio de la nueva fila (NEW.precio) es menor que 0.

NEW: Hace referencia a los valores que se están intentando insertar.

🔹 SIGNAL SQLSTATE '45000'
¿Qué hace?: Lanza un error personalizado.

SQLSTATE '45000': Es un código genérico que indica un error definido por el usuario.

🔹 SET MESSAGE_TEXT = 'Error: El precio no puede ser negativo';
¿Qué hace?: Especifica el mensaje de error que se mostrará si se cumple la condición del IF.

Estos dos líneas deben estar juntas siempre:
SIGNAL SQLSTATE '45000': '45000' es un código genérico para errores definidos por el usuario.
SET MESSAGE_TEXT = ...: especifica el mensaje de error que se mostrará.

🔹 END IF;
¿Qué hace?: Finaliza la instrucción condicional IF.

🔹 END //
¿Qué hace?: Finaliza el bloque del trigger.

🔹 DELIMITER ;
¿Qué hace?: Restaura el delimitador de comandos al valor por defecto (;).

✅ ¿Qué logra este trigger?
Evita que se inserte en la tabla Producto cualquier registro con un precio negativo. Si alguien intenta hacerlo, se genera un error con el mensaje:

Error: El precio no puede ser negativo

-- EXPLICACION:

Tu trigger:

DELIMITER //
CREATE TRIGGER before_insert_producto
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: El precio no puede ser negativo';
    END IF;
END //
DELIMITER ;

✅ ¿Qué hace este trigger?

Este trigger se ejecuta antes de insertar un nuevo registro en la tabla Producto. Su objetivo es:

Validar que el valor de precio no sea negativo.

Si precio < 0, lanza un error y bloquea la inserción del registro.

🔍 ¿Por qué no se puede insertar un registro con precio < 0?
Porque estás usando:

SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Error: El precio no puede ser negativo';

Esto hace que MySQL:

Interrumpa la operación de INSERT.

Devuelva un error personalizado.

Entonces, si intentas hacer algo como:

INSERT INTO Producto (nombre, precio) VALUES ('Coca-Cola', -5);

MySQL responderá con:

ERROR 1644 (45000): Error: El precio no puede ser negativo
Y no insertará el producto.
--------------------------------------------------------------------------------
-- 2. AFTER INSERT → REGISTRAR EN AUDITORIA TRAS INSERTAR

-- OBJETIVO: GUARDAR UN LOG CUANDO SE AGREGUE UN NUEVO PRODUCTO.

DROP TRIGGER after_insert_producto;
DELIMITER //
CREATE TRIGGER after_insert_producto
AFTER INSERT ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (accion, tabla_afectada, id_registro)
    VALUES ('Nuevo producto insertado', 'producto', NEW.id_producto);
END //
DELIMITER ;

-- PRUEBA:


INSERT INTO Producto (nombre, precio, stock) VALUES ('Mouse', 25.99, 10);
SELECT * FROM auditoria; -- Debe aparecer un registro
--------------------------------------------------------------------------------
-- 3. BEFORE UPDATE → ACTUALIZAR FECHA AUTOMÁTICAMENTE

-- OBJETIVO: ACTUALIZAR FECHA_ACTUALIZACION ANTES DE MODIFICAR UN PRODUCTO.

DROP TRIGGER before_update_producto;
DELIMITER //
CREATE TRIGGER before_update_producto
BEFORE UPDATE ON Producto
FOR EACH ROW
BEGIN
    SET NEW.fecha_actualizacion = NOW();
END //
DELIMITER ;

-- PRUEBA:

UPDATE Producto SET precio = 30.50 WHERE nombre = 'Mouse';
SELECT * FROM Producto WHERE nombre = 'Mouse'; -- Verificar fecha_actualizacion

-- ANTES ESTO PARA QUE FUNCIONE EL EJEMPLO:

SET SQL_SAFE_UPDATES = 0;

SELECT * FROM Producto;

INSERT INTO Producto (nombre, precio, stock, fecha_actualizacion)
VALUES ('Mouse', 25.00, 50, NOW());

-- EXPLICACION:

Cuando ejecutas una sentencia como:

UPDATE Producto SET precio = 50 WHERE id = 1;

y tienes este trigger:

CREATE TRIGGER before_update_producto
BEFORE UPDATE ON Producto
FOR EACH ROW
BEGIN
    SET NEW.fecha_actualizacion = NOW();
END;

¿Qué sucede internamente?

Antes de que MySQL actualice el registro en la tabla Producto, se ejecuta el trigger BEFORE UPDATE.

El trigger modifica el valor del campo fecha_actualizacion del nuevo registro usando SET NEW.fecha_actualizacion = NOW();.

Luego, MySQL continúa con la actualización original, por ejemplo, cambiando el precio.

Al final, el registro queda actualizado con:

El nuevo precio que diste en el UPDATE.

La fecha_actualizacion con la hora exacta en la que se hizo la modificación.
--------------------------------------------------------------------------------
-- 4. AFTER UPDATE → REGISTRAR CAMBIOS DE STOCK

-- OBJETIVO: GUARDAR EN AUDITORÍA SI EL STOCK DE UN PRODUCTO CAMBIA.

DROP TRIGGER after_update_producto;
DELIMITER //
CREATE TRIGGER after_update_producto
AFTER UPDATE ON Producto
FOR EACH ROW
BEGIN
    IF OLD.stock != NEW.stock THEN
        INSERT INTO auditoria (accion, tabla_afectada, id_registro)
        VALUES ('Stock actualizado', 'Producto', NEW.id_producto);
		
		
    END IF;
END //
DELIMITER ;

-- PRUEBA:

UPDATE Producto SET stock = 8 WHERE nombre = 'Mouse';
SELECT * FROM auditoria; -- Debe aparecer un nuevo registro
--------------------------------------------------------------------------------
-- 5. BEFORE DELETE → EVITAR ELIMINAR PRODUCTOS CON STOCK

-- OBJETIVO: NO PERMITIR BORRAR PRODUCTOS CON STOCK MAYOR A CERO.

DROP TRIGGER before_delete_producto;
DELIMITER //
CREATE TRIGGER before_delete_producto
BEFORE DELETE ON Producto
FOR EACH ROW
BEGIN
    IF OLD.stock > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar: El producto aún tiene stock';
    END IF;
END //
DELIMITER ;

-- PRUEBA:

DELETE FROM Producto WHERE nombre = 'Mouse'; -- Error si stock > 0
UPDATE Producto SET stock = 0 WHERE nombre = 'Mouse'; -- Primero reducir stock
DELETE FROM Producto WHERE nombre = 'Mouse'; -- Ahora sí funciona 
SELECT * FROM Producto; -- Verificar que se haya eliminado
--------------------------------------------------------------------------------
-- 6. AFTER DELETE → GUARDAR RESPALDO DE PRODUCTOS ELIMINADOS

-- OBJETIVO: COPIAR EL PRODUCTO ELIMINADO EN PRODUCTOS_ELIMINADOS.

DROP TRIGGER after_delete_producto
DELIMITER //
CREATE TRIGGER after_delete_producto
AFTER DELETE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO Productos_Eliminados (id, nombre, precio)
    VALUES (OLD.id_producto, OLD.nombre, OLD.precio);
END //
DELIMITER ;

-- PRUEBA:

DELETE FROM Producto WHERE nombre = 'Teclado';
SELECT * FROM productos_eliminados; -- Debe aparecer el Mouse eliminado
SELECT * FROM Producto; -- Verificar que se haya eliminado

-- ANTES INSERTAR MOUSE PARA PROBAR EL EJEMPLO

INSERT INTO Producto (nombre, precio, stock, fecha_actualizacion)
VALUES ('Teclado', 25.00, 0, NOW());
--------------------------------------------------------------------------------

















