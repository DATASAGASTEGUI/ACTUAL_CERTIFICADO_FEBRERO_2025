@ECHO OFF
CLS
CHCP 65001 > NUL
SET PATH=C:\dotnet-sdk-8.0.414-win-x64;%PATH%
dotnet --version