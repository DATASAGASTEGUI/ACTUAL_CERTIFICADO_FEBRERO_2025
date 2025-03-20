@ECHO OFF
TITLE SCRIPT BAT
CHCP 65001 > NUL
CLS
REM Obtener la hora, minutos y segundos sin espacios
SET HORA=%TIME:~0,2%
SET MINUTOS=%TIME:~3,2%
SET SEGUNDOS=%TIME:~6,2%
SET CARPETA=C:\TRABAJANDO_%HORA%_%MINUTOS%_%SEGUNDOS%
MKDIR %CARPETA%
REM Copiar los archivos de C:\PAGINA a la nueva carpeta
XCOPY "C:\PAGINA" "%CARPETA%" /E /F /Y
PAUSE
