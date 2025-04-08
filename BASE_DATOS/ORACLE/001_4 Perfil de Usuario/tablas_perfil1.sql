-- Eliminar el usuario llamado 'PERFIL1'
DROP USER PERFIL1 CASCADE;
-- Crear un nuevo usuario llamado 'PERFIL1' con la contraseña 12345678
CREATE USER PERFIL1 IDENTIFIED BY 12345678;
-- Otorgar privilegios necesarios				
GRANT CONNECT,RESOURCE,DBA TO PERFIL1;					
GRANT UNLIMITED TABLESPACE TO PERFIL1;


-- Eliminar el perfil llamado 'perfilwalter'
DROP PROFILE PERFILWALTER CASCADE; 
-- Crear el perfil llamado 'perfilwalter'						
CREATE PROFILE PERFILWALTER LIMIT PASSWORD_LIFE_TIME 1000;
-- La contraseña no tiene caducidad. Si usaramos un número, por ejemplo que la contraseña dure mas de 1000 días
ALTER PROFILE PERFILWALTER LIMIT PASSWORD_LIFE_TIME UNLIMITED;
-- Se puede reutilizar una contraseña en cualquier momento sin restricciones. Si usaramos un número, por ejemplo que se pueda reutilizar después de 10000 días
ALTER PROFILE PERFILWALTER LIMIT PASSWORD_REUSE_TIME UNLIMITED;
-- Número máximo de intentos de inicio de sesión fallidos antes de bloquear la cuenta
ALTER PROFILE PERFILWALTER LIMIT FAILED_LOGIN_ATTEMPTS 3;
-- Tiempo de bloqueo de la cuenta después de superar los intentos fallidos (en días)
ALTER PROFILE PERFILWALTER LIMIT PASSWORD_LOCK_TIME 1;


-- Listar los perfiles existentes
SELECT PROFILE FROM DBA_PROFILES;
-- Asignar el perfil llamado 'perfilwalter' al usuario llamado 'PERFIL1' 						
ALTER USER PERFIL1 PROFILE PERFILWALTER;	
				

-- Cambiar de sesión al usuario llamado 'PERFIL1'
CONNECT PERFIL1/12345678@LOCALHOST:1521/XEPDB1; 			

-- Configurar el formato fecha para que sea ingresado de esta manera 2023-10-20 
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';		

CREATE TABLE ALUMNO (
   IDALUMNO       CHAR(4)      NOT NULL PRIMARY KEY,
   NOMBRE         VARCHAR2(20) NOT NULL,
   APELLIDO       VARCHAR2(40) NOT NULL,
   EDAD           NUMBER(3)    NOT NULL,
   ESTATURA       NUMBER(3,2)  NOT NULL,
   FECHAMATRICULA DATE         NOT NULL,
   SEXO           CHAR(1)      NOT NULL,
   ESCASADO       NUMBER(1,0)  NOT NULL CHECK (ESCASADO IN (0,1)) -- 1 representa verdadero, 0 representa falso
);

INSERT INTO ALUMNO (IDALUMNO,NOMBRE,APELLIDO,EDAD,ESTATURA,FECHAMATRICULA,SEXO,ESCASADO) VALUES ('A001','Luis','Ruiz',23,1.62,'2023-01-01','H',0);
INSERT INTO ALUMNO (IDALUMNO,NOMBRE,APELLIDO,EDAD,ESTATURA,FECHAMATRICULA,SEXO,ESCASADO) VALUES ('A002','Miguel','Roncal',22,1.72,'2023-01-02','H',1);
INSERT INTO ALUMNO (IDALUMNO,NOMBRE,APELLIDO,EDAD,ESTATURA,FECHAMATRICULA,SEXO,ESCASADO) VALUES ('A003','Carlos','Lescano',21,1.73,'2023-01-03','H',0);
INSERT INTO ALUMNO (IDALUMNO,NOMBRE,APELLIDO,EDAD,ESTATURA,FECHAMATRICULA,SEXO,ESCASADO) VALUES ('A004','Carmen','Alva',20,1.56,'2023-01-02','M',0);
INSERT INTO ALUMNO (IDALUMNO,NOMBRE,APELLIDO,EDAD,ESTATURA,FECHAMATRICULA,SEXO,ESCASADO) VALUES ('A005','María','Jauregui',22,1.68,'2023-01-02','M',1);