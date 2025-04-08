class Alumno:
      def __init__(self,idAlumno,nombre,edad,casado):
            self.idAlumno = idAlumno
            self.nombre = nombre
            self.edad = edad
            self.casado = casado

      def __str__(self):
          return self.nombre + '  ' + str(self.edad)

a = Alumno(1, "Luis", 23, False)

print("Nombre: ", a.nombre)
print(a)