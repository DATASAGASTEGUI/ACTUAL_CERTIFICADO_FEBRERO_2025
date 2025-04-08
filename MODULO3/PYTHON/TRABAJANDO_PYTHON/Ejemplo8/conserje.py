

from Ejemplo8.empleado import Empleado


class Conserje(Empleado):
    def __init__(self, nombre, institucion, horario, herramientas):
        super().__init__(nombre, institucion, horario)
        self._herramientas = herramientas

    # METODOS SET Y GET
    @property              # getter
    def herramientas(self):
        return self._herramientas
    @herramientas.setter
    def herramientas(self, herramientas):
        self._herramientas = herramientas

    # METODOS ABSTRACTOS
    def calcular_salario(self):
        return 800

    # METODOS VIENE DE LA HERENCIA PERO LO PERSONALIZAMOS
    def mostrar_informacion(self):
        super().mostrar_informacion()
        print(f"Herramientas que usa: {self.herramientas}")
        print(f"Salario: {self.calcular_salario()}")