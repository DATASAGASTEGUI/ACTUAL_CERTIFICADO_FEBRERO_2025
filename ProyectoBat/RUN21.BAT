@echo off
cls
set archivo=nose.txt
:while
if not exist %archivo% (
    echo Esperando que aparezca nose.txt...
    timeout /t 2 >nul
    goto :while
)
echo nose.txt encontrado