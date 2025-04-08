--------------------------------------------------------------------------------
(1) HOLA MUNDO

SET SERVEROUTPUT ON;

BEGIN
   DBMS_OUTPUT.PUT_LINE('Hola Mundo');
END;
/

(2) HACIENDO USO DE UNA FUNCION

-- CREAR UNA FUNCION

CREATE OR REPLACE FUNCTION sumar_dos_numeros(p_a IN NUMBER, p_b IN NUMBER) RETURN NUMBER
IS
   v_suma NUMBER;
BEGIN
   v_suma := p_a + p_b;
   RETURN v_suma;
END;

-- CREAR UN PROGRAMA PL/SQL

SET SERVEROUTPUT ON;
DECLARE
    v_suma NUMBER;
BEGIN
   v_suma := sumar_dos_numeros(5,6);
   DBMS_OUTPUT.PUT_LINE('Suma: ' || v_suma);
END;
/

(2) ESTRUCTURA CONDICIONAL BINARIO

SET SERVEROUTPUT ON;

DECLARE
   v_numero NUMBER;
BEGIN
   v_numero := 2;
   IF v_numero MOD 2 = 0 THEN
      DBMS_OUTPUT.PUT_LINE('Par');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Impar');
   END IF;
END;
/

(3) ESTRUCTURA CONDICIONAL MULTIPLE

SET SERVEROUTPUT ON;

DECLARE
   v_numero NUMBER;
BEGIN
   v_numero := 2;
   IF v_numero MOD 2 = 0 THEN
      DBMS_OUTPUT.PUT_LINE('Par');
   ELSIF v_numero MOD 2 <> 0 THEN
      DBMS_OUTPUT.PUT_LINE('Impar');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Cero');
   END IF;
END;
/

(4) FUNCION OBTENER LA CUOTA DEL VENDEDOR 104
    PRINCIPAL EVALUA LA CUOTA SI SUPERA O NO LA MEDIA

-- FUNCION

CREATE OR REPLACE FUNCTION obtener_cuota(p_id_vendedor NUMBER) RETURN NUMBER
IS
  v_cuota NUMBER(10,2);
BEGIN
  SELECT cuota INTO v_cuota FROM Vendedor WHERE idVendedor = p_id_vendedor;
  RETURN v_cuota;
END;
/

-- PRINCIPAL

SET SERVEROUTPUT ON;
DECLARE
  v_cuota NUMBER(8,2);
  v_media NUMBER(8,2);
BEGIN
  v_cuota := obtener_cuota(104);
  SELECT AVG(cuota) INTO v_media FROM Vendedor; 
  DBMS_OUTPUT.PUT_LINE('Cuota : ' || v_cuota || '  ' || 'Media : ' || v_media);
  IF v_cuota > v_media THEN
     DBMS_OUTPUT.PUT_LINE('Cuota supera a la media');
  ELSE
     DBMS_OUTPUT.PUT_LINE('Cuota no supera a la media');
  END IF;
END;
/

(5)

CREATE OR REPLACE PROCEDURE p_obtener_alumnos_por_sexo(pi_sexo IN CHAR) 
IS
BEGIN
    FOR registro IN (SELECT * FROM Alumn WHERE sexo = pi_sexo) LOOP
        DBMS_OUTPUT.PUT_LINE(registro.id_alumno || '; ' || registro.nombre);
    END LOOP;
END;
/


SET SERVEROUTPUT ON
BEGIN
    p_obtener_alumnos_por_sexo('H');
END;
/

(6)

-- PROCEDURE

CREATE OR REPLACE PROCEDURE obtener_todos_vendedores_requisito(p_cuota IN NUMBER) 
IS
BEGIN
    FOR registro IN (SELECT * FROM Vendedor WHERE cuota > p_cuota) LOOP
        DBMS_OUTPUT.PUT_LINE(registro.idVendedor || '; ' || registro.nombre);
    END LOOP;
END;
/

-- PRINCIPAL

SET SERVEROUTPUT ON
BEGIN
    obtener_todos_vendedores_requisito(50000);
END;
/

(7) USANDO %ROWTYPE

-- PRINCIPAL

DECLARE
  v_vendedor Vendedor%ROWTYPE;
BEGIN
  SELECT * INTO v_vendedor
  FROM Vendedor
  WHERE idVendedor = 104;

  DBMS_OUTPUT.PUT_LINE('Nombre  : ' || v_vendedor.nombre);
  DBMS_OUTPUT.PUT_LINE('Contrato: ' || v_vendedor.contrato);
  DBMS_OUTPUT.PUT_LINE('Cuota   : ' || v_vendedor.cuota);
END;

(8)

DECLARE
  v_nombre VARCHAR2(20);
  v_contrato DATE;
  v_cuota NUMBER;
BEGIN
  SELECT nombre,contrato,cuota INTO v_nombre,v_contrato,v_cuota
  FROM Vendedor
  WHERE idVendedor = 104;

  DBMS_OUTPUT.PUT_LINE('Nombre  : ' || v_nombre);
  DBMS_OUTPUT.PUT_LINE('Contrato: ' || v_contrato);
  DBMS_OUTPUT.PUT_LINE('Cuota   : ' || v_cuota);
