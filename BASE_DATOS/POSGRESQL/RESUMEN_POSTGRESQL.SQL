**************************
***   TIPOS DE DATOS   ***
**************************

NUMEROS

| Tipo de Dato       | Alias / Alternativa | Descripción                          |
| ------------------ | ------------------- | ------------------------------------ |
| `smallint`         |                     | Entero de 2 bytes (−32,768 a 32,767) |
| `integer`          | `int`               | Entero de 4 bytes                    |
| `bigint`           |                     | Entero de 8 bytes                    |
| `decimal(p,s)`     | `numeric(p,s)`      | Números exactos con precisión        |
| `real`             |                     | Números de punto flotante de 4 bytes |
| `double precision` |                     | Punto flotante de 8 bytes            |
| `serial`           |                     | Entero auto-incremental de 4 bytes   |
| `bigserial`        |                     | Entero auto-incremental de 8 bytes   |

CADENAS DE TEXTO

| Tipo de Dato | Descripción                          |
| ------------ | ------------------------------------ |
| `char(n)`    | Cadena de longitud fija              |
| `varchar(n)` | Cadena de longitud variable (máx. n) |
| `text`       | Cadena de longitud ilimitada         |

BOOLEANOS

| Tipo de Dato | Valores posibles        |
| ------------ | ----------------------- |
| `boolean`    | `TRUE`, `FALSE`, `NULL` |

FECHAS Y HORAS

| Tipo de Dato               | Descripción                           |
| -------------------------- | ------------------------------------- |
| `date`                     | Fecha (AAAA-MM-DD)                    |
| `time`                     | Hora (sin zona horaria)               |
| `time with time zone`      | Hora con zona horaria                 |
| `timestamp`                | Fecha y hora (sin zona horaria)       |
| `timestamp with time zone` | Fecha y hora con zona horaria         |
| `interval`                 | Periodo de tiempo (días, meses, etc.) |

MONEDA

| Tipo de Dato | Descripción                               |
| ------------ | ----------------------------------------- |
| `money`      | Valor monetario (con símbolo y decimales) |

JSON / JSONB

| Tipo de Dato | Descripción                                    |
| ------------ | ---------------------------------------------- |
| `json`       | Guarda texto JSON (sin validación interna)     |
| `jsonb`      | Guarda JSON en formato binario (más eficiente) |

ARRAY Y OTROS COMPUESTOS

| Tipo de Dato | Descripción                       |
| ------------ | --------------------------------- |
| `tipo[]`     | Array de cualquier tipo (`int[]`) |
| `composite`  | Tipo definido por el usuario      |

ENUMERADOS (ENUM)

CREATE TYPE estado AS ENUM ('activo', 'inactivo', 'pendiente');

UUID

| Tipo de Dato | Descripción                   |
| ------------ | ----------------------------- |
| `uuid`       | Identificador único universal |

***************************************************
***   EJEMPLOS DE UNA BASE DE DATOS EN SCRIPT   ***
***************************************************

-- Crear la base de datos
CREATE DATABASE instituto;

-- Cambiar a la base de datos
\c instituto

-- Crear tipo ENUM para estado de matrícula
CREATE TYPE estado_matricula AS ENUM ('activo', 'pendiente', 'suspendido');

-- Crear tabla de personas (usa UUID y jsonb)
CREATE TABLE Persona (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100),
    edad SMALLINT CHECK (edad >= 0),
    casado BOOLEAN DEFAULT FALSE,
    fecha_nacimiento DATE,
    datos_contacto JSONB
);

-- Tabla de Pasaporte (relación UNO A UNO con Persona)
CREATE TABLE Pasaporte (
    id SERIAL PRIMARY KEY,
    id_persona UUID UNIQUE REFERENCES Persona(id),
    numero VARCHAR(20) UNIQUE NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_expiracion DATE NOT NULL
);

-- Tabla Departamento (UNO A MUCHOS con Estudiante)
CREATE TABLE Departamento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla Estudiante (pertenece a un Departamento)
CREATE TABLE Estudiante (
    id SERIAL PRIMARY KEY,
    id_persona UUID UNIQUE REFERENCES Persona(id),
    id_departamento INTEGER REFERENCES Departamento(id),
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    promedio NUMERIC(4,2) CHECK (promedio >= 0 AND promedio <= 10),
    estado estado_matricula
);

