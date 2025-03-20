@ECHO OFF
schtasks /create ^
         /sc once ^
         /tn "PROYECTO CONSOLA JAVA" ^
         /tr "C:\Users\RYZEN\Downloads\A5___BAT\A5___BAT\CMD___PROGRAMAR.TAREA.EJECUTAR.PROGRAMA\JAVA\EJECUTAR.CMD" ^
         /st 16:47 ^
         /f
PAUSE