END;

(9) USO %TYPE

DECLARE
  v_nombre Vendedor.nombre%TYPE;
  v_contrato Vendedor.contrato%TYPE;
  v_cuota Vendedor.cuota%TYPE;
BEGIN
  SELECT nombre,contrato,cuota INTO v_nombre,v_contrato,v_cuota
  FROM Vendedor
  WHERE idVendedor = 104;

  DBMS_OUTPUT.PUT_LINE('Nombre  : ' || v_nombre);
  DBMS_OUTPUT.PUT_LINE('Contrato: ' || v_contrato);
  DBMS_OUTPUT.PUT_LINE('Cuota   : ' || v_cuota);
END;
/

(10)

BEGIN
  FOR registro IN (SELECT * FROM Vendedor) LOOP
      DBMS_OUTPUT.PUT_LINE(registro);
  END LOOP
END;
/

(11)

DECLARE
  CURSOR c IS SELECT * FROM Vendedor;
  fila_vendedor c%ROWTYPE;
BEGIN
  OPEN c;
  LOOP
    FETCH c INTO fila_vendedor;
    EXIT WHEN c%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Nombre: ' || fila_vendedor.nombre);
  END LOOP;
  CLOSE c;
END

(12) USO CEL CASE SENTENCIA CONDICIONAL MULTIPLE

DECLARE
  v_grade CHAR(1) := 'B';
  v_result VARCHAR2(20);
BEGIN
  v_result := CASE v_grade
                WHEN 'A' THEN 'Excelente'
                WHEN 'B' THEN 'Bueno'
                WHEN 'C' THEN 'Aceptable'
                ELSE 'Necesita mejorar'
              END;
  DBMS_OUTPUT.PUT_LINE('Resultado: ' || v_result);
END;
/

(13)

SET SERVEROUTPUT ON
DECLARE
  v_nombre VARCHAR2(20);
  v_descripcion VARCHAR2(20);
BEGIN
  SELECT nombre, 
         CASE 
           WHEN edad > 50 THEN 'Maduro'  
           WHEN edad > 30 THEN 'Adulto'  
           ELSE 'Joven'                  
         END 
         INTO v_nombre, v_descripcion
  FROM Vendedor
  WHERE idVendedor = 104;
  
  DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
  DBMS_OUTPUT.PUT_LINE('Descripción: ' || v_descripcion);
END;
/

(14)

-- FUNCTION

CREATE OR REPLACE FUNCTION descripcion_mes(p_contrato DATE) RETURN VARCHAR2
IS
  v_descripcion_mes VARCHAR2(20);
  v_numero_mes VARCHAR(20); 
BEGIN
  v_numero_mes := TO_CHAR(p_contrato, 'MM'); 
  v_descripcion_mes := CASE v_numero_mes 
                          WHEN '01' THEN 'Enero'
                          WHEN '02' THEN 'Febrero'
                          WHEN '03' THEN 'Marzo'
                          WHEN '04' THEN 'Abril'
                          WHEN '05' THEN 'Mayo'
                          WHEN '06' THEN 'Junio'
                          WHEN '07' THEN 'Julio'
                          WHEN '08' THEN 'Agosto'
                          WHEN '09' THEN 'Septiembre'
                          WHEN '10' THEN 'Octubre'
                          WHEN '11' THEN 'Noviembre'
                          WHEN '12' THEN 'Diciembre'
                          ELSE 'Desconocido'
                       END;
    RETURN v_descripcion_mes;
END;
/

-- PRINCIPAL

SET SERVEROUTPUT ON SIZE 1000000
BEGIN
   FOR registro IN (SELECT * FROM Vendedor) LOOP
      DBMS_OUTPUT.PUT_LINE('Mes: ' || descripcion_mes(registro.contrato));
   END LOOP;
END;
/

(15) SE TIENE QUE CALCULAR AL FIN DE MES EL INTERES
     DE CADA CUENTA QUE SE SUMA AL SU SALDO.
	 
CUENTA       MOVIMIENTO
1            1..N
1            1

RELACION DE UNO A MUCHOS

CUENTA: AHORRO    2%   INTERES
        CORRIENTE 0.5% INTERES
		
-- ELIMINAR UN USUARIO CON TODOS SUS OBJETOS (TABLAS, VISTAS, SECUENCIAS ETC) DE PROPIEDAD DEL USUARIO
DROP USER BANCO CASCADE;

-- CREAR UN NUEVO USUARIO CON UNA CONTRASEÑA
CREATE USER BANCO IDENTIFIED BY 12345678;

-- EL ROL CONNECT PERMITE A UN USUARIO INICIAR SESION EN LA BASE DE DATOS
-- EL ROL RESOURCE PERMITE A UN USUARIO PERMISOS PARA CREAR Y MODIFICAR OBJETOS DE ESQUEMA, COMO TABLAS, VISTAS, SECUENCIAS ETC
-- EL ROL DBA OTORGA TODOS LOS PRIVILEGIOS ADMINISTRATIVOS A UN USUARIO
GRANT CONNECT,RESOURCE,DBA TO BANCO;

