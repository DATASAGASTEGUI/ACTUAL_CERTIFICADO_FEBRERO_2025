****************
***   0001   ***
****************

-- ---------------------------
-- ESQUEMA DE LA BASE DE DATOS
-- ---------------------------

-- 1. ELIMINAR UNA BASE DE DATOS SI EXISTE

DROP DATABASE IF EXISTS TIENDA;

-- 2. CREAR UNA BASE DE DATOS SI NO EXISTE

CREATE DATABASE IF NOT EXISTS TIENDA;

-- 3. SELECCIONAR UNA BASE DE DATOS PARA USARLA

USE TIENDA;

-- 4. ELIMINAR UNA TABLA SI EXISTE

DROP TABLE IF EXISTS Persona;

-- 5. CREAR UNA TABLA SI NO EXISTE

CREATE TABLE IF NOT EXISTS Ventas (
    id       INT             AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(50),
    precio   DECIMAL(10, 2),
    fecha    DATE,
    ciudad   VARCHAR(50)
);

-- -----
-- DATOS
-- -----

-- 6. INSERTAR REGISTROS EN UNA TABLA

INSERT INTO Ventas (producto, precio, fecha, ciudad) VALUES
('Laptop', 1000.00, '2023-10-01', 'Madrid'),
('Teléfono', 500.00, '2023-10-02', 'Barcelona'),
('Laptop', 1000.00, '2023-10-02', 'Madrid'),
('Tablet', 300.00, '2023-10-03', 'Valencia'),
('Monitor', 250.00, '2023-10-03', 'Sevilla'),
('Teclado', 50.00, '2023-10-04', 'Bilbao'),
('Ratón', 30.00, '2023-10-04', 'Zaragoza'),
('Impresora', 200.00, '2023-10-05', 'Málaga'),
('Laptop', 1200.00, '2023-10-05', 'Madrid'),
('Teléfono', 600.00, '2023-10-06', 'Barcelona'),
('Auriculares', 80.00, '2023-10-06', 'Valencia'),
('Altavoz', 120.00, '2023-10-07', 'Sevilla'),
('Tablet', 350.00, '2023-10-07', 'Bilbao'),
('Monitor', 300.00, '2023-10-08', 'Zaragoza'),
('Laptop', 1100.00, '2023-10-08', 'Málaga'),
('Teclado', 60.00, '2023-10-09', 'Madrid'),
('Ratón', 35.00, '2023-10-09', 'Barcelona'),
('Impresora', 220.00, '2023-10-10', 'Valencia'),
('Teléfono', 550.00, '2023-10-10', 'Sevilla'),
('Auriculares', 90.00, '2023-10-11', 'Bilbao'),
('Altavoz', 130.00, '2023-10-11', 'Zaragoza'),
('Tablet', 320.00, '2023-10-12', 'Málaga'),
('Monitor', 270.00, '2023-10-12', 'Madrid'),
('Laptop', 1050.00, '2023-10-13', 'Barcelona'),
('Teclado', 55.00, '2023-10-13', 'Valencia'),
('Ratón', 25.00, '2023-10-14', 'Sevilla'),
('Impresora', 210.00, '2023-10-14', 'Bilbao'),
('Teléfono', 520.00, '2023-10-15', 'Zaragoza'),
('Auriculares', 85.00, '2023-10-15', 'Málaga'),
('Altavoz', 110.00, '2023-10-16', 'Madrid');

-- ---------
-- CONSULTAS
-- ---------

-- 7. VERIFICAR LA INSERSION DE REGISTROS EN UNA TABLA

SELECT * FROM Ventas;

+----+-------------+---------+------------+-----------+
| id | producto    | precio  | fecha      | ciudad    |
+----+-------------+---------+------------+-----------+
|  1 | Laptop      | 1000.00 | 2023-10-01 | Madrid    |
|  2 | Teléfono    |  500.00 | 2023-10-02 | Barcelona |
|  3 | Laptop      | 1000.00 | 2023-10-02 | Madrid    |
|  4 | Tablet      |  300.00 | 2023-10-03 | Valencia  |
|  5 | Monitor     |  250.00 | 2023-10-03 | Sevilla   |
|  6 | Teclado     |   50.00 | 2023-10-04 | Bilbao    |
|  7 | Ratón       |   30.00 | 2023-10-04 | Zaragoza  |
|  8 | Impresora   |  200.00 | 2023-10-05 | Málaga    |
|  9 | Laptop      | 1200.00 | 2023-10-05 | Madrid    |
| 10 | Teléfono    |  600.00 | 2023-10-06 | Barcelona |
| 11 | Auriculares |   80.00 | 2023-10-06 | Valencia  |
| 12 | Altavoz     |  120.00 | 2023-10-07 | Sevilla   |
| 13 | Tablet      |  350.00 | 2023-10-07 | Bilbao    |
| 14 | Monitor     |  300.00 | 2023-10-08 | Zaragoza  |
| 15 | Laptop      | 1100.00 | 2023-10-08 | Málaga    |
| 16 | Teclado     |   60.00 | 2023-10-09 | Madrid    |
| 17 | Ratón       |   35.00 | 2023-10-09 | Barcelona |
| 18 | Impresora   |  220.00 | 2023-10-10 | Valencia  |
| 19 | Teléfono    |  550.00 | 2023-10-10 | Sevilla   |
| 20 | Auriculares |   90.00 | 2023-10-11 | Bilbao    |
| 21 | Altavoz     |  130.00 | 2023-10-11 | Zaragoza  |
| 22 | Tablet      |  320.00 | 2023-10-12 | Málaga    |
| 23 | Monitor     |  270.00 | 2023-10-12 | Madrid    |
| 24 | Laptop      | 1050.00 | 2023-10-13 | Barcelona |
| 25 | Teclado     |   55.00 | 2023-10-13 | Valencia  |
| 26 | Ratón       |   25.00 | 2023-10-14 | Sevilla   |
| 27 | Impresora   |  210.00 | 2023-10-14 | Bilbao    |
| 28 | Teléfono    |  520.00 | 2023-10-15 | Zaragoza  |
| 29 | Auriculares |   85.00 | 2023-10-15 | Málaga    |
| 30 | Altavoz     |  110.00 | 2023-10-16 | Madrid    |
+----+-------------+---------+------------+-----------+

