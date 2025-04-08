class Estudiante:
    def __init__(self, idEstudiante="",nombre=""):
        self._idEstudiante = idEstudiante
        self._nombre = nombre
        self.inscripciones = []

    @property
    def idEstudiante(self):
        return self._idEstudiante
    
    @idEstudiante.setter
    def idEstudiante(self, value):
        self._idEstudiante = value

    @property
    def nombre(self):
        return self._nombre
    @nombre.setter
    def nombre(self, value):
        self._nombre = value

    def __str__(self):
        return f"Estudiante --> Nombre: {self.nombre}, ID: {self.idEstudiante}"

    def inscribir_curso(self, curso, fecha_inscripcion):
        inscripcion = Inscripcion(self, curso, fecha_inscripcion)
        self.inscripciones.append(inscripcion)
        