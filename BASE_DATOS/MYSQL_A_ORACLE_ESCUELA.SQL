****************
***   0001   ***
****************

Cambios necesarios de MySQL a Oracle:

Oracle no tiene AUTO_INCREMENT, usamos GENERATED ALWAYS AS IDENTITY.

Oracle no permite IF NOT EXISTS en CREATE DATABASE (y no usa USE).

Las FOREIGN KEY deben tener nombres opcionales, pero se recomienda definirlos.

Oracle requiere DATE como tipo de fecha, y usa 'YYYY-MM-DD' como formato válido por defecto.

****************
***   0002   ***
****************

-- ELIMINAR UN USUARIO CON TODOS SUS OBJETOS (TABLAS, VISTAS, SECUENCIAS ETC) DE PROPIEDAD DEL USUARIO
DROP USER ESCUELA CASCADE;

-- CREAR UN NUEVO USUARIO CON UNA CONTRASEÑA
CREATE USER ESCUELA IDENTIFIED BY 12345678;

-- EL ROL CONNECT PERMITE A UN USUARIO INICIAR SESION EN LA BASE DE DATOS
-- EL ROL RESOURCE PERMITE A UN USUARIO PERMISOS PARA CREAR Y MODIFICAR OBJETOS DE ESQUEMA, COMO TABLAS, VISTAS, SECUENCIAS ETC
-- EL ROL DBA OTORGA TODOS LOS PRIVILEGIOS ADMINISTRATIVOS A UN USUARIO
GRANT CONNECT,RESOURCE,DBA TO ESCUELA;

-- ESTE PRIVILEGIO PERMITE AL USUARIO USAR UN ESPACIO ILIMITADO EN TODOS LOS TABLESPACES DE LA BASE DE DATOS
GRANT UNLIMITED TABLESPACE TO ESCUELA;

-- MODIFICA EL PERFIL DEFAULT PARA QUE EL PARAMETRO PASSWORD_REUSE_TIME NO TENGA LIMITES. NO HAY RESTRICCIONES DE TIEMPO PARA LA REUTILIZACION DE CONTRASEÑAS
ALTER PROFILE DEFAULT LIMIT PASSWORD_REUSE_TIME UNLIMITED;

-- MODIFICA EL PERFIL DEFAULT PARA QUE EL PARAMETRO PASSWORD_LIFE_TIME NO TENGA LIMITES. LA CONTRASEÑA NUNCA EXPIRA
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

-- DESBLOQUEAR AL USUARIO FACTORIA POR SI ESTUBIERA BLOQUEADO
ALTER USER ESCUELA ACCOUNT UNLOCK;

-- INICIAR SESION CON EL USUARIO FACTORIA
CONNECT ESCUELA/12345678@LOCALHOST:1521/XEPDB1

-- CONFIGURAR EL FORMATO DE LA FECHA, COMO DEBE SER INGRESADA EN INSERT
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD'; 

-- DESACTIVAR TEMPORALMENTE LA FUNCION DE SUSTITUCION DE VARIABLE EN TU SESION
SET DEFINE OFF;

-- NOTA: Oracle no usa CREATE DATABASE ni USE

-- Primero elimina las tablas si existen
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Matricula';
    EXECUTE IMMEDIATE 'DROP TABLE Asignatura';
    EXECUTE IMMEDIATE 'DROP TABLE Estudiante';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Crear tabla Estudiante
CREATE TABLE Estudiante (
    id_estudiante INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre        VARCHAR2(100),
    edad          INT
);

-- Crear tabla Asignatura
CREATE TABLE Asignatura (
    id_asignatura INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_asignatura VARCHAR2(100),
    curso VARCHAR2(20)
);

-- Crear tabla Matricula (relación muchos a muchos)
CREATE TABLE Matricula (
    id_estudiante INT,
    id_asignatura INT,
    fecha_matricula DATE,
    PRIMARY KEY (id_estudiante, id_asignatura),
    CONSTRAINT fk_estudiante FOREIGN KEY (id_estudiante)
        REFERENCES Estudiante(id_estudiante),
    CONSTRAINT fk_asignatura FOREIGN KEY (id_asignatura)
        REFERENCES Asignatura(id_asignatura)
);

