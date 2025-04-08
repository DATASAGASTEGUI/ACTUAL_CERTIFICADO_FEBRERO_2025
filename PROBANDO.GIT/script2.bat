@echo off
set repos=https://github.com/TheAlgorithms/Java.git https://github.com/kubernetes-client/java.git

for %%r in (%repos%) do (
    echo Clonando %%r
    git clone %%r
    echo ----------------------------------------
)

echo Todos los repositorios han sido clonados
pause