-- 8. OBTENER EL TOTAL DE VENTAS POR CIUDAD PARA PRODUCTOS CON PRECIO MAYOR A €800, ORDENADO POR TOTAL DESCENDENTE.
--    CONSULTA SQL (GROUP BY + HAVING)

SELECT 
    ciudad, 
    SUM(precio) AS totalVentas
FROM 
    Ventas
WHERE 
    precio > 800
GROUP BY 
    ciudad
ORDER BY 
    totalVentas DESC;
	
+-----------+-------------+
| ciudad    | totalVentas |
+-----------+-------------+
| Madrid    |     3200.00 |
| Málaga    |     1100.00 |
| Barcelona |     1050.00 |
+-----------+-------------+

****************
***   0002   ***
****************

// 1. Conectar a la base de datos (si no estás ya conectado)
use tienda;

// 2. Eliminar la colección existente (opcional - solo si quieres empezar desde cero)
db.ventas.drop();

// 3. Insertar 30 registros de libros que coincidan con la estructura Java
db.ventas.insertMany([
  { "producto": "Laptop", "precio": 1000, "fecha": "2023-10-01", "ciudad": "Madrid" },
  { "producto": "Teléfono", "precio": 500, "fecha": "2023-10-02", "ciudad": "Barcelona" },
  { "producto": "Laptop", "precio": 1000, "fecha": "2023-10-02", "ciudad": "Madrid" },
  { "producto": "Tablet", "precio": 300, "fecha": "2023-10-03", "ciudad": "Valencia" },
  { "producto": "Monitor", "precio": 250, "fecha": "2023-10-03", "ciudad": "Sevilla" },
  { "producto": "Teclado", "precio": 50, "fecha": "2023-10-04", "ciudad": "Bilbao" },
  { "producto": "Ratón", "precio": 30, "fecha": "2023-10-04", "ciudad": "Zaragoza" },
  { "producto": "Impresora", "precio": 200, "fecha": "2023-10-05", "ciudad": "Málaga" },
  { "producto": "Laptop", "precio": 1200, "fecha": "2023-10-05", "ciudad": "Madrid" },
  { "producto": "Teléfono", "precio": 600, "fecha": "2023-10-06", "ciudad": "Barcelona" },
  { "producto": "Auriculares", "precio": 80, "fecha": "2023-10-06", "ciudad": "Valencia" },
  { "producto": "Altavoz", "precio": 120, "fecha": "2023-10-07", "ciudad": "Sevilla" },
  { "producto": "Tablet", "precio": 350, "fecha": "2023-10-07", "ciudad": "Bilbao" },
  { "producto": "Monitor", "precio": 300, "fecha": "2023-10-08", "ciudad": "Zaragoza" },
  { "producto": "Laptop", "precio": 1100, "fecha": "2023-10-08", "ciudad": "Málaga" },
  { "producto": "Teclado", "precio": 60, "fecha": "2023-10-09", "ciudad": "Madrid" },
  { "producto": "Ratón", "precio": 35, "fecha": "2023-10-09", "ciudad": "Barcelona" },
  { "producto": "Impresora", "precio": 220, "fecha": "2023-10-10", "ciudad": "Valencia" },
  { "producto": "Teléfono", "precio": 550, "fecha": "2023-10-10", "ciudad": "Sevilla" },
  { "producto": "Auriculares", "precio": 90, "fecha": "2023-10-11", "ciudad": "Bilbao" },
  { "producto": "Altavoz", "precio": 130, "fecha": "2023-10-11", "ciudad": "Zaragoza" },
  { "producto": "Tablet", "precio": 320, "fecha": "2023-10-12", "ciudad": "Málaga" },
  { "producto": "Monitor", "precio": 270, "fecha": "2023-10-12", "ciudad": "Madrid" },
  { "producto": "Laptop", "precio": 1050, "fecha": "2023-10-13", "ciudad": "Barcelona" },
  { "producto": "Teclado", "precio": 55, "fecha": "2023-10-13", "ciudad": "Valencia" },
  { "producto": "Ratón", "precio": 25, "fecha": "2023-10-14", "ciudad": "Sevilla" },
  { "producto": "Impresora", "precio": 210, "fecha": "2023-10-14", "ciudad": "Bilbao" },
  { "producto": "Teléfono", "precio": 520, "fecha": "2023-10-15", "ciudad": "Zaragoza" },
  { "producto": "Auriculares", "precio": 85, "fecha": "2023-10-15", "ciudad": "Málaga" },
  { "producto": "Altavoz", "precio": 110, "fecha": "2023-10-16", "ciudad": "Madrid" }
]);

