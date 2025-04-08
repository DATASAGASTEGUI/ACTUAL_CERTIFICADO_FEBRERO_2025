SELECT idPedido, idFabrica, idProducto, descripción, cantidad, precio, calcular(cantidad,precio) AS ImporteCalculo, importe 
FROM Producto pr
JOIN Pedido pe ON pr.idFabrica = pe.idFabrica AND pr.idProducto = pe.idProducto





--------------
CREATE TABLE Empleado (
    id_empleado INTEGER PRIMARY KEY,
    nombre TEXT,
    id_departamento INTEGER
);


CREATE TABLE Departamento (
    id_departamento INTEGER PRIMARY KEY,
    nombre_departamento TEXT
);

INSERT INTO Departamento (id_departamento, nombre_departamento) VALUES
(1, 'Recursos Humanos'),
(2, 'Tecnología'),
(3, 'Finanzas');

INSERT INTO Empleado (id_empleado, nombre, id_departamento) VALUES
(1, 'Ana', 2),
(2, 'Luis', 1),
(3, 'Carlos', 2),
(4, 'Marta', 3);

SELECT Empleado.nombre, Departamento.nombre_departamento
FROM Empleado
INNER JOIN Departamento
ON Empleado.id_departamento = Departamento.id_departamento;

---------------------------------------------------------------------------------------------------------
| Tipo declarado | Afinidad de tipo | Descripción                                                |
| -------------- | ---------------- | ---------------------------------------------------------- |
| `INTEGER`      | INTEGER          | Números enteros (cualquier tamaño)                         |
| `REAL`         | REAL             | Números con punto flotante (decimales)                     |
| `TEXT`         | TEXT             | Cadenas de texto                                           |
| `BLOB`         | BLOB             | Datos binarios (imágenes, archivos, etc.)                  |
| `NUMERIC`      | NUMERIC          | Números que pueden ser enteros o flotantes, también fechas |

Nota: puedes declarar tipos como VARCHAR(100), CHAR, BOOLEAN, etc., pero SQLite los mapea internamente a una de las afinidades anteriores.

SELECT id_departamento, COUNT(*) AS total_empleados
FROM Empleado
GROUP BY id_departamento;

FUNCIONES DE AGREGACION
--------------------------------------------------------------------------------------------------------
| Función   | Descripción                              | Ejemplo                     |
| --------- | ---------------------------------------- | --------------------------- |
| `COUNT()` | Cuenta el número de filas                | `COUNT(*)`, `COUNT(nombre)` |
| `SUM()`   | Suma los valores de una columna numérica | `SUM(salario)`              |
| `AVG()`   | Calcula el promedio                      | `AVG(edad)`                 |
| `MIN()`   | Valor mínimo                             | `MIN(precio)`               |
| `MAX()`   | Valor máximo                             | `MAX(precio)`               |

-----------------------

FUNCIONES DE TEXTO

| Función                        | Descripción                        | Ejemplo                |
| ------------------------------ | ---------------------------------- | ---------------------- |
| `UPPER(texto)`                 | Convierte a mayúsculas             | `UPPER(nombre)`        |
| `LOWER(texto)`                 | Convierte a minúsculas             | `LOWER(nombre)`        |
| `LENGTH(texto)`                | Longitud del texto                 | `LENGTH(nombre)`       |
| `SUBSTR(texto, inicio, largo)` | Extrae subcadena                   | `SUBSTR(nombre, 1, 3)` |
| `TRIM(texto)`                  | Elimina espacios al inicio y final | `TRIM(nombre)`         |

---------------

FUNCIONES MATEMATICAS

| Función                  | Descripción                       | Ejemplo                      |
| ------------------------ | --------------------------------- | ---------------------------- |
| `ABS(x)`                 | Valor absoluto                    | `ABS(-5)` → 5                |
| `ROUND(x, n)`            | Redondea a `n` decimales          | `ROUND(3.1416, 2)` → 3.14    |
| `CEIL(x)` o `CEILING(x)` | Redondea hacia arriba             | No disponible directamente\* |
| `FLOOR(x)`               | Redondea hacia abajo              | No disponible directamente\* |
| `RANDOM()`               | Genera un número aleatorio entero | `RANDOM()`                   |

