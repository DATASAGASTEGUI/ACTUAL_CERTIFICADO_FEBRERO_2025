****************
***   0001   ***   MYSQL
****************
CREATE TABLE Alumno (
    id_alumno           INT                                   AUTO_INCREMENT PRIMARY KEY,
    nombre              VARCHAR(100)               NOT NULL,
	
    edad0               INT,	
    edad1               INT                        NOT NULL   CHECK (edad1 >= 0),
	edad2               INT                                   CHECK (edad2 >= 0 AND edad2 < 150),
	
    sexo                ENUM('M', 'F')             NOT NULL,
    fecha_nacimiento    DATE                       NOT NULL,
	
    estatura0           DECIMAL(4,2)               NOT NULL,
	estatura1           DECIMAL(4,2)               NOT NULL   CHECK (estatura1 > 0 AND estatura1 <= 3.00),
	
    casado3             TINYINT(1)                            -- Toma valores 0 (falso) o 1 (verdadero)
	casado0             BOOLEAN                    NOT NULL,  -- BOOLEAN es un alias de TINYINT
	
	
	casado1             ENUM('VERDADERO', 'FALSO') NOT NULL,
	casado2             VARCHAR(8)                 NOT NULL   CHECK (casado2 IN ('VERDADERO', 'FALSO')),
	
    fecha_creacion0     TIMESTAMP                             DEFAULT CURRENT_TIMESTAMP,        -- Si se pone NOT NULL no salta ningún error.
	fecha_creacion1     TIMESTAMP                             DEFAULT CURRENT_TIMESTAMP         ON UPDATE CURRENT_TIMESTAMP, -- Si se pone NOT NULL no salta ningún error.
	
    fecha_modificacion  TIMESTAMP                             DEFAULT CURRENT_TIMESTAMP         ON UPDATE CURRENT_TIMESTAMP,-- Si se pone NOT NULL no salta ningún error.
	
	fecha_nacimiento    DATE                       NOT NULL
	
	dni                 CHAR(8)                    NOT NULL   UNIQUE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8
  COLLATE=utf8_general_ci;
  
  
INSERT INTO Alumno (
    nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1,
    casado3, casado0, casado1, casado2, dni
) VALUES
-- Ejemplo 1: todo correcto y consistente
('Juan Perez', 25, 25, 24, 'M', '1998-05-10', 1.75, 1.75, 1, 1, 'VERDADERO', 'VERDADERO', '2003-05-15','12345678'),

-- Ejemplo 2: edad2 menor que 150, casado falso con boolean y enum
('Maria Lopez', 30, 30, 29, 'F', '1993-11-20', 1.60, 1.60, 0, 0, 'FALSO', 'FALSO', '2003-05-15', '87654321'),

-- Ejemplo 3: probar valores límite en estatura1 y edad2
('Carlos Ruiz', 45, 45, 149, 'M', '1978-01-15', 2.99, 3.00, 1, 1, 'VERDADERO', 'VERDADERO', '2003-05-15', '11223344'),

-- Ejemplo 4: casado con boolean 0, y varchar 'FALSO'
('Ana Gomez', 20, 20, 19, 'F', '2003-07-05', 1.55, 1.55, 0, 0, 'FALSO', 'FALSO', '2003-05-15', '44332211');
****************
***   0002   ***   POSTGRESQL
****************
-- Conectarse a la base de datos principal (solo en psql)
\c postgres

-- Eliminar y crear la base de datos ESCUELA
DROP DATABASE IF EXISTS escuela;
CREATE DATABASE escuela;

-- Conectarse a la base de datos ESCUELA
\c escuela

-- Crear tabla Alumno con múltiples variantes de los campos para pruebas
CREATE TABLE Alumno (
    id_alumno           SERIAL PRIMARY KEY,
    nombre              VARCHAR(100) NOT NULL,

    edad0               INTEGER,
    edad1               INTEGER NOT NULL CHECK (edad1 >= 0),
    edad2               INTEGER          CHECK (edad2 >= 0 AND edad2 < 150),

    sexo                VARCHAR(1) NOT NULL CHECK (sexo IN ('M', 'F')),

    fecha_nacimiento    DATE NOT NULL,

    estatura0           DECIMAL(4,2) NOT NULL,
    estatura1           DECIMAL(4,2) NOT NULL CHECK (estatura1 > 0 AND estatura1 <= 3.00),

    casado3             SMALLINT,  -- 1 casado 0 soltero
    casado0             BOOLEAN NOT NULL, -- true=casado false=soltero
    casado1             VARCHAR(10) NOT NULL CHECK (casado1 IN ('VERDADERO', 'FALSO')),
    casado2             VARCHAR(10) NOT NULL CHECK (casado2 IN ('VERDADERO', 'FALSO')),

    fecha_creacion0     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_creacion1     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion  TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 

    dni                 CHAR(8) NOT NULL UNIQUE
);

-- Crear función del trigger para actualizar la fecha de modificación
CREATE OR REPLACE FUNCTION actualizar_fecha_modificacion()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_modificacion := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear trigger asociado a la tabla Alumno
CREATE TRIGGER trg_actualizar_fecha_modificacion
BEFORE UPDATE ON Alumno
FOR EACH ROW
EXECUTE FUNCTION actualizar_fecha_modificacion();

-- Insertar registros de prueba
INSERT INTO Alumno (
    nombre, edad0, edad1, edad2, sexo, fecha_nacimiento,
    estatura0, estatura1,
    casado3, casado0, casado1, casado2,
    dni
)
VALUES
('Pedro Gómez', 20, 20, 20, 'M', '2005-01-10', 1.75, 1.75, 1, TRUE, 'VERDADERO', 'VERDADERO', '11112222'),
('Lucía Ruiz', 21, 21, 21, 'F', '2004-06-20', 1.68, 1.68, 0, FALSE, 'FALSO', 'FALSO', '33334444');

SELECT * FROM Alumno;