-- Borrar la base de datos
DROP DATABASE IF EXISTS gestion_matriculas;

-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS gestion_matriculas;
USE gestion_matriculas;

-- Tabla Estudiantes
CREATE TABLE estudiantes (
    id_estudiante VARCHAR(10) PRIMARY KEY,
    nombre        VARCHAR(50) NOT NULL
);

-- Tabla Cursos
CREATE TABLE cursos (
    id_curso VARCHAR(10) PRIMARY KEY,
    nombre   VARCHAR(50) NOT NULL
);

-- Tabla Inscripciones (relación muchos a muchos)
CREATE TABLE inscripciones (
    id_inscripcion    INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante     VARCHAR(10) NOT NULL,
    id_curso          VARCHAR(10) NOT NULL,
    fecha_inscripcion DATE        NOT NULL,
                      FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
                      FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Datos de prueba
INSERT INTO estudiantes (id_estudiante, nombre) VALUES 
('E1', 'Luis'),
('E2', 'Miguel'),
('E3', 'Carlos'),
('E4', 'María'),
('E5', 'Silvia');

INSERT INTO cursos (id_curso, nombre) VALUES 
('Mat', 'Matemática'),
('Qui', 'Química'),
('Fis', 'Física');

INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion) VALUES 
('E1', 'Mat', '2025-01-01'),
('E1', 'Qui', '2025-01-01'),
('E1', 'Fis', '2025-01-01'),
('E2', 'Mat', '2025-01-02'),
('E2', 'Qui', '2025-01-02'),
('E3', 'Mat', '2025-01-01'),
('E3', 'Fis', '2025-01-01'),
('E4', 'Mat', '2025-01-01'),
('E5', 'Qui', '2025-01-01');

