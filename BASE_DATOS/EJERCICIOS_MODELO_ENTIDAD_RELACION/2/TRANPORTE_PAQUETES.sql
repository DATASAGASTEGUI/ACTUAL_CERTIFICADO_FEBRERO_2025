-- DISEÑO

-- -----------------------------------------------------
-- Schema TRANSPORTE_PAQUETES
-- -----------------------------------------------------

DROP DATABASE IF EXISTS TRANSPORTE_PAQUETES;
CREATE DATABASE IF NOT EXISTS TRANSPORTE_PAQUETES DEFAULT CHARACTER SET utf8 ;
USE TRANSPORTE_PAQUETES ;

-- -----------------------------------------------------
-- Table TRANSPORTE_PAQUETES.Camionero
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Camionero (
  dni              CHAR(9) NOT NULL,
  nombre_camionero VARCHAR(100) NOT NULL,
  telefono         CHAR(9) NOT NULL,
  direccion        VARCHAR(100) NOT NULL,
  salario          DECIMAL(10,2) NOT NULL,
  poblacion        VARCHAR(30) NOT NULL,
                   PRIMARY KEY (dni)
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table TRANSPORTE_PAQUETES.Provincia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Provincia (
  id_provincia     INT NOT NULL AUTO_INCREMENT,
  nombre_provincia VARCHAR(45) NOT NULL,
                   PRIMARY KEY (id_provincia)
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table TRANSPORTE_PAQUETES.Paquete
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Paquete (
  id_paquete             INT NOT NULL AUTO_INCREMENT,
  descripcion            VARCHAR(100) NOT NULL,
  destinatario           VARCHAR(100) NULL,
  direccion_destinatario VARCHAR(100) NULL,
  dni                    CHAR(9) NOT NULL,
  id_provincia           INT NOT NULL,
                         PRIMARY KEY (id_paquete),

    FOREIGN KEY (dni)  REFERENCES Camionero (dni)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

    FOREIGN KEY (id_provincia) REFERENCES Provincia (id_provincia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Camion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Camion (
  matricula CHAR(8) NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  potencia INT NOT NULL,
  PRIMARY KEY (matricula)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Camion_has_Camionero
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Camion_has_Camionero (
  matricula CHAR(8) NOT NULL,
  dni       CHAR(9) NOT NULL,
  fecha     DATE NOT NULL,
            PRIMARY KEY (matricula, dni),

    FOREIGN KEY (matricula)
    REFERENCES TRANSPORTE_PAQUETES.Camion (matricula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

    FOREIGN KEY (dni)
    REFERENCES TRANSPORTE_PAQUETES.Camionero (dni)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;

-- DATA

-- Insertar Provincias
INSERT INTO Provincia (nombre_provincia) VALUES 
('Madrid'),
('Barcelona'),
('Valencia'),
('Sevilla'),
('Bilbao');

-- Insertar Camioneros
INSERT INTO Camionero (dni, nombre_camionero, telefono, direccion, salario, poblacion) VALUES
('12345678A', 'Juan Pérez', '600000001', 'Calle Mayor 1', 1800.00, 'Madrid'),
('23456789B', 'Luis Gómez', '600000002', 'Avenida Sur 12', 1900.00, 'Barcelona'),
('34567890C', 'Carlos Ruiz', '600000003', 'Plaza Norte 3', 1700.00, 'Valencia'),
('45678901D', 'Miguel Torres', '600000004', 'Calle Oeste 45', 2000.00, 'Sevilla'),
('56789012E', 'Pedro Sánchez', '600000005', 'Ronda Este 56', 1750.00, 'Bilbao'),
('67890123F', 'Andrés García', '600000006', 'Calle Real 7', 1850.00, 'Madrid'),
('78901234G', 'Jesús Martínez', '600000007', 'Calle Falsa 123', 1950.00, 'Barcelona'),
('89012345H', 'Sergio López', '600000008', 'Camino del Río', 1650.00, 'Valencia'),
('90123456I', 'Daniel Morales', '600000009', 'Travesía Norte 8', 2100.00, 'Sevilla'),
('01234567J', 'Alberto Navarro', '600000010', 'Callejón Azul 6', 1600.00, 'Bilbao');

-- Insertar Camiones
INSERT INTO Camion (matricula, modelo, tipo, potencia) VALUES
('1234ABC', 'Volvo FH', 'Trailer', 450),
('5678DEF', 'Mercedes Actros', 'Refrigerado', 430),
('9012GHI', 'Scania R', 'Cisterna', 480);

-- Relación Camion_has_Camionero
INSERT INTO Camion_has_Camionero (matricula, dni, fecha) VALUES
('1234ABC', '12345678A', '2024-01-10'),
('1234ABC', '23456789B', '2024-02-15'),
('5678DEF', '34567890C', '2024-03-12'),
('5678DEF', '45678901D', '2024-04-01'),
('9012GHI', '56789012E', '2024-04-10'),
('9012GHI', '67890123F', '2024-04-12');

-- Insertar Paquetes (40 registros, 4 por cada camionero)
INSERT INTO Paquete (descripcion, destinatario, direccion_destinatario, dni, id_provincia) VALUES
-- Juan Pérez
('Electrodomésticos', 'Marta López', 'Av. España 22', '12345678A', 1),
('Libros escolares', 'Antonio Ruiz', 'Calle de la Paz 11', '12345678A', 2),
('Ropa', 'Lucía Díaz', 'Calle Luna 45', '12345678A', 3),
('Juguetes', 'Pepe Sánchez', 'Av. Sol 7', '12345678A', 4),

-- Luis Gómez
('Medicamentos', 'Clara Gómez', 'Calle Norte 5', '23456789B', 2),
('Alimentos', 'Raúl Torres', 'Calle Sur 8', '23456789B', 3),
('Material de oficina', 'Sofía Pérez', 'Calle Comercio 19', '23456789B', 1),
('Herramientas', 'Álvaro Cano', 'Paseo del Mar 33', '23456789B', 5),

-- Carlos Ruiz
('Electrónica', 'Ana Torres', 'Plaza Central 3', '34567890C', 3),
('Muebles', 'Pablo Ramírez', 'Av. Colón 15', '34567890C', 1),
('Ropa deportiva', 'Irene Sanz', 'Calle Río 6', '34567890C', 4),
('Zapatos', 'Jorge Marín', 'Calle Verde 10', '34567890C', 2),

-- Miguel Torres
('Juguetes', 'Laura Romero', 'Calle Nieve 21', '45678901D', 2),
('Papelería', 'Tomás Sánchez', 'Av. Bosque 11', '45678901D', 1),
('Ferretería', 'Sonia López', 'Calle Metal 2', '45678901D', 4),
('Perfumería', 'Lidia Valle', 'Calle Aroma 16', '45678901D', 5),

-- Pedro Sánchez
('Electrodomésticos', 'Ramón Díaz', 'Av. Horizonte 7', '56789012E', 3),
('Bicicletas', 'Manuel Cortés', 'Calle Rueda 3', '56789012E', 1),
('Pinturas', 'Julia Campos', 'Av. Arte 19', '56789012E', 2),
('Plantas', 'Eva Reina', 'Calle Jardín 5', '56789012E', 5),

-- Andrés García
('Cámaras', 'Mario Suárez', 'Calle Click 8', '67890123F', 4),
('Ordenadores', 'Mónica Lara', 'Av. Software 22', '67890123F', 3),
('Electrodomésticos', 'Elena Vela', 'Calle Luz 10', '67890123F', 1),
('Juegos', 'Nacho Cobo', 'Calle Juego 7', '67890123F', 5),

-- Jesús Martínez
('Colchones', 'Andrea Luna', 'Av. Descanso 2', '78901234G', 2),
('Relojes', 'Alba Marín', 'Calle Tiempo 6', '78901234G', 3),
('Café', 'Cristina Alba', 'Calle Aroma 4', '78901234G', 1),
('Cosmética', 'Esther Bravo', 'Av. Belleza 8', '78901234G', 5),

-- Sergio López
('Vinos', 'Raquel Ortega', 'Calle Bodega 9', '89012345H', 4),
('Panadería', 'Luis Castaño', 'Av. Trigo 14', '89012345H', 1),
('Cerveza', 'Alberto Reina', 'Calle Malta 13', '89012345H', 2),
('Agua', 'Laura Sosa', 'Calle Fuente 20', '89012345H', 3),

-- Daniel Morales
('Papel higiénico', 'Diana Márquez', 'Av. Limpieza 11', '90123456I', 5),
('Detergente', 'Víctor Vega', 'Calle Espuma 17', '90123456I', 3),
('Perfume', 'Lucía Herrero', 'Av. Fragancia 5', '90123456I', 2),
('Toallas', 'Sara Rubio', 'Calle Tela 1', '90123456I', 1),

-- Alberto Navarro
('Ropa interior', 'Claudia Núñez', 'Calle Privada 6', '01234567J', 2),
('Sábanas', 'Marina León', 'Av. Sueño 3', '01234567J', 4),
('Cortinas', 'Ismael Palacios', 'Calle Sombra 9', '01234567J', 5),
('Vajilla', 'Gema Calderón', 'Av. Cocina 13', '01234567J', 1);

-- CONSULTAS

-- 1. CUANTOS PAQUETES POR PROVINCIA.

SELECT id_provincia, COUNT(*) AS numero_paquetes
FROM Paquete
GROUP BY id_provincia;

-- MOSTRAR TAMBIEN EL NOMBRE DE LA PROVINCIA

SELECT Paquete.id_provincia, nombre_provincia, COUNT(*) AS numero_paquetes
FROM Paquete
JOIN Provincia ON Paquete.id_provincia = Provincia.id_provincia
GROUP BY Paquete.id_provincia;

+--------------+------------------+-----------------+
| id_provincia | nombre_provincia | numero_paquetes |
+--------------+------------------+-----------------+
|            1 | Madrid           |              10 |
|            2 | Barcelona        |               9 |
|            3 | Valencia         |               8 |
|            4 | Sevilla          |               6 |
|            5 | Bilbao           |               7 |
+--------------+------------------+-----------------+
5 rows in set (0.00 sec)

-- 2. HACER UN LISTADO DE TODOS LOS CAMINOES CON SU FECHA QUE FUE CONDUCIDO

SELECT matricula, fecha
FROM Camion_has_Camionero
ORDER BY matricula;

+-----------+------------+
| matricula | fecha      |
+-----------+------------+
| 1234ABC   | 2024-01-10 |
| 1234ABC   | 2024-02-15 |
| 5678DEF   | 2024-03-12 |
| 5678DEF   | 2024-04-01 |
| 9012GHI   | 2024-04-10 |
| 9012GHI   | 2024-04-12 |
+-----------+------------+

SELECT *
FROM Camion_has_Camionero
ORDER BY matricula;

+-----------+-----------+------------+
| matricula | dni       | fecha      |
+-----------+-----------+------------+
| 1234ABC   | 12345678A | 2024-01-10 |
| 1234ABC   | 23456789B | 2024-02-15 |
| 5678DEF   | 34567890C | 2024-03-12 |
| 5678DEF   | 45678901D | 2024-04-01 |
| 9012GHI   | 56789012E | 2024-04-10 |
| 9012GHI   | 67890123F | 2024-04-12 |
+-----------+-----------+------------+


SELECT distinct chc.matricula, p.id_provincia, pr.nombre_provincia
FROM Paquete p
JOIN Camionero cr ON cr.dni = p.dni
JOIN Camion_has_Camionero chc ON cr.dni = chc.dni
JOIN Provincia pr ON p.id_provincia = pr.id_provincia
WHERE p.id_provincia = 1;

+-----------+--------------+------------------+
| matricula | id_provincia | nombre_provincia |
+-----------+--------------+------------------+
| 1234ABC   |            1 | Madrid           |
| 5678DEF   |            1 | Madrid           |
| 9012GHI   |            1 | Madrid           |
+-----------+--------------+------------------+

SELECT distinct chc.matricula, p.id_provincia, pr.nombre_provincia
FROM Paquete p
JOIN Camionero cr ON cr.dni = p.dni
JOIN Camion_has_Camionero chc ON cr.dni = chc.dni
JOIN Provincia pr ON p.id_provincia = pr.id_provincia
ORDER BY chc.matricula;

+-----------+--------------+------------------+
| matricula | id_provincia | nombre_provincia |
+-----------+--------------+------------------+
| 1234ABC   |            1 | Madrid           |
| 1234ABC   |            2 | Barcelona        |
| 1234ABC   |            3 | Valencia         |
| 1234ABC   |            4 | Sevilla          |
| 1234ABC   |            5 | Bilbao           |
| 5678DEF   |            1 | Madrid           |
| 5678DEF   |            2 | Barcelona        |
| 5678DEF   |            3 | Valencia         |
| 5678DEF   |            4 | Sevilla          |
| 5678DEF   |            5 | Bilbao           |
| 9012GHI   |            1 | Madrid           |
| 9012GHI   |            2 | Barcelona        |
| 9012GHI   |            3 | Valencia         |
| 9012GHI   |            4 | Sevilla          |
| 9012GHI   |            5 | Bilbao           |
+-----------+--------------+------------------+

-- MOSTRAR EL MES CON EL MAYOR NUMERO DE ENTREGAS DE PAQUETES

SELECT MONTH(fecha), COUNT(*)
FROM Camion_has_Camionero
GROUP BY MONTH(fecha);











