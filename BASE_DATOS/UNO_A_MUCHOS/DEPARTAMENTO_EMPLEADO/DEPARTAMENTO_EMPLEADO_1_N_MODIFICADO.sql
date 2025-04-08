-- DISEÑO

DROP DATABASE IF EXISTS DEPARTAMENTO_EMPLEADO_1_N;

CREATE DATABASE IF NOT EXISTS DEPARTAMENTO_EMPLEADO_1_N DEFAULT CHARACTER SET utf8 ;
USE DEPARTAMENTO_EMPLEADO_1_N;
-- -----------------------------------------------------
-- Table Departamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS DEPARTAMENTO_EMPLEADO_1_N.Departamento (
  id_departamento     INT NOT NULL AUTO_INCREMENT,
  nombre_departamento VARCHAR(45) NOT NULL,
                      PRIMARY KEY (id_departamento)
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Empleado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Empleado (
  id_empleado     INT NOT NULL AUTO_INCREMENT,
  nombre_empleado VARCHAR(45) NOT NULL,
  id_departamento INT NOT NULL,
                  PRIMARY KEY (id_empleado),
  FOREIGN KEY (id_departamento)  REFERENCES DEPARTAMENTO_EMPLEADO_1_N.Departamento (id_departamento)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
)ENGINE = InnoDB;

-- DATA

INSERT INTO Departamento (id_departamento, nombre_departamento) VALUES
(1, 'Informática'),
(2, 'Venta'),
(3, 'Publicidad');

INSERT INTO Empleado (id_empleado, nombre_empleado, id_departamento) VALUES
(1, 'Luis', 1),
(2, 'Miguel', 1),
(3, 'Carmen', 2),
(4, 'María', 3);

-- CONSULTAS

-- 1. MOSTRAR UN LISTADO DE TODAS LAS BASES DE DATOS
-- SHOW DATABASES;

-- 2. MOSTRAR UN LISTADO DE TODAS LAS TABLAS DE UNA BASE DE DATOS SELECCIONADA
-- SHOW TABLES;

-- 3. MOSTRAR LISTADO DEPARTAMENTOS.
-- SELECT nombre_departamento FROM Departamento;

-- +---------------------+
-- | nombre_departamento |
-- +---------------------+
-- | Informática         |
-- | Venta               |
-- | Publicidad          |
-- +---------------------+

-- 4. MOSTRAR EL DEPARMENTO DONDE TRABAJA EL EMPLEADO 2
-- SELECT id_departamento FROM Empleado WHERE id_empleado = 2;


SELECT 
    d.nombre_departamento
FROM 
    Departamento d
JOIN 
    Empleado e ON d.id_departamento = e.id_departamento
WHERE 
    e.id_empleado = 2;





















