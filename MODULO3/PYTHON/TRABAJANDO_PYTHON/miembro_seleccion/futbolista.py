from miembro_seleccion import MiembroSeleccion
from concentracion import Concentracion

class Futbolista(MiembroSeleccion, Concentracion):
    def __init__(self, id_seleccion=0, nombre='', apellidos='', edad=0, dorsal=0, posicion=''):
        super().__init__(id_seleccion, nombre, apellidos, edad)
        self._dorsal = dorsal
        self._posicion = posicion

    @property 
    def dorsal(self):
        return self._dorsal
    
    @dorsal.setter
    def dorsal(self, value):
        if value < 0:
            raise ValueError("El dorsal no puede ser negativo.")
        self._dorsal = value

    @property
    def posicion(self):
        return self._posicion
    
    @posicion.setter
    def posicion(self, value):
        if not value:
            raise ValueError("La posición no puede estar vacía.")
        self._posicion = value

    # METODOS HEREDADOS
    def viajar(self):
        return f"{self.nombre} está viajando con la selección."
    
    # METODOS DE LA CLASE CONCENTRACION
    def concentrarse(self):
        return f"{self.nombre} está concentrando con el equipo."
    
    # METODOS PROPIOS
    def entrenar(self):
        return f"{self.nombre} está entrenando en la posición de {self.posicion}."
    
    def jugar_partido(self):
        return f"{self.nombre} está jugando un partido como {self.posicion} con el dorsal {self.dorsal}."   

    def mostrar_informacion(self):
        return super().mostrar_informacion() + \
               f"Dorsal     : {self.dorsal}\n" \
               f"Posición   : {self.posicion}\n"
    
    def __str__(self):
        return super().__str__() + f", Dorsal: {self.dorsal}, Posición: {self.posicion}"