------------

FUNCIONES DE FECHA Y HORA

| Función                 | Descripción                    | Ejemplo                          |
| ----------------------- | ------------------------------ | -------------------------------- |
| `DATE('now')`           | Fecha actual (AAAA-MM-DD)      | `DATE('now')`                    |
| `TIME('now')`           | Hora actual (HH\:MM\:SS)       | `TIME('now')`                    |
| `DATETIME('now')`       | Fecha y hora actual            | `DATETIME('now')`                |
| `strftime('%Y', fecha)` | Extrae el año de una fecha     | `strftime('%Y', fecha_contrato)` |
| `julianday(fecha)`      | Días desde el 24 nov 4714 a.C. | `julianday('2025-01-01')`        |

--------------

FUNCIONES DE CONTROL DE FLUJO

| Función        | Descripción                                    | Ejemplo                                              |
| -------------- | ---------------------------------------------- | ---------------------------------------------------- |
| `IFNULL(x, y)` | Devuelve `x` si no es `NULL`, si no `y`        | `IFNULL(salario, 0)`                                 |
| `NULLIF(x, y)` | Devuelve `NULL` si `x = y`, si no devuelve `x` | `NULLIF(a, b)`                                       |
| `CASE`         | Estructura condicional                         | `CASE WHEN edad > 18 THEN 'Adulto' ELSE 'Menor' END` |

---------------

OBTENER FECHA HORA Y AMBAS

| Función           | Descripción         | Ejemplo                   | Resultado ejemplo     |
| ----------------- | ------------------- | ------------------------- | --------------------- |
| `DATE('now')`     | Fecha actual        | `SELECT DATE('now');`     | `2025-05-06`          |
| `TIME('now')`     | Hora actual         | `SELECT TIME('now');`     | `14:35:00`            |
| `DATETIME('now')` | Fecha y hora actual | `SELECT DATETIME('now');` | `2025-05-06 14:35:00` |

-------------

MODIFICADORES DE FECHA Y HORA

| Modificador           | Descripción                      | Ejemplo                         |
| --------------------- | -------------------------------- | ------------------------------- |
| `'+1 day'`            | Un día adelante                  | `DATE('now', '+1 day')`         |
| `'-7 days'`           | Siete días antes                 | `DATE('now', '-7 days')`        |
| `'+1 month'`          | Un mes adelante                  | `DATE('now', '+1 month')`       |
| `'+1 year'`           | Un año adelante                  | `DATE('now', '+1 year')`        |
| `'start of month'`    | Primer día del mes actual        | `DATE('now', 'start of month')` |
| `'start of year'`     | Primer día del año actual        | `DATE('now', 'start of year')`  |
| `'weekday 0'` a `'6'` | Próximo domingo (0) a sábado (6) | `DATE('now', 'weekday 0')`      |
| `'localtime'`         | Ajuste a hora local              | `DATETIME('now', 'localtime')`  |
| `'utc'`               | Ajuste a hora UTC                | `DATETIME('now', 'utc')`        |

----------------

FUNCIONES PARA CALCULO Y FORMATO

| Función                    | Descripción                                | Ejemplo                                    | Resultado ejemplo |
| -------------------------- | ------------------------------------------ | ------------------------------------------ | ----------------- |
| `julianday(fecha)`         | Convierte a número de días desde 4714 a.C. | `SELECT julianday('2025-01-01');`          | `2460680.5`       |
| `strftime('%Y', fecha)`    | Extrae parte de la fecha (año aquí)        | `strftime('%Y', '2025-05-06')`             | `2025`            |
| `strftime('%m', fecha)`    | Extrae el mes                              | `strftime('%m', '2025-05-06')`             | `05`              |
| `strftime('%d', fecha)`    | Extrae el día                              | `strftime('%d', '2025-05-06')`             | `06`              |
| `strftime('%H:%M', fecha)` | Extrae hora y minuto                       | `strftime('%H:%M', '2025-05-06 15:20:00')` | `15:20`           |

