from miembro_seleccion import MiembroSeleccion

class Masajista(MiembroSeleccion):
    def __init__(self, id_seleccion=0, nombre='', apellidos='', edad=0, titulacion='', darMasaje=''):
        super().__init__(id_seleccion, nombre, apellidos, edad)
        self._titulacion = titulacion
        self._darMasaje = darMasaje

    @property
    def titulacion(self):
        return self._titulacion
    
    @titulacion.setter
    def titulacion(self, value):
        if not value:
            raise ValueError("La titulación no puede estar vacía.")
        self._titulacion = value

    @property
    def darMasaje(self):
        return self._darMasaje
    
    @darMasaje.setter
    def darMasaje(self, value):
        if not isinstance(value, bool):
            raise ValueError("darMasaje debe ser un valor booleano.")
        self._darMasaje = value

    # METODOS HEREDADOS
    def viajar(self):
        return f"{self.nombre} está viajando con la selección como masajista."


    # METODOS PROPIOS
    def mostrar_informacion(self):
        return super().mostrar_informacion() + \
               f"Titulación: {self.titulacion}\n" \
               f"Dar Masaje: {'Sí' if self.darMasaje else 'No'}\n"



    def __str__(self):
        return f"Masajista: {self.nombre}, Edad: {self.edad}, Experiencia: {self.experiencia} años"