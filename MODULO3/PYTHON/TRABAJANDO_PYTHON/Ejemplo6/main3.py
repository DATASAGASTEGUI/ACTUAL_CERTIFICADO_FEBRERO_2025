from tabulate import tabulate

class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def mostrar_datos(self):
        return [self.nombre, self.edad]

class Empleado(Persona):
    def __init__(self, nombre, edad, salario):
        # Llamada directa a Persona.__init__ para evitar problemas con super()
        Persona.__init__(self, nombre, edad)
        self.salario = salario

    def mostrar_datos(self):
        datos_persona = Persona.mostrar_datos(self)
        return datos_persona + [self.salario, "-", "Empleado"]

class Estudiante(Persona):
    def __init__(self, nombre, edad, carrera):
        # Llamada directa a Persona.__init__ para evitar problemas con super()
        Persona.__init__(self, nombre, edad)
        self.carrera = carrera

    def mostrar_datos(self):
        datos_persona = Persona.mostrar_datos(self)
        return datos_persona + ["-", self.carrera, "Estudiante"]

class EstudianteTrabajador(Empleado, Estudiante):
    def __init__(self, nombre, edad, salario, carrera, horario_trabajo="Diurno"):
        # Inicializamos Empleado (que ya inicializa Persona)
        Empleado.__init__(self, nombre, edad, salario)
        # Luego inicializamos solo los atributos de Estudiante (sin Persona nuevamente)
        self.carrera = carrera
        self.horario_trabajo = horario_trabajo

    def mostrar_datos(self):
        datos_empleado = Empleado.mostrar_datos(self)[:-1]  # Eliminamos "Empleado"
        datos_estudiante = ["-", self.carrera]  # Usamos los atributos directamente
        return datos_empleado + datos_estudiante + [self.horario_trabajo, "EstudianteTrabajador"]

def main():
    personas = [
        Empleado("Carlos", 30, 1500),
        Empleado("Lucía", 40, 1800),
        Estudiante("Marta", 22, "Matemáticas"),
        Estudiante("Juan", 19, "Biología"),
        Estudiante("Sara", 23, "Física"),
        EstudianteTrabajador("Ana", 25, 1200, "Ingeniería", "Nocturno"),
        EstudianteTrabajador("Luis", 28, 1000, "Informática"),
        EstudianteTrabajador("Elena", 26, 1100, "Medicina", "Mixto"),
        Empleado("Pedro", 35, 2000),
        Estudiante("Noelia", 21, "Química"),
    ]

    tabla = []
    for persona in personas:
        tabla.append(persona.mostrar_datos())

    encabezados = ["Nombre", "Edad", "Salario (€)", "Carrera", "Horario", "Tipo"]
    print(tabulate(tabla, headers=encabezados, tablefmt="grid"))

if __name__ == "__main__":
    main()