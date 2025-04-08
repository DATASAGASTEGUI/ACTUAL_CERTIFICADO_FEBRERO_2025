es una forma especial de JOIN, pero sin condición 😄

¿Qué es el producto cartesiano en SQL?

Es cuando haces un JOIN sin condición, lo cual genera todas las combinaciones posibles entre los registros de dos tablas.

Ejemplo simple con dos tablas:

Supongamos estas tablas:

CREATE TABLE Colores (
    id_color INT,
    nombre   VARCHAR(20)
);

CREATE TABLE Tallas (
    id_talla    INT,
    descripcion VARCHAR(20)
);

Y hay estos datos:

Colores

------------------
id_color	nombre
------------------
1			Rojo
2			Azul
------------------

Tallas

-----------------------
id_talla	descripcion
-----------------------
1			Pequeña
2			Mediana
-----------------------

Producto cartesiano:

SELECT *
FROM Colores, Tallas;

Resultado:

-------------------------------------------
id_color	nombre	id_talla	descripcion
-------------------------------------------
1			Rojo	1			Pequeña
1			Rojo	2			Mediana
2			Azul	1			Pequeña
2			Azul	2			Mediana
-------------------------------------------

Equivalente con CROSS JOIN (explícito):

SELECT *
FROM Colores
CROSS JOIN Tallas;

Así que sí, el producto cartesiano es un tipo de JOIN, 
pero sin una condición ON o WHERE para relacionar las filas. 
En la práctica, se usa poco, pero es útil para generar combinaciones, 
como colores y tallas de ropa.
