****************
***   0001   ***
****************

DROP DATABASE IF EXISTS ESCUELA;
CREATE DATABASE IF NOT EXISTS ESCUELA;
USE ESCUELA;

CREATE TABLE Alumno (
    id_alumno           INT                                   AUTO_INCREMENT PRIMARY KEY,
    nombre              VARCHAR(100)               NOT NULL,
	
    edad0               INT,	
    edad1               INT                        NOT NULL   CHECK (edad1 >= 0),
	edad2               INT                                   CHECK (edad2 >= 0 AND edad2 < 150),
	
	-- sexo             VARCHAR(1)                 NOT NULL,
	-- sexo             CHAR(1)                    NOT NULL,
    sexo                ENUM('M', 'F')             NOT NULL,
	
    fecha_nacimiento    DATE                       NOT NULL,
	
    estatura0           DECIMAL(4,2)               NOT NULL, -- 1.75    7.88
	estatura1           DECIMAL(4,2)               NOT NULL   CHECK (estatura1 > 0 AND estatura1 <= 3.00),
	
    casado3             TINYINT(1),                            -- Toma valores 0 (falso) o 1 (verdadero)
	casado0             BOOLEAN                    NOT NULL,  -- BOOLEAN es un alias de TINYINT
	
	casado1             ENUM('VERDADERO', 'FALSO') NOT NULL,
	casado2             VARCHAR(10)                 NOT NULL   CHECK (casado2 IN ('VERDADERO', 'FALSO')),
	
    fecha_creacion0     TIMESTAMP                             DEFAULT CURRENT_TIMESTAMP,        -- Si se pone NOT NULL no salta ningún error.
	fecha_creacion1     TIMESTAMP                             DEFAULT CURRENT_TIMESTAMP         ON UPDATE CURRENT_TIMESTAMP, -- Si se pone NOT NULL no salta ningún error.
	
    fecha_modificacion  TIMESTAMP                             DEFAULT CURRENT_TIMESTAMP         ON UPDATE CURRENT_TIMESTAMP,-- Si se pone NOT NULL no salta ningún error.
	
	fecha_nacimiento1    DATE                       NOT NULL,
	
	dni                 CHAR(8)                    NOT NULL   UNIQUE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8
  COLLATE=utf8_general_ci;

  
INSERT INTO Alumno (
    nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1,
    casado3, casado0, casado1, casado2, fecha_nacimiento1,dni
) VALUES
-- Ejemplo 1: todo correcto y consistente
('Juan Perez', 25, 25, 24, 'M', '1998-05-10', 1.75, 1.75, 1, 1, 'VERDADERO', 'VERDADERO', '2003-05-15','12345678'),

-- Ejemplo 2: edad2 menor que 150, casado falso con boolean y enum
('Maria Lopez', 30, 30, 29, 'F', '1993-11-20', 1.60, 1.60, 0, 0, 'FALSO', 'FALSO', '2003-05-15', '87654321'),

-- Ejemplo 3: probar valores límite en estatura1 y edad2
('Carlos Ruiz', 45, 45, 149, 'M', '1978-01-15', 2.99, 3.00, 1, 1, 'VERDADERO', 'VERDADERO', '2003-05-15', '11223344'),

-- Ejemplo 4: casado con boolean 0, y varchar 'FALSO'
('Ana Gomez', 20, 20, 19, 'F', '2003-07-05', 1.55, 1.55, 0, 0, 'FALSO', 'FALSO', '2003-05-15', '44332211');
****************
***   0002   ***
****************
--------------------------------------------------------------------------------
En MySQL,  el  orden  de  las  palabras  clave  NOT NULL  y  UNIQUE no afecta su 
funcionamiento. Ambas formas son válidas y equivalentes.

No es estrictamente necesario poner NOT NULL a una columna TIMESTAMP si ya tiene
un valor por defecto (DEFAULT CURRENT_TIMESTAMP), porque  MySQL  la tratará como 
NOT NULL implícitamente, a menos que se indique lo contrario.

Esto   funciona   perfectamente  y  no  permitirá  NULL  a menos que lo insertes 
explícitamente: fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP

Esto  es  más  explícito  y claro para el lector del código. Garantiza que nunca 
habrá NULL, ni siquiera accidentalmente:
fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

Usa  NOT NULL  si  deseas  documentar  claramente  tu  intención. Aunque  no sea 
obligatorio, es una buena práctica cuando sabes que el campo nunca debe ser nulo.
Entonces, ambas opciones son válidas, pero esta es la más clara:
fecha_creacion TIMESTAMP        NOT NULL         DEFAULT CURRENT_TIMESTAMP

estatura DECIMAL(4,2): permite valores como 1.75 (1 metro 75 cm).

casado BOOLEAN: Campo booleano (TRUE o FALSE).

fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP: Se  llenará  automáticamente 
con la fecha y hora actuales cuando se inserte el registro.

Se actualice automáticamente al modificar el registro, puedes usar:
ON UPDATE CURRENT_TIMESTAMP.

Para  que  la  columna fecha_creacion se actualice automáticamente al insertar y 
también al modificar el registro algún campo, puedes usar:
fecha_creacion TIMESTAMP                    --Tipo fecha y hora
               DEFAULT CURRENT_TIMESTAMP    --Pone fecha automatica al crearse la row
			   ON UPDATE CURRENT_TIMESTAMP. --Pone fecha automatica al modificarse un campo de la row
--------------------------------------------------------------------------------
****************
***   0003   ***   TRIGGER
****************
--------------------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER before_update_fecha_modificacion
BEFORE UPDATE ON Alumno
FOR EACH ROW
BEGIN
  SET NEW.fecha_modificacion = CURRENT_TIMESTAMP;
END$$

DELIMITER ;

-- EVENTO QUE LANZA EL TRIGGER 

UPDATE Alumno SET nombre = 'Arturo Lescano' WHERE id_alumno = 1;
--------------------------------------------------------------------------------
Cómo funciona:

Se ejecuta antes de cada actualización en la tabla Alumno.

Cambia el valor de fecha_modificacion a la fecha y hora actual (CURRENT_TIMESTAMP).

Así, no importa qué campos cambies, fecha_modificacion siempre se actualiza.
--------------------------------------------------------------------------------
Importante:

Si tienes en la definición del campo esta parte:

fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

Este trigger es redundante, porque MySQL lo hace automáticamente.
--------------------------------------------------------------------------------
¿Cuándo usar el trigger?

Si tu campo no tiene ON UPDATE CURRENT_TIMESTAMP o

Quieres que se actualice la fecha incluso en operaciones especiales o  complejas
(por ejemplo, UPDATE que no modifican campos directamente)
--------------------------------------------------------------------------------
****************
***   0004   ***
****************
--------------------------------------------------------------------------------
NO QUIERO QUE NADIE ALTERE LA FECHA DE CREACION
--------------------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_no_modificar_fecha_creacion
BEFORE UPDATE ON Alumno
FOR EACH ROW
BEGIN
  IF NEW.fecha_creacion0 <> OLD.fecha_creacion0 THEN
    SIGNAL SQLSTATE '45000' 
	SET MESSAGE_TEXT = 'No se puede modificar la fecha de creación';
  END IF;
END$$

DELIMITER ;

-- EVENTO QUE LANZA EL TRIGGER

UPDATE Alumno SET fecha_creacion0 = '2025-05-30 16:45:15' WHERE id_alumno = 1;
--------------------------------------------------------------------------------
Explicación:

Se ejecuta antes de un UPDATE.

Compara el valor nuevo NEW.fecha_creacion con el original OLD.fecha_creacion.

Si hay cambio, lanza un error con mensaje personalizado y cancela la operación.

Esto protege la integridad de la fecha de creación para que no se altere.
--------------------------------------------------------------------------------
****************
***   0005   ***
****************
--------------------------------------------------------------------------------
Crea  la  tabla  Alumno  y  el  trigger combinado para proteger fecha_creacion y 
actualizar fecha_modificacion:
--------------------------------------------------------------------------------
CREATE TABLE Alumno (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    dni CHAR(8) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    edad INT CHECK (edad >= 0 AND edad < 150),
    sexo ENUM('M', 'F') NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    estatura DECIMAL(4,2) CHECK (estatura > 0 AND estatura <= 3.00),
    casado VARCHAR(8) NOT NULL CHECK (casado IN ('VERDADERO', 'FALSO')),
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8
  COLLATE=utf8_general_ci;
--------------------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_update_fecha_modificacion_y_protege_fecha_creacion
BEFORE UPDATE ON Alumno
FOR EACH ROW
BEGIN
  IF NEW.fecha_creacion <> OLD.fecha_creacion THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede modificar la fecha de creación';
  END IF;

  SET NEW.fecha_modificacion = CURRENT_TIMESTAMP;
END$$

DELIMITER ;
--------------------------------------------------------------------------------
Explicación:

Primero valida que fecha_creacion no cambie, si cambia lanza error y cancela el UPDATE.

Luego actualiza fecha_modificacion con el timestamp actual.

Todo sucede antes de la actualización.

Si usas este trigger, te recomiendo que en la definición de la tabla  no  pongas 
ON UPDATE CURRENT_TIMESTAMP en fecha_modificacion para evitar conflictos.

Resumen:

fecha_creacion se establece al insertar y no puede modificarse.

fecha_modificacion se actualiza automáticamente cada vez que se actualiza un registro.

Restricciones para edad, estatura y casado.

dni único y no nulo.
--------------------------------------------------------------------------------
UPDATE Alumno
SET nombre = 'Nuevo Nombre',
    edad = 25
WHERE id_alumno = 1;
--------------------------------------------------------------------------------
Qué pasa:

Se cambia el nombre y la edad del alumno con id_alumno = 1.

El trigger se ejecuta antes del UPDATE:

Verifica que fecha_creacion no se modifique (no lo toques en el UPDATE).

Actualiza fecha_modificacion con el timestamp actual automáticamente.
--------------------------------------------------------------------------------
Ejemplo que lanza error si intentas modificar fecha_creacion:

UPDATE Alumno
SET fecha_creacion = '2020-01-01 00:00:00'
WHERE id_alumno = 1;

Esto fallará con el mensaje:

No se puede modificar la fecha de creación
--------------------------------------------------------------------------------
-- Insertar datos iniciales
INSERT INTO Alumno (dni, nombre, edad, sexo, fecha_nacimiento, estatura, casado)
VALUES
('12345678', 'Juan Pérez', 22, 'M', '2002-05-15', 1.75, 'FALSO'),
('87654321', 'Ana Gómez', 30, 'F', '1994-08-10', 1.65, 'VERDADERO');

-- Actualizar un registro (dispara el trigger y actualiza fecha_modificacion)
UPDATE Alumno
SET nombre = 'Juan P. López',
    edad = 23
WHERE dni = '12345678';
--------------------------------------------------------------------------------
Qué pasa:

Se insertan dos alumnos con todos los datos requeridos.

Al hacer el UPDATE, el trigger actualiza fecha_modificacion automáticamente.

Si intentas modificar fecha_creacion en un UPDATE, el trigger lanzará error.
--------------------------------------------------------------------------------
****************
***   0006   ***   MYSQL A ORACLE
****************
--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------
CREATE TABLE Alumno (
    id_alumno           NUMBER                              GENERATED BY DEFAULT ON NULL AS IDENTITY       PRIMARY KEY,
    nombre              VARCHAR2(100)    NOT NULL,
    edad0               NUMBER           NOT NULL,
    edad1               NUMBER           NOT NULL           CHECK (edad1 >= 0),
    edad2               NUMBER           NOT NULL           CHECK (edad2 >= 0 AND edad2 < 150),
	sexo                CHAR(1)          NOT NULL           CHECK (sexo IN ('M', 'F')),
    fecha_nacimiento    DATE             NOT NULL,
    estatura0           NUMBER(4,2)      NOT NULL,
    estatura1           NUMBER(4,2)      NOT NULL           CHECK (estatura1 > 0 AND estatura1 <= 3.00),
    casado0             NUMBER(1)        NOT NULL           CHECK (casado0 IN (0, 1)),
    casado1             VARCHAR2(9)      NOT NULL           CHECK (casado1 IN ('VERDADERO', 'FALSO')),
    fecha_creacion      TIMESTAMP                           DEFAULT CURRENT_TIMESTAMP, -- Si se pone NOT NULL salta error
    fecha_modificacion  TIMESTAMP                           DEFAULT CURRENT_TIMESTAMP, -- Si se pone NOT NULL salta error
    dni                 CHAR(8)          NOT NULL           UNIQUE
);

-- Registro 1
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Juan Pérez', 20, 20, 20, 'M', TO_DATE('2003-05-15', 'YYYY-MM-DD'), 1.75, 1.75, 0, 'FALSO', '12345678');

-- Registro 2
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('María García', 22, 22, 22, 'F', TO_DATE('2001-08-22', 'YYYY-MM-DD'), 1.65, 1.65, 1, 'VERDADERO', '23456789');

-- Registro 3
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Carlos López', 19, 19, 19, 'M', TO_DATE('2004-02-10', 'YYYY-MM-DD'), 1.80, 1.80, 0, 'FALSO', '34567890');

-- Registro 4
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Ana Martínez', 21, 21, 21, 'F', TO_DATE('2002-11-30', 'YYYY-MM-DD'), 1.70, 1.70, 0, 'FALSO', '45678901');

-- Registro 5
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Luis Rodríguez', 23, 23, 23, 'M', TO_DATE('2000-07-05', 'YYYY-MM-DD'), 1.78, 1.78, 1, 'VERDADERO', '56789012');

-- Registro 6
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Sofía Sánchez', 18, 18, 18, 'F', TO_DATE('2005-04-18', 'YYYY-MM-DD'), 1.62, 1.62, 0, 'FALSO', '67890123');

-- Registro 7
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Pedro Gómez', 24, 24, 24, 'M', TO_DATE('1999-09-25', 'YYYY-MM-DD'), 1.85, 1.85, 0, 'FALSO', '78901234');

-- Registro 8
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Laura Díaz', 20, 20, 20, 'F', TO_DATE('2003-01-12', 'YYYY-MM-DD'), 1.68, 1.68, 0, 'FALSO', '89012345');

-- Registro 9
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Jorge Ruiz', 22, 22, 22, 'M', TO_DATE('2001-06-08', 'YYYY-MM-DD'), 1.77, 1.77, 1, 'VERDADERO', '90123456');

-- Registro 10
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Elena Castro', 19, 19, 19, 'F', TO_DATE('2004-03-21', 'YYYY-MM-DD'), 1.63, 1.63, 0, 'FALSO', '01234567');

-- Registro 11
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Miguel Torres', 25, 25, 25, 'M', TO_DATE('1998-12-03', 'YYYY-MM-DD'), 1.82, 1.82, 1, 'VERDADERO', '11223344');

-- Registro 12
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Isabel Ramírez', 21, 21, 21, 'F', TO_DATE('2002-10-17', 'YYYY-MM-DD'), 1.69, 1.69, 0, 'FALSO', '22334455');

-- Registro 13
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Fernando Herrera', 20, 20, 20, 'M', TO_DATE('2003-07-29', 'YYYY-MM-DD'), 1.76, 1.76, 0, 'FALSO', '33445566');

-- Registro 14
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Carmen Flores', 22, 22, 22, 'F', TO_DATE('2001-04-14', 'YYYY-MM-DD'), 1.64, 1.64, 1, 'VERDADERO', '44556677');

-- Registro 15
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Ricardo Mendoza', 18, 18, 18, 'M', TO_DATE('2005-08-07', 'YYYY-MM-DD'), 1.79, 1.79, 0, 'FALSO', '55667788');

-- Registro 16
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Patricia Vega', 23, 23, 23, 'F', TO_DATE('2000-02-28', 'YYYY-MM-DD'), 1.67, 1.67, 0, 'FALSO', '66778899');

-- Registro 17
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Oscar Rojas', 24, 24, 24, 'M', TO_DATE('1999-11-09', 'YYYY-MM-DD'), 1.83, 1.83, 1, 'VERDADERO', '77889900');

-- Registro 18
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Teresa Guzmán', 19, 19, 19, 'F', TO_DATE('2004-05-20', 'YYYY-MM-DD'), 1.71, 1.71, 0, 'FALSO', '88990011');

-- Registro 19
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Hugo Silva', 21, 21, 21, 'M', TO_DATE('2002-09-13', 'YYYY-MM-DD'), 1.81, 1.81, 0, 'FALSO', '99001122');

-- Registro 20
INSERT INTO Alumno (nombre, edad0, edad1, edad2, sexo, fecha_nacimiento, estatura0, estatura1, casado0, casado1, dni)
VALUES ('Diana Morales', 20, 20, 20, 'F', TO_DATE('2003-06-24', 'YYYY-MM-DD'), 1.66, 1.66, 1, 'VERDADERO', '00112233');
--------------------------------------------------------------------------------