-- ESTE PRIVILEGIO PERMITE AL USUARIO USAR UN ESPACIO ILIMITADO EN TODOS LOS TABLESPACES DE LA BASE DE DATOS
GRANT UNLIMITED TABLESPACE TO BANCO;

-- MODIFICA EL PERFIL DEFAULT PARA QUE EL PARAMETRO PASSWORD_REUSE_TIME NO TENGA LIMITES. NO HAY RESTRICCIONES DE TIEMPO PARA LA REUTILIZACION DE CONTRASEÑAS
ALTER PROFILE DEFAULT LIMIT PASSWORD_REUSE_TIME UNLIMITED;

-- MODIFICA EL PERFIL DEFAULT PARA QUE EL PARAMETRO PASSWORD_LIFE_TIME NO TENGA LIMITES. LA CONTRASEÑA NUNCA EXPIRA
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

-- DESBLOQUEAR AL USUARIO FACTORIA POR SI ESTUBIERA BLOQUEADO
ALTER USER BANCO ACCOUNT UNLOCK;

-- INICIAR SESION CON EL USUARIO FACTORIA
CONNECT BANCO/12345678@LOCALHOST:1521/XEPDB1

-- CONFIGURAR EL FORMATO DE LA FECHA, COMO DEBE SER INGRESADA EN INSERT
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD'; 

-- DESACTIVAR TEMPORALMENTE LA FUNCION DE SUSTITUCION DE VARIABLE EN TU SESION (&)
SET DEFINE OFF;

-- (1) CREAR TABLA CUENTA

CREATE TABLE Cuenta(
   id_cuenta      NUMBER PRIMARY KEY,
   nombre_cliente VARCHAR2(50),
   tipo_cuenta    VARCHAR2(20), -- AHORRO Ó CORRIENTE
   saldo_cuenta   NUMBER
);

-- (2) CREAR TABLA MOVIMIENTO(TRANSACCION)

CREATE TABLE Movimiento(
   id_movimiento    NUMBER PRIMARY KEY, -- SECUENCIAL
   monto_movimiento NUMBER,
   fecha_movimiento DATE,
   tipo_movimiento  VARCHAR2(20),
   id_cuenta        NUMBER
);

-- INSERTAR DATOS

INSERT INTO CUENTA VALUES(1, 'Carlos García', 'AHORRO', 1000);
INSERT INTO CUENTA VALUES(2, 'Vanessa Jauregui', 'CORRIENTE', 500);
INSERT INTO CUENTA VALUES(3, 'Gerson Rabanal', 'CORRIENTE', 0);

CREATE SEQUENCE sec_movimiento
START WITH 1
INCREMENT BY 1;

-- PROCEDURE
CREATE OR REPLACE PROCEDURE calcular_interes_mensual
IS

BEGIN
   FOR registro IN (SELECT * FROM Cuenta WHERE saldo_cuenta > 0) LOOP
       -- 1. CALCULAR INTERES SEGUN TIPO DE CUENTA
       DECLARE
         v_interes NUMBER(8,5);
       BEGIN
         IF registro.tipo_cuenta = 'AHORRO' THEN
            v_interes := registro.saldo_cuenta * 0.02;
         ELSE
            v_interes := registro.saldo_cuenta * 0.005;
         END IF;
       
       -- 2. ACTUALIZAR SALDO CUENTA
       UPDATE Cuenta
       SET saldo_cuenta = saldo_cuenta + v_interes
       WHERE id_cuenta = registro.id_cuenta;
       -- 3. REGISTRAR MOVIMIENTO(TRANSACCION)
       INSERT INTO Movimiento VALUES(sec_movimiento.NEXTVAL,
       v_interes, SYSDATE, 'Interes', registro.id_cuenta);
       END;
   END LOOP;
   COMMIT;
END;
/

-- PRINCIPAL

BEGIN
  calcular_interes_mensual;
END;

-- VERIFICAR RESULTADO

SELECT * FROM Movimiento;

SELECT * FROM Cuenta;





















CURSOR
DECLARE
  v_nombre Persona.nombre%TYPE;
  v_edad   Persona.edad%TYPE;
  CURSOR c IS
    SELECT nombre, edad FROM Persona WHERE edad BETWEEN 18 AND 30 AND activo = 'S';
BEGIN
  FOR persona IN c LOOP
    v_nombre := persona.nombre;
    v_edad := persona.edad;

    IF v_nombre LIKE 'A%' THEN
      DBMS_OUTPUT.PUT_LINE(v_nombre || ' tiene ' || v_edad || ' años y su nombre empieza con A');
    ELSE
      DBMS_OUTPUT.PUT_LINE(v_nombre || ' tiene ' || v_edad || ' años');
    END IF;
  END LOOP;
END




