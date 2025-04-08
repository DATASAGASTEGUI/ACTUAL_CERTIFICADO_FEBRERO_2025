import os

from futbolista import Futbolista
from masajista import Masajista
from entrenador import Entrenador
from gestion_miembro_seleccion import GestionMiembrosSeleccion 

listado = [
        Futbolista(1, "Lionel", "Messi", 36, 10, "Delantero"),
        Futbolista(2, "Cristiano", "Ronaldo", 38, 7, "Delantero"),
        Futbolista(3, "Andrés", "Iniesta", 39, "Centrocampista", 8),
        Futbolista(4, "Sergio", "Ramos", 37, 4, "Defensa"),
        Futbolista(5, "Gerard", "Piqué", 36, 3, "Defensa"),
        Futbolista(6, "Xavi", "Hernández", 43, "Centrocampista", 6),
        Masajista(7, "Juan", "Gómez", 30, "Fisioterapeuta", True),
        Entrenador(8, "Pep", "Guardiola", 52, "Táctica avanzada", True),
    ]

def main():
    menu()


def menu():
    gms = GestionMiembrosSeleccion(listado)
    
    while(True):
        print("1. Agregar miembro a la selección")
        print("2. Mostrar miembros de la selección")
        print("3. Buscar miembro por ID")
        print("4. Eliminar miembro de la selección")
        print("5. Actualizar el nombre de un miembro de la selección")
        print("6. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == '1':
            id_seleccion = int(input("Ingrese ID de selección: "))
            nombre = input("Ingrese nombre: ")
            apellidos = input("Ingrese apellidos: ")
            edad = int(input("Ingrese edad: "))
            tipo_miembro = input("Ingrese tipo de miembro (Futbolista, Masajista, Entrenador): ")
            
            if tipo_miembro.lower() == 'futbolista':
                dorsal = int(input("Ingrese dorsal: "))
                posicion = input("Ingrese posición: ")
                miembro = Futbolista(id_seleccion, nombre, apellidos, edad, dorsal, posicion)
                gms.agregar_miembro(miembro)
            elif tipo_miembro.lower() == 'masajista':
                titulacion = input("Ingrese titulación: ")
                dar_masaje = input("¿Dar masaje? (Sí/No): ").lower() == 'sí'
                miembro = Masajista(id_seleccion, nombre, apellidos, edad, titulacion, dar_masaje)
                gms.agregar_miembro(miembro)
            elif tipo_miembro.lower() == 'entrenador':
                estrategia = input("Ingrese estrategia: ")
                dirigir_entrenamiento = input("¿Dirigir entrenamiento? (Sí/No): ").lower() == 'sí'
                miembro = Entrenador(id_seleccion, nombre, apellidos, edad, estrategia, dirigir_entrenamiento)
                gms.agregar_miembro(miembro)
            else:
                print("Tipo de miembro no válido.")
                continue
        if opcion == '2':
            gms.mostrar_miembros()
        if opcion == '3':
            os.system('cls')
            id_seleccion = int(input("Ingrese ID de selección a buscar: "))
            miembro = gms.buscar_miembro(id_seleccion)
            if miembro: # None es False
                if isinstance(miembro, Futbolista):
                   print("Clase: Futbolista")
                if isinstance(miembro, Masajista):
                    print("Clase: Masajista")
                if isinstance(miembro, Entrenador):
                    print("Clase: Entrenador")
            else:
                print("Miembro no encontrado.")
            os.system('pause')
        if opcion == '4':
            os.system('cls')
            id_seleccion = int(input("Ingrese ID de selección a eliminar: "))
            if gms.eliminar_miembro(id_seleccion):
                print("Miembro eliminado correctamente.")
            else:
                print("Miembro no encontrado.")
            os.system('pause')
        
        if opcion == '5':
            os.system('cls')
            id_seleccion = int(input("Ingrese ID de selección a actualizar: "))
            nuevo_nombre = input("Ingrese nuevo nombre: ")
            if gms.actualizar_miembro(id_seleccion, nuevo_nombre):
                print("Miembro actualizado correctamente.")
            else:
                print("Miembro no encontrado.")
            os.system('pause')

if __name__ == "__main__":
   os.system('cls')
   main()

   os.system('pause')