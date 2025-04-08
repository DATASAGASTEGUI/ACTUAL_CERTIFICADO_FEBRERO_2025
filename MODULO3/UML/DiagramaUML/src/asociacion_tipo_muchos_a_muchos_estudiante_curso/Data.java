package asociacion_tipo_muchos_a_muchos_estudiante_curso;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Data {

    public static void getEstudiantesCursosInscripciones(List<Estudiante> estudiantes, List<Curso> cursos, List<Inscripcion> inscripciones) {
        //List<Estudiante> estudiantes = new ArrayList<>();

        Estudiante luis = new Estudiante("E1", "Luis");
        Estudiante miguel = new Estudiante("E2", "Miguel");
        Estudiante carlos = new Estudiante("E3", "Carlos");
        Estudiante maria = new Estudiante("E4", "María");
        Estudiante silvia = new Estudiante("E5", "Silvia");

        estudiantes.add(luis);
        estudiantes.add(miguel);
        estudiantes.add(carlos);
        estudiantes.add(maria);
        estudiantes.add(silvia);

        //List<Curso> cursos = new ArrayList<>();
        Curso mat = new Curso("Mat", "Matemática");
        Curso qui = new Curso("Qui", "Química");
        Curso fis = new Curso("Fis", "Física");

        cursos.add(mat);
        cursos.add(qui);
        cursos.add(fis);

        //List<Inscripcion> inscripciones = new ArrayList<>();
        inscripciones.add(new Inscripcion(luis, mat, "2025-01-01"));
        inscripciones.add(new Inscripcion(luis, qui, "2025-01-01"));
        inscripciones.add(new Inscripcion(luis, fis, "2025-01-01"));

        inscripciones.add(new Inscripcion(miguel, mat, "2025-01-02"));
        inscripciones.add(new Inscripcion(miguel, qui, "2025-01-02"));

        inscripciones.add(new Inscripcion(carlos, mat, "2025-01-01"));
        inscripciones.add(new Inscripcion(carlos, fis, "2025-01-01"));

        inscripciones.add(new Inscripcion(maria, mat, "2025-01-01"));

        inscripciones.add(new Inscripcion(silvia, qui, "2025-01-01"));
    }

    public static void getEstudiantesCursosInscripciones1(Map<String, Estudiante> estudiantes /*, Map<String, Curso> cursos, Map<String, Inscripcion> inscripciones*/) {


        Estudiante luis = new Estudiante("E1", "Luis");
        Estudiante miguel = new Estudiante("E2", "Miguel");
        Estudiante carlos = new Estudiante("E3", "Carlos");
        Estudiante maria = new Estudiante("E4", "María");
        Estudiante silvia = new Estudiante("E5", "Silvia");

        estudiantes.put("E1",luis);
        estudiantes.put("E2",miguel);
        estudiantes.put("E3",carlos);
        estudiantes.put("E4",maria);
        estudiantes.put("E5",silvia);
/*
        //List<Curso> cursos = new ArrayList<>();
        Curso mat = new Curso("Mat", "Matemática");
        Curso qui = new Curso("Qui", "Química");
        Curso fis = new Curso("Fis", "Física");

        cursos.add(mat);
        cursos.add(qui);
        cursos.add(fis);

        //List<Inscripcion> inscripciones = new ArrayList<>();
        inscripciones.add(new Inscripcion(luis, mat, "2025-01-01"));
        inscripciones.add(new Inscripcion(luis, qui, "2025-01-01"));
        inscripciones.add(new Inscripcion(luis, fis, "2025-01-01"));

        inscripciones.add(new Inscripcion(miguel, mat, "2025-01-02"));
        inscripciones.add(new Inscripcion(miguel, qui, "2025-01-02"));

        inscripciones.add(new Inscripcion(carlos, mat, "2025-01-01"));
        inscripciones.add(new Inscripcion(carlos, fis, "2025-01-01"));

        inscripciones.add(new Inscripcion(maria, mat, "2025-01-01"));

        inscripciones.add(new Inscripcion(silvia, qui, "2025-01-01"));
*/
    }

}
