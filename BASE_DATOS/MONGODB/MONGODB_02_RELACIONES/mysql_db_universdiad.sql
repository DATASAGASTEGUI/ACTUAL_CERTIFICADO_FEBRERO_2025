-- ------------------------------
-- 1. ESQUEMA DE LA BASE DE DATOS
-- ------------------------------

DROP DATABASE IF EXISTS UNIVERSIDAD;
CREATE DATABASE IF NOT EXISTS UNIVERSIDAD;
USE UNIVERSIDAD;

-- ------------------------------
-- UNO A UNO: PERSONA - PASAPORTE
-- ------------------------------

CREATE TABLE Persona (
    id     INT         PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Pasaporte (
    id         INT         PRIMARY KEY,
    numero     VARCHAR(50),
    id_persona INT         UNIQUE,
               FOREIGN KEY (id_persona) REFERENCES Persona(id)
);

-- ---------------------------
-- UNO A MUCHOS: AUTOR - LIBRO
-- ---------------------------

CREATE TABLE Autor (
    id     INT         PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Libro (
    id       INT          PRIMARY KEY,
    titulo   VARCHAR(100),
    id_autor INT,
             FOREIGN KEY (id_autor) REFERENCES Autor(id)
);

-- -----------------------------------
-- MUCHOS A MUCHOS: ESTUDIANTE - CURSO
-- -----------------------------------

CREATE TABLE Estudiante (
    id     INT          PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Curso (
    id     INT          PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Estudiante_Curso (
    id_estudiante INT,
    id_curso      INT,
                  PRIMARY KEY (id_estudiante, id_curso),
                  FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id),
                  FOREIGN KEY (id_curso) REFERENCES Curso(id)
);

-- --------
-- 2. DATOS
-- --------

-- -------------------
-- Persona y Pasaporte
-- -------------------

INSERT INTO Persona (id, nombre) VALUES (1, 'Ana');

INSERT INTO Pasaporte (id, numero, id_persona) VALUES (101, 'X1234567', 1);

-- -------------
-- Autor y Libro
-- -------------

INSERT INTO Autor (id, nombre) VALUES (1, 'Gabriel García Márquez');

INSERT INTO Libro (id, titulo, id_autor) VALUES (1, 'Cien años de soledad', 1);
INSERT INTO Libro (id, titulo, id_autor) VALUES (2, 'El coronel no tiene quien le escriba', 1);