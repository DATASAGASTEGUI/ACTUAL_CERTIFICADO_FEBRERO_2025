

class Inscripcion:
    def __init__(self, estudiante=None, curso=None, fecha_inscripcion=""):
        self.estudiante = estudiante
        self.curso = curso
        self.fecha_inscripcion = fecha_inscripcion


    @property   
    def estudiante(self):
        return self._estudiante
    @estudiante.setter
    def estudiante(self, value):
        self._estudiante = value

    @property
    def curso(self):
        return self._curso
    @curso.setter
    def curso(self, value):
        self._curso = value
    
    @property   
    def fecha_inscripcion(self):
        return self._fecha_inscripcion
    @fecha_inscripcion.setter
    def fecha_inscripcion(self, value):
        self._fecha_inscripcion = value
           
    def __str__(self):
        return f"Inscripción de {self.estudiante} en el curso {self.curso} fecha_inscripción: {self.fecha_inscripcion}"
    