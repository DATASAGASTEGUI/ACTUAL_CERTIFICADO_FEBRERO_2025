from gestion_inscripciones import GestionInscripciones
from data import Data
import os

class Principal:
    def __init__(self):
        self.estudiantes = []
        self.cursos = []
        self.inscripciones = []

        Data.obtenerTodosEstudiantesCursosInscripciones(self.estudiantes, self.cursos, self.inscripciones)  
        self.gi = GestionInscripciones(self.estudiantes, self.cursos, self.inscripciones)

    def menu(self):
        while True:
            os.system("cls")
            print("Bienvenido al sistema de gestión de inscripciones")
            print("\nMenú:")
            print("1. Mostrar estudiantes")
            print("2. Mostrar cursos")
            print("3. Salir")
            opcion = input("Seleccione una opción: ")

            if opcion == "1":
               os.system("cls"); self.opcion1(); os.system("pause")
            elif opcion == "2":
                 os.system("cls"); self.opcion2(); os.system("pause")
            elif opcion == "0":
                os.system
                print("Gracias por su visita")
                os.system.pause()
                break


    def opcion1(self    ):
        print("[1]. Mostrar estudiantes")
        print("------------------------")
        self.gi.mostrar_todos_estudiantes()


        


'''
    def agregar_estudiante(self, estudiante):
        self.estudiantes.append(estudiante)

    def agregar_curso(self, curso):
        self.cursos.append(curso)

    def mostrar_estudiantes(self):
        for estudiante in self.estudiantes:
            print(estudiante)

    def mostrar_cursos(self):
        for curso in self.cursos:
            print(curso)
            '''

if __name__ == "__main__":
    principal = Principal()
    principal.menu()