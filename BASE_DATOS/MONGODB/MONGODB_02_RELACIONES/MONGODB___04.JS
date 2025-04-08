****************
***   0001   ***   BASE DE DATOS EN MYSQL CON RELACIONES UNO A UNO, UNO A MUCHOS Y MUCHOS A MUCHOS
****************
----------------------------------------------------------------------------------------------------
RELACIONES
----------------------------------------------------------------------------------------------------
RELACION    	ENTIDADES INVOLUCRADAS          DESCRIPCION
----------------------------------------------------------------------------------------------------
Uno a Uno		Persona - Pasaporte				Cada persona tiene un único pasaporte.
Uno a Muchos	Autor - Libro					Un autor puede haber escrito varios libros.
Muchos a Muchos	Estudiante - Curso				Un estudiante puede tomar varios cursos y viceversa.
----------------------------------------------------------------------------------------------------
****************
***   0002   ***
****************
-- ------------------------------
-- 1. ESQUEMA DE LA BASE DE DATOS
-- ------------------------------

DROP DATABASE IF EXISTS UNIVERSIDAD;
CREATE DATABASE IF NOT EXISTS UNIVERSIDAD;
USE UNIVERSIDAD;

-- ------------------------------
-- UNO A UNO: PERSONA - PASAPORTE
-- ------------------------------

