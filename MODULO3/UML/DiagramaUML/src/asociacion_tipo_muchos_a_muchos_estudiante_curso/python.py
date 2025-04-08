
from typing import List
import os

class Estudiante:
    def __init__(self, id_estudiante: str = "", nombre: str = ""):
        self.id_estudiante = id_estudiante
        self.nombre = nombre
        self.inscripciones: List[Inscripcion] = []

    # Métodos get y set
    @property
    def id_estudiante(self) -> str:
        return self._id_estudiante

    @id_estudiante.setter
    def id_estudiante(self, id_estudiante: str):
        self._id_estudiante = id_estudiante

    @property
    def nombre(self) -> str:
        return self._nombre

    @nombre.setter
    def nombre(self, nombre: str):
        self._nombre = nombre

    def __str__(self) -> str:
        return f"Estudiante(id_estudiante={self.id_estudiante}, nombre={self.nombre})"

    def inscribir_curso(self, curso: 'Curso', fecha_inscripcion: str):
        inscripcion = Inscripcion(self, curso, fecha_inscripcion)
        self.inscripciones.append(inscripcion)


class Curso:
    def __init__(self, id_curso: str = "", nombre: str = ""):
        self.id_curso = id_curso
        self.nombre = nombre
        self.inscripciones: List[Inscripcion] = []

    # Métodos get y set
    @property
    def id_curso(self) -> str:
        return self._id_curso

    @id_curso.setter
    def id_curso(self, id_curso: str):
        self._id_curso = id_curso

    @property
    def nombre(self) -> str:
        return self._nombre

    @nombre.setter
    def nombre(self, nombre: str):
        self._nombre = nombre

    def __str__(self) -> str:
        return f"Curso(id_curso={self.id_curso}, nombre={self.nombre})"

    def agregar_inscripcion(self, inscripcion: 'Inscripcion'):
        self.inscripciones.append(inscripcion)


class Inscripcion:
    def __init__(self, estudiante: Estudiante = None, curso: Curso = None, fecha_inscripcion: str = ""):
        self.estudiante = estudiante
        self.curso = curso
        self.fecha_inscripcion = fecha_inscripcion

    # Métodos get y set
    @property
    def estudiante(self) -> Estudiante:
        return self._estudiante

    @estudiante.setter
    def estudiante(self, estudiante: Estudiante):
        self._estudiante = estudiante

    @property
    def curso(self) -> Curso:
        return self._curso

    @curso.setter
    def curso(self, curso: Curso):
        self._curso = curso

    @property
    def fecha_inscripcion(self) -> str:
        return self._fecha_inscripcion

    @fecha_inscripcion.setter
    def fecha_inscripcion(self, fecha_inscripcion: str):
        self._fecha_inscripcion = fecha_inscripcion

    def __str__(self) -> str:
        return f"Inscripcion(estudiante={self.estudiante}, curso={self.curso}, fecha_inscripcion={self.fecha_inscripcion})"


class GestionMatricula:
    def __init__(self, estudiantes: List[Estudiante] = None, cursos: List[Curso] = None, inscripciones: List[Inscripcion] = None):
        self.estudiantes = estudiantes if estudiantes is not None else []
        self.cursos = cursos if cursos is not None else []
        self.inscripciones = inscripciones if inscripciones is not None else []

    # Métodos get y set
    @property
    def estudiantes(self) -> List[Estudiante]:
        return self._estudiantes

    @estudiantes.setter
    def estudiantes(self, estudiantes: List[Estudiante]):
        self._estudiantes = estudiantes

    @property
    def cursos(self) -> List[Curso]:
        return self._cursos

    @cursos.setter
    def cursos(self, cursos: List[Curso]):
        self._cursos = cursos

    @property
    def inscripciones(self) -> List[Inscripcion]:
        return self._inscripciones

    @inscripciones.setter
    def inscripciones(self, inscripciones: List[Inscripcion]):
        self._inscripciones = inscripciones

    def __str__(self) -> str:
        return f"GestionMatricula(estudiantes={self.estudiantes}, cursos={self.cursos}, inscripciones={self.inscripciones})"

    # Métodos CRUD
    def mostrar_todos_estudiantes(self):
        for e in self.estudiantes:
            print(e)

    def mostrar_todos_cursos(self):
        for c in self.cursos:
            print(c)

    def obtener_asignaturas_de_un_estudiante(self, id_estudiante: str) -> List[str]:
        nombres_cursos = []
        for inscripcion in self.inscripciones:
            curso = inscripcion.curso
            estudiante = inscripcion.estudiante
            if estudiante.id_estudiante.lower() == id_estudiante.lower():
                nombres_cursos.append(curso.nombre)
        return nombres_cursos


