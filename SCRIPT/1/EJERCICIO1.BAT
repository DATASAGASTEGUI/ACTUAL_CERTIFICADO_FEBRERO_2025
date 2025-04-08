REM ----------------------------------------------------------------------------
REM Desactivar el mostrar el comando
REM ----------------------------------------------------------------------------

@ECHO OFF

REM ----------------------------------------------------------------------------
REM Crear archivo calculadora.c con menú básico
REM ----------------------------------------------------------------------------

(
    echo // calculadora.c ^(rama main^)
    echo #include ^<stdio.h^>
    echo.
    echo int main^(^) ^{
    echo     int opcion;
    echo.
    echo     printf^("Menú de operaciones:\n"^);
    echo     printf^("1. Suma\n"^);
    echo     printf^("2. Resta\n"^);
    echo     printf^("3. Multiplicación\n"^);
    echo     printf^("4. División\n"^);
    echo     printf^("Seleccione una opción: "^);
    echo     scanf^("%%d", ^&opcion^);
    echo.
    echo     printf^("Funcionalidad aún no implementada.\n"^);
    echo.
    echo     return 0;
	echo ^}
) > calculadora.c

REM ----------------------------------------------------------------------------
REM Mostrar contenido generado en el archivo calculadora.c
REM ----------------------------------------------------------------------------

TYPE calculadora.c

REM ----------------------------------------------------------------------------
REM Compilar y Ejecutar
REM ----------------------------------------------------------------------------

gcc calculadora.c -o calculadora.exe && calculadora.exe

REM ----------------------------------------------------------------------------
REM Detener la salida para evitar que se cierre la consola
REM ----------------------------------------------------------------------------

PAUSE

