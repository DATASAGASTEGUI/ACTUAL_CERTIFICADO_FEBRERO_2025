****************
***   0001   ***
****************
--------------------------------------------------------------------------------
-- ¿Qué es ON UPDATE CASCADE?

Cuando defines una clave foránea con ON UPDATE CASCADE, si  cambias  el valor de 
la clave primaria en la tabla padre, MySQL  actualiza  automáticamente  el valor 
relacionado en la tabla hija.
--------------------------------------------------------------------------------
-- ESCENARIO DE EJEMPLO: UNO A MUCHOS

Supongamos que tienes dos tablas:

Departamento (id_depto, nombre)

Empleado (id_empleado, nombre, id_depto)

Cuando se actualiza el id_depto en la tabla Departamento(Padre), queremos que el 
cambio se refleje automáticamente en la tabla Empleado(Hijo).
--------------------------------------------------------------------------------
****************
***   0002   ***
****************

-- 1. Crear base de datos y usarla

DROP DATABASE IF EXISTS EMPRESA;
CREATE DATABASE IF NOT EXISTS EMPRESA;
USE EMPRESA;

-- 2. Crear tabla Departamento

CREATE TABLE Departamento (
    id_depto INT PRIMARY KEY,
    nombre   VARCHAR(50)
);

-- 3. Crear tabla Empleado con ON UPDATE CASCADE

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    nombre      VARCHAR(50),
    id_depto    INT,
                FOREIGN KEY (id_depto) REFERENCES Departamento(id_depto) ON UPDATE CASCADE
);

-- 4. Insertar datos

INSERT INTO Departamento (id_depto, nombre) VALUES (1, 'Ventas'), (2, 'TI');

INSERT INTO Empleado (id_empleado, nombre, id_depto) 
VALUES (1, 'Luis', 1), (2, 'Alejandro', 1), (2, 'Marta', 2);

****************
***   0003  ***
****************

-- 5. Verifica los datos antes del update

SELECT * FROM Departamento;
SELECT * FROM Empleado;

-- 6. Actualizar el ID de un departamento (padre)

-- Supongamos que quieres cambiar el id_depto de 1 a 10:

UPDATE Departamento SET id_depto = 10 WHERE id_depto = 1;

-- 7. Verifica los cambios en cascada

SELECT * FROM Empleado;

Ahora el empleado "Luis" tendrá id_depto = 10.

****************
***   0004   ***
****************
Importante:

El valor del campo relacionado (en la tabla hija) debe permitir la actualización, es decir, no debe estar definido como NOT NULL si no quieres valores inválidos.

Este tipo de UPDATE no es tan común como DELETE CASCADE, porque normalmente los identificadores no se suelen actualizar.

















