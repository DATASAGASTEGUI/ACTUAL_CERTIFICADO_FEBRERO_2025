from estudiante import Estudiante
from curso import Curso
from inscripcion import Inscripcion

class Data:
    @staticmethod

    def obtenerTodosEstudiantesCursosInscripciones(estudiantes: list[Estudiante]=None, cursos: list[Curso]=None, inscripciones: list[Inscripcion]=None):

        # Crear estudiantes
        luis: Estudiante = Estudiante("E1", "Luis");
        miguel: Estudiante = Estudiante("E2", "Miguel");
        carlos: Estudiante = Estudiante("E3", "Carlos");
        maria: Estudiante = Estudiante("E4", "María");
        silvia: Estudiante = Estudiante("E5", "Silvia");

        estudiantes.append(luis)    
        estudiantes.append(miguel)
        estudiantes.append(carlos)  
        estudiantes.append(maria)
        estudiantes.append(silvia)  

        # Crear cursos
        mat: Curso = Curso("Mat", "Matemática");
        qui: Curso = Curso("Qui", "Química");
        fis: Curso = Curso("Fis", "Física");

        cursos.append(mat)  
        cursos.append(qui)
        cursos.append(fis)

        # Crear inscripciones
        inscripciones.append(Inscripcion(luis, mat, "2025-01-01"))
        inscripciones.append(Inscripcion(luis, qui, "2025-01-01"))
        inscripciones.append(Inscripcion(luis, fis, "2025-01-01"))

        inscripciones.append(Inscripcion(miguel, mat, "2025-01-02"))
        inscripciones.append(Inscripcion(miguel, qui, "2025-01-02"))

        inscripciones.append(Inscripcion(carlos, mat, "2025-01-01"))
        inscripciones.append(Inscripcion(carlos, fis, "2025-01-01"))

        inscripciones.append(Inscripcion(maria, mat, "2025-01-01"))

        inscripciones.append(Inscripcion(silvia, qui, "2025-01-01"))
 

        #return (estudiantes, cursos, inscripciones)  # tupla formado por 3 listas: estudiantes, cursos, inscripciones

