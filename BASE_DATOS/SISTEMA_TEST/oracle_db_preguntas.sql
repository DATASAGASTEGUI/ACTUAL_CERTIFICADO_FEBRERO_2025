-- ----------------
-- CREAR EL USUARIO
-- ----------------

DROP USER DB_PREGUNTAS CASCADE;
CREATE USER DB_PREGUNTAS IDENTIFIED BY 12345678;
GRANT CONNECT,RESOURCE,dba TO DB_PREGUNTAS;
GRANT UNLIMITED TABLESPACE TO DB_PREGUNTAS;
ALTER PROFILE DEFAULT LIMIT PASSWORD_REUSE_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

ALTER USER DB_PREGUNTAS ACCOUNT UNLOCK;
CONNECT DB_PREGUNTAS/12345678@LOCALHOST:1521/XEPDB1
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- ----------------------
-- CREAR LA BASE DE DATOS
-- ----------------------

-- Creación de la tabla de preguntas
CREATE TABLE preguntas (
    id_pregunta        NUMBER                  PRIMARY KEY,
    texto_pregunta     VARCHAR2(500) NOT NULL,
    respuesta_correcta NUMBER(1)     NOT NULL
);

-- Creación de la tabla de opciones
CREATE TABLE opciones (
    id_opcion     NUMBER                  PRIMARY KEY,
    id_pregunta   NUMBER        NOT NULL,
    texto_opcion  VARCHAR2(300) NOT NULL,
    numero_opcion NUMBER(1)     NOT NULL,
    CONSTRAINT fk_pregunta FOREIGN KEY (id_pregunta) REFERENCES preguntas(id_pregunta)
);

-- Secuencia para autoincrementar IDs
CREATE SEQUENCE seq_preguntas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_opciones START WITH 1 INCREMENT BY 1;