// 4. Verificar la inserción
print("Total de ventas insertados: " + db.ventas.countDocuments());

// 5. Mostrar algunos registros
print("\nPrimeros 5 ventas:");
db.ventas.find().limit(5).pretty();

****************
***   0003   ***
****************

- SERVIDOR MONGODB
https://www.mongodb.com/try/download/community

- HERRAMIENTA PARA BASE DE DATOS
https://www.mongodb.com/try/download/database-tools

- HERRAMIENTA SHELL DE LINEAS DE COMANDOS (CLIENTE CONSOLA)
https://www.mongodb.com/try/download/shell

Lugar donde hay que copiar los exe de las dos herramientas:
C:\Program Files\MongoDB\Server\8.0\bin

****************
***   0004   ***   AGREGACION(MONGODB=NOSQL) = AGRUPAMIENTO(SQL)
****************

// 6.1. Obtener el total de ventas por ciudad para productos con precio mayor a €800, ordenado por total descendente.

// NOSQL: Pipeline completo
db.ventas.aggregate([
  { $match: { precio: { $gt: 800 } } },           // Filtra (WHERE)
  { $group: {                                     // Agrupa (GROUP BY)
      _id: "$ciudad",                             // Campo a agrupar
      totalVentas: { $sum: "$precio" },           // Suma de precios
  }},
  { $sort: { totalVentas: -1 } }                  // Ordena (ORDER BY)
]);

// SQL

SELECT 
    ciudad, 
    SUM(precio) AS totalVentas
FROM 
    Ventas
WHERE 
    precio > 800
GROUP BY 
    ciudad
ORDER BY 
    totalVentas DESC;
	
// 6.2: NOSQL

db.ventas.aggregate([
  { $match: { precio: { $gt: 800 } } },           // Filtra (WHERE)
  { $group: {                                     // Agrupa (GROUP BY)
      _id: "$ciudad",                             // Campo a agrupar
      totalVentas: { $sum: "$precio" },           // Suma de precios
      cantidadVentas: { $sum: 1 }                 // Conteo de documentos
  }},
  { $sort: { totalVentas: -1 } }                  // Ordena (ORDER BY)
]);

// SALIDA

[
  { _id: 'Madrid', totalVentas: 3200, cantidadVentas: 3 },
  { _id: 'Málaga', totalVentas: 1100, cantidadVentas: 1 },
  { _id: 'Barcelona', totalVentas: 1050, cantidadVentas: 1 }
]

// SQL

SELECT 
    ciudad, SUM(precio) AS totalVentas, SUM(1) AS cantidadVentas 
FROM 
    Ventas
WHERE 
    precio > 800
GROUP BY 
    ciudad
ORDER BY 
    totalVentas DESC;
	
****************
***   0005   ***   ELIMINAR VARIOS DOCUMENTOS (SQL VS NOSQL)
****************

// (1)

Eliminar varios documentos que cumplan una condición (como DELETE FROM Persona WHERE precio > 30):

db.ventas.deleteMany({ precio: { $gt: 800 } });

DELETE FROM Ventas WHERE precio > 800

// (2)

Eliminar todos los documentos pero conservar la colección (como DELETE FROM Persona en SQL sin DROP):

db.ventas.deleteMany({});

DELETE FROM Ventas;

// (3)

//Eliminar varios campos de todos los documentos que cumplan un OR

db.ventas.updateMany(
  { 
    $or: [
      { ciudad: "Madrid" },
      { ciudad: "Barcelona" }
    ]
  },
  { $unset: { fecha: "", precio: "" } }
);

//Verificar que se hayan eliminado los campos
db.ventas.find();

// (4)

//Eliminar campo con combinación de operadores (AND, OR) y comparaciones complejas
//Borra fecha_registro de quienes (tengan edad entre 20 y 30 O apellido en lista)

db.persona.updateMany(
  {
    $or: [
      { edad: { $gte: 20, $lte: 30 } },
      { apellido: { $in: ["Gómez", "López", "Martínez"] } }
    ]
  },
  { $unset: { fecha_registro: "" } }
);