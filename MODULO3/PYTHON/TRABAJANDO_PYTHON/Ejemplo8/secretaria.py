from Ejemplo8.empleado import Empleado


class Secretaria(Empleado):
    def __init__(self, nombre, institucion, horario, software_usa):
        super().__init__(nombre, institucion, horario)
        self._software_usa = software_usa

    # METODOS SET Y GET
    @property              # get
    def software_usa(self):
        return self._software_usa
    @software_usa.setter   # set
    def software_usa(self, nuevo_software):
        self._software_usa = nuevo_software

    # METODOS ABSTRACTOS
    def calcular_salario(self):
        return 15000  # Salario fijo para el ejemplo
    
    # METODOS VIENE DE LA HERENCIA PERO LO PERSONALIZAMOS
    def mostrar_informacion(self):
        super().mostrar_informacion()
        print(f"Software que usa: {self.software_usa}")
        print(f"Salario: {self.calcular_salario()}")
