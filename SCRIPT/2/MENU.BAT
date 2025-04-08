@ECHO OFF

:MENU
CLS
echo [1] CREAR UN CONTROL DE VERSION 
echo [2] CONFIGURAR USUARIO: NOMBRE-EMAIL-PASSWORD
echo [3] REALIZAR PRIMER COMMIT
echo [4] REALIZAR EL COMMIT SOBRE EL ULTIMO
echo [5] CONFIGURAR REPOSITORIO REMOTO
echo [6] CAMBIAR NOMBRE DE LA RAMA PRINCIPAL DE MASTER A MAIN
echo [7] SUBIR EL REPOSITORIO LOCAL AL REMOTO
echo [8] SALIR"

SET /P OPCION="INGRESAR OPCION: "

IF "1"=="%OPCION%" ( 
   CLS
   ECHO [1] CREAR UN CONTROL DE VERSION
   ECHO -------------------------------
   git init
   PAUSE
   GOTO MENU
)

IF "2"=="%OPCION%" ( 
   CLS
   ECHO [2] CONFIGURAR USUARIO: NOMBRE-EMAIL-PASSWORD
   ECHO ---------------------------------------------
   git config user.name DATASAGASTEGUI
   git config user.email datasagamadrid@gmail.com
   git config user.password xxxxxxx
   PAUSE
   GOTO MENU
)

IF "3"=="%OPCION%" ( 
   CLS
   echo [3] REALIZAR PRIMER COMMIT
   echo --------------------------
   git add .
   git commit -m "SNAPSHOT 1"
   PAUSE
   GOTO MENU
)

IF "4"=="%OPCION%" ( 
   CLS
   ECHO [4] REALIZAR EL COMMIT SOBRE EL ULTIMO
   ECHO --------------------------------------
   git add .
   git commit --amend -m "SNAPSHOT 1"   
   PAUSE
   GOTO MENU
)

IF "5"=="%OPCION%" ( 
   CLS
   ECHO [5] CONFIGURAR REPOSITORIO REMOTO
   ECHO ---------------------------------
   git remote add origin "https://github.com/DATASAGASTEGUI/ACTUAL_CERTIFICADO_FEBRERO_2025.git"
   PAUSE
   GOTO MENU
)

IF "6"=="%OPCION%" ( 
   CLS
   ECHO [6] CAMBIAR NOMBRE DE LA RAMA PRINCIPAL DE MASTER A MAIN
   ECHO --------------------------------------------------------
   git branch -M main 
   PAUSE
   GOTO MENU
)

IF "7"=="%OPCION%" ( 
   CLS
   ECHO [7] SUBIR EL REPOSITORIO LOCAL AL REMOTO
   ECHO ----------------------------------------
   git push -u -f origin main
   PAUSE
   GOTO MENU
)

IF "8"=="%OPCION%" ( 
   CLS
   ECHO GRACIAS POR SU VISITA
   PAUSE
   EXIT
)

GOTO MENU

   
