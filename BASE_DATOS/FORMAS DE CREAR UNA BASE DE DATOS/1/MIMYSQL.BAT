@ECHO OFF
TITLE WALTER
CLS
SET PATH=.;C:\Program Files\MySQL\MySQL Server 8.0\bin;%PATH%
CHCP 850
CHCP 65001
mysql -V
mysql -u root -p12345678 -h localhost -P3307 < bd_biblioteca.sql
mysql -u root -p12345678 -h localhost -P3307
PAUSE