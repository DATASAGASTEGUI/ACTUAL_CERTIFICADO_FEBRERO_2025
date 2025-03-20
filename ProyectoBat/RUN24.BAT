
:while
set /p input=Escribe "exit" para salir: 
if /I not "%input%"=="exit" (
   echo Aún dentro del bucle...
   goto while
)

echo Saliste del bucle.
pause