-- Insertar estudiantes
INSERT INTO Estudiante (nombre, edad) VALUES ('Juan Pérez', 20);
INSERT INTO Estudiante (nombre, edad) VALUES ('Laura Gómez', 22);

-- Insertar asignaturas
INSERT INTO Asignatura (nombre_asignatura, curso) VALUES ('Matemáticas', '1º');
INSERT INTO Asignatura (nombre_asignatura, curso) VALUES ('Historia', '1º');
INSERT INTO Asignatura (nombre_asignatura, curso) VALUES ('Biología', '2º');

-- Insertar matrículas
INSERT INTO Matricula (id_estudiante, id_asignatura, fecha_matricula) VALUES (1, 1, DATE '2025-01-10');
INSERT INTO Matricula (id_estudiante, id_asignatura, fecha_matricula) VALUES (1, 2, DATE '2025-01-11');
INSERT INTO Matricula (id_estudiante, id_asignatura, fecha_matricula) VALUES (2, 1, DATE '2025-01-12');
INSERT INTO Matricula (id_estudiante, id_asignatura, fecha_matricula) VALUES (2, 3, DATE '2025-01-13');

COMMIT;

****************
***   0003   ***
****************

-- Una consulta tipo JOIN para ver qué estudiantes están en qué asignaturas:

SELECT 
    e.nombre AS estudiante,
    a.nombre_asignatura,
    m.fecha_matricula
FROM 
    Matricula m
    JOIN Estudiante e ON m.id_estudiante = e.id_estudiante
    JOIN Asignatura a ON m.id_asignatura = a.id_asignatura;
	
****************
***   0004   ***
****************

En versiones modernas de Oracle (desde la 12c en adelante), 
ya no es necesario crear manualmente una secuencia para usar AUTO_INCREMENT, porque ahora puedes usar:

GENERATED [ALWAYS | BY DEFAULT] AS IDENTITY

✅ ¿Qué hace GENERATED AS IDENTITY?

Internamente, Oracle crea y gestiona una secuencia automáticamente para esa columna. Es decir, esta sintaxis:

id_estudiante INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY

Es equivalente a lo que antes hacíamos manualmente así:

CREATE SEQUENCE seq_estudiante START WITH 1 INCREMENT BY 1;

y luego en la inserción:

INSERT INTO Estudiante (id_estudiante, nombre, edad)
VALUES (seq_estudiante.NEXTVAL, 'Juan', 20);

🎯 Tipos de IDENTITY en Oracle:

Tipo										¿Se puede insertar valor manualmente?									¿Se autoincrementa?

GENERATED ALWAYS AS IDENTITY				❌ No permite insertar valores manuales.								✅ Sí
GENERATED BY DEFAULT AS IDENTITY			✅ Permite insertar manualmente, pero si no se da valor, se incrementa.	✅ Sí
GENERATED BY DEFAULT ON NULL AS IDENTITY	✅ Solo si el valor es NULL, lo incrementa.								✅ Sí

Conclusión:

Desde Oracle 12c, ya no necesitas declarar manualmente una secuencia para claves primarias autoincrementales.

Usar GENERATED AS IDENTITY es más limpio y seguro.

Si estás usando Oracle 11g o inferior, sí deberías crear secuencias manualmente.

****************
***   0005   ***
****************

Ejemplo adaptado a Oracle 11g o inferior, donde no existe GENERATED AS IDENTITY, por lo tanto tendrás que crear una secuencia y un trigger para simular el comportamiento de AUTO_INCREMENT.

-- 1. Tabla Estudiante con secuencia y trigger

-- Crear la tabla Estudiante
CREATE TABLE Estudiante (
    id_estudiante NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    edad NUMBER
);

-- Crear la secuencia para autoincrementar
CREATE SEQUENCE seq_estudiante
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Crear el trigger para usar la secuencia al insertar
CREATE OR REPLACE TRIGGER trg_estudiante_autoinc
BEFORE INSERT ON Estudiante
FOR EACH ROW
BEGIN
    IF :NEW.id_estudiante IS NULL THEN
        SELECT seq_estudiante.NEXTVAL INTO :NEW.id_estudiante FROM dual;
    END IF;
