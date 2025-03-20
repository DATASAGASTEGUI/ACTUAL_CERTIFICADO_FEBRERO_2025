@ECHO OFF
schtasks /create ^
         /sc once ^
         /tn "ALEATORIO" ^
         /tr "F:\BORJA80GB\PROJECTS\PROJECTS___CMD\CMD___PROGRAMAR.TAREA\C\RUN.CMD" ^
         /st 22:28 ^
         /f ^
         /rl highest
PAUSE > NUL