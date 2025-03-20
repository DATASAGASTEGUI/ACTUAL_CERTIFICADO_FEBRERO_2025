********************************
***   COMANDOS BASICOS CMD   ***
********************************
-----------------------------------------------------
1. COMANDOS DE NAVEGACIONY ADMINISTRACION DE ARCHIVOS
-----------------------------------------------------
(*) dir: Muestra el contenido de un directorio.

DIR

(*) cd: Cambia de directorio.

CD nombre_del_directorio

(*) Para regresar al directorio anterior:

CD ..

(*) md o mkdir: Crea un nuevo directorio.

MKDIR nombre_del_directorio

(*) rd o rmdir: Elimina un directorio (debe estar vacío).

RMDIR nombre_del_directorio

(*) del: Elimina archivos.

DEL nombre_del_archivo

(*) copy: Copia archivos de un lugar a otro.

COPY origen destino

(*) move: Mueve o renombra archivos.

MOVE origen destino
     RESUMEN PROBANDO

----------------------
2. COMANDOS DE SISTEMA
----------------------

(*) cls: Limpia la pantalla de la terminal.

CLS

(*) exit: Cierra el CMD.

EXIT

(*) echo: Muestra mensajes en la terminal.

ECHO Hola, mundo

(*) tasklist: Lista los procesos en ejecución.

TASKLIST

(*) taskkill: Finaliza un proceso específico.

taskkill /IM nombre_del_proceso.exe /F

(*) systeminfo: Muestra información detallada del sistema.

systeminfo

------------------
3. COMANDOS DE RED
------------------

(*) ipconfig: Muestra la configuración de red del equipo.

ipconfig

(*) Para renovar la dirección IP:

ipconfig /renew

(*) Para liberar la dirección IP:

ipconfig /release

(*) ping: Envía paquetes para comprobar la conectividad con un servidor o dirección IP.

ping google.com

tracert: Rastrea la ruta de paquetes hasta llegar a un servidor o dirección IP.

(*) tracert google.com

netstat: Muestra las conexiones de red activas y los puertos en uso.

netstat

------------------------------------------
4. COMANDOS DE DISCO Y SISTEMA DE ARCHIVOS
------------------------------------------

(*) chkdsk: Revisa un disco en busca de errores y los repara.

chkdsk C:

(*) format: Formatea un disco o partición.

format E:

(*) diskpart: Abre una utilidad para gestionar particiones y discos.

diskpart

(*) sfc /scannow: Escanea y repara archivos de sistema corruptos.

sfc /scannow

---------------------------------
5. COMANDOS DE USUARIO Y PERMISOS
---------------------------------

(*) whoami: Muestra el usuario actualmente conectado.

whoami

(*) net user: Muestra una lista de usuarios en el sistema.

net user

(*) Para agregar un nuevo usuario:

net user nombre_usuario contraseña /add

(*) Para eliminar un usuario:

net user nombre_usuario /delete

------------------------
6. OTROS COMANDOS UTILES
------------------------

(*) shutdown: Apaga o reinicia el sistema.

(*) Para apagar:

shutdown /s

(*) Para reiniciar:

shutdown /r

(*) Para cancelar el apagado:

shutdown /a

(*) cls: Limpia la pantalla del terminal.

cls

--------------------------------
7. COMANDOS DE HISTORIAL Y AYUDA
--------------------------------

(*) doskey /history: Muestra el historial de comandos ingresados en la sesión actual.
			
doskey /history

(*) help: Muestra una lista de todos los comandos disponibles en CMD.

help

**********************
***   EJERCICIOS   ***
**********************
--------------------------------------------------------------------------------
(001) 

ELIMINA TODA LA CARPETA CON SUS SUBCARPETAS Y ARCHIVOS  SIN  ENVIAR AL RECICLAJE
ES DECIR USARLO CON CUIDADO YA NO SE PUEDE RECUPERAR LO BORRADO.
--------------------------------------------------------------------------------
RMDIR /S /Q "C:\ANGULAR\mi-segundo-app"

/S (Subdirectories)

Elimina el directorio especificado junto con todos los archivos y subdirectorios
que contiene.
Si se omite este parámetro, RMDIR solo eliminaría directorios vacíos.

/Q (Quiet mode)

Evita que el sistema pida confirmación antes de eliminar los archivos.
Si no se usa, Windows pedirá confirmación para cada archivo eliminado.
--------------------------------------------------------------------------------
(002) ELIMINAR UN PROCESO POR SU NOMBRE. EJEMPLO NOTEPAD.EXE
--------------------------------------------------------------------------------
TASKKILL /F /IM notepad.exe
--------------------------------------------------------------------------------
(003) ELIMINAR UN PROCESO POR SU PID
--------------------------------------------------------------------------------
TASKKILL /PID 1234 /F
--------------------------------------------------------------------------------
(004) LEVANTAR APLICACIONES
--------------------------------------------------------------------------------
START NOTEPAD
START EXCEL
START CALC
START WORDPAD
START MSPAINT
START EXPLORER
START TASKMGR
START CMD
START CHROME
START POWERSHELL
START MS-SETTINGS:
START MSEDGE
START WINWORD
START POWERPNT
--------------------------------------------------------------------------------
(005) ABRIR UNA URL EN EL NAVEGADOR PREDETERMINADO
--------------------------------------------------------------------------------
START https://www.google.com
--------------------------------------------------------------------------------
(006) ABRIR UNA CARPETA
--------------------------------------------------------------------------------
START C:\MICARPETA
--------------------------------------------------------------------------------
(007) ABRIR UN ARCHIVO ESPECIFICO CON APLICACIONES PREDETERMINADAS
--------------------------------------------------------------------------------
START C:\DOCUMENTOS\archivo.txt
--------------------------------------------------------------------------------
*******************************
***   ARCHIVOS BAT(BATCH)   ***
*******************************

- LEVANTAR UNA CONSOLA CMD

@ECHO OFF
TITLE MI CMD
"C:\Windows\System32\cmd.exe"

- LEVANTAR EXCEL

@ECHO OFF
TITLE MI CMD
"C:\Windows\System32\cmd.exe"
"C:\Program Files\Microsoft Office\Office16\EXCEL.EXE"

- LEVANTAR 100 NOTEPAD.EXE

@ECHO OFF
TITLE PROGRAMA CMD
CLS
ECHO FORMA 1
FOR /L %%i IN (1,1,100) DO (
    START NOTEPAD
)

- ESCRIBIR UN CUADRO DE TEXTO

@ECHO OFF
CLS
TITLE ASCII
CHCP 65001 > NUL
ECHO ┌────────────────────────────────────────┐
ECHO │AUTOR: WALTER ISMAEL SAGASTEGUI LESCANO │
ECHO │FECHA:           19/06/2024             │
ECHO └────────────────────────────────────────┘
PAUSE > NUL

************************
***   EJECUTAR CMD   ***
************************

Sirve para gestionar el sistema operativo a traves de comandos.

- LEVANTAR LA VENTA CMD DE DOS FORMAS

Como usuario
Como administrador

***************************************************
***   CODIGO ASCCI PARA DIBUJAR LINEAS EN CMD   ***
***************************************************

CODIGO ASCII

https://concepto.de/ascii/

        DECIMAL
┌ Alt + 218

└ Alt + 192

┐ Alt + 191

┘ Alt + 217

─ Alt + 196

│ Alt + 179

********************
***   COMANDOS   ***
********************