-- Insertar preguntas
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (1, '¿Qué tipo de software es Oracle Database?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (2, '¿Cuál es el lenguaje principal para interactuar con Oracle Database?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (3, '¿Qué componente de Oracle permite la ejecución de procedimientos almacenados?', 1);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (4, '¿Qué comando se usa para crear una tabla en Oracle?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (5, '¿Qué extensión tienen habitualmente los archivos de control en Oracle?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (6, '¿Cuál es el comando para eliminar una tabla?', 1);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (7, '¿Qué comando sirve para otorgar privilegios a un usuario?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (8, '¿Qué archivo contiene parámetros de inicialización en Oracle?', 1);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (9, '¿Cuál es el nombre del lenguaje procedural extendido de SQL en Oracle?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (10, '¿Qué tipo de backup permite recuperar una base de datos hasta un punto específico?', 4);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (11, '¿Qué comando se usa para revocar permisos?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (12, '¿Qué tabla contiene información sobre todas las tablas del usuario?', 1);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (13, '¿Qué vista muestra las sesiones activas en Oracle?', 1);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (14, '¿Qué comando se usa para finalizar una transacción?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (15, '¿Cuál de estos no es un tipo de dato en Oracle?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (16, '¿Cuál es la herramienta gráfica de Oracle para administración?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (17, '¿Cuál es el nombre del archivo de configuración de Oracle Listener?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (18, '¿Qué comando PL/SQL se usa para manejar errores?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (19, '¿Cuál es la función de ROWNUM en Oracle?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (20, '¿Qué objeto sirve para automatizar tareas en Oracle?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (21, '¿Qué significa DML?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (22, '¿Cuál no es una instrucción DML?', 1);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (23, '¿Cuál es el usuario por defecto de Oracle?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (24, '¿Qué hace el comando ROLLBACK?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (25, '¿Cómo se llama el archivo que contiene los nombres de red de Oracle?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (26, '¿Qué comando se usa para cambiar el valor de una columna?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (27, '¿Qué significa DDL?', 1);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (28, '¿Cuál es un ejemplo de comando DDL?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (29, '¿Qué es un "tablespace"?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (30, '¿Cómo se llama el motor de transacciones de Oracle?', 4);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (31, '¿Qué hace el comando DESCRIBE en SQL*Plus?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (32, '¿Qué tipo de clave identifica de forma única cada fila?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (33, '¿Qué comando se usa para crear una vista?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (34, '¿Qué operador se usa para concatenar cadenas en Oracle?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (35, '¿Qué palabra clave se usa para ordenar resultados?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (36, '¿Cuál es el valor por defecto de una columna si no se especifica ninguno?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (37, '¿Qué función devuelve la fecha actual?', 4);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (38, '¿Qué cláusula limita el número de resultados?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (39, '¿Qué palabra se usa para agrupar resultados?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (40, '¿Cuál es el máximo número de columnas que puede tener una tabla en Oracle 19c?', 4);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (41, '¿Qué función se usa para contar filas?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (42, '¿Qué significa el error ORA-00942?', 1);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (43, '¿Qué vista muestra todos los índices de una tabla?', 1);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (44, '¿Cuál es el formato de fecha por defecto en Oracle?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (45, '¿Qué operador se usa para comprobar si un valor está en una lista?', 3);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (46, '¿Qué significa el acrónimo RAC en Oracle?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (47, '¿Qué herramienta se usa para clonar bases de datos en Oracle?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (48, '¿Qué comando se usa para cambiar la contraseña de un usuario?', 2);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (49, '¿Qué comando sirve para finalizar una sesión en SQL*Plus?', 4);
INSERT INTO preguntas (id_pregunta, texto_pregunta, respuesta_correcta) VALUES (50, '¿Qué extensión suelen tener los datafiles en Oracle?', 3);

-- Insertar opciones para cada pregunta
-- Pregunta 1
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (1, 1, 'Sistema Operativo', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (2, 1, 'Sistema de Gestión de Base de Datos', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (3, 1, 'Editor de texto', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (4, 1, 'Navegador Web', 4);

-- Pregunta 2
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (5, 2, 'Python', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (6, 2, 'Java', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (7, 2, 'SQL', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (8, 2, 'HTML', 4);

-- Pregunta 3
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (9, 3, 'PL/SQL', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (10, 3, 'JavaScript', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (11, 3, 'HTML', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (12, 3, 'Bash', 4);

-- Pregunta 4
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (13, 4, 'MAKE TABLE', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (14, 4, 'CREATE TABLE', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (15, 4, 'INIT TABLE', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (16, 4, 'NEW TABLE', 4);

-- Pregunta 5
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (17, 5, '.dbf', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (18, 5, '.ctl', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (19, 5, '.ora', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (20, 5, '.log', 4);

-- Pregunta 6
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (21, 6, 'DROP TABLE', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (22, 6, 'REMOVE TABLE', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (23, 6, 'DELETE TABLE', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (24, 6, 'ERASE TABLE', 4);

-- Pregunta 7
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (25, 7, 'ALLOW', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (26, 7, 'PERMIT', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (27, 7, 'GRANT', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (28, 7, 'GIVE', 4);

-- Pregunta 8
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (29, 8, 'init.ora', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (30, 8, 'conf.ini', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (31, 8, 'dbconfig.xml', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (32, 8, 'start.ctl', 4);

-- Pregunta 9
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (33, 9, 'T-SQL', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (34, 9, 'SQL+', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (35, 9, 'PL/SQL', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (36, 9, 'MySQL', 4);

-- Pregunta 10
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (37, 10, 'Cold Backup', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (38, 10, 'Hot Backup', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (39, 10, 'Full Backup', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (40, 10, 'Point-in-Time Recovery', 4);

-- Pregunta 11
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (41, 11, 'REMOVE', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (42, 11, 'REVOKE', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (43, 11, 'CANCEL', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (44, 11, 'UNGRANT', 4);

-- Pregunta 12
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (45, 12, 'USER_TABLES', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (46, 12, 'ALL_USERS', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (47, 12, 'DBA_DATAFILES', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (48, 12, 'TABLE_INFO', 4);

-- Pregunta 13
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (49, 13, 'V$SESSION', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (50, 13, 'V$USER', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (51, 13, 'SESSION_INFO', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (52, 13, 'SYS.SESSIONS', 4);

-- Pregunta 14
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (53, 14, 'EXIT', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (54, 14, 'FINISH', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (55, 14, 'COMMIT', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (56, 14, 'SAVE', 4);

-- Pregunta 15
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (57, 15, 'VARCHAR2', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (58, 15, 'NUMBER', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (59, 15, 'BOOLEAN', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (60, 15, 'DATE', 4);

-- Pregunta 16
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (61, 16, 'SQL Server Management', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (62, 16, 'SQL Developer', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (63, 16, 'MySQL Workbench', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (64, 16, 'Oracle Navigator', 4);

-- Pregunta 17
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (65, 17, 'listener.conf', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (66, 17, 'tnsnames.ora', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (67, 17, 'listener.ora', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (68, 17, 'init.ora', 4);

-- Pregunta 18
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (69, 18, 'TRY...CATCH', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (70, 18, 'ON ERROR', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (71, 18, 'EXCEPTION', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (72, 18, 'CATCH', 4);

-- Pregunta 19
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (73, 19, 'Cuenta filas duplicadas', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (74, 19, 'Devuelve el ID del usuario', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (75, 19, 'Devuelve el número de fila', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (76, 19, 'Suma todas las filas', 4);

-- Pregunta 20
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (77, 20, 'Cronjob', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (78, 20, 'Event', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (79, 20, 'Trigger', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (80, 20, 'Hook', 4);

-- Pregunta 21
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (81, 21, 'Data Management Language', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (82, 21, 'Data Migration Language', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (83, 21, 'Data Manipulation Language', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (84, 21, 'Database Management Layer', 4);

-- Pregunta 22
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (85, 22, 'SELECT', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (86, 22, 'INSERT', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (87, 22, 'DELETE', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (88, 22, 'UPDATE', 4);

-- Pregunta 23
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (89, 23, 'ROOT', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (90, 23, 'SYSTEM', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (91, 23, 'ADMIN', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (92, 23, 'SA', 4);

-- Pregunta 24
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (93, 24, 'Guarda los cambios', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (94, 24, 'Elimina una tabla', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (95, 24, 'Cancela los cambios', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (96, 24, 'Reinicia la base de datos', 4);

-- Pregunta 25
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (97, 25, 'oracle.ora', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (98, 25, 'dbnet.ini', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (99, 25, 'tnsnames.ora', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (100, 25, 'connect.xml', 4);

-- Pregunta 26
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (101, 26, 'MODIFY', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (102, 26, 'UPDATE', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (103, 26, 'SET', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (104, 26, 'CHANGE', 4);

-- Pregunta 27
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (105, 27, 'Data Definition Language', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (106, 27, 'Database Driver Layer', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (107, 27, 'Data Delete Language', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (108, 27, 'Direct Data Load', 4);

-- Pregunta 28
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (109, 28, 'SELECT', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (110, 28, 'INSERT', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (111, 28, 'CREATE', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (112, 28, 'DELETE', 4);

-- Pregunta 29
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (113, 29, 'Un tipo de tabla', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (114, 29, 'Una partición de disco', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (115, 29, 'Un área de almacenamiento lógico', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (116, 29, 'Un esquema', 4);

-- Pregunta 30
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (117, 30, 'InnoDB', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (118, 30, 'OracleDB', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (119, 30, 'ASM', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (120, 30, 'Undo/Redo', 4);

-- Pregunta 31
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (121, 31, 'Elimina una tabla', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (122, 31, 'Muestra estructura de la tabla', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (123, 31, 'Borra los datos', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (124, 31, 'Exporta la tabla', 4);

-- Pregunta 32
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (125, 32, 'Clave secundaria', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (126, 32, 'Clave foránea', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (127, 32, 'Clave primaria', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (128, 32, 'Clave de búsqueda', 4);

-- Pregunta 33
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (129, 33, 'CREATE WINDOW', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (130, 33, 'CREATE VIEW', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (131, 33, 'MAKE VIEW', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (132, 33, 'NEW VIEW', 4);

-- Pregunta 34
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (133, 34, '+', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (134, 34, '&', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (135, 34, '||', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (136, 34, 'CONCAT', 4);

-- Pregunta 35
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (137, 35, 'ORDER', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (138, 35, 'SORT', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (139, 35, 'ORDER BY', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (140, 35, 'GROUP', 4);

-- Pregunta 36
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (141, 36, '0', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (142, 36, 'NULL', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (143, 36, '''''', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (144, 36, 'DEFAULT', 4);

-- Pregunta 37
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (145, 37, 'TODAY()', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (146, 37, 'GETDATE()', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (147, 37, 'NOW()', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (148, 37, 'SYSDATE', 4);

-- Pregunta 38
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (149, 38, 'LIMIT', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (150, 38, 'TOP', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (151, 38, 'ROWNUM', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (152, 38, 'OFFSET', 4);

-- Pregunta 39
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (153, 39, 'SORT BY', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (154, 39, 'GROUP BY', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (155, 39, 'ORDER BY', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (156, 39, 'COLLECT', 4);

-- Pregunta 40
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (157, 40, '100', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (158, 40, '255', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (159, 40, '1000', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (160, 40, '4096', 4);

-- Pregunta 41
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (161, 41, 'SUM()', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (162, 41, 'COUNT()', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (163, 41, 'LENGTH()', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (164, 41, 'TOTAL()', 4);

-- Pregunta 42
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (165, 42, 'Tabla o vista no existe', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (166, 42, 'Error de conexión', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (167, 42, 'Usuario inválido', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (168, 42, 'Dispositivo lleno', 4);

-- Pregunta 43
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (169, 43, 'USER_INDEXES', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (170, 43, 'ALL_INDICES', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (171, 43, 'DBA_INDEX', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (172, 43, 'TABLE_INDEX', 4);

-- Pregunta 44
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (173, 44, 'DD-MM-YYYY', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (174, 44, 'MM/DD/YYYY', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (175, 44, 'DD-MON-YY', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (176, 44, 'YYYY-MM-DD', 4);

-- Pregunta 45
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (177, 45, '=', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (178, 45, 'MATCH', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (179, 45, 'IN', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (180, 45, 'ANY', 4);

-- Pregunta 46
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (181, 46, 'Redundant Access Control', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (182, 46, 'Real Application Clusters', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (183, 46, 'Rapid Access Connection', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (184, 46, 'Remote Administration Console', 4);

-- Pregunta 47
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (185, 47, 'Oracle Dump', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (186, 47, 'RMAN', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (187, 47, 'TNS Admin', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (188, 47, 'Oracle Replicator', 4);

-- Pregunta 48
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (189, 48, 'CHANGE PASSWORD', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (190, 48, 'ALTER USER', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (191, 48, 'SET PASSWORD', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (192, 48, 'UPDATE USER', 4);

-- Pregunta 49
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (193, 49, 'STOP', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (194, 49, 'END', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (195, 49, 'DISCONNECT', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (196, 49, 'EXIT', 4);

-- Pregunta 50
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (197, 50, '.ora', 1);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (198, 50, '.sql', 2);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (199, 50, '.dbf', 3);
INSERT INTO opciones (id_opcion, id_pregunta, texto_opcion, numero_opcion) VALUES (200, 50, '.log', 4);

COMMIT;