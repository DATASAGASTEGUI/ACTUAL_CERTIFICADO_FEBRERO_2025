-- -------------
-- BASE DE DATOS
-- -------------

DROP DATABASE IF EXISTS VENTA_AUTOMOVILES;
CREATE DATABASE IF NOT EXISTS VENTA_AUTOMOVILES DEFAULT CHARACTER SET utf8 ;
USE VENTA_AUTOMOVILES;

-- -----------------------------------------------------
-- Table Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cliente (
  id_cliente INT          NOT NULL AUTO_INCREMENT,
  nombre     VARCHAR(50)  NOT NULL,
  direccion  VARCHAR(100) NOT NULL,
  ciudad     VARCHAR(30)  NOT NULL,
  telefono   CHAR(9)      NOT NULL,
             PRIMARY KEY (id_cliente)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Coche
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Coche (
  id_coche     INT         NOT NULL AUTO_INCREMENT,
  matricula    CHAR(8)     NOT NULL,
  marca        VARCHAR(20) NOT NULL,
  modelo       VARCHAR(45) NOT NULL,
  color        VARCHAR(20) NOT NULL,
  precio_venta DOUBLE      NOT NULL,
  id_cliente   INT         NOT NULL,
               PRIMARY KEY (id_coche),
               FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
               ON DELETE NO ACTION
               ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Revision
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Revision (
  id_revision INT         NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(45) NOT NULL,
              PRIMARY KEY (id_revision)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Revision_has_Coche
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Revision_has_Coche (
  id_revision    INT  NOT NULL,
  id_coche       INT  NOT NULL,
  fecha_revision DATE NOT NULL,
                 PRIMARY KEY (id_revision, id_coche, fecha_revision),
 
                 FOREIGN KEY (id_revision) REFERENCES Revision (id_revision)
                 ON DELETE NO ACTION
                 ON UPDATE NO ACTION,
  
                 FOREIGN KEY (id_coche) REFERENCES Coche (id_coche)
                 ON DELETE NO ACTION
                 ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----
-- DATOS
-- -----

INSERT INTO Cliente (id_cliente, nombre, direccion, ciudad, telefono) VALUES
(1, 'Juan Pérez', 'Calle Mayor 1', 'Madrid', '600123456'),
(2, 'María Gómez', 'Avenida Libertad 45', 'Barcelona', '600234567'),
(3, 'Carlos López', 'Plaza España 12', 'Sevilla', '600345678'),
(4, 'Ana Martínez', 'Calle Gran Vía 78', 'Valencia', '600456789'),
(5, 'David Sánchez', 'Paseo de la Castellana 200', 'Madrid', '600567890'),
(6, 'Laura Rodríguez', 'Calle Sierpes 15', 'Sevilla', '600678901'),
(7, 'Javier Fernández', 'Avenida Diagonal 400', 'Barcelona', '600789012'),
(8, 'Sofía García', 'Calle Colón 32', 'Valencia', '600890123'),
(9, 'Daniel Ruiz', 'Calle Preciados 10', 'Madrid', '600901234'),
(10, 'Elena Hernández', 'Paseo de Gracia 50', 'Barcelona', '601012345'),
(11, 'Pablo Díaz', 'Calle Feria 22', 'Sevilla', '601123456'),
(12, 'Lucía Moreno', 'Calle Paz 8', 'Valencia', '601234567'),
(13, 'Alejandro Álvarez', 'Calle Serrano 120', 'Madrid', '601345678'),
(14, 'Carmen Romero', 'Avenida Meridiana 300', 'Barcelona', '601456789'),
(15, 'Raúl Torres', 'Calle Tetuán 5', 'Sevilla', '601567890'),
(16, 'Isabel Jiménez', 'Calle Jorge Juan 40', 'Valencia', '601678901'),
(17, 'Miguel Ortega', 'Calle Alcalá 250', 'Madrid', '601789012'),
(18, 'Teresa Navarro', 'Calle Mallorca 200', 'Barcelona', '601890123'),
(19, 'Francisco Morales', 'Calle Asunción 18', 'Sevilla', '601901234'),
(20, 'Patricia Delgado', 'Calle de la Paz 30', 'Valencia', '602012345');

INSERT INTO Coche (id_coche, matricula, marca, modelo, color, precio_venta, id_cliente) VALUES
(1, '1234ABC', 'Toyota', 'Corolla', 'Blanco', 22000, 1),
(2, '2345BCD', 'Honda', 'Civic', 'Rojo', 23500, 2),
(3, '3456CDE', 'Ford', 'Focus', 'Azul', 19500, 3),
(4, '4567DEF', 'Volkswagen', 'Golf', 'Negro', 24500, 4),
(5, '5678EFG', 'Renault', 'Clio', 'Gris', 16500, 5),
(6, '6789FGH', 'Toyota', 'Corolla', 'Plateado', 22500, 6),
(7, '7890GHI', 'Honda', 'Civic', 'Blanco', 23000, 7),
(8, '8901HIJ', 'Ford', 'Focus', 'Rojo', 19000, 8),
(9, '9012IJK', 'Volkswagen', 'Golf', 'Azul', 24000, 9),
(10, '0123JKL', 'Renault', 'Clio', 'Negro', 16000, 10),
(11, '1234KLM', 'Toyota', 'Corolla', 'Gris', 21800, 11),
(12, '2345LMN', 'Honda', 'Civic', 'Plateado', 23200, 12),
(13, '3456MNO', 'Ford', 'Focus', 'Blanco', 19200, 13),
(14, '4567NOP', 'Volkswagen', 'Golf', 'Rojo', 24200, 14),
(15, '5678OPQ', 'Renault', 'Clio', 'Azul', 16200, 15),
(16, '6789PQR', 'Toyota', 'Corolla', 'Negro', 22400, 16),
(17, '7890QRS', 'Honda', 'Civic', 'Gris', 23400, 17),
(18, '8901RST', 'Ford', 'Focus', 'Plateado', 19400, 18),
(19, '9012STU', 'Volkswagen', 'Golf', 'Blanco', 24400, 19),
(20, '0123TUV', 'Renault', 'Clio', 'Rojo', 16400, 20);

INSERT INTO Revision (id_revision, descripcion) VALUES
(1, 'Cambio de filtro'),
(2, 'Cambio de Aceite'),
(3, 'Cambio de Frenos u otros');

INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(1, 1, '2022-07-15'),
(2, 1, '2022-07-15'),
(2, 2, '2021-09-20'),
(3, 3, '2021-01-10'),
(1, 4, '2020-01-25'),
(2, 5, '2023-08-05'),
(3, 6, '2022-10-18'),
(1, 7, '2021-12-30'),
(2, 8, '2021-02-12'),
(3, 9, '2020-04-22'),
(1, 10, '2023-07-08'),
(2, 11, '2022-09-14'),
(3, 12, '2022-01-19'),
(1, 13, '2021-03-23'),
(2, 14, '2020-05-17'),
(3, 15, '2023-10-02'),
(1, 16, '2022-12-11'),
(2, 17, '2022-02-09'),
(3, 18, '2021-04-05'),
(1, 19, '2020-06-15'),
(2, 20, '2023-09-28');

-- Revisiones adicionales para el coche 1 (Toyota Corolla)
INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(2, 1, '2023-01-15'),  -- Cambio de aceite a los 6 meses
(1, 1, '2023-07-15'),  -- Cambio de filtro al año
(2, 1, '2024-01-15'),  -- Cambio de aceite siguiente
(3, 1, '2023-04-10');  -- Revisión de frenos

-- Revisiones adicionales para el coche 2 (Honda Civic)
INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(2, 2, '2022-03-20'),  -- Cambio de aceite a los 6 meses
(3, 2, '2022-09-20'),  -- Revisión de frenos al año
(1, 2, '2023-03-20'),  -- Cambio de filtro
(2, 2, '2023-09-20');  -- Cambio de aceite

-- Revisiones adicionales para el coche 3 (Ford Focus)
INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(2, 3, '2021-07-10'),  -- Cambio de aceite a los 6 meses
(1, 3, '2022-01-10'),  -- Cambio de filtro al año
(3, 3, '2022-07-10'),  -- Revisión de frenos
(2, 3, '2023-01-10');  -- Cambio de aceite

-- Revisiones mensuales para el coche 4 (Volkswagen Golf)
INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(2, 4, '2020-04-25'),  -- Cambio de aceite a los 3 meses
(1, 4, '2020-07-25'),  -- Cambio de filtro a los 6 meses
(2, 4, '2020-10-25'),  -- Cambio de aceite
(3, 4, '2021-01-25'),  -- Revisión de frenos
(2, 4, '2021-04-25');  -- Cambio de aceite

-- Revisiones con diferentes intervalos para coche 5 (Renault Clio)
INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(2, 5, '2023-11-05'),  -- Cambio de aceite a los 3 meses
(1, 5, '2024-02-05'),  -- Cambio de filtro a los 6 meses
(3, 5, '2024-05-05'),  -- Revisión de frenos
(2, 5, '2024-08-05');  -- Cambio de aceite

-- Revisiones semestrales para coche 6 (Toyota Corolla)
INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(2, 6, '2023-04-18'),  -- Cambio de aceite
(1, 6, '2023-10-18'),  -- Cambio de filtro
(2, 6, '2024-04-18'),  -- Cambio de aceite
(3, 6, '2024-10-18');  -- Revisión de frenos

-- Revisiones trimestrales para coche 7 (Honda Civic)
INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(2, 7, '2022-03-30'),  -- Cambio de aceite
(1, 7, '2022-06-30'),  -- Cambio de filtro
(2, 7, '2022-09-30'),  -- Cambio de aceite
(3, 7, '2022-12-30');  -- Revisión de frenos

-- Revisiones con diferentes tipos en el mismo mes para coche 8 (Ford Focus)
INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(1, 8, '2021-05-12'),  -- Cambio de filtro
(2, 8, '2021-05-15'),  -- Cambio de aceite
(3, 8, '2021-05-20');  -- Revisión de frenos

-- Revisiones anuales para coche 9 (Volkswagen Golf)
INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(2, 9, '2021-04-22'),  -- Cambio de aceite
(1, 9, '2022-04-22'),  -- Cambio de filtro
(3, 9, '2023-04-22');  -- Revisión de frenos

-- Revisiones con diferentes años para coche 10 (Renault Clio)
INSERT INTO Revision_has_Coche (id_revision, id_coche, fecha_revision) VALUES
(2, 10, '2023-10-08'),  -- Cambio de aceite
(1, 10, '2024-01-08'),  -- Cambio de filtro
(3, 10, '2024-04-08');  -- Revisión de frenos

-- ---------
-- CONSULTAS
-- ---------

-- (1) CUANTOS MODELOS TIENE LA MARCA TOYOTA

SELECT COUNT(DISTINCT modelo) AS Cantidad
FROM Coche
WHERE marca = 'Toyota';

+----------+
| Cantidad |
+----------+
|        1 |
+----------+

-- (2) MOSTRAR LA CANTIDAD DE CAMBIOS DE ACEITE, FILTRO Y FRENOS A UN COCHE DADO

SELECT rc.id_coche, rc.id_revision, rc.fecha_revision
FROM Coche c
JOIN Revision_has_Coche rc ON c.id_coche = rc.id_coche 
WHERE rc.id_coche = 6 AND (rc.id_revision = 1 OR rc.id_revision = 2 OR rc.id_revision = 3);

SELECT rc.id_revision, COUNT(*) AS CantidadRevisiones
FROM Coche c
JOIN Revision_has_Coche rc ON c.id_coche = rc.id_coche 
WHERE rc.id_coche = 6 AND (rc.id_revision = 1 OR rc.id_revision = 2 OR rc.id_revision = 3)
GROUP BY rc.id_revision;

+-------------+--------------------+
| id_revision | CantidadRevisiones |
+-------------+--------------------+
|           1 |                  1 |
|           2 |                  2 |
|           3 |                  2 |
+-------------+--------------------+

-- (3) CANTIDAD DE REVISIONES HECHAS EN UN MES DADO(ABRIL=4) POR CADA TIPO

SELECT id_revision, COUNT(*) AS Cantidad
FROM Revision_has_Coche
WHERE MONTH(fecha_revision) = 4
GROUP BY id_revision
ORDER BY id_revision;

+-------------+----------+
| id_revision | Cantidad |
+-------------+----------+
|           1 |        1 |
|           2 |        5 |
|           3 |        5 |
+-------------+----------+

-- (4) MOSTRAR EL TIPO DE REVISION CON MAS FRECUENCIAS

SELECT id_revision, COUNT(*) AS Cantidad
FROM Revision_has_Coche
GROUP BY id_revision
ORDER BY Cantidad DESC
LIMIT 1;

+-------------+----------+
| id_revision | Cantidad |
+-------------+----------+
|           2 |       26 |
+-------------+----------+

SELECT rc.id_revision, r.descripcion, COUNT(*) AS Cantidad
FROM Revision_has_Coche rc
JOIN Revision r ON rc.id_revision = r.id_revision
GROUP BY id_revision
ORDER BY Cantidad DESC
LIMIT 1;

+-------------+------------------+----------+
| id_revision | descripcion      | Cantidad |
+-------------+------------------+----------+
|           2 | Cambio de Aceite |       26 |
+-------------+------------------+----------+

-- (5) QUE MARCAS HAN HECHO LAS 3 REVISIONES EN UNA MISMA FECHA

INVESTIGAR CON FUNCTION O PROCEDURE

SELECT c.marca, rc.id_revision
FROM coche c
JOIN Revision_has_Coche rc ON rc.id_coche = c.id_coche
JOIN Revision r ON r.id_revision = rc.id_revision
GROUP BY c.marca; 


