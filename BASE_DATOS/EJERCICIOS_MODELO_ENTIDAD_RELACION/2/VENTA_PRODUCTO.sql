-- DISEÑO

-- -----------------------------------------------------
-- Schema VENTA_PRODUCTO
-- -----------------------------------------------------
DROP DATABASE IF EXISTS VENTA_PRODUCTO;
CREATE DATABASE IF NOT EXISTS VENTA_PRODUCTO DEFAULT CHARACTER SET utf8 ;
USE VENTA_PRODUCTO ;

-- -----------------------------------------------------
-- Table VENTA_PRODUCTO.Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombres VARCHAR(45) NOT NULL,
  apellidos VARCHAR(60) NOT NULL,
  dni CHAR(9) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  PRIMARY KEY (id_cliente),
  UNIQUE INDEX dni_UNIQUE (dni ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table VENTA_PRODUCTO.Proveedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Proveedor (
  id_proveedor INT NOT NULL AUTO_INCREMENT,
  nif CHAR(8) NOT NULL,
  nombre_proveedor VARCHAR(100) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_proveedor),
  UNIQUE INDEX nif_UNIQUE (nif ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table VENTA_PRODUCTO.Producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  nombre_producto VARCHAR(45) NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  id_proveedor INT NOT NULL,
  PRIMARY KEY (id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor (id_proveedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table VENTA_PRODUCTO.Cliente_has_Producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cliente_has_Producto (
  id_cliente  INT NOT NULL,
  id_producto INT NOT NULL,
              PRIMARY KEY (id_cliente, id_producto),
  
    FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

    FOREIGN KEY (id_producto) REFERENCES Producto (id_producto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;

-- DATA

-- Proveedores (5 proveedores)
INSERT INTO Proveedor (nif, nombre_proveedor, direccion) VALUES
('A1234567', 'Distribuciones Luna', 'Calle Sol 123, Madrid'),
('B2345678', 'TechGlobal S.A.', 'Av. América 45, Barcelona'),
('C3456789', 'AgroAlimentos SL', 'Camino Verde 10, Valencia'),
('D4567890', 'Papelería Central', 'Plaza Mayor 3, Sevilla'),
('E5678901', 'Mundo Electro', 'Calle Real 89, Bilbao');

-- Productos (10 productos, cada uno asignado a un proveedor)
INSERT INTO Producto (nombre_producto, precio_unitario, id_proveedor) VALUES
('Laptop Pro', 1200.50, 1),          -- Proveedor TechGlobal
('Impresora Multifunción', 199.99, 2), -- Proveedor TechGlobal
('Arroz Integral 1kg', 1.75, 3),      -- Proveedor AgroAlimentos
('USB 64GB', 9.99, 2),                -- Proveedor TechGlobal
('Televisor 50"', 499.90, 5),         -- Proveedor Mundo Electro
('Café Molido 500g', 2.80, 3),        -- Proveedor AgroAlimentos
('Cuaderno A4', 1.20, 4),             -- Proveedor Papelería Central
('Monitor 27"', 229.95, 5),           -- Proveedor Mundo Electro
('Teclado Mecánico', 79.95, 5),       -- Proveedor Mundo Electro
('Auriculares Bluetooth', 49.99, 5);  -- Proveedor Mundo Electro

-- Clientes (50 clientes)
INSERT INTO Cliente (nombres, apellidos, dni, direccion, fecha_nacimiento) VALUES
('Juan', 'García Pérez', '12345678A', 'Calle del Sol 12, Madrid', '1985-06-15'),
('María', 'López Martínez', '23456789B', 'Avenida de la Libertad 45, Barcelona', '1990-03-22'),
('Carlos', 'Rodríguez Sánchez', '34567890C', 'Plaza Mayor 3, Valencia', '1978-11-30'),
('Ana', 'Fernández García', '45678901D', 'Calle Luna 7, Sevilla', '1992-07-10'),
('Pedro', 'Martín Jiménez', '56789012E', 'Gran Vía 22, Bilbao', '1982-09-18');

-- Relaciones Cliente-Producto (actualizadas para los productos correctos)
INSERT INTO Cliente_has_Producto (id_cliente, id_producto) VALUES
(1, 1),
(1, 2),
(2, 8),
(2, 9),
(2, 10),
(3,4),
(3,5),
(4,1),
(4,10),
(5,1),
(5,2),
(5,3),
(5,4);

-- CONSULTAS

-- 1. LISTAR LOS PRODUCTOS DEL PROVEEDOR NUMERO 4

SELECT id_producto, nombre_producto
FROM Producto
WHERE id_proveedor = 4;

+-------------+-----------------+
| id_producto | nombre_producto |
+-------------+-----------------+
|           7 | Cuaderno A4     |
+-------------+-----------------+

-- 2. MOSTRAR CUANTOS PRODUCTOS PROVEE CADA PROVEEDOR (AGRUPAMIENTO)

SELECT id_proveedor, COUNT(*)
FROM Producto
GROUP BY id_proveedor;

+--------------+----------+
| id_proveedor | COUNT(*) |
+--------------+----------+
|            1 |        1 |
|            2 |        2 |
|            3 |        2 |
|            4 |        1 |
|            5 |        4 |
+--------------+----------+

-- 3. MOSTRAR CUANTOS PRODUCTOS EXISTEN

SELECT COUNT(*) FROM Producto;

+----------+
| COUNT(*) |
+----------+
|       10 |
+----------+

SELECT COUNT(*) AS CANTIDAD FROM Producto;

+----------+
| CANTIDAD |
+----------+
|       10 |
+----------+

-- 3. MOSTRAR LA CANTIDAD DE PRODUCTOS COMPRADOS POR CADA CLIENTE

SELECT id_cliente, COUNT(*) AS Cantidad
FROM Cliente_has_Producto
GROUP BY id_cliente;

+------------+----------+
| id_cliente | COUNT(*) |
+------------+----------+
|          1 |        2 |
|          2 |        3 |
|          3 |        2 |
|          4 |        2 |
|          5 |        4 |
+------------+----------+

+------------+----------+
| id_cliente | Cantidad |
+------------+----------+
|          1 |        2 |
|          2 |        3 |
|          3 |        2 |
|          4 |        2 |
|          5 |        4 |
+------------+----------+

-- 4. CANTIDAD DE CLIENTES QUE COMPRO CADA PRODUCTO

SELECT id_producto, COUNT(*) AS Cantidad
FROM Cliente_has_Producto
GROUP BY id_producto;

+-------------+----------+
| id_producto | Cantidad |
+-------------+----------+
|           1 |        3 |
|           2 |        2 |
|           3 |        1 |
|           4 |        2 |
|           5 |        1 |
|           8 |        1 |
|           9 |        1 |
|          10 |        2 |
+-------------+----------+

SELECT id_producto, COUNT(id_producto) AS Cantidad
FROM Cliente_has_Producto
GROUP BY id_producto;

-- 5. MOSTRAR EL PRODUCTO CON EL MAYOR PRECIO UNITARIO

SELECT MAX(precio_unitario) 
FROM Producto;

+----------------------+
| MAX(precio_unitario) |
+----------------------+
|              1200.50 |
+----------------------+

-- 5. MOSTRAR EL PRODUCTO MAS VENDIDO

-- FORMA 1

SELECT id_producto, COUNT(*) AS Cantidad
FROM Cliente_has_Producto
GROUP BY id_producto
ORDER BY cantidad DESC
LIMIT 1;

+-------------+----------+
| id_producto | Cantidad |
+-------------+----------+
|           1 |        3 |
+-------------+----------+

-- FORMA 2 (SUB-TABLA)

SELECT MAX(TAUXILIAR.Cantidad)
FROM (SELECT id_producto, COUNT(*) AS Cantidad
FROM Cliente_has_Producto
GROUP BY id_producto) AS TAUXILIAR;

+-------------------------+
| MAX(TAUXILIAR.Cantidad) |
+-------------------------+
|                       3 |
+-------------------------+






