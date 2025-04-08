from pymongo import MongoClient
# pip install pymongo

# Establecer conexión con la base de datos
client = MongoClient('localhost', 27017)
db = client['tienda']  # Reemplaza 'nombre_de_tu_base_de_datos' con el nombre real de tu base de datos
collection = db['producto']

# Consulta
result = collection.find({}, {"nombre": 1, "_id": 1}).sort([("_id", 1)]).limit(10)
print(list(result))
# Mostrar resultadospy
for document in result:
    print(document)