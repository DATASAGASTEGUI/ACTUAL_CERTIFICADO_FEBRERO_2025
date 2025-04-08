from abc import ABC, abstractmethod

class MiembroSeleccion(ABC):
    def __init__(self,id_seleccion=0, nombre='', apellidos='', edad=0):
        self._id_seleccion = id_seleccion
        self._nombre = nombre
        self._apellidos = apellidos
        self._edad = edad

    @property
    def id_seleccion(self):
        return self._id_seleccion
    
    @id_seleccion.setter
    def id_seleccion(self, value):
        self._id_seleccion = value

    @property
    def nombre(self):
        return self._nombre
    
    @nombre.setter
    def nombre(self, value):
        self._nombre = value

    @property
    def apellidos(self):
        return self._apellidos
    
    @apellidos.setter
    def apellidos(self, value):
        self._apellidos = value

    @property
    def edad(self):
        return self._edad   
    
    @edad.setter
    def edad(self, value):
        if value < 0:
            raise ValueError("La edad no puede ser negativa.")
        self._edad = value  

    def mostrar_informacion(self):
        return f"ID Selección: {self.id_seleccion}\n" \
               f"Nombre      : {self.nombre}\n" \
               f"Apellidos   : {self.apellidos}\n" \
               f"Edad        : {self.edad}\n"

    def __str__(self):
        return f"ID: {self.id_seleccion}, Nombre: {self.nombre}, Apellidos: {self.apellidos}, Edad: {self.edad}"
    
    @abstractmethod
    def viajar(self):
        pass    

    '''
    @abstractmethod
    def entrenar(self):
        pass        

    @abstractmethod
    def jugar_partido(self):
        pass 
       

    @abstractmethod
    def concentrarse(self):
        pass
         ''' 