END;
/

-- 2. Tabla Asignatura

CREATE TABLE Asignatura (
    id_asignatura NUMBER PRIMARY KEY,
    nombre_asignatura VARCHAR2(100),
    curso VARCHAR2(20)
);

CREATE SEQUENCE seq_asignatura
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE TRIGGER trg_asignatura_autoinc
BEFORE INSERT ON Asignatura
FOR EACH ROW
BEGIN
    IF :NEW.id_asignatura IS NULL THEN
        SELECT seq_asignatura.NEXTVAL INTO :NEW.id_asignatura FROM dual;
    END IF;
END;
/
-- 3. Tabla Matricula (relación muchos a muchos)

CREATE TABLE Matricula (
    id_estudiante NUMBER,
    id_asignatura NUMBER,
    fecha_matricula DATE,
    PRIMARY KEY (id_estudiante, id_asignatura),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura)
);

-- 4. Insertar datos

-- Insertar estudiantes (el id se genera automáticamente)
INSERT INTO Estudiante (nombre, edad) VALUES ('Juan Pérez', 20);
INSERT INTO Estudiante (nombre, edad) VALUES ('Laura Gómez', 22);

-- Insertar asignaturas
INSERT INTO Asignatura (nombre_asignatura, curso) VALUES ('Matemáticas', '1º');
INSERT INTO Asignatura (nombre_asignatura, curso) VALUES ('Historia', '1º');
INSERT INTO Asignatura (nombre_asignatura, curso) VALUES ('Biología', '2º');

-- Insertar matrículas (usamos SELECTs para obtener los ids)
INSERT INTO Matricula (id_estudiante, id_asignatura, fecha_matricula)
VALUES (1, 1, TO_DATE('2025-01-10', 'YYYY-MM-DD'));

INSERT INTO Matricula (id_estudiante, id_asignatura, fecha_matricula)
VALUES (1, 2, TO_DATE('2025-01-11', 'YYYY-MM-DD'));

INSERT INTO Matricula (id_estudiante, id_asignatura, fecha_matricula)
VALUES (2, 1, TO_DATE('2025-01-12', 'YYYY-MM-DD'));

INSERT INTO Matricula (id_estudiante, id_asignatura, fecha_matricula)
VALUES (2, 3, TO_DATE('2025-01-13', 'YYYY-MM-DD'));

****************
***   0006   ***
****************

-- VERSION MYSQL QUE SE CONVIRTIO A ORACLE

-- ----------------
-- BASE DE DATOS --
-- ----------------

-- Borrar base de datos
DROP DATABASE IF EXISTS ESCUELA_MUCHOSAMUCHOS_1;

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS ESCUELA_MUCHOSAMUCHOS_1;
USE ESCUELA_MUCHOSAMUCHOS_1;

-- ---------
-- TABLAS --
-- ---------

-- Tabla de Estudiantes
CREATE TABLE Estudiante (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT
);

-- Tabla de Asignaturas
CREATE TABLE Asignatura (
    id_asignatura INT AUTO_INCREMENT PRIMARY KEY,
    nombre_asignatura VARCHAR(100),
    curso VARCHAR(20)
);

-- Tabla intermedia de Matrícula (muchos a muchos)
CREATE TABLE Matricula (
    id_estudiante INT,
    id_asignatura INT,
    fecha_matricula DATE,
    PRIMARY KEY (id_estudiante, id_asignatura),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura)
);

-- --------
-- DATOS --
-- --------

-- Insertar estudiantes
INSERT INTO Estudiante (nombre, edad) VALUES
('Juan Pérez', 20),
('Laura Gómez', 22);

-- Insertar asignaturas
INSERT INTO Asignatura (nombre_asignatura, curso) VALUES
('Matemáticas', '1º'),
('Historia', '1º'),
('Biología', '2º');

-- Insertar matrículas (relaciones muchos a muchos)
INSERT INTO Matricula (id_estudiante, id_asignatura, fecha_matricula) VALUES
(1, 1, '2025-01-10'),
(1, 2, '2025-01-11'),
(2, 1, '2025-01-12'),
(2, 3, '2025-01-13');




