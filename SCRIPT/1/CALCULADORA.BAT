REM ----------------------------------------------------------------------------
REM Desactivar el mostrar el comando
REM ----------------------------------------------------------------------------

@ECHO OFF

PAUSE

REM ----------------------------------------------------------------------------
REM Crear carpeta del proyecto y entrar en ella
REM ----------------------------------------------------------------------------

MKDIR calculadora
CD calculadora

PAUSE

REM ----------------------------------------------------------------------------
REM Inicializar repositorio Git
REM ----------------------------------------------------------------------------

git init

PAUSE

REM ----------------------------------------------------------------------------
REM Configurar las credenciales
REM ----------------------------------------------------------------------------

git config user.name DATASAGASTEGUI
git config user.email datasagamadrid@gmail.com
git config user.password xxxxxxxxxxxxxx

PAUSE

REM ----------------------------------------------------------------------------
REM Crear archivo calculadora.c con menú básico (rama main)
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

PAUSE

REM ----------------------------------------------------------------------------
REM Commit inicial en rama main
REM ----------------------------------------------------------------------------

git add calculadora.c
git commit -m "Versión inicial con menú básico"

PAUSE

REM ----------------------------------------------------------------------------
REM Crear y cambiar a rama 'operaciones'
REM ----------------------------------------------------------------------------

git checkout -b operaciones

PAUSE

REM ----------------------------------------------------------------------------
REM Sobrescribir el archivo con versión completa
REM ----------------------------------------------------------------------------

(
	echo // calculadora.c ^(rama operaciones^)
	echo #include ^<stdio.h^>
	echo.
	echo int main^(^) ^{
	echo     int opcion, a, b;
	echo     float resultado;
	echo.
	echo     printf^("Menú de operaciones:\n"^);
	echo     printf^("1. Suma\n"^);
	echo     printf^("2. Resta\n"^);
	echo     printf^("3. Multiplicación\n"^);
	echo     printf^("4. División\n"^);
	echo     printf^("Seleccione una opción: "^);
	echo     scanf^("%%d", ^&opcion^);
	echo.
	echo     printf^("Ingrese el primer número: "^);
	echo     scanf^("%%d", ^&a^);
	echo     printf^("Ingrese el segundo número: "^);
	echo     scanf^("%%d", ^&b^);
	echo.
	echo     switch^(opcion^) ^{
	echo         case 1:
	echo             resultado = a + b;
	echo             printf^("Resultado de la suma: %%.2f\n", resultado^);
	echo             break;
	echo         case 2:
	echo             resultado = a - b;
	echo             printf^("Resultado de la resta: %%.2f\n", resultado^);
	echo             break;
	echo         case 3:
	echo             resultado = a * b;
	echo             printf^("Resultado de la multiplicación: %%.2f\n", resultado^);
	echo             break;
	echo         case 4:
	echo             if ^(b != 0^) ^{
	echo                 resultado = ^(float^)a / b;
	echo                 printf^("Resultado de la división: %%.2f\n", resultado^);
	echo             ^} else ^{
	echo                 printf^("Error: División por cero\n"^);
	echo             ^}
	echo             break;
	echo         default:
	echo             printf^("Opción no válida\n"^);
	echo     ^}
	echo.
	echo     return 0;
	echo ^}
	) > calculadora.c
	
PAUSE

REM ----------------------------------------------------------------------------
REM Commit con operaciones implementadas
REM ----------------------------------------------------------------------------

git add calculadora.c
git commit -m "Implementadas operaciones básicas en el menú"

PAUSE

REM ----------------------------------------------------------------------------
REM Fusionar cambios en main y eliminar la rama
REM ----------------------------------------------------------------------------

git checkout main
git merge operaciones
git branch -d operaciones

PAUSE

REM ----------------------------------------------------------------------------
REM Final
REM ----------------------------------------------------------------------------

echo.
echo Proyecto listo y fusionado en la rama main.
echo.

REM ----------------------------------------------------------------------------
REM Compilar y Ejecutar
REM ----------------------------------------------------------------------------

gcc calculadora.c -o calculadora.exe && calculadora.exe

REM ----------------------------------------------------------------------------
REM Detener la salida para evitar que se cierre la consola
REM ----------------------------------------------------------------------------

PAUSE

