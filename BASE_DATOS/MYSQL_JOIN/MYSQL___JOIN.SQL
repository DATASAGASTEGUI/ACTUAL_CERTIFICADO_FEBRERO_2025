****************
***   0001   ***   ESQUEMA DE LA BASE DE DATOS 
****************
-- ---------------------------------
-- 1. ESTRUCTURA DE LA BASE DE DATOS
-- ---------------------------------

-- Crear la base de datos
DROP DATABASE IF EXISTS PRACTICA_JOINS;
CREATE DATABASE IF NOT EXISTS PRACTICA_JOINS;
USE PRACTICA_JOINS;

-- Tabla de clientes
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    fecha_registro DATE
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_pedido DATE,
    total DECIMAL(10, 2),
    estado VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Tabla de productos
CREATE TABLE productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2),
    stock INT
);

-- Tabla de detalles de pedidos (que relaciona pedidos con productos)
CREATE TABLE detalles_pedido (
    detalle_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Tabla de categorías (para algunos productos sin relación)
CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Tabla para relación muchos a muchos entre productos y categorías
CREATE TABLE producto_categoria (
    producto_id INT,
    categoria_id INT,
    PRIMARY KEY (producto_id, categoria_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

-- --------
-- 2. DATOS
-- --------

-- Insertar clientes
INSERT INTO clientes (nombre, apellido, email, fecha_registro) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', '2023-01-15'),
('María', 'Gómez', 'maria.gomez@email.com', '2023-02-20'),
('Carlos', 'López', 'carlos.lopez@email.com', '2023-03-10'),
('Ana', 'Martínez', NULL, '2023-04-05'),
('Pedro', 'Sánchez', 'pedro.sanchez@email.com', '2023-05-12'),
('Luisa', 'Fernández', NULL, '2023-06-18');

-- Insertar productos
INSERT INTO productos (nombre, precio, stock) VALUES
('Laptop', 1200.00, 15),
('Teléfono', 800.00, 30),
('Tablet', 450.00, 20),
('Auriculares', 150.00, 50),
('Teclado', 75.00, 40),
('Monitor', 300.00, 25),
('Impresora', 200.00, 10),
('Mouse', 50.00, 60),
('Altavoz', 120.00, 35),
('Cámara', 500.00, 8);

-- Insertar pedidos (algunos clientes no tienen pedidos)
INSERT INTO pedidos (cliente_id, fecha_pedido, total, estado) VALUES
(1, '2023-01-20', 1250.00, 'Entregado'),
(1, '2023-03-05', 800.00, 'Entregado'),
(2, '2023-02-25', 450.00, 'Entregado'),
(2, '2023-04-10', 300.00, 'En proceso'),
(3, '2023-03-15', 950.00, 'Entregado'),
(5, '2023-05-20', 120.00, 'Cancelado'),
(NULL, '2023-06-01', 500.00, 'En proceso'); -- Pedido sin cliente asignado

-- Insertar detalles de pedido
INSERT INTO detalles_pedido (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 1200.00),
(1, 8, 1, 50.00),
(2, 2, 1, 800.00),
(3, 3, 1, 450.00),
(4, 6, 1, 300.00),
(5, 1, 1, 1200.00),
(5, 4, 1, 150.00),
(5, 8, 1, 50.00),
(6, 9, 1, 120.00),
(7, 10, 1, 500.00);

-- Insertar categorías
INSERT INTO categorias (nombre, descripcion) VALUES
('Electrónica', 'Productos electrónicos en general'),
('Computación', 'Productos relacionados con computadoras'),
('Dispositivos móviles', 'Teléfonos y tablets'),
('Accesorios', 'Accesorios para dispositivos electrónicos'),
('Fotografía', 'Productos relacionados con fotografía');

-- Insertar relaciones producto-categoría (algunos productos no tienen categoría)
INSERT INTO producto_categoria (producto_id, categoria_id) VALUES
(1, 1), (1, 2),
(2, 1), (2, 3),
(3, 1), (3, 3),
(4, 1), (4, 4),
(5, 2), (5, 4),
(6, 2),
(7, 2),
(8, 4),
(9, 1), (9, 4);
-- Los productos 7 y 10 no tienen categorías asignadas

****************
***   0002   ***   INNER JOIN (INTERSECCION) - PADRES CON HIJOS
****************
-- Mostrar los pedidos de los clientes (Mostrar los Clientes con sus pedidos)

SELECT c.cliente_id, c.nombre, p.pedido_id, p.fecha_pedido
FROM Clientes c
INNER JOIN Pedidos p ON c.cliente_id = p.cliente_id;

+------------+--------+-----------+--------------+
| cliente_id | nombre | pedido_id | fecha_pedido |
+------------+--------+-----------+--------------+
|          1 | Juan   |         1 | 2023-01-20   |
|          1 | Juan   |         2 | 2023-03-05   |
|          2 | María  |         3 | 2023-02-25   |
|          2 | María  |         4 | 2023-04-10   |
|          3 | Carlos |         5 | 2023-03-15   |
|          5 | Pedro  |         6 | 2023-05-20   |
+------------+--------+-----------+--------------+
****************
***   0003   ***   LEFT JOIN (DIFERENCIA A - B) - PADRES SIN HIJOS
****************
-- Mostrar los clientes que no tienen pedidos

SELECT c.cliente_id, c.nombre, p.pedido_id, p.fecha_pedido
FROM Clientes c
LEFT JOIN Pedidos p ON c.cliente_id = p.cliente_id
WHERE p.pedido_id IS NULL;

+------------+--------+-----------+--------------+
| cliente_id | nombre | pedido_id | fecha_pedido |
+------------+--------+-----------+--------------+
|          4 | Ana    |      NULL | NULL         |
|          6 | Luisa  |      NULL | NULL         |
+------------+--------+-----------+--------------+

****************
***   0004   ***   RIGHT JOIN (DIFERENCIA B - 1) - HIJOS SIN PADRE
****************
-- Mostrar los pedidos sin cliente

SELECT c.cliente_id, c.nombre, p.pedido_id, p.fecha_pedido
FROM Clientes c
RIGHT JOIN Pedidos p ON c.cliente_id = p.cliente_id
WHERE c.cliente_id IS NULL;

+------------+--------+-----------+--------------+
| cliente_id | nombre | pedido_id | fecha_pedido |
+------------+--------+-----------+--------------+
|       NULL | NULL   |         7 | 2023-06-01   |
+------------+--------+-----------+--------------+

****************
***   0005   ***   CROSS JOIN (PRODUCTO CARTESIANO)
****************
-- Mostra r todas las combinaciones de los productos con todas las categorias
SELECT p.nombre AS producto, c.nombre as categoria, c.descripcion
FROM productos p
CROSS JOIN categorias c;

****************
***   0006   ***   AGRUPACIONES
****************
-- ANALIZAR CON MAS DETALLE
-- Mostrar cantidad de pedidos por cada cliente

-- PADRES CON HIJOS
SELECT c.cliente_id, c.nombre, COUNT(p.pedido_id)
FROM Clientes c
INNER JOIN Pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id
UNION
-- PADRES SIN HIJOS
SELECT c.cliente_id, c.nombre, COUNT(p.pedido_id)
FROM Clientes c
LEFT JOIN Pedidos p ON c.cliente_id = p.cliente_id
WHERE p.pedido_id IS NULL;

-- SOLUCION SIMPLIFICADA SIN UNION

SELECT c.cliente_id, c.nombre, COUNT(p.pedido_id) as num_pedidos
FROM Clientes c
LEFT JOIN Pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id, c.nombre;


-- EL PRODUCTO MAS VENDIDO EN CANTIDAD DE UNIDADES

SELECT producto_id, COUNT(*) AS cantidad_unidades
FROM detalles_pedido
GROUP BY producto_id
ORDER BY cantidad_unidades DESC
LIMIT 1; 

-- SUBCONSULTA QUE NOS ARROJA LA CANTIDAD MAS VENDIDA (2)
SELECT COUNT(*) AS cantidad_unidades
FROM detalles_pedido
GROUP BY producto_id
ORDER BY cantidad_unidades DESC
LIMIT 1; 

-- SOLUCION A MEDIAS
SELECT producto_id, COUNT(*) AS cantidad_unidades
FROM detalles_pedido
GROUP BY producto_id
HAVING cantidad_unidades = (SELECT COUNT(*) AS cantidad_unidades
FROM detalles_pedido
GROUP BY producto_id
ORDER BY cantidad_unidades DESC
LIMIT 1);

-- SOLUCION COMPLETA

SELECT dp.producto_id, p.nombre, COUNT(*) AS cantidad_unidades
FROM detalles_pedido dp
JOIN productos p ON dp.producto_id = p.producto_id
GROUP BY producto_id
HAVING cantidad_unidades = (SELECT COUNT(*) AS cantidad_unidades
FROM detalles_pedido
GROUP BY producto_id
ORDER BY cantidad_unidades DESC
LIMIT 1);

+-------------+--------+-------------------+
| producto_id | nombre | cantidad_unidades |
+-------------+--------+-------------------+
|           1 | Laptop |                 2 |
|           8 | Mouse  |                 2 |
+-------------+--------+-------------------+

-- EL PRODUCTO MAS VENDIDO EN DINERO APORTADO

SELECT dp.producto_id, p.nombre, SUM(dp.cantidad * dp.precio_unitario) AS total_dinero
FROM detalles_pedido dp
JOIN productos p ON dp.producto_id = p.producto_id
GROUP BY producto_id
HAVING total_dinero = (SELECT SUM(dp.cantidad * dp.precio_unitario) AS total_dinero
FROM detalles_pedido dp
GROUP BY producto_id
ORDER BY total_dinero DESC
LIMIT 1);


-- MONTO
SELECT SUM(dp.cantidad * dp.precio_unitario) AS total_dinero
FROM detalles_pedido dp
GROUP BY producto_id
ORDER BY total_dinero DESC
LIMIT 1;

-- MOSTRAR LOS PRODUCTOS CUYAS VENTAS SUPEREN LOS 500 EUROS
SELECT dp.producto_id, p.nombre, SUM(dp.cantidad * dp.precio_unitario) AS total_dinero
FROM detalles_pedido dp
JOIN productos p ON dp.producto_id = p.producto_id
GROUP BY producto_id
HAVING total_dinero > 500;

 




















