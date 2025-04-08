-- 1. BORRAR BASE DE DATOS SI ESTA EXISTE

DROP DATABASE IF EXISTS CITASMEDICA;

-- 2. CREAR BASE DE DATOS

CREATE DATABASE CITASMEDICA;

-- 3. USAR BASE DE DATOS

USE CITASMEDICA;

-- 4. CREAR TABLA

DROP TABLE IF EXISTS Alumno;

CREATE TABLE RegistroCitas (
  idPaciente        INT         NOT NULL AUTO_INCREMENT,
  nombre            VARCHAR(50) NOT NULL,
  fecha_hora        VARCHAR(30) NOT NULL, -- 2025-07-10T18:40    2025-07-10T18:0
                    PRIMARY KEY (idPaciente)
);
					  
-- 5. MOSTRAR LAS TABLAS DE LA BASE DE DATOS

SHOW TABLES;

-- 6. MOSTRAR LA ESTRUCTURA DE UNA TABLA

--DESCRIBE Alumno; 

-- 7. INSERTAR REGISTROS A UNA TABLA

-- INSERT INTO Alumno (idAlumno, nombre, apellidos, grupo, fechaNacimiento) VALUES (NULL,'Carlos','Ledezma Perez','dam','2020.01.15');
--INSERT INTO Alumno (idAlumno, nombre, apellidos, grupo, fechaNacimiento) VALUES (NULL,'Miguel','Ruíz Párraga','daw','2021.02.13');

-- 8. MOSTRAR TODOS LOS REGISTROS DE UNA TABLA

--SELECT * FROM Alumno;


