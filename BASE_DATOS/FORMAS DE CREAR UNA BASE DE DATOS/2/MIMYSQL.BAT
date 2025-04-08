@ECHO OFF
TITLE WALTER
CLS
SET PATH=.;C:\Program Files\MySQL\MySQL Server 8.0\bin;%PATH%
CHCP 850
CHCP 65001
mysql.exe -V
mysql.exe -u root -p12345678 -h localhost -P3307 < schema_biblioteca.sql
mysql.exe -u root -p12345678 -h localhost -P3307 -D biblioteca < data_biblioteca.sql
mysql.exe -u root -p12345678 -h localhost -P3307
PAUSE