from futbolista import Futbolista
from masajista import Masajista
from entrenador import Entrenador

class GestionMiembrosSeleccion:
    def __init__(self, miembros_seleccion=[]):
        self.miembros_seleccion = miembros_seleccion

    def agregar_miembro(self, miembro):
        self.miembros_seleccion.append(miembro)

    # READ
    def mostrar_miembros(self):
        print("-" * 40)
        for miembro in self.miembros_seleccion:
            if isinstance(miembro, Futbolista):
                print("Clase: Futbolista")
            if isinstance(miembro, Masajista):
                print("Clase: Masajista")
            if isinstance(miembro, Entrenador):
                print("Clase: Entrenador")

            print(miembro.mostrar_informacion())
            print("-" * 40)

    # READ
    def buscar_miembro(self, id_seleccion):
        for miembro in self.miembros_seleccion:
            if miembro.id_seleccion == id_seleccion:
               return miembro
        return None
    # DELETE
    def eliminar_miembro(self, id_seleccion):
        miembro = self.buscar_miembro(id_seleccion)
        if miembro:
            self.miembros_seleccion.remove(miembro)
            return True
        return False
    # UPDATE
    def actualizar_miembro(self, id_seleccion, nuevo_nombre):
        for miembro in self.miembros_seleccion:
            if miembro.id_seleccion == id_seleccion:
                miembro.nombre = nuevo_nombre
                return True
        return False
    



