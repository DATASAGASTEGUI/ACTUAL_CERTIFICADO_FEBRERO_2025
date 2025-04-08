****************
***   0001   ***
****************
Una relación uno a muchos en una base de datos MySQL, incluyendo:

Creación de tablas

Inserción de datos

Dos consultas JOIN

🔸 Contexto del ejemplo:
Tenemos dos tablas:

Clientes: almacena información de los clientes.

Pedidos: almacena los pedidos que hace cada cliente. Un cliente puede tener muchos pedidos.

-------------------
1. Crear las tablas
-------------------

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre     VARCHAR(100),
    email      VARCHAR(100)
);

CREATE TABLE Pedidos (
    id_pedido  INT PRIMARY KEY,
    fecha      DATE,
    total      DECIMAL(10,2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-----------------
2. Insertar datos
-----------------

-- Insertar clientes
INSERT INTO Clientes (id_cliente, nombre, email) VALUES
(1, 'Ana Gómez', 'ana@gmail.com'),
(2, 'Luis Torres', 'luis@gmail.com'),
(3, 'María López', 'maria@gmail.com');

-- Insertar pedidos
INSERT INTO Pedidos (id_pedido, fecha, total, id_cliente) VALUES
(101, '2025-04-01', 250.00, 1),
(102, '2025-04-02', 150.00, 1),
(103, '2025-04-03', 300.00, 2),
(104, '2025-04-04', 450.00, 3),
(105, '2025-04-05', 120.00, 3),
(106, '2025-04-06', 90.00, 3);

-----------------
3. Consultas JOIN
-----------------

Consulta 1: Ver todos los pedidos con el nombre del cliente (INNER JOIN)

SELECT p.id_pedido, p.fecha, p.total, c.nombre AS cliente
FROM Pedidos p
INNER JOIN Clientes c ON p.id_cliente = c.id_cliente;

Resultado esperado:

id_pedido | fecha      | total  | cliente    
----------|------------|--------|------------
101       | 2025-04-01 | 250.00 | Ana Gómez  
102       | 2025-04-02 | 150.00 | Ana Gómez  
103       | 2025-04-03 | 300.00 | Luis Torres
104       | 2025-04-04 | 450.00 | María López
105       | 2025-04-05 | 120.00 | María López
106       | 2025-04-06 |  90.00 | María López

Consulta 2: Ver todos los clientes con la cantidad total que han gastado (JOIN + GROUP BY)

SELECT c.nombre, SUM(p.total) AS total_gastado
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nombre;

Resultado esperado:

nombre       | total_gastado
-------------|---------------
Ana Gómez    | 400.00
Luis Torres  | 300.00
María López  | 660.00


1. Obtener todos los pedidos de un cliente (por ejemplo, con id_cliente = 1):

SELECT p.*
FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.id_cliente
WHERE c.id_cliente = 1;

Si prefieres hacerlo por nombre del cliente:


SELECT p.*
FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.id_cliente
WHERE c.nombre = 'Nombre del Cliente';
2. Obtener el cliente de un pedido (por ejemplo, con id_pedido = 10):

SELECT c.*
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = 10;