- CAMBIAR ENTRE CONSOLAS CMD Y POWERSHELL

CMD
POWERSHELL

- LIMPIAR PANTALLA

CLS

- CAMBIAR EL TITULO DE LA VENTANA

TITLE WALTER ISMAEL SAGASTEGUI LESCANO

- INICIAR UN PROGRAMA O UNA PAGINA WEB

start excel
start notepad
start calc
start cmd
start powershell
start www.gmail.com

- AYUDA DE UN COMANDOS

start /?  

- PROMPT 

PROMPT $P$G        (VUELVE AL PROMPT ORIGINAL O POR DEFECTO)   
PROMPT $L$D$G
PROMPT             (VUELVE AL PROMPT ORIGINAL O POR DEFECTO)

PROMPT

Es el comando que cambia la apariencia del prompt en CMD.

$L (Left bracket [)

Muestra un corchete izquierdo [ en el prompt.

$D (Date)

Muestra la fecha actual en el formato configurado en el sistema.

$G (Greater than >)

Muestra el símbolo >, que normalmente indica que el sistema está esperando un comando.

*******************************
***   LECTURA DE UNA RUTA   ***
*******************************

ADMINISTRACION DE EQUIPOS (BUSCARLO EN WINDOWS)

C:\Windows\system32>

C:   					UNIDAD
C:\ 					RAIZ DE LA UNIDAD C
C:\Windows> 		    CARPERTA WINDOWS ESTA EN LA RAIZ DE LA UNIDAD C
C:\Windows\system32>    CARPETA SYSTEM32 ESTA DENTRO DE LA CARPETA WINDOWS Y ESTA SE ENCUENTRA EN LA RAIZ DE LA UNIDAD C

*******************************
***   COLOR DE LA CONSOLA   ***
*******************************

- CAMBIAR DE COLOR

0 = Negro       	8 = Gris
    1 = Azul        9 = Azul claro
    2 = Verde       A = Verde claro
    3 = Aguamarina  B = Aguamarina claro
    4 = Rojo        C = Rojo claro
    5 = Púrpura     D = Púrpura claro
    6 = Amarillo    E = Amarillo claro
    7 = Blanco      F = Blanco brillante
	
COLOR 17    1-> COLOR DE LETRA
            7-> COLOR DE FONDO
	
COLOR       (POR DEFECTO COLOR DE LETRA BLANCO Y FONDO NEGRO)	

*******************************
***   GESTION DE CARPETAS   ***
*******************************

CD    Desplazarnos entre carpetas
RD    Eliminar carpetas
MD    Crear carpetas

MD CIENCIA CIENCIA\MATEMATICA CIENCIA\QUIMICA CIENCIA\FISICA
TREE CIENCIA

- COPIAR CARPETA A OTRA UNIDAD

      ORIGEN  DESTINO
XCOPY CIENCIA D:\CIENCIA /E
PREGUNTA SI ES UN DIRECTORIO. LE DICEN "D"

- MOVER CARPETA A OTRA UNIDAD

MOVE CIENCIA D:\CIENCIA

- ELIMINAR UN ARBOL DE CARPETAS

RD CIENCIA /S

**************************
***   CREAR ARCHIVOS   ***
**************************

- ESCRIBIR MENSAJES EN LA PANTALLA

ECHO HOLA MUNDO

- CREAR UN ARCHIVO CON EL MENSAJE HOLA MUNDO

ECHO HOLA MUNDO > ARCHIVO.TXT            (> DIRECCIONAMIENTO)

- VER CONTENIDO DEL ARCHIVO

TYPE ARCHIVO.TXT

- AÑADIR CONTENIDO A UN ARCHIVO 

ECHO HOLA WALTER >> ARCHIVO.TXT

**********************************
***   OPERADORES COMPARACION   ***
**********************************

OPERADOR	   DESCRIPCION		         EJEMPLO
--------	   -----------		         -------
EQU			IGUAL A			         IF %variable% EQU valor ( ... )
NEQ			DIFERENTE DE 	         IF %variable% NEQ valor ( ... )
GTR			MAYOR QUE 		         IF %variable% GTR valor ( ... )
GEQ			MAYOR O IGUAL A	         IF %variable% GEQ valor ( ... )
LSS			MENOR QUE		         IF %variable% LSS valor ( ... )
LEQ			MENOR O IGUAL A 	     IF %variable% LEQ valor ( ... )

EJEMPLOS
--------

-------------------------------------------------------------------------------
(0) CONDICIONAL BINARIO

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SET /P NUMERO=INGRESE UN NUMERO ENTERO? 
IF %NUMERO% GEQ 0 (
   ECHO EL NUMERO ES POSITIVO.
) ELSE 
   ECHO EL NUMERO ES NEGATIVO.
) 

(1) CONDICIONAL MULTIPLE
    HACER  UN  PROGRAMA  EN  CMD  QUE  PIDA  UN NÚMERO  ENTERO POR TECLADO Y EL
    PROGRAMA DIGA SI ES POSITIVO, NEGATIVO O CERO.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SET /P NUMERO=INGRESE UN NUMERO ENTERO? 
IF %NUMERO% GTR 0 (
   ECHO EL NUMERO ES POSITIVO.
) ELSE IF %NUMERO% equ 0 (
   ECHO EL NUMERO ES CERO.
) ELSE (
   ECHO EL NUMERO ES NEGATIVO.
)
-------------------------------------------------------------------------------
(2) HACER  UN  PROGRAMA  EN  CMD  QUE  PIDA  UN  NÚMERO ENTERO POR TECLADO Y EL
    PROGRAMA DIGA SI ESTA EN EL SIGUIENTE RANGO [10,100].

(*)

@ECHO OFF
REM SOLUCION 1
TITLE PROGRAMA CMD
CLS
SET /P numero=INGRESE UN NUMERO ENTERO? 

IF %numero% LSS 10 (
   ECHO EL NUMERO NO ESTA EN EL RANGO [10, 100].
) ELSE IF %numero% GEQ 10 IF %numero% LEQ 100 (
   ECHO EL NUMERO ESTA EN EL RANGO [10, 100].
) ELSE (
   ECHO EL NUMERO NO ESTA EN EL RANGO [10, 100].
)

(*)

@ECHO OFF
REM SOLUCIO 2
TITLE PROGRAMA CMD
CLS
SET /P numero=INGRESE UN NUMERO ENTERO? 

IF %numero% GEQ 10 (
   IF %numero% LEQ 100 (
      ECHO EL NUMERO ESTA EN EL RANGO [10, 100].
   ) ELSE (
      ECHO EL NUMERO NO ESTA EN EL RANGO [10, 100].
   )
) ELSE (
    ECHO EL NUMERO NO ESTA EN EL RANGO [10, 100].   
)
-------------------------------------------------------------------------------
(3) HACER  UN  PROGRAMA  EN  CMD  QUE  PIDA  UN  NÚMERO ENTERO POR TECLADO Y EL
    PROGRAMA DIGA SI ESTA EN EL SIGUIENTE RANGO ]10,100[.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SET /P numero=INGRESE UN NUMERO ENTERO? 

IF %numero% GTR 10 (
   IF %numero% LSS 100 (
      ECHO EL NUMERO ESTA EN EL RANGO ]10, 100[.
   ) ELSE (
      ECHO EL NUMERO NO ESTA EN EL RANGO ]10, 100[.
   )
) ELSE (
    ECHO EL NUMERO NO ESTA EN EL RANGO ]10, 100[.   
)
-------------------------------------------------------------------------------
(4) HACER  UN  PROGRAMA  EN  CMD  QUE  PIDA  UN  NÚMERO ENTERO POR TECLADO Y EL
    PROGRAMA DIGA SI ESTA EN EL SIGUIENTE RANGO [5, 10] U [20, 30].

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SET /P numero=INGRESE UN NUMERO ENTERO? 

IF %numero% LSS 5 (
   ECHO EL NUMERO NO ESTA EN EL RANGO [5, 10] U [20, 30]
) ELSE IF %numero% GEQ 5 IF %numero% leq 10 (
       ECHO EL NUMERO ESTA EN EL RANGO [5, 10] U [20, 30]
) ELSE IF %numero% GTR 10 IF %numero% LSS 20 (
       ECHO EL NUMERO NO ESTA EN EL RANGO [5, 10] U [20, 30]
) ELSE IF %numero% GEQ 20 IF %numero% LEQ 30 (
       ECHO EL NUMERO ESTA EN EL RANGO [5, 10] U [20, 30]
) ELSE (
       ECHO EL NUMERO NO ESTA EN EL RANGO [5, 10] U [20, 30]
)
-------------------------------------------------------------------------------
******************************
***   OPERADORES LOGICOS   ***
******************************

- EMULAR EL OPERADOR LOGICO AND.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
REM   X>=1 AND X<=6 
SET /P x=Ingrese número entero [1,6]?
IF %x% GEQ 1 (
   IF %x% LEQ 6 (
      ECHO Es un número del dado
   ) ELSE (
     ECHO No es un número del dado
   )
) ELSE (
    ECHO No es un número del dado
)

- EMULAR EL OPERADOR LOGICO OR

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SET /P x=Ingrese número entero ]INF,1[ OR ]6, INF[?
IF %x% LSS 1 (
   ECHO Es un número fuera del dado
) ELSE IF %x% GTR 6  (
   ECHO Es un número fuera del dado
) ELSE (
   ECHO Es un número del dado
)

*****************
***   EXIST   ***
*****************

(1)

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SET archivo=INDEX.TXT
IF EXIST %archivo% (
    echo El archivo %archivo% existe.
) ELSE (
    echo El archivo %archivo% no existe.
)

(2)

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SET archivo=C:\CURSOS\INDEX.TXT
IF EXIST %archivo% (
    echo El archivo %archivo% existe.
) ELSE (
    echo El archivo %archivo% no existe.
)

(3) HACER UN SCRIPT BAT QUE ELIMINE LA CARPETA
    BUILD DE LOS PROYECTOS JAVA EN APACHE NETBEANS

@ECHO OFF
TITLE BORRAR CARPETA BUILD
SET "RUTA=C:\CERTIFICADO_27022025_MODULO1\ProyectoJava14032025\build"
RD %RUTA% /S /Q
PAUSE

(4) HACERUN SCRIPT BAT PARA COMPILAR E INTERPRETAR
    UN PROGRAMA JAVA CON LA VERSION jdk1.8.0_202
	
@ECHO OFF
TITLE COMPILAR E INTERPRETAR JAVA
CLS
SET "JAVA_HOME=C:\Program Files\Java\jdk1.8.0_202"
SET PATH=PATH;%JAVA_HOME%\BIN
REM COMPILAR
javac.exe Principal.java
REM INTERPRETAR
java.exe Principal
PAUSE > NUL

(5) CREAR UN ARCHIVO BAT PARA INICIALIZAR UNA VARIABLE CON UN
    NUMERO Y LUEGO PASARSELO A OTRA VARIABLE. LUEGO MOSTRAR
	LAS DOS VARIABLES
	
@ECHO OFF
TITLE PASAR UNA VALOR A OTRA VARIABLE
CLS
SET X=4
SET Y=%X%
ECHO X=%X%
ECHO Y=%Y%
PAUSE 


**********************************************************
***   PASAR EL VALOR DE UNA VARIABLE A OTRA VARIABLE   ***
**********************************************************

@ECHO OFF
TITLE PROGRAMA CMD
CLS

REM CREAR UNA VARIABLE Y ASIGNARLE UN VALOR
SET variable1=4

REM PASAR EL VALOR DE UNA VARIABLE A OTRA VARIABLE
SET variable2=%variable1%

ECHO VARIABLE1 = %variable1%
ECHO VARIABLE2 = %variable2%

**************************************************************************
***   OPERADOR DE IGUALDAD PARA COMPARAR SI DOS VARIABLES SON IGUALES  ***
**************************************************************************

@ECHO OFF
TITLE PROGRAMA CMD
CLS

SET variable1=5
SET variable2=4

IF %variable1%==5 (
   ECHO EL NUMERO %variable1% ES VERDADERO
) ELSE (
   ECHO EL NUMERO %variable1% ES FALSO
)

IF %variable2%==5 (
   ECHO EL NUMERO %variable2% ES VERDADERO
) ELSE (
   ECHO EL NUMERO %variable2% ES FALSO
)

***************
***   FOR   ***
***************

-------------------------------------------------------------------------------
(1) SERIE NATURAL 1, 2, 3, 4, 5

@ECHO OFF
TITLE PROGRAMA CMD
CLS
ECHO FORMA 1
FOR /L %%i IN (1,1,5) DO (
    ECHO %%i
)
ECHO FORMA 2
FOR %%i IN (1 2 3 4 5) DO (
    ECHO %%i
)
PAUSE
-------------------------------------------------------------------------------
(2) SERIE NATURAL 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

@ECHO OFF
TITLE PROGRAMA CMD
CLS
ECHO FORMA 1
FOR /L %%i IN (0,1,9) DO (
    ECHO %%i
)
ECHO FORMA 2
FOR %%i IN (0 1 2 3 4 5 6 7 8 9) DO (
    ECHO %%i
)
PAUSE
-------------------------------------------------------------------------------
(3) SERIE NATURAL 1, 3, 5, 7, 9

@ECHO OFF
TITLE PROGRAMA CMD
CLS
ECHO FORMA 1
FOR /L %%i IN (1,2,9) DO (
    ECHO %%i
)
ECHO FORMA 2
FOR %%i IN (1 3 5 7 9) DO (
    ECHO %%i
)
PAUSE
-------------------------------------------------------------------------------
(4) LISTAR TODOS LOS ARCHIVOS (*) DEL DIRECTORIO ACTUAL.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
FOR %%F IN (*) DO (
    ECHO %%F
)
PAUSE 
-------------------------------------------------------------------------------
(5) LISTAR TODOS LOS ARCHIVOS .TXT DEL DIRECTORIO ACTUAL

@ECHO OFF
TITLE PROGRAMA CMD
CLS
FOR %%F IN (*.TXT) DO (
    ECHO %%F
)
PAUSE 
-------------------------------------------------------------------------------
(6) LISTAR TODOS LOS ARCHIVOS .TXT DEL DIRECTORIO ACTUAL Y SUS SUBDIRECTORIOS.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
FOR /R %%F IN (*.TXT) DO (
    ECHO %%F
)
PAUSE 
-------------------------------------------------------------------------------
(7) LISTAR TODOS LOS ARCHIVOS .TXT DEL DIRECTORIO ACTUAL Y VER SU CONTENIDO  AL
    AL MISMO TIEMPO.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
FOR %%F IN (*.TXT) DO (
    ECHO -----------------
    ECHO ARCHIVO DE TEXTO: %%F
    ECHO -----------------
    TYPE %%F
)
PAUSE
-------------------------------------------------------------------------------
(8) MOSTRAR CADA ELEMENTO DE UN CONJUNTO.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
FOR %%I IN (manzana pera banana "manzana roja") DO (
    ECHO %%I
)
PAUSE
-------------------------------------------------------------------------------
(9) COPIAR  TODOS  LOS  ARCHIVOS  .TXT  CONTENIDOS  EN  UN  DIRECTORIO  Y   SUS
    SUBDIRECTORIOS, HACIA OTRO DIRECTORIO.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
FOR /R %%F IN (*.TXT) DO (
    COPY %%F C:\DESTINO\
)
PAUSE 

ESTA SOLUCION TIENE UN PROBLEMA SI ENCUENTRA DUPLICADOS LOS SOBREESCRIBE
-------------------------------------------------------------------------------
(10) HACER UN CONTADOR QUE SE VALLA INCREMENTANDO DE 1 EN 1

(*) CONTADOR QUE CUENTA LA CANTIDAD DE ARCHIVOS .TXT

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
FOR /R %%F IN (*.TXT) DO (
    SET /A C+=1
    ECHO !C!
)
ENDLOCAL
PAUSE 

(*) DISTINTAS FORMAS DE USAR UN CONTADOR

@ECHO OFF
TITLE PROGRAMA CMD
CLS
REM IMPORTANTE PARA ACTUALIZAR EL CONTADOR Y SE USA !VARIABLE!
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO CONTADOR 1
SET C1=0
FOR %%I IN (1 2 3 4 5 6 7 8 9 10) DO (
	ECHO C1 = !C1!
    SET /A C1=!C1!+1
	REM TIMEOUT /T 1 > NUL
)
ECHO CONTADOR 2
SET C2=0
FOR /L %%I IN (0,1,9) DO (
	ECHO C2 = !C2!
	SET /A C2+=1
	REM TIMEOUT /T 1 > NUL
)
ECHO CONTADOR 3
FOR /L %%I IN (1,1,10) DO (
	SET C3=%%I
	SET ARCHIVO=APUNTES!C3!
	ECHO !ARCHIVO!
)
ENDLOCAL
PAUSE
-------------------------------------------------------------------------------
(11) MEJORAR LA SOLUCION DEL EJERCICIO 9 QUE TRATA SOBRE COPIAR

(*) PROBANDO 1

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
FOR /R %%F IN (*.TXT) DO (
    SET /A C+=1
    SET ARCHIVO=%%F_!C!.TXT
    ECHO !ARCHIVO!
)
ENDLOCAL
PAUSE 

(*) PROBANDO 2

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
FOR /R %%F IN (*.TXT) DO (
    SET /A C+=1
    SET ARCHIVO=C:\DESTINO\APUNTES_!C!.TXT
    ECHO !ARCHIVO!
    
)
ENDLOCAL
PAUSE 

(*) SOLUCION

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
FOR /R %%F IN (*.TXT) DO (
    SET /A C+=1
    SET ARCHIVO=C:\DESTINO\APUNTES_!C!.TXT
    COPY %%F !ARCHIVO!
)
ENDLOCAL
PAUSE 
-------------------------------------------------------------------------------
(12) BUSCAR UN ARCHIVO EN UN DIRECTORIO Y SUS SUBDIRECTORIOS

(*) BUSCAR CADENA apuntes.txt QUE NO DIFERENCIA ENTRE MAYUSCULAS Y MINUSCULAS

@ECHO OFF
TITLE PROGRAMA CMD
CLS
FOR /R %%F IN (*.TXT) DO (
    ECHO %%F | FIND /I "apuntes.txt"
)
PAUSE

(*) BUSCAR CADENA java QUE NO DIFERENCIA ENTRE MAYUSCULAS Y MINUSCULAS

@ECHO OFF
TITLE PROGRAMA CMD
CLS
FOR /R %%F IN (*.TXT) DO (
    ECHO %%F | FIND /I "java"
)
PAUSE
-------------------------------------------------------------------------------
(13) BUSCAR UN ARCHIVO EN UN DIRECTORIO Y SUS SUBDIRECTORIOS. PERO DEBE  ENVIAR
     EL RESULTADO A UN ARCHIVO.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
FOR /R %%F IN (*.TXT) DO (
    ECHO %%F | FIND /I "apuntes.txt" >> RESULTADO.TXT
)
PAUSE
-------------------------------------------------------------------------------
(14) CREAR 10 ARCHIVOS EN BLANCO NUMERADOS SECUENCIALMENTE ASI:
     APUNTES1.TXT APUNTES2.TXT ... APUNTES10.TXT

@ECHO OFF
TITLE PROGRAMA CMD
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /L %%I IN (1,1,10) DO (
	SET X=%%I
    SET ARCHIVO=APUNTES!X!.TXT
	ECHO. > !ARCHIVO!
)
PAUSE
-------------------------------------------------------------------------------
(15) GENERAR Y MOSTRAR EN LA CONSOLA LOS TEXTOS SIGUIENTES DEL 1 AL 10:
     APUNTES1.TXT
     ...
     APUNTES10.TXT

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /L %%I IN (1,1,10) DO (
	SET X=%%I
    SET ARCHIVO=APUNTES!X!.TXT
	ECHO !ARCHIVO!
)
PAUSE
-------------------------------------------------------------------------------
(16) CREAR 10 ARCHIVOS EN BLANCO CUYO NOMBRE SERA DE LA SIGUIENTE FORMA:
     APUNTES1.TXT
     ...
     APUNTES10.TXT

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /L %%I IN (1,1,10) DO (
	SET X=%%I
    SET ARCHIVO=APUNTES!X!.TXT
	ECHO. > !ARCHIVO!
)
ENDLOCAL
PAUSE
-------------------------------------------------------------------------------
(17) SE TIENE ARCHIVOS CON EL SIGUIENTE PATRON: APUNTES_1.TXT...APUNTES_31.TXT.
     SE PIDE HACER UN BUCLE FOR PARA ELIMINARLOS.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /L %%I IN (1,1,31) DO (
	SET X=%%I
    SET ARCHIVO=APUNTES_!X!.TXT
	DEL !ARCHIVO!
)
ENDLOCAL
PAUSE
-------------------------------------------------------------------------------
(18) HACER UN CONTADOR QUE VAYA CONTANDO POR CADA LINEA DE TEXTO QUE  ENCUENTRE
     EN UN ARCHIVO DE TEXTO. LA IMPRESION DEL CONTADOR TIENE UN RETARDO DE 1SEG

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
FOR /F "DELIMS=" %%A IN (RESULTADO.TXT) DO (
    SET /A C=!C!+1
	TIMEOUT /T 1 > NUL
	ECHO !C!
)
ENDLOCAL
PAUSE

APUNTES

FOR /F "DELIMS=" %%A IN (RESULTADO.TXT) DO (...): Este  es  un  bucle  FOR  que
recorre las líneas del archivo RESULTADO.TXT. Cada  línea  se  almacena  en  la
variable %%A. El conjunto de instrucciones que sigue después de DO (y antes de)
se ejecuta para cada línea del archivo.
-------------------------------------------------------------------------------
(19) BUSCAR EN LA RUTA ACTUAL TODAS LAS CADENAS QUE INCLUYAN "ARCHIVO" Y GRABAR
     DICHA RUTA EN UN ARCHIVO LLAMADO RESULT.TXT

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /R %%F IN (*.TXT) DO (
    ECHO %%F
    ECHO %%F | FIND "ARCHIVO" /I >> .\RESULT.TXT
)
ENDLOCAL
PAUSE
-------------------------------------------------------------------------------
(20) BUSCAR TODOS LOS ARCHIVOS "APUNTES" EN  UN  DIRECTORIO   Y  SUBDIRECTORIOS
     Y LOS VALLA COPIANDO EN OTRO DIRECTORIO, PERO COMO HAY ALGUNOS  QUE TIENEN
     EL MISMO NOMBRE, ENTONCES LOS VALLA RENOMBRANDO CON UN NÚMERO   SECUENCIAL
     GENERADO POR UN CONTADOR.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /R %%F IN (*.TXT) DO (
    ECHO %%F | FIND "APUNTES" /I >> .\RESULTADO.TXT
)
SET C=0
FOR /F "DELIMS=" %%A IN (RESULTADO.TXT) DO (
    SET /A C=!C!+1
	SET ARCHIVODESTINO=C:\DESTINO1\APUNTES!C!.TXT
	COPY %%A !ARCHIVODESTINO!
)
PAUSE
-------------------------------------------------------------------------------
(21) COPIAR  TODOS  LOS  ARCHIVOS .TXT  PRESENTES  EN  EL  DIRECTORIAL ACTUAL Y
     SUBDIRECTORIOS HACIA OTRA RUTA Y TAMBIEN AL FINAL INDICAR CUANTOS ARCHIVOS
     SE COPIARON

@ECHO OFF
TITLE SCRIPT CMD
REM UTF8
CHCP 65001 > NUL
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET c=0
FOR /R %%X IN (*.TXT) DO (
  SET /A c+=1
  COPY %%X C:\DESTINO1
)
ECHO CANTIDAD DE ARCHIVOS TXT: %c%
ENDLOCAL
PAUSE

**************************
***   BUCLE CON GOTO   ***
**************************

@ECHO OFF
TITLE PROGRAMA CMD
CLS

SETLOCAL ENABLEDELAYEDEXPANSION 

SET contador=1

:IMPRIMIR_SERIE
IF %contador% LEQ 5 (
   ECHO %contador%
   SET /A contador+=1
   GOTO IMPRIMIR_SERIE
)
ENDLOCAL
PAUSE

**********************
***   SCRIPT CMD   ***
**********************

PROGRAMAS CON COMANDOS CMD

*********************
***   PROGRAMAS   ***
*********************

-------------------------------------------------------------------------------
(1) INGRESAR UN NOMBRE DESDE EL TECLADO Y GUARDARLO EN UNA VARIABLE

@ECHO OFF
TITLE PROGRAMA CMD
CLS
REM DECLARAR UNA VARIABLE
SET /P X=INGRESA TU NOMBRE?
ECHO HOLA %X%
-------------------------------------------------------------------------------
(2) SUMAR DOS NUMEROS ENTEROS

@ECHO OFF
TITLE PROGRAMA CMD
REN UTF8
CHCP 65001 > NUL
CLS
REM ENTRADA
SET /P N1=INGRESA NUMERO ENTERO 1?
SET /P N2=INGRESA NUMERO ENTERO 2?
REM PROCESO
SET /A SUMA = %N1% + %N2%
REM SALIDA
ECHO SUMA: %SUMA%
-------------------------------------------------------------------------------
(3) CONDICIONAL BINARIO: EVALUAR SI UN NUMERO ENTERO ES POSITIVO O NEGATIVO

@ECHO OFF
TITLE PROGRAMA CMD
REN UTF8
CHCP 65001 > NUL
CLS
REM ENTRADA
SET /P N=INGRESE NUMERO ENTERO?
REM PROCESO - SALIDA
IF %N% GTR 0 (
   ECHO NUMERO POSITIVO
) ELSE (
   ECHO NUMERO NEGATIVO
)
-------------------------------------------------------------------------------
(4) CONCIONAL MULTIPLE: EVALUAR  SI  UN  NUMERO  ENTERO  ES  POSITIVO, NEGATIVO
    O  CERO

@ECHO OFF
TITLE PROGRAMA CMD
REN UTF8
CHCP 65001 > NUL
CLS
REM ENTRADA
SET /P N=INGRESE NUMERO ENTERO?
REM PROCESO - SALIDA
IF %N% GTR 0 (
   ECHO NUMERO POSITIVO
) ELSE IF %N% LSS 0 (
   ECHO NUMERO NEGATIVO
) ELSE (
    ECHO NUMERO CERO
)
-------------------------------------------------------------------------------
(5) BUSCAR EL TELEFONO DE UNA PERSONA EN UN ARCHIVO

@ECHO OFF
TITLE PROGRAMA CMD
REN UTF8
CHCP 65001 > NUL
CLS
REM ENTRADA
SET /P NOMBRE=INGRESE EL NOMBRE DE UNA PERSONA?
REM PROCESO - SALIDA
FIND /I "%NOMBRE%" TELEFONOS.TXT

TELEFONO.TXT

LUIS   : 67849549
MIGUEL : 68394958
-------------------------------------------------------------------------------
(6) BUSCAR EL TELEFONO DE UNA PERSONA EN VARIOS ARCHIVOS

@ECHO OFF
TITLE PROGRAMA CMD
REN UTF8
CHCP 65001 > NUL
CLS
REM ENTRADA
SET /P NOMBRE=INGRESE NOMBRE DE UNA PERSONA?
REM PROCESO - SALIDA
FIND /I "%NOMBRE%" "TELEFONO?.TXT"

TELEFONO1.TXT
TELEFONO2.TXT
-------------------------------------------------------------------------------
(7) CREAR EL SIGUIENTE ARBOL DE CARPETAS. DEBE INDICAR  TAMBIEN  EL COMANDO QUE
    DIBUJA EL ARBOL.

C:\ALUMNOUTP
├───A
├───B
└───C
    ├───C1
    ├───C2
    |    └───C2_1
    └───C3

@ECHO OFF
TITLE PROGRAMA BUSCAR EL TELEFONO DE UNA PERSONA
REN UTF8
CHCP 65001 > NUL
CLS
CD \
MKDIR ALUMNOUTP
CD ALUMNOUTP
MKDIR A B C
CD C
MKDIR C1 C2 C3
CD C3
CD ..
CD C2
MKDIR C2_1
CD \
REM CD ../..   RETROCEDER 2 CARPETAS
TREE ALUMNOUTP
-------------------------------------------------------------------------------
(8) HACER UN DICCIONARIO QUE BUSQUE PALABRAS EN ESPAÑOL O INGLES.

@ECHO OFF
TITLE PROGRAMA CMD
REN UTF8
CHCP 65001 > NUL
CLS
REM ENTRADA
SET /P PALABRA=INGRESE UNA PALABRA EN ESPAÑOL O INGLES?
REM PROCESO
FIND "%PALABRA%" /I < DICCIONARIO.TXT

DICCIONARIO.TXT

ONE : UNO
TWO : DOS
COMPUTER : COMPUTADORA
-------------------------------------------------------------------------------
(9) LISTAR TODOS LOS ARCHIVOS EN EL DICTORIO ACTUAL Y SUBDIRECTORIOS.

@ECHO OFF
TITLE PROGRAMA CMD
REN UTF8
CHCP 65001 > NUL
CLS
FOR /R %%X IN (*.TXT) DO (
    ECHO %%X
)
-------------------------------------------------------------------------------
(10)  COPIAR TODOS LOS ARCHIVOS .TXT HACIA UNA RUTA DADA

@ECHO OFF
TITLE PROGRAMA CMD
REN UTF8
CHCP 65001 > NUL
CLS
FOR /R %%X IN (*.TXT) DO (
    COPY %%X C:\ALUMNOUTP
)
-------------------------------------------------------------------------------
(11) LEVANTAR 5 VECES NOTEPAD.EXE Y 5 VECESE CMD.EXE

@ECHO OFF
TITLE CMD
REN UTF8
CHCP 65001 > NUL
CLS
FOR /L %%I IN (1,1,5) DO (
    START NOTEPAD
)

FOR %%I IN (1 2 3 4 5) DO (
    START CMD
)
-------------------------------------------------------------------------------
(12)

REM GENERAR 1000 ARCHIVOS EN BLANCO
REM 1.TXT, 2.TXT... 1000.TXT

@ECHO OFF
TITLE SCRIPT CMD
CHCP 65001 > NUL
CLS
FOR /L %%I IN (1,1,1000) DO (
   ECHO. > %%I.TXT  
)
-------------------------------------------------------------------------------
(13)

REM ELIMINAR LOS 1000 ARCHIVOS GENEREADOS EN EL SCRIPT ANTERIOR

@ECHO OFF
TITLE SCRIPT CMD
CHCP 65001 > NUL
CLS
FOR /L %%I IN (1,1,1000) DO (
   DEL %%I.TXT  
)
-------------------------------------------------------------------------------
(14)

REM CONTADOR


@ECHO OFF
TITLE SCRIPT CMD
CHCP 65001 > NUL
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
FOR /L %%I IN (1,1,100) DO (
    SET /A C = !C! + 1
    ECHO !C!
)
-------------------------------------------------------------------------------
(15)

(*)

@ECHO OFF
REM VERSION 1
TITLE SCRIPT CMD
REM UTF8
CHCP 65001 > NUL
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
FOR /R %%X IN (*.TXT) DO (
  SET /A C=!C!+1
)
ECHO CANTIDAD DE ARCHIVOS TXT: !C!
PAUSE

(*)

@ECHO OFF
REM VERSION 2
TITLE SCRIPT CMD
REM UTF8
CHCP 65001 > NUL
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET c=0
FOR /R %%X IN (*.TXT) DO (
  SET /A c+=1
)
ECHO CANTIDAD DE ARCHIVOS TXT: %c%
ENDLOCAL
PAUSE
-------------------------------------------------------------------------------
(16)

@ECHO OFF
TITLE SCRIPT CMD
REM UTF8
CHCP 65001 > NUL
CLS
FOR /F "DELIMS=" %%X IN (DATOS.TXT) DO (
    ECHO %%X
    REM TIMEOUT /T 5 > NUL
    PAUSE > NUL
)
-------------------------------------------------------------------------------
(17)

@ECHO OFF
TITLE SCRIPT CMD
REM UTF8
CHCP 65001 > NUL
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /R %%X IN (*APUNTES*.TXT) DO (
    ECHO %%X >> IMPRIMIR2.TXT
)
-------------------------------------------------------------------------------
(18)

@ECHO OFF
REM APAGAR LA PC DENTRO DE 1 HORA
shutdown /s /f /t 3600
PAUSE
-------------------------------------------------------------------------------
(19) LEER UN ARCHIVO LINEA POR LINEA CON UN RETARDO DE 1 SEGUNDO.

@ECHO OFF
TITLE SCRIPT CMD
REM UTF8
CHCP 65001 > NUL
CLS
REM RECORRER UN ARCHIVO CON DATOS
FOR /F "DELIMS=" %%X IN (DATOS.TXT) DO (
   ECHO %%X
   TIMEOUT /T 1 > NUL
)
PAUSE


DATOS.TXT

A1;LUIS;23;1.72
A2;MIGUEL;24;1.67
A3;CARLOS;21;1.61
A4;CARMEN;22;1.60
A5;CARLOS;25;1.62
-------------------------------------------------------------------------------
(20) MOSTRAR CUANTOS ARCHIVOS .TXT TENGO EN EL DIRECTORIO ACTUAL Y SUBDIRECTORIOS

(*)

@ECHO OFF
REM VERSION 2
TITLE SCRIPT CMD
REM UTF8
CHCP 65001 > NUL
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
FOR /R %%X IN (*.TXT) DO (
  SET /A C+=1
)
ECHO CANTIDAD DE ARCHIVOS TXT: %C%
ENDLOCAL
PAUSE

(*)

@ECHO OFF
TITLE SCRIPT CMD
CLS
REM UTF8
CHCP 65001 > NUL
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
FOR /R %%X IN (*.TXT) DO (
  SET /A C=!C!+1
)
ECHO CANTIDAD DE ARCHIVOS TXT: !C!
ENDLOCAL
PAUSE
-------------------------------------------------------------------------------
(21) BUSCAR TODOS LOS ARCHIVOS APUNTES.TXT Y LUEGO QUE CREE UN ARCHIVO CON  LAS
     RUTAS DE TODOS LOS ARCHIVOS QUE ENCONTRO.

@ECHO OFF
TITLE SCRIPT CMD
REM UTF8
CHCP 65001 > NUL
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /R %%X IN (APUNTES.TXT) DO (
  ECHO %%X >> RESUMEN.TXT
)
ENDLOCAL
PAUSE
-------------------------------------------------------------------------------
(22) GENERAR UN CONTADOR

@ECHO OFF
TITLE SCRIPT CMD
REM UTF8
CHCP 65001 > NUL
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
FOR /L %%I IN (1,1,100) DO (
   SET /A C=!C!+1
   ECHO !C! 
)
ENDLOCAL
PAUSE
-------------------------------------------------------------------------------

***************
***   DIR   ***
***************

- LISTAR TODOS LOS ARCHIVOS .TXT INCLUIDO EN SUBCARPETAS

DIR *.TXT /S

****************
***   FIND   ***
****************

-------------------------------------------------------------------------------
(1) SUPONIENDO  QUE  TENGO  UN  ARCHIVO.TXT  Y QUIERO BUSCAR EN SU CONTENIDO UN
    TEXTO "LIBRO". CUAL ES EL COMANDO CMD PARA REALIZAR DICHA ACCION.

@ECHO OFF
TITLE PROGRAMA CMD
CLS
TYPE ARCHIVO.TXT | FIND /I "LIBRO"
PAUSE
-------------------------------------------------------------------------------
(2) SUPONIENDO QUE TENGO LOS SIGUIENTES ARCHIVOS: 1.TXT, 2.TXT, 3.TXT  Y QUIERO
    BUSCAR EN TODOS ESOS ARCHIVOS UN TEXTO "LIBRO". LA SALIDA SERIA:

---------- 1.TXT: 0

---------- 2.TXT: 1

---------- 3.TXT: 2

DONDE 0 INDICA QUE NO TIENE LA CADENA LIBRO 1 TIENE UNA CADENA LIBRO Y 2  TIENE
2 CADENA LIBROS

@ECHO OFF
TITLE PROGRAMA CMD
CLS
REM CON C INDICO SOLO EL NOMBRE DEL ARCHIVO QUE CONTIENE DICHA CADENA
FIND /I "LIBRO" "?.TXT" /C
PAUSE
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
Elimina archivos temporales para liberar espacio en el disco.
-------------------------------------------------------------------------------
@echo off
echo Limpiando archivos temporales...
del /s /f /q "%temp%\*.*"
rd /s /q "%temp%"
mkdir "%temp%"
echo Limpieza completada.
pause

🔹 Explicación:

Borra archivos en la carpeta temporal (%temp%).
Vuelve a crear la carpeta para evitar errores.
-------------------------------------------------------------------------------
Muestra tu dirección IP y otros datos de red.
-------------------------------------------------------------------------------
@echo off
ipconfig /all
pause

🔹 Explicación:

Ejecuta ipconfig /all para ver la IP, DNS, MAC, etc.
Usa pause para que no se cierre la ventana.
3️⃣ Apagar, reiniciar o cerrar sesión
💡 Permite elegir entre apagar, reiniciar o cerrar sesión.

bat
Copiar
Editar
@echo off
echo 1 - Apagar
echo 2 - Reiniciar
echo 3 - Cerrar sesion
set /p opcion="Elige una opcion: "
if %opcion%==1 shutdown /s /t 0
if %opcion%==2 shutdown /r /t 0
if %opcion%==3 shutdown /l
🔹 Explicación:

Pide al usuario que elija una opción.
Usa shutdown /s para apagar, /r para reiniciar y /l para cerrar sesión.
4️⃣ Crear una copia de seguridad de una carpeta
💡 Copia todos los archivos de una carpeta a otra (backup).

-------------------------------------------------------------------------------
@echo off
xcopy "C:\MiCarpeta" "D:\Backup\MiCarpeta" /s /e /y
echo Copia de seguridad completada.
pause
🔹 Explicación:

Copia C:\MiCarpeta a D:\Backup\MiCarpeta.
/s y /e copian todas las carpetas y archivos.
/y evita que pida confirmación para sobrescribir archivos.
-------------------------------------------------------------------------------
Muestra los cambios en tiempo real en una carpeta.
-------------------------------------------------------------------------------
@echo off
echo Monitoreando cambios en C:\MiCarpeta...
:loop
dir "C:\MiCarpeta"
timeout /t 5 >nul
goto loop

🔹 Explicación:

Muestra los archivos en C:\MiCarpeta cada 5 segundos.
timeout /t 5 espera 5 segundos antes de actualizar.
-------------------------------------------------------------------------------
Borra una carpeta completamente sin pedir confirmación.
-------------------------------------------------------------------------------
@echo off
rd /s /q "C:\CarpetaAEliminar"
echo Carpeta eliminada.
pause

🔹 Explicación:

/s elimina subcarpetas y archivos.
/q lo hace sin pedir confirmación.
⚠ ¡Cuidado! Esto no se puede deshacer.
-------------------------------------------------------------------------------
Verifica la conexión a Internet enviando pings continuos.
-------------------------------------------------------------------------------
@echo off
ping google.com -t

🔹 Explicación:

ping google.com -t envía pings sin parar.
Para detenerlo, presiona Ctrl + C.
-------------------------------------------------------------------------------
Impide que la PC se apague bloqueando el comando shutdown.
-------------------------------------------------------------------------------
@echo off
echo Bloqueando apagado del sistema...
shutdown -a
echo Apagado cancelado.
pause

🔹 Explicación:

shutdown -a cancela cualquier apagado en curso.
Útil si alguien ejecuta shutdown /s.
-------------------------------------------------------------------------------
Muestra datos del sistema, CPU, RAM, y versión de Windows.
-------------------------------------------------------------------------------
@echo off
systeminfo
pause

🔹 Explicación:

Ejecuta systeminfo para mostrar detalles del sistema.
-------------------------------------------------------------------------------
Convierte todos los archivos de una carpeta en "ocultos".
-------------------------------------------------------------------------------
@echo off
attrib +h "C:\MisArchivos\*.*" /s /d
echo Archivos ocultos.
pause

🔹 Explicación:

attrib +h oculta todos los archivos en C:\MisArchivos.
/s y /d aplican esto a todas las subcarpetas.
-------------------------------------------------------------------------------
Recuperar archivos ocultos en USB o disco
-------------------------------------------------------------------------------
@echo off
attrib -h -r -s /s /d *.*
echo Archivos recuperados.
pause

🔹 Explicación:

attrib -h -r -s /s /d *.* → Quita los atributos oculto (-h), de solo lectura (-r)
y de sistema (-s) de todos los archivos en la carpeta actual y subcarpetas.
Útil para recuperar archivos de USBs infectados con virus que los ocultan.
-------------------------------------------------------------------------------
**********************************
***   PREGUNTAS Y RESPUESTAS   ***
**********************************

(1) PARA BUSCAR UN ARCHIVO CON EL FOR DE MANERA RECURSIVA (INCLUYE SUBCARPETAS)
    CUAL ES EL PARAMETRO QUE SE AÑADE AL FOR

A. /F
B. /R (X)
C. /X
D. NINGUNA DE LAS ANTERIORES

(2) PARA CAMBIAR AL PROMPT ORIGINAL O POR DEFECTO CUAL ES EL COMANDO

A. PROMPT $P%G
B. PROMPT %D
C. PROMPT
D. A Y C  (X)

(3) COMANDO CMD PARA LIMPIAR LA PANTALLA.

A. CLS (X)
B. CLEAR
C. DIR
D. NINGUNA DE LAS ANTERIORES

(4) COMANDO CMD PARA VER EL CONTENIDO DE UN ARCHIVO DE TEXTO

A. ECHO
B. TYPE (X)
C. DIR
D. NINGUNA DE LAS ANTERIORES

(5) COMANDO CMD PARA CREAR UN ARCHIVO EN BLANCO

A. ECHO. > ARCHIVO.TXT (X)
B. ECHO HOLA MUNDO > ARCHIVO.TXT
C. ECHO HOLA ARCHIVO.TXT
D. NINGUNA DE LAS ANTERIORES

(6) COMANDO CMD PARA LISTAR LOS ARCHIVOS Y SUBDIRECTORIOS 

A. DIR
B. DIR * /S (X)
C. LS
D. NINGUNA DE LAS ANTERIORES

**********************
***   EJERCICIOS   ***
**********************
--------------------------------------------------------------------------------
EJERCICIO 1

@ECHO OFF
TITLE SCRIPT BAT
REM COPIAR TODOS LOS ARCHIVOS .BAT DE LA RUTA ACTUAL HACIA OTRA RUTA
CLS
FOR /R %%I IN (*.BAT) DO (
    COPY %%I D:\SALVAR
)
PAUSE
--------------------------------------------------------------------------------
EJERCICIO 2

@ECHO OFF
TITLE SCRIPT BAT
REM COPIAR TODOS LOS ARCHIVOS .BAT DE UNA RUTA CUALQUIERA HACIA OTRA RUTA
CLS
SET "RUTA=D:\"
FOR /R %RUTA% %%I IN (*.BAT) DO (
    COPY %%I D:\SALVAR
)
PAUSE
--------------------------------------------------------------------------------
EJEMPLO 3

@ECHO OFF
TITLE SCRIPT BAT
REM COPIAR TODOS LOS ARCHIVOS .BAT DE UNA RUTA CUALQUIERA HACIA OTRA RUTA
REM CREA UN ARCHIVO RESUMEN DE LAS RUTAS DE ORIGEN DE LOS ARCHIVOS COPIADOS
CLS
SET "RUTA=D:\"
FOR /R %RUTA% %%I IN (*.BAT) DO (
    COPY %%I D:\SALVAR
    ECHO %%I >> RESUMEN.TXT
)
PAUSE
--------------------------------------------------------------------------------
EJEMPLO 4

@ECHO OFF
TITLE SCRIPT BAT
REM MOSTRAR EN EL ARCHIVO RESUMEN SOLO LOS NOMBRES CON SU EXTENSION
CLS
SET "RUTA=H:\"
FOR /R %RUTA% %%I IN (*.BAT) DO (
    ECHO "%%~nxI" >> RESUMEN.TXT
)
PAUSE
--------------------------------------------------------------------------------
EJEMPLO 5

@ECHO OFF
TITLE SCRIPT BAT
CLS
SET "RUTA=H:\"
SET "ARCHIVOBUSCAR=CONF.BAT"
FOR /R %RUTA% %%I IN (*.BAT) DO (
	IF "%%~nxI"=="%ARCHIVOBUSCAR%" (
       ECHO "%%I" >> RESUMEN.TXT
	   ECHO Archivo encontrado: %%I
	)
)
PAUSE
--------------------------------------------------------------------------------
EJEMPLO 6

@ECHO OFF
TITLE SCRIPT BAT
CLS
SET "RUTA=H:\"
REM TIENE QUE TENER SIEMPRE UN COMODIN ASTERISCO
FOR /R %RUTA% %%I IN (WALTERSAGASTEGUI*.BAT) DO (
	   ECHO "%%I" >> RESUMEN.TXT
	   ECHO Archivo encontrado: %%I
	)
)
PAUSE
--------------------------------------------------------------------------------
EJEMPLO 7

