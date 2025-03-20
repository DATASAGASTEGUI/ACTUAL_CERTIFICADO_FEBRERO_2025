EJEMPLO 5

@ECHO OFF
TITLE LISTAR TODOS LOS ARCHIVO DE UNA RUTA
CLS
SET "RUTA=D:\"
SET "ABUSCAR=A.BAT"
FOR /R %RUTA% %%I IN (*.BAT) DO (
    ECHO "%%~nxI" >> RESUMEN.TXT
	IF /I "%%~nxI"=="%ABUSCAR%" (
	   ECHO Archivo encontrado: %%I
	)
)
PAUSE