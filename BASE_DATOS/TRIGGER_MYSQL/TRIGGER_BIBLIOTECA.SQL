--------------------------------------------------------------------------------
-- BEFORE INSERT

-- Evita insertar una transacción si el book_id no tiene copias disponibles.

DELIMITER $$

CREATE TRIGGER trg_before_insert_transaction
BEFORE INSERT ON transaction
FOR EACH ROW
BEGIN
  DECLARE stock INT;

  SELECT copies INTO stock
  FROM book
  WHERE book_id = NEW.book_id;

  IF stock IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El libro no existe.';
  ELSEIF stock <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No hay copias disponibles del libro.';
  END IF;
END$$
--------------------------------------------------------------------------------
-- BEFORE UPDATE

-- Evita que se cambie el campo email si el cliente está inactivo.

DELIMITER $$

CREATE TRIGGER trg_before_update_client
BEFORE UPDATE ON client
FOR EACH ROW
BEGIN
  IF OLD.active = 0 AND NEW.email != OLD.email THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede cambiar el email de un cliente inactivo.';
  END IF;
END$$

DELIMITER ;

-- BEFORE UPDATE
UPDATE client SET email = 'otro@bloqueado.com' WHERE client_id = 1;
--------------------------------------------------------------------------------
-- AFTER DELETE

-- Aumenta el número de copias del libro si se elimina una transacción finalizada
-- de tipo lend (por ejemplo, préstamo devuelto y se borra registro).

DELIMITER $$

CREATE TRIGGER trg_after_delete_transaction
AFTER DELETE ON transaction
FOR EACH ROW
BEGIN
  IF OLD.finished = 1 AND OLD.type = 'lend' THEN
    UPDATE book
    SET copies = copies + 1
    WHERE book_id = OLD.book_id;
  END IF;
END$$

DELIMITER ;
--------------------------------------------------------------------------------