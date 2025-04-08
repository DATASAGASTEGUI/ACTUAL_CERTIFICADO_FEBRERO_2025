-- Crear la base de datos
CREATE DATABASE instituto;

-- Cambiar a la base de datos
\c instituto

-- Crear tipo ENUM para estado de matrícula
CREATE TYPE estado_matricula AS ENUM ('activo', 'pendiente', 'suspendido');

-- Crear tabla de personas (usa UUID y jsonb)
CREATE TABLE Persona (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100),
    edad SMALLINT CHECK (edad >= 0),
    casado BOOLEAN DEFAULT FALSE,
    fecha_nacimiento DATE,
    datos_contacto JSONB
);

-- Tabla de Pasaporte (relación UNO A UNO con Persona)
CREATE TABLE Pasaporte (
    id SERIAL PRIMARY KEY,
    id_persona UUID UNIQUE REFERENCES Persona(id),
    numero VARCHAR(20) UNIQUE NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_expiracion DATE NOT NULL
);

-- Tabla Departamento (UNO A MUCHOS con Estudiante)
CREATE TABLE Departamento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla Estudiante (pertenece a un Departamento)
CREATE TABLE Estudiante (
    id SERIAL PRIMARY KEY,
    id_persona UUID UNIQUE REFERENCES Persona(id),
    id_departamento INTEGER REFERENCES Departamento(id),
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    promedio NUMERIC(4,2) CHECK (promedio >= 0 AND promedio <= 10),
    estado estado_matricula
);

-- Tabla Curso
CREATE TABLE Curso (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INTEGER CHECK (creditos > 0),
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla intermedia Estudiante_Curso (MUCHOS A MUCHOS)
CREATE TABLE Estudiante_Curso (
    id_estudiante INTEGER REFERENCES Estudiante(id),
    id_curso INTEGER REFERENCES Curso(id),
    nota REAL CHECK (nota >= 0 AND nota <= 10),
    PRIMARY KEY (id_estudiante, id_curso)
);

-- Insertar personas
INSERT INTO Persona (nombre, apellido, edad, casado, fecha_nacimiento, datos_contacto)
VALUES 
    ('Ana', 'Pérez', 20, FALSE, '2004-03-21', '{"email": "ana@example.com", "telefono": "123456789"}'),
    ('Luis', 'García', 25, TRUE, '1999-07-10', '{"email": "luis@example.com", "telefono": "987654321"}');

-- Insertar pasaporte (relación 1 a 1)
INSERT INTO Pasaporte (id_persona, numero, fecha_emision, fecha_expiracion)
SELECT id, 'X123456', '2022-01-01', '2032-01-01'
FROM Persona
WHERE nombre = 'Ana';

-- Insertar departamentos
INSERT INTO Departamento (nombre)
VALUES ('Informática'), ('Matemáticas'), ('Biología');

-- Insertar estudiantes
INSERT INTO Estudiante (id_persona, id_departamento, promedio, estado)
SELECT id, 1, 8.5, 'activo' FROM Persona WHERE nombre = 'Ana';

INSERT INTO Estudiante (id_persona, id_departamento, promedio, estado)
SELECT id, 2, 7.3, 'pendiente' FROM Persona WHERE nombre = 'Luis';

-- Insertar cursos
INSERT INTO Curso (nombre, creditos)
VALUES ('Bases de Datos', 5),
       ('Algebra', 4),
       ('Biología Molecular', 6);

-- Insertar estudiante_curso (relación muchos a muchos)
INSERT INTO Estudiante_Curso (id_estudiante, id_curso, nota)
VALUES 
    (1, 1, 9.2),
    (1, 2, 7.5),
    (2, 2, 6.8),
    (2, 3, 8.0);