@ECHO OFF
TITLE SCRIPT BAT
CLS
REM INGRESAR POR TECLADO EL NOMBRE DEL ARCHIVO .BAT A BUSCAR
SET "RUTA=H:\"
SET /P ARCHIVOBUSCAR=INGRESAR ARCHIVO A BUSCAR:
FOR /R %RUTA% %%I IN (*.BAT) DO (
	IF "%%~nxI"=="%ARCHIVOBUSCAR%" (
       ECHO "%%I" >> RESUMEN.TXT
	   ECHO Archivo encontrado: %%I
	)
)
PAUSE
--------------------------------------------------------------------------------
EJERCICIO 8

(1) SERIE NATURAL 1, 2, 3, 4, 5

@ECHO OFF
TITLE PROGRAMA CMD
CLS
ECHO FORMA 1
FOR /L %%i IN (1,1,5) DO (
    ECHO %%i
)
ECHO FORMA 2
FOR %%i IN (1 2 3 4 5) DO (
    ECHO %%i
)
PAUSE
--------------------------------------------------------------------------------
EJERCICIO 9

FIND /I /N "javier" MITEXTO.TXT AGENDA.TXT CIENCIA\FISICA\AGENDA1.TXT
--------------------------------------------------------------------------------
EJERCICIO 10

