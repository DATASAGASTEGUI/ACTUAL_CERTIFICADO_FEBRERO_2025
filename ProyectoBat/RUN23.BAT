@echo off
REM SIMULAR DO...WHILE
:inicio
set /p input=Escribe "exit" para salir: 

if /I "%input%"=="exit" goto fin
echo Aún dentro del bucle...
goto inicio

:fin
echo Saliste del bucle.
pause