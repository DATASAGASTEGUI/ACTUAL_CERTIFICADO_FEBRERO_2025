
import tabulate
# pip install abc

from abc import ABC, abstractmethod

class Empleado(ABC):
    def __init__(self, nombre, institucion, horario):
        self._nombre = nombre
        self._institucion = institucion
        self._horario = horario

    @property       # get         
    def nombre(self):
        return self._nombre
    @nombre.setter   # set
    def nombre(self, nuevo_nombre):
        self._nombre = nuevo_nombre
    @property       # get
    def institucion(self):
        return self._institucion
    @institucion.setter   # set
    def institucion(self, nueva_institucion):
        self._institucion = nueva_institucion
    @property       # get
    def horario(self):
        return self._horario
    @horario.setter   # set
    def horario(self, nuevo_horario):
        self._horario = nuevo_horario

    @abstractmethod
    def calcular_salario(self):
        pass

    def mostrar_informacion(self):
        print(f"Nombre     : {self.nombre}")
        print(f"Institución: {self.institucion}")
        print(f"Horario    : {self.horario}")
        print(f"Salario    : {self.calcular_salario()}")



    def __str__(self):
        return "Nombre: " + self.nombre + "\nInstitucion: " + self.institucion + "\nHorario: " + self.horario