CREAR UN ARCHIVO BAT QUE FUNCIONES COMO UN DICCIONARIO DONDE BUSCAREMOS UNA PALABRA
Y OBTENER SU SIGNIFICADO.

@ECHO OFF
TITLE SCRIPT BAT
CLS
SET /P PALABRA=INGRESAR PALABRA A BUSCAR:
FIND /I /N "%PALABRA%" DICCIONARIO2.TXT CIENCIA\FISICA\DICCIONARIO1.TXT
PAUSE
--------------------------------------------------------------------------------
EJEMPLO 11

CONSTRUIR UN CONTADOR. CONTAR LA CANTIDAD DE ARCHIVOS

REM UTF8
CHCP 65001 > NUL
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET C=0
SET RUTA=H:\
FOR /R %RUTA% %%X IN (*.JAVA) DO (
  SET /A C=!C!+1
)
ECHO CANTIDAD DE ARCHIVOS JAVA: !C!
PAUSE
--------------------------------------------------------------------------------
EJEMPLO 12

APLICANDO UN CONTADOR PARA RENOMBRAR EL ARCHIVO ORIGEN HACIA UN DESTINO CONSERVANDO
TODOS LOS ARCHIVOS CON EL MISMO NOMBRE AGREGANDOLE UNA SECUENCIA NUMERICA.

