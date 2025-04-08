@echo off
setlocal enabledelayedexpansion
set contador=1
:while
if !contador! leq 5 (
    echo Contador: !contador!
    set /a contador+=1
    goto :while
)

for /l %%i in (1,1,5) do (
    echo Contador: %%i
)