class Data:
    @staticmethod
    def get_estudiantes_cursos_inscripciones(estudiantes: List[Estudiante], cursos: List[Curso], inscripciones: List[Inscripcion]):
        luis = Estudiante("E1", "Luis")
        miguel = Estudiante("E2", "Miguel")
        carlos = Estudiante("E3", "Carlos")
        maria = Estudiante("E4", "María")
        silvia = Estudiante("E5", "Silvia")

        estudiantes.extend([luis, miguel, carlos, maria, silvia])

        mat = Curso("Mat", "Matemática")
        qui = Curso("Qui", "Química")
        fis = Curso("Fis", "Física")

        cursos.extend([mat, qui, fis])

        inscripciones.extend([
            Inscripcion(luis, mat, "2025-01-01"),
            Inscripcion(luis, qui, "2025-01-01"),
            Inscripcion(luis, fis, "2025-01-01"),
            Inscripcion(miguel, mat, "2025-01-02"),
            Inscripcion(miguel, qui, "2025-01-02"),
            Inscripcion(carlos, mat, "2025-01-01"),
            Inscripcion(carlos, fis, "2025-01-01"),
            Inscripcion(maria, mat, "2025-01-01"),
            Inscripcion(silvia, qui, "2025-01-01")
        ])


def cls():
    os.system('cls' if os.name == 'nt' else 'clear')


def pause():
    input("\nPresiona una tecla para continuar...")


def mostrar_menu():
    print("SISTEMA GESTION DE MATRICULAS")
    print("-----------------------------")
    print("[1] Mostrar todos los estudiantes")
    print("[2] Mostrar todos los cursos")
    print("[3] Mostrar las asignaturas de un alumno dado su id")
    print("[0] Salir")
    print("\nIngrese su opción: ", end="")


def opcion1(gm: GestionMatricula):
    print("[1] Mostrar todos los estudiantes")
    print("---------------------------------")
    gm.mostrar_todos_estudiantes()


def opcion2(gm: GestionMatricula):
    print("[2] Mostrar todos los cursos")
    print("----------------------------")
    gm.mostrar_todos_cursos()


def opcion3(gm: GestionMatricula):
    print("[3] Mostrar las asignaturas de un alumno dado su id")
    print("---------------------------------------------------")
    id_estudiante = input("Ingrese el id del estudiante: ")
    nombres_cursos = gm.obtener_asignaturas_de_un_estudiante(id_estudiante)
    if nombres_cursos:
        for nombre in nombres_cursos:
            print(nombre)
    else:
        print("Estudiante no matriculado o no existe dicho id_estudiante")


def main():
    estudiantes = []
    cursos = []
    inscripciones = []
    Data.get_estudiantes_cursos_inscripciones(estudiantes, cursos, inscripciones)
    gm = GestionMatricula(estudiantes, cursos, inscripciones)

    while True:
        cls()
        mostrar_menu()
        opcion = input().strip()

        if opcion == "1":
            cls()
            opcion1(gm)
            pause()
        elif opcion == "2":
            cls()
            opcion2(gm)
            pause()
        elif opcion == "3":
            cls()
            opcion3(gm)
            pause()
        elif opcion == "0":
            cls()
            print("Gracias por su visita")
            pause()
            break
        else:
            cls()
            print("Opción no existe")
            pause()


if __name__ == "__main__":
    main()