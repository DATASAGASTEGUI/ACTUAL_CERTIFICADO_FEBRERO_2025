

class GestionInscripciones:
    def __init__(self, estudiantes=None, cursos=None, inscripciones=None):
        self._estudiantes = estudiantes 
        self._cursos = cursos
        self._inscripciones = inscripciones

    @property
    def estudiantes(self):
        return self._estudiantes    
    @estudiantes.setter
    def estudiantes(self, value):
        self._estudiantes = value
    @property
    def cursos(self):
        return self._cursos 
    @cursos.setter
    def cursos(self, value):
        self._cursos = value
    @property
    def inscripciones(self):
        return self._inscripciones    
    @inscripciones.setter   
    def inscripciones(self, value):
        self._inscripciones = value

    def mostrar_todos_estudiantes(self):
        for estudiante in self.estudiantes:
            print(estudiante)