@ECHO OFF
TITLE SCRIPT BAT
REM COPIAR TODOS LOS ARCHIVOS .BAT DE UNA RUTA CUALQUIERA HACIA OTRA RUTA
CLS
SETLOCAL ENABLEDELAYEDEXPANSION
SET "RUTA=H:\"
SET C=0
FOR /R %RUTA% %%I IN (*.BAT) DO (
	SET /A C=!C!+1
    SET NOMBREARCHIVO=!C!_%%~nxI
    SET DESTINO=C:\SALVAR\!NOMBREARCHIVO!
    COPY "%%I" !DESTINO!
)
PAUSE
--------------------------------------------------------------------------------
EJEMPLO 13


@ECHO OFF
TITLE PROGRAMA CMD
CLS
SET "RUTA=H:\"
SET "ARCHIVOBUSCAR=A.BAT"
FOR /R %RUTA% %%I IN (*.BAT) DO (
    REM ECHO %%A
    REM ECHO %%~nxA
    IF "%%~nxI"=="%ARCHIVOBUSCAR%" (
        echo El archivo %%I existe.
    ) 
)

EJEMPLO 14

LEER UN ARCHIVO LINEA POR LINEA Y MOSTRARLO EN PANTALLA
CON RETARDO DE 5 SEGUNDOS ENTRE LINEA Y LINEA

