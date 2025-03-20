@ECHO OFF
TITLE SCRIPT BAT
SCHTASKS /CREATE ^
         /SC MINUTE ^
         /MO 1 ^
         /TN "EJECUTARTAREA" ^
         /tr "C:\CERTIFICADO_27022025_MODULO1\ProyectoBat\TAREA.BAT" ^
         /ST 16:20 ^
         /rl highest ^
         /F
PAUSE