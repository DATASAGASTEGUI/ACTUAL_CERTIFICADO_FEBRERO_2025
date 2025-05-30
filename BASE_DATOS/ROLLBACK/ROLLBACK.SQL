-- EJEMPLO "SET SQL_SAFE_UPDATES = 0;"

DROP DATABASE IF EXISTS DB_BANCO;
CREATE DATABASE IF NOT EXISTS DB_BANCO;
USE DB_BANCO;

-- SET autocommit = 1;
CREATE TABLE Cuenta(
   id     INT AUTO_INCREMENT PRIMARY KEY,
   nombre VARCHAR(30),
   saldo  DECIMAL(10,2)
);

INSERT INTO Cuenta(nombre,saldo) VALUES
("Ana", 1000),
("Luis", 500);

-- SET autocommit = 0;

-- VERIFICAR: ANTES TRANSACCION

SELECT * FROM Cuenta;

-- REALIZAR TRANSACCION (Ana deposita a Luis 300 euros)
START TRANSACTION;
UPDATE Cuenta SET saldo = saldo - 300 WHERE id = 1;
UPDATE Cuenta SET saldo = saldo + 300 WHERE id = 2;

-- SIMULAR UN ERROR 

-- VERIFICAR: DESPUES TRANSACCION

SELECT * FROM Cuenta;

COMMIT;

ROLLBACK;