-- Tabla Curso
CREATE TABLE Curso (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INTEGER CHECK (creditos > 0),
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla intermedia Estudiante_Curso (MUCHOS A MUCHOS)
CREATE TABLE Estudiante_Curso (
    id_estudiante INTEGER REFERENCES Estudiante(id),
    id_curso INTEGER REFERENCES Curso(id),
    nota REAL CHECK (nota >= 0 AND nota <= 10),
    PRIMARY KEY (id_estudiante, id_curso)
);

-- Insertar personas
INSERT INTO Persona (nombre, apellido, edad, casado, fecha_nacimiento, datos_contacto)
VALUES 
    ('Ana', 'Pérez', 20, FALSE, '2004-03-21', '{"email": "ana@example.com", "telefono": "123456789"}'),
    ('Luis', 'García', 25, TRUE, '1999-07-10', '{"email": "luis@example.com", "telefono": "987654321"}');

-- Insertar pasaporte (relación 1 a 1)
INSERT INTO Pasaporte (id_persona, numero, fecha_emision, fecha_expiracion)
SELECT id, 'X123456', '2022-01-01', '2032-01-01'
FROM Persona
WHERE nombre = 'Ana';

-- Insertar departamentos
INSERT INTO Departamento (nombre)
VALUES ('Informática'), ('Matemáticas'), ('Biología');

-- Insertar estudiantes
INSERT INTO Estudiante (id_persona, id_departamento, promedio, estado)
SELECT id, 1, 8.5, 'activo' FROM Persona WHERE nombre = 'Ana';

INSERT INTO Estudiante (id_persona, id_departamento, promedio, estado)
SELECT id, 2, 7.3, 'pendiente' FROM Persona WHERE nombre = 'Luis';

-- Insertar cursos
INSERT INTO Curso (nombre, creditos)
VALUES ('Bases de Datos', 5),
       ('Álgebra', 4),
       ('Biología Molecular', 6);

-- Insertar estudiante_curso (relación muchos a muchos)
INSERT INTO Estudiante_Curso (id_estudiante, id_curso, nota)
VALUES 
    (1, 1, 9.2),
    (1, 2, 7.5),
    (2, 2, 6.8),
    (2, 3, 8.0);
	
------------------------------
---   EJECUTAR EL SCRIPT   ---
------------------------------

¿Cómo ejecutar este script en PostgreSQL?
Opción 1: Con psql (desde terminal)
Guarda el script en un archivo, por ejemplo: instituto.sql

En la terminal, ejecuta:

psql -U tu_usuario -f instituto.sql
Reemplaza tu_usuario por tu usuario de PostgreSQL. Si tienes contraseña, te la pedirá.

psql -U postgres -f instituto.sql

Opción 2: Desde PgAdmin

Abre PgAdmin.

Conéctate al servidor PostgreSQL.

Haz clic derecho en "Databases" > "Create" > Database y escribe instituto.

Abre el panel de consultas SQL.

Copia y pega el script completo y haz clic en "Execute" (F5).

---------------------
---   CONSULTAS   ---
---------------------

1. Mostrar todos los estudiantes con su nombre completo, edad, estado de matrícula y nombre del departamento

SELECT 
    e.id AS id_estudiante,
    p.nombre || ' ' || p.apellido AS nombre_completo,
    p.edad,
    e.estado,
    d.nombre AS departamento
FROM Estudiante e
JOIN Persona p ON e.id_persona = p.id
JOIN Departamento d ON e.id_departamento = d.id;

2. Mostrar todos los cursos con sus estudiantes inscritos y notas

SELECT 
    c.nombre AS curso,
    p.nombre || ' ' || p.apellido AS estudiante,
    ec.nota
FROM Estudiante_Curso ec
JOIN Estudiante e ON ec.id_estudiante = e.id
JOIN Persona p ON e.id_persona = p.id
JOIN Curso c ON ec.id_curso = c.id
ORDER BY curso, estudiante;

3. Listar los cursos en los que está inscrito un estudiante específico (por ejemplo, Ana)

SELECT 
    p.nombre || ' ' || p.apellido AS estudiante,
    c.nombre AS curso,
    ec.nota
FROM Estudiante_Curso ec
JOIN Estudiante e ON ec.id_estudiante = e.id
JOIN Persona p ON e.id_persona = p.id
JOIN Curso c ON ec.id_curso = c.id
WHERE p.nombre = 'Ana';

4. Ver pasaporte de una persona (relación uno a uno)

SELECT 
    p.nombre || ' ' || p.apellido AS persona,
    ps.numero AS pasaporte,
    ps.fecha_emision,
    ps.fecha_expiracion
FROM Pasaporte ps
JOIN Persona p ON ps.id_persona = p.id;

********************************
***   FUNCTION Y PROCEDURE   ***
********************************

1. FUNCTION: Calcular el promedio de notas de un estudiante

CREATE OR REPLACE FUNCTION obtener_promedio(id_est INTEGER)
RETURNS NUMERIC(5,2) AS $$
DECLARE
    promedio NUMERIC(5,2);
BEGIN
    SELECT AVG(nota)
    INTO promedio
    FROM Estudiante_Curso
    WHERE id_estudiante = id_est;

    RETURN COALESCE(promedio, 0);
END;
$$ LANGUAGE plpgsql;

📌 Uso:

SELECT obtener_promedio(1);
🔧 2. FUNCTION: Verificar si un estudiante está matriculado en un curso específico

CREATE OR REPLACE FUNCTION esta_matriculado(id_est INTEGER, id_cur INTEGER)
RETURNS BOOLEAN AS $$
DECLARE
    existe BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1
        FROM Estudiante_Curso
        WHERE id_estudiante = id_est AND id_curso = id_cur
    ) INTO existe;

    RETURN existe;
