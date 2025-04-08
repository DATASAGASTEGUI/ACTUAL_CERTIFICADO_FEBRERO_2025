REM Ejemplo 1: Script Básico con Comandos Git
@echo off
:menu
cls
echo Seleccione una opcion:
echo 1. Git status
echo 2. Git pull
echo 3. Git add y commit
echo 4. Git push
echo 5. Salir
set /p opcion="Ingrese opcion: "

if "%opcion%"=="1" (
    git status
    pause
    goto menu
)
if "%opcion%"=="2" (
    git pull
    pause
    goto menu
)
if "%opcion%"=="3" (
    set /p mensaje="Ingrese mensaje del commit: "
    git add .
    git commit -m "%mensaje%"
    pause
    goto menu
)
if "%opcion%"=="4" (
    git push
    pause
    goto menu
)
if "%opcion%"=="5" (
    exit
)
goto menu

REM Ejemplo 2: Automatización de Flujo Git Completo
@echo off
setlocal enabledelayedexpansion

:inicio
echo Iniciando proceso Git...
echo.

:loop
set /p branch="Ingrese nombre de rama (o 'salir' para terminar): "

if "%branch%"=="salir" (
    exit
)

echo.
echo Trabajando en rama: %branch%
echo.

:: Cambiar a la rama
git checkout %branch% || git checkout -b %branch%

:: Actualizar cambios
git pull origin %branch%

:: Agregar cambios
git add .

:: Hacer commit
set /p commit_msg="Ingrese mensaje para el commit: "
git commit -m "!commit_msg!"

:: Hacer push
git push origin %branch%

echo.
echo Operaciones completadas para la rama %branch%
echo.

goto loop

REM Ejemplo 3: Script para Clonar Múltiples Repositorios
@echo off
set repos=https://github.com/user/repo1.git https://github.com/user/repo2.git https://github.com/user/repo3.git

for %%r in (%repos%) do (
    echo Clonando %%r
    git clone %%r
    echo ----------------------------------------
)

echo Todos los repositorios han sido clonados
pause

REM Ejemplo 4: Actualizar Múltiples Repositorios Locales
@echo off
setlocal enabledelayedexpansion

for /d %%i in (*) do (
    if exist "%%i\.git" (
        echo Actualizando repositorio: %%i
        cd "%%i"
        git pull
        cd ..
        echo ----------------------------------------
    )
)

echo Todos los repositorios han sido actualizados
pause
REM Ejemplo 5: Cambio Masivo entre Ramas con Confirmación
@echo off
setlocal enabledelayedexpansion

:start
cls
echo Ramas disponibles:
git branch
echo.
set /p branch="Ingrese nombre de rama a la que cambiar (o 'exit' para salir): "

if "!branch!"=="exit" exit

echo.
echo Cambiando a rama !branch!...
git checkout !branch!

if errorlevel 1 (
    set /p create="La rama no existe. ¿Crearla? (s/n): "
    if /i "!create!"=="s" (
        git checkout -b !branch!
    )
)

echo.
set /p continue="¿Desea cambiar a otra rama? (s/n): "
if /i "!continue!"=="s" goto start

exit
REM Ejemplo 6: Limpieza de Ramas Locales (elimina ramas ya fusionadas)
@echo off
echo Limpieza de ramas locales...
echo.

:: Actualizar referencia de ramas remotas
git fetch --prune

:: Obtener ramas locales fusionadas con main/master
for /f "tokens=*" %%b in ('git branch --merged ^| findstr /v "main master"') do (
    echo ¿Eliminar rama %%b?
    set /p delete="(s/n): "
    if /i "!delete!"=="s" (
        git branch -d %%b
    )
    echo.
)

echo Limpieza completada.
pause
REM Ejemplo 7: Script para Hacer Rebase Interactivo
@echo off
setlocal enabledelayedexpansion

