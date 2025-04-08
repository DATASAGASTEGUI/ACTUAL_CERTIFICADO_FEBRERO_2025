***************
***   001   ***   CREAR UNA BASE DE DATOS
***************

-- Paso 1: Crear la base de datos

DROP DATABASE IF EXISTS ESCUELA;
CREATE DATABASE IF NOT EXISTS ESCUELA;
USE ESCUELA;

-- Paso 2: Crear la tabla Padres

CREATE TABLE Padres (
    id_padre INT PRIMARY KEY,
    nombre   VARCHAR(50)
);

-- Paso 3: Crear la tabla Hijos con la relación y la opción ON DELETE CASCADE

CREATE TABLE Hijos (
    id_hijo  INT PRIMARY KEY,
    nombre   VARCHAR(50),
    id_padre INT,
             FOREIGN KEY (id_padre) REFERENCES Padres(id_padre) ON DELETE CASCADE
);

-- Paso 4: Insertar datos de ejemplo

INSERT INTO Padres (id_padre, nombre) VALUES (1, 'Carlos'), (2, 'Ana');

INSERT INTO Hijos (id_hijo, nombre, id_padre) 
VALUES (1, 'Pedro', 1), (2, 'Lucía', 1), (3, 'Marcos', 2);

***************
***   002   ***
***************

-- Paso 5: Ver los datos antes de eliminar

SELECT * FROM Padres;
SELECT * FROM Hijos;

-- Paso 6: Eliminar un padre (Carlos)

DELETE FROM Padres WHERE id_padre = 1;

-- Paso 7: Verifica que los hijos también se eliminaron (Los hijos de Carlos osea Pedro y Lucia)

SELECT * FROM Hijos;

La opción ON DELETE CASCADE solo funciona si se define la clave foránea con esta opción desde el principio.
