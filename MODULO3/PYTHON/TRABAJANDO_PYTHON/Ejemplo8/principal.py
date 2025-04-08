from Ejemplo8.conserje import Conserje
from Ejemplo8.profesor import Profesor
from Ejemplo8.secretaria import Secretaria


class Principal:
    def __init__(self):
        empleados = [
            Profesor("Juan Pérez", "Escuela Secundaria", "Lunes a Viernes 8:00-16:00", "Matemáticas"),
            Conserje("Ana Gómez", "Escuela Primaria", "Lunes a Viernes 7:00-15:00", ["Escoba", "Trapeador"]),
            Secretaria("María López", "Universidad", "Lunes a Viernes 9:00-17:00", ["Microsoft Office","Antivirus"]),
            Profesor("Carlos Sánchez", "Instituto Técnico", "Lunes a Viernes 8:00-16:00", "Programación")
        ]
        for empleado in empleados:
            print(f"Información del {empleado.__class__.__name__}:")
            empleado.mostrar_informacion()

# PUNTO DE ENTRADA DE LA APLICACIÓN
if __name__ == "__main__":
   Principal()

   p = Profesor("Juan Pérez", "Escuela Secundaria", "Lunes a Viernes 8:00-16:00", "Matemáticas")
   print("Materia: ", p._materia) #get

  
   

        
'''
__init__
__str__
__repr__
'''