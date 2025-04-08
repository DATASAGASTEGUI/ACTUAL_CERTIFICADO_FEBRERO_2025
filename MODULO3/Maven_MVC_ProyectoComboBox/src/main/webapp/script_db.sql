DROP DATABASE IF EXISTS CAMPUSFP;
CREATE DATABASE IF NOT EXISTS CAMPUSFP;
USE CAMPUSFP;

CREATE TABLE IF NOT EXISTS Alumno (
    idAlumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO Alumno (nombre) VALUES
('Ana Martínez'),
('Carlos Pérez'),
('Lucía Gómez'),
('Pedro Sánchez'),
('María López');