SELECT 
    DATE('now') AS hoy,
    DATE('now', '+7 days') AS dentro_7_dias,
    strftime('%Y', 'now') AS anio_actual,
    DATETIME('now', 'start of year', '+6 months') AS mitad_de_anio;
---------------------

SCRIPT

-- Tabla Estudiante
CREATE TABLE Estudiante (
    id_estudiante INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    edad INTEGER
);

-- Tabla Perfil (relación uno a uno con Estudiante)
CREATE TABLE Perfil (
    id_perfil INTEGER PRIMARY KEY,
    id_estudiante INTEGER UNIQUE,
    direccion TEXT,
    telefono TEXT,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante)
);

-- Tabla Profesor
CREATE TABLE Profesor (
    id_profesor INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

-- Tabla Curso
CREATE TABLE Curso (
    id_curso INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    id_profesor INTEGER,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor)
);

-- Tabla Inscripcion (relación muchos a muchos)
CREATE TABLE Inscripcion (
    id_estudiante INTEGER,
    id_curso INTEGER,
    fecha_inscripcion DATE,
    PRIMARY KEY (id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Insertar datos
INSERT INTO Estudiante VALUES (1, 'Ana', 20), (2, 'Luis', 22), (3, 'Marta', 21);
INSERT INTO Perfil VALUES (1, 1, 'Calle A', '111-111'), (2, 2, 'Calle B', '222-222'), (3, 3, 'Calle C', '333-333');
INSERT INTO Profesor VALUES (1, 'Dr. Gómez'), (2, 'Lic. Pérez');
INSERT INTO Curso VALUES (1, 'Matemáticas', 1), (2, 'Historia', 2), (3, 'Programación', 1);
INSERT INTO Inscripcion VALUES (1, 1, '2025-01-15'), (1, 3, '2025-01-16'),
                               (2, 2, '2025-01-17'), (3, 1, '2025-01-18'), (3, 2, '2025-01-18');
----------

Ejemplos de consultas para practicar
JOIN con varias tablas

SELECT e.nombre AS estudiante, c.titulo AS curso, p.nombre AS profesor
FROM Estudiante e
JOIN Inscripcion i ON e.id_estudiante = i.id_estudiante
JOIN Curso c ON i.id_curso = c.id_curso
JOIN Profesor p ON c.id_profesor = p.id_profesor;
 GROUP BY y funciones

SELECT c.titulo, COUNT(i.id_estudiante) AS total_inscritos
FROM Curso c
LEFT JOIN Inscripcion i ON c.id_curso = i.id_curso
GROUP BY c.titulo;
HAVING (condición sobre agregación)

SELECT c.titulo, COUNT(*) AS total
FROM Curso c
JOIN Inscripcion i ON c.id_curso = i.id_curso
GROUP BY c.titulo
HAVING COUNT(*) >= 2;
ORDER BY

SELECT e.nombre, COUNT(*) AS cursos_tomados
FROM Estudiante e
JOIN Inscripcion i ON e.id_estudiante = i.id_estudiante
GROUP BY e.nombre
ORDER BY cursos_tomados DESC;
Uso de funciones con fecha

SELECT e.nombre, i.fecha_inscripcion,
       DATE(i.fecha_inscripcion, '+30 days') AS vencimiento
FROM Estudiante e
JOIN Inscripcion i ON e.id_estudiante = i.id_estudiante;

sqlite3 academia.db < academia_ejemplo.sql


SQLite no soporta funciones o procedimientos almacenados (stored functions o stored procedures) como en otros sistemas de bases de datos como MySQL, PostgreSQL u Oracle. Es decir, no puedes crear funciones o procedimientos directamente en SQL dentro de SQLite como harías con CREATE FUNCTION o CREATE PROCEDURE.

Sin embargo, sí puedes simular ciertas funcionalidades usando lo siguiente:

✅ 1. Triggers (Disparadores)
Puedes automatizar acciones cuando se hacen INSERT, UPDATE o DELETE.

Ejemplo: Trigger para registrar cambios en una tabla Empleado

sql
Copiar
Editar
CREATE TABLE Empleado (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    salario REAL
);

CREATE TABLE LogCambios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_empleado INTEGER,
    accion TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER tr_update_empleado
AFTER UPDATE ON Empleado
FOR EACH ROW
BEGIN
    INSERT INTO LogCambios (id_empleado, accion)
    VALUES (OLD.id, 'ACTUALIZACION');
END;
✅ 2. Views (Vistas)
Te permiten guardar consultas complejas como si fueran una tabla virtual.

Ejemplo: Vista de empleados con salario mayor a 2000

sql
Copiar
Editar
CREATE VIEW vista_salario_alto AS
SELECT nombre, salario
FROM Empleado
WHERE salario > 2000;
✅ 3. User-Defined Functions (UDFs) desde el código (Python, C, etc.)
SQLite te permite crear funciones personalizadas en el lenguaje anfitrión, por ejemplo, en Python con sqlite3.create_function.

Ejemplo en Python:

python
Copiar
Editar
import sqlite3

def mi_multiplicador(x, y):
    return x * y

conn = sqlite3.connect('mi_db.db')
conn.create_function("multiplicar", 2, mi_multiplicador)

cursor = conn.cursor()
cursor.execute("SELECT multiplicar(3, 4);")
print(cursor.fetchone())  # Devuelve (12,)
✅ 4. Sentencias Preparadas con Variables en Aplicación
SQLite no tiene variables como DECLARE en procedimientos, pero puedes manejar lógica desde el lenguaje anfitrión:

Ejemplo (en Python):

python
Copiar
Editar
id = 1
nuevo_salario = 3000

cursor.execute("UPDATE Empleado SET salario = ? WHERE id = ?", (nuevo_salario, id))
✅ 5. Simulación de lógica compleja con CTEs y Subconsultas
Puedes usar CTEs (Common Table Expressions) con WITH para simular lógica de funciones:

Ejemplo: Aumentar el salario en un 10% a los que ganan menos de 2000

sql
Copiar
Editar
WITH empleados_bajo_salario AS (
    SELECT id, salario * 1.10 AS nuevo_salario
    FROM Empleado
    WHERE salario < 2000
)
UPDATE Empleado
SET salario = (
    SELECT nuevo_salario FROM empleados_bajo_salario WHERE empleados_bajo_salario.id = Empleado.id
)
WHERE id IN (SELECT id FROM empleados_bajo_salario);
✅ 6. Funciones Integradas de SQLite
SQLite tiene muchas funciones integradas como:

Matemáticas: ABS, ROUND, RANDOM(), SQRT

Cadenas: UPPER, LOWER, SUBSTR, REPLACE

Fecha y hora: DATE(), DATETIME(), STRFTIME()

Agregación: SUM, AVG, MAX, MIN

Ejemplo: Obtener edad promedio:

sql
Copiar
Editar
SELECT AVG(edad) FROM Alumno;
❌ ¿Qué no puedes hacer directamente en SQLite?
CREATE PROCEDURE, CREATE FUNCTION (como en MySQL/PostgreSQL).

Uso de variables dentro del SQL puro (DECLARE, SET, etc.).

Bucles (WHILE, FOR, etc.) o condiciones (IF, CASE en bloques de procedimientos).

✅ Conclusión
SQLite no admite funciones o procedimientos almacenados como otros motores, pero puedes hacer muchas cosas útiles usando:

Característica	¿Disponible?	Alternativa/Comentario
Procedimientos	❌	Simula con lógica en el lenguaje anfitrión (Python, etc.)
Funciones definidas	❌ (SQL)	✅ desde Python, C u otro lenguaje
Triggers	✅	Perfecto para automatizar en INSERT/UPDATE/DELETE
Vistas	✅	Consultas reutilizables
CTEs (WITH)	✅




