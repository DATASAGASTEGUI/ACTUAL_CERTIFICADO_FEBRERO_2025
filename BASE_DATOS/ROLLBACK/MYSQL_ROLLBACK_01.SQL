****************
***   0001   ***   BASE DE DATOS
****************

-- Borrar la base de datos
DROP DATABASE  IF EXISTS BDTRANSACCIONES;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS BDTRANSACCIONES;

-- Usar la base de datos
USE BDTRANSACCIONES;

-- Crear la tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente INT                  PRIMARY KEY,
    nombre     VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL
);

****************
***   0002   ***
****************

-- -----------------------------------------------------------------------------
Te daré un ejemplo paso a paso de cómo usar COMMIT y ROLLBACK en una transacción 
en MySQL. Vamos a simular una operación de inserción  de  datos  y  cómo podrías 
revertirla si algo sale mal.
-- -----------------------------------------------------------------------------
Contexto:

Supongamos  que  estamos  trabajando  con  una base de datos que tiene una tabla 
llamada Clientes con los siguientes campos:

id_cliente
nombre
email
-- -----------------------------------------------------------------------------
Paso a paso

1. Iniciar una transacción: Comenzamos  la  transacción  para asegurarnos de que 
   las operaciones que realizamos puedan confirmarse o revertirse en bloque.

START TRANSACTION;

2. Insertar un registro en  la  tabla  Clientes: Realizamos  una inserción de un 
   nuevo cliente.

INSERT INTO Clientes (id_cliente, nombre, email) 
VALUES (1, 'Juan Perez', 'juan.perez@email.com');

3. Verificar  el  estado  de  la  transacción: Después  de la inserción, podrías 
   verificar si todo salió bien con una consulta:

SELECT * FROM Clientes WHERE id_cliente = 1;

4. Realizar una segunda operación (opcional): Supongamos que ahora insertamos un 
   segundo cliente.

INSERT INTO Clientes (id_cliente, nombre, email) 
VALUES (2, 'Maria Gomez', 'maria.gomez@email.com');

5. Verificar el segundo estado: Revisamos si la segunda inserción fue correcta:

SELECT * FROM Clientes WHERE id_cliente = 2;

6. Confirmar (COMMIT) la transacción: Si todas  las  operaciones  se  realizaron 
   correctamente y quieres confirmar los cambios, ejecuta:

COMMIT;

6. Revertir (ROLLBACK) en caso de error: Si en algún punto ocurre un error, como 
   un   fallo   en   una  inserción  o una validación, puedes deshacer todas las
   operaciones realizadas desde el inicio de la transacción con:

ROLLBACK; 
-- -----------------------------------------------------------------------------
-- EJEMPLO COMPLETO:

START TRANSACTION;

INSERT INTO Clientes (id_cliente, nombre, email) 
VALUES (1, 'Juan Perez', 'juan.perez@email.com');

INSERT INTO Clientes (id_cliente, nombre, email) 
VALUES (2, 'Maria Gomez', 'maria.gomez@email.com');

-- Si todo está bien:
COMMIT;

-- Si algo sale mal (por ejemplo, un error en la segunda inserción):

ROLLBACK;

-- NOTAS:

COMMIT: Confirma los cambios en la base de datos, haciendo  que las  operaciones 
        realizadas en la transacción sean permanentes.
		
ROLLBACK: Revierte todos los cambios hechos en la transacción hasta  ese  punto, 
          dejándolo como estaba antes de iniciar la transacción.
		  
Recuerda que las transacciones  son  útiles cuando  necesitas  asegurar  que  un 
conjunto de operaciones se realicen de manera atómica, es decir, todas o ninguna 
se deben completar con éxito. 
-- -----------------------------------------------------------------------------
¿QUE SUCEDE CUANDO EJECUTAS ROLLBACK?

Cancela la transacción actual: Revertirá   todas   las operaciones de inserción, 
actualización o eliminación realizadas desde que ejecutaste  START TRANSACTION;.
Anula el "punto de restauración": La   transacción   se   considerará  como   no 
ejecutada, y la base de datos volverá al estado anterior a la transacción.
-- -----------------------------------------------------------------------------
IMPORTANTE

Si ya confirmaste  la  transacción  con  COMMIT,  no  puedes  usar ROLLBACK para 
deshacer esos cambios.

Una vez que usas ROLLBACK, la transacción se cierra, y ya no puedes volver atrás
ni confirmar cambios parciales.
-- -----------------------------------------------------------------------------

****************
***   0003   ***
****************

-- ----------------
-- CREAR BASE DATOS
-- ----------------

-- Borrar la base de datos
DROP DATABASE  IF EXISTS BDTRANSACCIONES;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS BDTRANSACCIONES;

-- Usar la base de datos
USE BDTRANSACCIONES;

-- Crear la tabla Clientes
CREATE TABLE IF NOT EXISTS Cliente (
    id_cliente INT                  PRIMARY KEY,
    nombre     VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL
)ENGINE = InnoDB;

-- ----------------------
-- REALIZAR TRANSACCION 1
-- ----------------------

START TRANSACTION;

INSERT INTO Cliente (id_cliente, nombre, email) 
VALUES (1, 'Juan Perez', 'juan.perez@email.com');

INSERT INTO Cliente (id_cliente, nombre, email) 
VALUES (2, 'Maria Gomez', 'maria.gomez@email.com');

-- Si todo está bien:
COMMIT;

-- Si algo sale mal (por ejemplo, un error en la segunda inserción):

ROLLBACK;

-- ----------------------
-- REALIZAR TRANSACCION 2
-- ----------------------

START TRANSACTION;

UPDATE Cliente SET nombre = 'Carmen Alva', email = 'carmen.alva@email.com' WHERE id_cliente = 2;

-- Si todo está bien:
COMMIT;

-- Si algo sale mal (por ejemplo, un error en la segunda inserción):

ROLLBACK;

-- ---------------------
-- COMPROBAR TRANSACCION
-- ---------------------

SELECT * FROM Cliente;
SELECT @@autocommit; -- 0 no se confirma automaticamente, 1 se confirma automaticamente

SHOW TABLE STATUS WHERE Name = 'Cliente';

SHOW PROCESSLIST;

SHOW ENGINE INNODB STATUS;