@ECHO OFF
REM 1. CREAR UNA SOLUCION EN BLANCO
dotnet new sln -n ProjectCSharp
REM 2. CREAR UN PROYECTO (PRINCIPAL)
dotnet new console -n Aplicacion1
REM 3. CREAR UN PROYECTO (LIBRERIA)
dotnet new classlib -n Aplicacion2
REM 4. AÑADIR EL PROYECTO PRINCIPAL Y EL PROYECTO LIBRERIA A LA SOLUCION
dotnet sln ProjectCSharp.sln add Aplicacion1/Aplicacion1.csproj
dotnet sln ProjectCSharp.sln add Aplicacion2/Aplicacion2.csproj
REM 5. AÑADIR LA REFERENCIA DEL PROYECTO LIBRERIA AL PROYECTO PRINCIPAL
dotnet add Aplicacion1/Aplicacion1.csproj reference Aplicacion2/Aplicacion2.csproj