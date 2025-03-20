@echo off
set /a contador=1

:inicio
if %contador% LEQ 5 (
    echo Hola, mundo %contador%
    set /a contador+=1
    goto inicio
)

echo Bucle terminado.
pause