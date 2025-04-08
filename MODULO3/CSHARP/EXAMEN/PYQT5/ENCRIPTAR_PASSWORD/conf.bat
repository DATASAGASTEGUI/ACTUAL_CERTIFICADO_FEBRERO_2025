@ECHO OFF
CLS

REM PYTHON
SET PATH=.;C:\Users\MARIAISABELRUIZPARRA\AppData\Local\Programs\Python\Python313;%PATH%
SET PATH=C:\Users\MARIAISABELRUIZPARRA\AppData\Local\Programs\Python\Python313\Scripts;%PATH%

REM MYSQL
SET PATH=C:\Users\MARIAISABELRUIZPARRA\MySQL_9_4_0\bin;%PATH%

REM SQLITE
SET PATH=C:\sqlite3;%PATH%

REM LIBRERIA PYTHON
SET PYTHONPATH=C:\Users\MARIAISABELRUIZPARRA\Documents\JAVA\TRABAJANDO\ProyectoDjango0012

python --version
pip --version
mysql --version
sqlite3 --version
