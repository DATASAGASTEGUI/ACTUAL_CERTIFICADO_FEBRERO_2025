

class MiClase:
    def __init__(self, nombre):
        self._nombre = nombre

    def get_nombre(self):
        return self._nombre
    
    def set_nombre(self, nuevo_nombre):
        self._nombre = nuevo_nombre

if __name__ == "__main__":
    mi_clase = MiClase("Juan")

    print("Nombre: ", mi_clase._nombre)
    print(mi_clase.get_nombre())
    mi_clase.set_nombre("Pedro")
    print(mi_clase.get_nombre())


