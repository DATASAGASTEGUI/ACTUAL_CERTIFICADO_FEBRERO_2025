from Ejemplo8.empleado import Empleado


class Profesor(Empleado):
    def __init__(self, nombre, institucion, horario, materia):
        super().__init__(nombre, institucion, horario)
        self._materia = materia

    # METODOS SET Y GET
    @property       # get
    def materia(self):
        return self._materia    
    @materia.setter   # set
    def materia(self, nueva_materia):
        self._materia = nueva_materia

    # METODOS ABSTRACTOS
    def calcular_salario(self):
        return 2000

    # METODOS VIENE DE LA HERENCIA PERO LO PERSONALIZAMOS
    def mostrar_informacion(self):
        super().mostrar_informacion()
        print(f"Materia que enseña: {self.materia}") 
        print(f"Salario: {self.calcular_salario()}")   
        