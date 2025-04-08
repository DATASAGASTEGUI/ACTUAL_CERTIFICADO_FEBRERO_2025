from inscripcion import Inscripcion

class Curso:
    def __init__(self, id_curso = "", nombre = ""):
        self._id_curso = id_curso
        self._nombre = nombre
        self.inscripciones = []

    @property
    def id_curso(self):
        return self._id_curso
    @id_curso.setter
    def id_curso(self, value):
        self._id_curso = value
    @property
    def nombre(self):
        return self._nombre
    @nombre.setter
    def nombre(self, value):
        self._nombre = value

    def __str__(self):
        return f"Curso ID: {self.id_curso}, Nombre: {self.nombre}"  

    def agregar_inscripcion(self, inscripcion):
        self.inscripciones.append(inscripcion)


