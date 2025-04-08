-- MOSTRAR EL CAMPO NOMBRE DE CLIENTE PARA LA TABLA TRANSACTION

SELECT t.transaction_id, t.book_id, t.client_id, c.name
FROM Client c
JOIN Transaction t ON c.client_id = t.client_id;

+----------------+---------+-----------+---------------------+
| transaction_id | book_id | client_id | name                |
+----------------+---------+-----------+---------------------+
|              1 |       1 |         1 | Maria Dolores Gomez |
|              2 |       2 |         1 | Maria Dolores Gomez |
|              3 |       3 |         2 | Adrian Fernandez    |
|              4 |       4 |         2 | Adrian Fernandez    |
|              5 |       5 |         3 | Maria Luisa Marin   |
|              6 |       6 |         3 | Maria Luisa Marin   |
|              7 |       7 |         4 | Pedro Sanchez       |
|              8 |       8 |         4 | Pedro Sanchez       |
|              9 |       9 |         5 | Pablo Saavedra      |
|             10 |      10 |         5 | Pablo Saavedra      |
|             11 |      11 |         6 | Marta Carrillo      |
|             12 |      12 |         6 | Marta Carrillo      |
|             13 |      13 |         7 | Javier Barrio       |
|             14 |      14 |         7 | Javier Barrio       |
|             15 |      15 |         8 | Milagros Garcia     |
|             16 |      16 |         8 | Milagros Garcia     |
|             17 |      17 |         9 | Carlos Quiros       |
|             18 |      18 |         9 | Carlos Quiros       |
|             19 |      19 |        10 | Carmen De la Torre  |
|             20 |      20 |        10 | Carmen De la Torre  |
+----------------+---------+-----------+---------------------+

-- CONTAR EL NUMERO DE TRANSACCIONES HECHAS POR CADA CLIENTE

SELECT c.name, COUNT(*)
FROM Client c
JOIN Transaction t ON c.client_id = t.client_id
GROUP BY c.name
ORDER BY c.name;

+---------------------+----------+
| name                | COUNT(*) |
+---------------------+----------+
| Adrian Fernandez    |        2 |
| Carlos Quiros       |        2 |
| Carmen De la Torre  |        2 |
| Javier Barrio       |        2 |
| Maria Dolores Gomez |        2 |
| Maria Luisa Marin   |        2 |
| Marta Carrillo      |        2 |
| Milagros Garcia     |        2 |
| Pablo Saavedra      |        2 |
| Pedro Sanchez       |        2 |
+---------------------+----------+

-- TIPOS DE TRIGGER

BEFORE/AFTER  --- INSERT/UPDATE/DELETE

-- EVITAR EL INSERT DE UN CLIENTE CON UN EMAIL QUE NO CONTENGA @

DELIMITER $$
CREATE TRIGGER before_insert_email_no_contiene_arroba
BEFORE INSERT ON Client
FOR EACH ROW
BEGIN
	 IF NEW.email NOT LIKE '%@%' THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El email debe contener un @';
	 END IF;
END$$
DELIMITER ;

DESCRIBE CLIENT;

INSERT INTO Client(name, email, birthdate, gender) VALUES
('Luis Jauregue','luis#gmail.com','2000-01-01','M');

-- GRABAR EN UN ARCHIVO LOG INFORMACION DE LA FECHA Y USUARIO
-- QUE CREEO EL CLIENTE

CREATE TABLE LOG_CLIENT(
   id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
   id_client      INT,
   fecha_creacion TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
   usuario        VARCHAR(30)
);

DELIMITER ##
CREATE TRIGGER after_insert_log_client
AFTER INSERT ON Client
FOR EACH ROW
BEGIN
     INSERT INTO LOG_CLIENT(id_client,usuario) VALUES
	 (NEW.client_id,CURRENT_USER());
END##
DELIMITER ;

INSERT INTO Client(name, email, birthdate, gender) VALUES
('Arturo Alva','arturo@gmail.com','2000-01-01','M');

DESCRIBE CLIENT;

SELECT * FROM LOG_CLIENT;

-- BEFORE UPDATE

ALTER TABLE Client ADD fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

DELIMITER //
CREATE TRIGGER before_update_fecha_actualizacion
BEFORE UPDATE ON Client
FOR EACH ROW
BEGIN
	SET NEW.fecha_actualizacion = NOW();
END//
DELIMITER ;

UPDATE FROM Client SET birthdate = '1999-01-01' WHERE client_id = 101;