@ECHO OFF
TITLE SCRIPT CMD
REM UTF8
CHCP 65001 > NUL
CLS
FOR /F "DELIMS=" %%X IN (DATOS.TXT) DO (
    ECHO %%X
    TIMEOUT /T 5 > NUL
    REM PAUSE > NUL
)
--------------------------------------------------------------------------------
EJERCICIO 1

Crea un script que:

Liste los archivos del directorio actual.

Cree una carpeta llamada Temp.

Copie todos los archivos .txt a la carpeta Temp.

Muestre un mensaje de éxito.

SOLUCION

@ECHO OFF
DIR
MKDIR Temp
COPY *.txt Temp
ECHO ¡Archivos copiados con exito!
--------------------------------------------------------------------------------
EJERCICIO 2

Escribe un comando para eliminar la carpeta Temp y todo su contenido sin pedir confirmación.

SOLUCION

RMDIR /S /Q
--------------------------------------------------------------------------------
EJERCICIO 3

Mata todos los procesos de notepad.exe en segundo plano.

SOLUCION

TASKKILL /IM /F notepad.exe 
--------------------------------------------------------------------------------
EJERCICIO 4

Lista todos los archivos .bat del directorio actual y sus subcarpetas, y guarda 
las rutas en archivos_bat.txt.

SOLUCION

DIR *.bat /S >> archivos_bat.txt

FOR /R %RUTA% %%I IN (*.bat) DO ECHO %%I >> archivos_bat.txt
--------------------------------------------------------------------------------
EJERCICIO 5

Crea 10 archivos vacíos con nombres documento1.txt a documento10.txt.

SOLUCION

FOR /L %%I IN (1,1,10) DO ECHO. > documento%%I.txt
--------------------------------------------------------------------------------
EJERCICIO 6

Busca la palabra "error" en todos los archivos .log de una carpeta y guarda los
resultados en errores.txt.

SOLUCION

FIND "error" *.log >> errores.txt
--------------------------------------------------------------------------------

















