from miembro_seleccion import MiembroSeleccion
from concentracion import Concentracion

class Entrenador(MiembroSeleccion, Concentracion):
    def __init__(self, id_seleccion=0, nombre='', apellidos='', edad=0, estrategia='', dirigirEntrenamiento=False):
        super().__init__(id_seleccion, nombre, apellidos, edad)
        self._estrategia = estrategia
        self._dirigirEntrenamiento = dirigirEntrenamiento

    @property
    def estrategia(self):
        return self._estrategia
    
    @estrategia.setter
    def estrategia(self, value):
        if not value:
            raise ValueError("La estrategia no puede estar vacía.")
        self._estrategia = value

    @property
    def dirigirEntrenamiento(self):
        return self._dirigirEntrenamiento
    @dirigirEntrenamiento.setter
    def dirigirEntrenamiento(self, value):
        if not isinstance(value, bool):
            raise ValueError("dirigirEntrenamiento debe ser un valor booleano.")
        self._dirigirEntrenamiento = value

    # METODOS HEREDADOS
    def viajar(self):
        return f"{self.nombre} está viajando con la selección como entrenador."
    
    # METODOS DE LA CLASE CONCENTRACION
    def concentrarse(self):
        return f"{self.nombre} está concentrando al equipo con la estrategia: {self.estrategia}."

    # METODOS PROPIOS
    def dirigir_entrenamiento(self):
        if self.dirigirEntrenamiento:
            return f"{self.nombre} está dirigiendo el entrenamiento con la estrategia: {self.estrategia}."
        else:
            return f"{self.nombre} no dirige el entrenamiento."
     
    def dirigir_partido(self):
        return f"{self.nombre} está dirigiendo el partido con la estrategia: {self.estrategia}."    
    
    def mostrar_informacion(self):
        return super().mostrar_informacion() + \
               f"Estrategia          : {self.estrategia}\n" \
               f"Dirigir Entrenamiento: {'Sí' if self.dirigirEntrenamiento else 'No'}\n"
    
    def __str__(self):
        return f"Entrenador: {self.nombre}, Edad: {self.edad}, Nacionalidad: {self.nacionalidad}, Experiencia: {self.experiencia} años"