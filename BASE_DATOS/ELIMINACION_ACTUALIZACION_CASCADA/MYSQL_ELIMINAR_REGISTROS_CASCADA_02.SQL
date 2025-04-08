****************
***   0001   ***   CREAR UNA BASE DE DATOS
****************

-- Paso 1: Crear la base de datos

DROP DATABASE IF EXISTS ESCUELA;
CREATE DATABASE IF NOT EXISTS ESCUELA;
USE ESCUELA;

-- Supongamos que ya tienes estas dos tablas creadas SIN la opción ON DELETE CASCADE:

CREATE TABLE Padres (
    id_padre INT PRIMARY KEY,
    nombre   VARCHAR(50)
);

CREATE TABLE Hijos (
    id_hijo  INT PRIMARY KEY,
    nombre   VARCHAR(50),
    id_padre INT
);

-- Insertar datos de ejemplo

INSERT INTO Padres (id_padre, nombre) VALUES (1, 'Carlos'), (2, 'Ana');

INSERT INTO Hijos (id_hijo, nombre, id_padre) 
VALUES (1, 'Pedro', 1), (2, 'Lucía', 1), (3, 'Marcos', 2);

-- Hasta aquí, no hay ninguna restricción que conecte id_padre en Hijos con Padres.

****************
***   0002   ***
****************

-- Ver los datos antes de eliminar

SELECT * FROM Padres;
SELECT * FROM Hijos;

-- Eliminar un padre (Carlos)

DELETE FROM Padres WHERE id_padre = 1;

-- Al borrarse el padre 1 Carlos no se borra sus hijos

****************
***   0003   ***
****************

-- PASOS PARA AGREGAR ON DELETE CASCADE

-- 1. Agrega la clave foránea con ON DELETE CASCADE:

ALTER TABLE Hijos
ADD CONSTRAINT fk_id_padre
FOREIGN KEY (id_padre) REFERENCES Padres(id_padre)
ON DELETE CASCADE;

-- Ahora restauramos la base de datos del paso 1 y repetimos el paso 2

****************
***   0003   ***
****************

-- NOTAS IMPORTANTES

El nombre fk_id_padre es el nombre que le das tú a la clave foránea. Puedes usar cualquier nombre válido.

Si la tabla Hijos ya tenía una clave foránea que no usaba ON DELETE CASCADE, primero debes eliminarla con ALTER TABLE Hijos DROP FOREIGN KEY nombre_restricción; y luego crearla de nuevo con ON DELETE CASCADE.

-- PRECAUCION:

Este tipo de eliminación es automática, así que úsala con cuidado: eliminar un padre elimina todos los hijos asociados.

Asegúrate de tener respaldos si estás trabajando con datos reales.

-- ELIMINAR LA CLAVE FORANEA EXISTENTE

-- Primero necesitas saber el nombre de la clave foránea. Si no lo recuerdas, puedes usar:

SELECT CONSTRAINT_NAME 
FROM information_schema.KEY_COLUMN_USAGE 
WHERE TABLE_NAME = 'Hijos' AND TABLE_SCHEMA = 'Escuela';

-- Luego, eliminas la clave foránea (supongamos que se llama fk_id_padre):

ALTER TABLE Hijos DROP FOREIGN KEY fk_id_padre;