echo Rebase interactivo
echo.
git branch
echo.
set /p branch="¿Contra qué rama hacer rebase? (main/master/otra): "
set /p num_commits="¿Cuántos commits revisar? (ej. 5): "

echo.
echo Iniciando rebase interactivo para los últimos !num_commits! commits...
git rebase -i HEAD~!num_commits! !branch!

if errorlevel 1 (
    echo.
    echo Hubo conflictos durante el rebase.
    echo 1. Resolver conflictos manualmente
    echo 2. Abortar rebase
    set /p option="Seleccione opción: "
    
    if "!option!"=="1" (
        echo Ejecute 'git rebase --continue' después de resolver conflictos
    ) else (
        git rebase --abort
        echo Rebase abortado.
    )
) else (
    echo Rebase completado exitosamente.
)

pause
REM Ejemplo 8: Actualizar Múltiples Repositorios en Subdirectorios
@echo off
setlocal enabledelayedexpansion

set BASE_DIR=C:\ruta\a\tus\proyectos

echo Buscando repositorios Git en !BASE_DIR!...
echo.

for /d /r !BASE_DIR! %%i in (*) do (
    if exist "%%i\.git" (
        echo Actualizando: %%i
        cd /d "%%i"
        git fetch --all
        git pull
        echo ----------------------------------------
    )
)

echo Todos los repositorios han sido actualizados.
pause
REM Ejemplo 9: Crear Tags y Publicarlos
@echo off
setlocal enabledelayedexpansion

:start
cls
echo Administración de Tags
echo.
echo 1. Listar tags existentes
echo 2. Crear nuevo tag
echo 3. Enviar tags al remoto
echo 4. Salir
echo.
set /p option="Seleccione opción: "

if "!option!"=="1" (
    git tag -l
    pause
    goto start
)

if "!option!"=="2" (
    set /p tag_name="Nombre del tag (ej. v1.0.0): "
    set /p tag_message="Mensaje descriptivo: "
    git tag -a !tag_name! -m "!tag_message!"
    echo Tag !tag_name! creado localmente.
    pause
    goto start
)

if "!option!"=="3" (
    echo Enviando tags al remoto...
    git push origin --tags
    pause
    goto start
)

if "!option!"=="4" exit

goto start
REM Ejemplo 10: Stash Automático con Menú
@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Gestión de Stash
echo.
echo 1. Guardar cambios en stash
echo 2. Listar stashes
echo 3. Aplicar último stash
echo 4. Aplicar stash específico
echo 5. Limpiar stashes
echo 6. Salir
echo.
set /p option="Seleccione opción: "

if "!option!"=="1" (
    set /p stash_name="Nombre descriptivo (opcional): "
    if "!stash_name!"=="" (
        git stash push
    ) else (
        git stash push -m "!stash_name!"
    )
    pause
    goto menu
)

if "!option!"=="2" (
    git stash list
    pause
    goto menu
)

if "!option!"=="3" (
    git stash apply
    pause
    goto menu
)

if "!option!"=="4" (
    git stash list
    echo.
    set /p stash_id="Ingrese índice del stash (ej. stash@{1}): "
    git stash apply !stash_id!
    pause
    goto menu
)

if "!option!"=="5" (
    git stash clear
    echo Todos los stashes han sido eliminados.
    pause
    goto menu
)

if "!option!"=="6" exit

goto menu

Consejos para personalizar tus scripts:
Combina comandos: Puedes encadenar comandos git en una sola línea con &&

git add . && git commit -m "mensaje" && git push
Agrega validaciones: Verifica si estás en un repositorio git antes de ejecutar comandos

if not exist ".git" (
    echo Esto no es un repositorio Git!
    pause
    exit
)
Registra logs: Añade registro de actividades

echo %date% %time% - Operación completada >> git_operations.log
Maneja errores: Usa if errorlevel para manejar situaciones de error

¿Te gustaría que desarrolle algún script específico para tu flujo de trabajo particular?


