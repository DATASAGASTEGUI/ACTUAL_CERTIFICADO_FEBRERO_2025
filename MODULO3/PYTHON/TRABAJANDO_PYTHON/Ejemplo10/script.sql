CREATE DATABASE IF NOT EXISTS PYQTDB;
USE PYQTDB;

CREATE TABLE IF NOT EXISTS Personas (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    estatura DECIMAL(4,2),
    sexo CHAR(1)  -- Nueva columna para el sexo (M = Masculino, F = Femenino)
);

INSERT INTO Personas (id, nombre, estatura, sexo) VALUES
(1, 'Luis', 1.72, 'M'),
(2, 'Miguel', 1.73, 'M'),
(3, 'Carlos', 1.74, 'M'),
(4, 'Javier', 1.75, 'M'),
(5, 'Carmen', 1.76, 'F'),
(6, 'Maria', 1.60, 'F'),
(7, 'Lucia', 1.61, 'F'),
(8, 'Carmen', 1.62, 'F'),
(9, 'Arturo', 1.63, 'M'),
(10, 'Ismael', 1.64, 'M'),
(11, 'Delly', 1.65, 'F'),
(12, 'Vanessa', 1.56, 'F'),
(13, 'Melissa', 1.64, 'F'),
(14, 'Raul', 1.67, 'M'),
(15, 'Arturo', 2.00, 'M'),
(16, 'Gerson', 2.00, 'M');
