@ECHO OFF
TITLE MONGODB
mongoimport 01_tienda_producto.json -d 01_tienda -c producto --jsonArray --drop
PAUSE