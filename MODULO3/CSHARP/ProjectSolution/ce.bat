@ECHO OFF
REM --- COMPILAR TODO ---
dotnet build ProjectCSharp.sln
REM --- EJECUTAR EL PROYECTO PRINCIPAL ---
dotnet run --project Aplicacion1