END;
$$ LANGUAGE plpgsql;

📌 Uso:

SELECT esta_matriculado(1, 2);
🔧 3. PROCEDURE: Insertar un nuevo estudiante y asignarle un curso

CREATE OR REPLACE PROCEDURE insertar_estudiante_con_curso(
    nombre_p TEXT,
    apellido_p TEXT,
    edad_p INTEGER,
    estado_p BOOLEAN,
    departamento_id INTEGER,
    curso_id INTEGER,
    nota NUMERIC(5,2)
)
LANGUAGE plpgsql
AS $$
DECLARE
    nueva_persona_id INTEGER;
    nuevo_estudiante_id INTEGER;
BEGIN
    -- Insertar en Persona
    INSERT INTO Persona (nombre, apellido, edad)
    VALUES (nombre_p, apellido_p, edad_p)
    RETURNING id INTO nueva_persona_id;

    -- Insertar en Estudiante
    INSERT INTO Estudiante (id_persona, estado, id_departamento)
    VALUES (nueva_persona_id, estado_p, departamento_id)
    RETURNING id INTO nuevo_estudiante_id;

    -- Insertar inscripción en curso
    INSERT INTO Estudiante_Curso (id_estudiante, id_curso, nota)
    VALUES (nuevo_estudiante_id, curso_id, nota);

    RAISE NOTICE 'Estudiante insertado con ID: %', nuevo_estudiante_id;
END;
$$;

📌 Uso:

CALL insertar_estudiante_con_curso(
    'Luis', 'Martínez', 23, TRUE, 1, 2, 7.8
);
🔄 Diferencias clave:
Característica	FUNCTION	PROCEDURE
Devuelve un valor	✅ Sí	🚫 No obligatoriamente
Usada en SELECT	✅ Sí	❌ No
Puede tener OUT params	⚠️ Con trucos (RETURNS TABLE)	✅ Sí
Llamada con	SELECT o DO	CALL


FUNCTION: Cursos con más de 3 estudiantes
sql
Copiar
Editar
CREATE OR REPLACE FUNCTION cursos_con_muchos_estudiantes()
RETURNS TABLE(
    id_curso INT,
    nombre_curso TEXT,
    cantidad_estudiantes INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.id,
        c.nombre,
        COUNT(ec.id_estudiante) AS cantidad_estudiantes
    FROM Curso c
    JOIN Estudiante_Curso ec ON c.id = ec.id_curso
    GROUP BY c.id, c.nombre
    HAVING COUNT(ec.id_estudiante) > 3;
END;
$$ LANGUAGE plpgsql;
🔎 ¿Qué hace esta función?
Devuelve una tabla con:

ID del curso

Nombre del curso

Cantidad de estudiantes inscritos

Solo incluye los cursos que tienen más de 3 estudiantes

▶️ ¿Cómo la usas?
sql
Copiar
Editar
SELECT * FROM cursos_con_muchos_estudiantes();