CREATE TABLE Persona (
    id     INT         PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Pasaporte (
    id         INT         PRIMARY KEY,
    numero     VARCHAR(50),
    id_persona INT         UNIQUE,
               FOREIGN KEY (id_persona) REFERENCES Persona(id)
);

-- ---------------------------
-- UNO A MUCHOS: AUTOR - LIBRO
-- ---------------------------

CREATE TABLE Autor (
    id     INT         PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Libro (
    id       INT          PRIMARY KEY,
    titulo   VARCHAR(100),
    id_autor INT,
             FOREIGN KEY (id_autor) REFERENCES Autor(id)
);

-- -----------------------------------
-- MUCHOS A MUCHOS: ESTUDIANTE - CURSO
-- -----------------------------------

CREATE TABLE Estudiante (
    id     INT          PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Curso (
    id     INT          PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Estudiante_Curso (
    id_estudiante INT,
    id_curso      INT,
                  PRIMARY KEY (id_estudiante, id_curso),
                  FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id),
                  FOREIGN KEY (id_curso) REFERENCES Curso(id)
);

-- --------
-- 2. DATOS
-- --------

-- -------------------
-- Persona y Pasaporte
-- -------------------

INSERT INTO Persona (id, nombre) VALUES (1, 'Ana');

INSERT INTO Pasaporte (id, numero, id_persona) VALUES (101, 'X1234567', 1);

-- -------------
-- Autor y Libro
-- -------------

INSERT INTO Autor (id, nombre) VALUES (1, 'Gabriel García Márquez');

INSERT INTO Libro (id, titulo, id_autor) VALUES (1, 'Cien años de soledad', 1);
INSERT INTO Libro (id, titulo, id_autor) VALUES (2, 'El coronel no tiene quien le escriba', 1);

-- ------------------
-- Estudiante y Curso
-- ------------------

INSERT INTO Estudiante (id, nombre) VALUES (1, 'Carlos');
INSERT INTO Estudiante (id, nombre) VALUES (2, 'Lucía');

INSERT INTO Curso (id, nombre) VALUES (1, 'Matemáticas');
INSERT INTO Curso (id, nombre) VALUES (2, 'Física');

INSERT INTO Estudiante_Curso (id_estudiante, id_curso) VALUES (1, 1);
INSERT INTO Estudiante_Curso (id_estudiante, id_curso) VALUES (1, 2);
INSERT INTO Estudiante_Curso (id_estudiante, id_curso) VALUES (2, 1);

-- ------------
-- 3. CONSULTAS
-- ------------

-- ----
-- JOIN
-- ----

-- Uno a Uno

SELECT p.nombre, pa.numero
FROM Persona p
JOIN Pasaporte pa ON p.id = pa.id_persona;

+--------+----------+
| nombre | numero   |
+--------+----------+
| Ana    | X1234567 |
+--------+----------+

-- Uno a Muchos

SELECT a.nombre AS autor, l.titulo
FROM Autor a
JOIN Libro l ON a.id = l.id_autor;

+--------------------------+--------------------------------------+
| autor                    | titulo                               |
+--------------------------+--------------------------------------+
| Gabriel García Márquez   | Cien años de soledad                 |
| Gabriel García Márquez   | El coronel no tiene quien le escriba |
+--------------------------+--------------------------------------+

-- Muchos a Muchos

SELECT e.nombre AS estudiante, c.nombre AS curso
FROM Estudiante e
JOIN Estudiante_Curso ec ON e.id = ec.id_estudiante
JOIN Curso c ON ec.id_curso = c.id;

+------------+--------------+
| estudiante | curso        |
+------------+--------------+
| Carlos     | Física       |
| Carlos     | Matemáticas  |
| Lucía      | Matemáticas  |
+------------+--------------+
****************
***   0003   ***   BASE DE DATOS EN MONGODB 
****************
--------------------------------------------------------------------------------
En  MongoDB  no  hay  relaciones estrictas como en SQL. Aquí usaremos documentos 
embebidos y referencias.
--------------------------------------------------------------------------------

-- ----------------------------
-- 1. ESTRUCTURA DE COLECCIONES
-- ----------------------------

// 1. Persona - Pasaporte (Uno a Uno)

// persona
{
    _id: 1,
    nombre: "Ana",
    pasaporte: {
       id: 101,
       numero: "X1234567"
    }
}

// 2. Autor - Libros (Uno a Muchos)

// autor
{
    _id: 1,
    nombre: "Gabriel García Márquez",
    libros: [
       { id: 1, titulo: "Cien años de soledad" },
       { id: 2, titulo: "El coronel no tiene quien le escriba" }
    ]
}

// 3. Estudiante - Curso (Muchos a Muchos - mediante referencias)

// estudiante
{
    _id: 1,
    nombre: "Carlos",
    cursos: [1, 2]
}

{
    _id: 2,
    nombre: "Lucía",
    cursos: [1]
}

// curso
{
    _id: 1,
    nombre: "Matemáticas"
}
{
    _id: 2,
    nombre: "Física"
}

-- ---------
-- CONSULTAS
-- ---------

// Uno a Uno: Mostrar el pasaporte de todas las personas

db.persona.find({}, { nombre: 1, "pasaporte.numero": 1 });

// Salida

[ { _id: 1, nombre: 'Ana', pasaporte: { numero: 'X1234567' } } ]

// Uno a Muchos: Mostrar los titulos(libro) por cada autor

db.autor.aggregate([
  { $unwind: "$libros" },
  { $project: { autor: "$nombre", titulo: "$libros.titulo" } }
]);

// Salida

[
  {
    _id: 1,
    autor: 'Gabriel García Márquez',
    titulo: 'Cien años de soledad'
  },
  {
    _id: 1,
    autor: 'Gabriel García Márquez',
    titulo: 'El coronel no tiene quien le escriba'
  }
]

// Muchos a Muchos: Mostrar los estudiantes con sus cursos

db.estudiante.aggregate([
  {
    $lookup: {
      from: "curso",
      localField: "cursos",
      foreignField: "_id",
      as: "detalle_cursos"
    }
  },
  {
    $project: {
      nombre: 1,
	  _id: 0,
      cursos: "$detalle_cursos.nombre"
    }
  }
]);

// Salida

[
  { nombre: 'Carlos', cursos: [ 'Física', 'Matemáticas' ] },
  { nombre: 'Lucía', cursos: [ 'Matemáticas' ] }
]

****************
***   0004   ***
****************
Ejemplo de Transformación

db.autor.aggregate([
  { $unwind: "$libros" },
  { $project: { autor: "$nombre", titulo: "$libros.titulo" } }
]);

Documento original:

{
  "_id": 1,
  "nombre": "Gabriel García Márquez",
  "libros": [
    { "titulo": "Cien años de soledad", "año": 1967 },
    { "titulo": "El amor en los tiempos del cólera", "año": 1985 }
  ]
}

Después de $unwind (dos documentos):


[
  {
    "_id": 1,
    "nombre": "Gabriel García Márquez",
    "libros": { "titulo": "Cien años de soledad", "año": 1967 }
  },
  {
    "_id": 1,
    "nombre": "Gabriel García Márquez",
    "libros": { "titulo": "El amor en los tiempos del cólera", "año": 1985 }
  }
]

Después de $project:


[
  { "autor": "Gabriel García Márquez", "titulo": "Cien años de soledad" },
  { "autor": "Gabriel García Márquez", "titulo": "El amor en los tiempos del cólera" }
]

Resultado Final

El  código  toma  una  colección  de  autores donde cada autor tiene un array de 
libros, y produce una lista plana de documentos donde cada documento contiene el
nombre de un autor y el título de uno de sus libros.
****************
***   0005   ***
****************
db.estudiante.aggregate([
  {
    $lookup: {
      from: "curso",
      localField: "cursos",
      foreignField: "_id",
      as: "detalle_cursos"
    }
  },
  {
    $project: {
      nombre: 1,
      cursos: "$detalle_cursos.nombre"
    }
  }
]);

Colección estudiante (antes):

{
  "_id": 1,
  "nombre": "Carlos",
  "cursos": [1, 2]
}

Colección curso:

[
  { _id: 1, nombre: 'Carlos', cursos: [ 'Matemáticas', 'Física' ] },
  { _id: 2, nombre: 'Lucía', cursos: [ 'Matemáticas' ] }
]

Resultado después de $lookup:

{
  "_id": 1,
  "nombre": "Carlos",
  "cursos": [1, 2],
  "detalle_cursos": [
    {"_id": 1, "nombre": "Matemáticas"},
    {"_id": 2, "nombre": "Historia"}
  ]
}

Resultado final después de $project:

[
  { _id: 1, nombre: 'Carlos', cursos: [ 'Matemáticas', 'Física' ] },
  { _id: 2, nombre: 'Lucía', cursos: [ 'Matemáticas' ] }
]

****************
***   0006  ***
****************



****************
***   0007   ***
****************



****************
***   0008   ***
****************


****************
***   0009   ***
****************



****************
***   0010   ***
****************









