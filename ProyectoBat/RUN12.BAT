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