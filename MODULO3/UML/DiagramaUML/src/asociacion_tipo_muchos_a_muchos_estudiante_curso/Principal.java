package asociacion_tipo_muchos_a_muchos_estudiante_curso;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Principal {

    static Scanner sc = new Scanner(System.in);

    static List<Estudiante> estudiantes = null;
    static List<Curso> cursos = null;
    static List<Inscripcion> inscripciones = null;

    static GestionMatricula gm = null;

    public static void main(String[] args) {
        estudiantes = new ArrayList<>();
        cursos = new ArrayList<>();
        inscripciones = new ArrayList<>();
        Data.getEstudiantesCursosInscripciones(estudiantes, cursos, inscripciones);
        gm = new GestionMatricula(estudiantes, cursos, inscripciones);
        String opcion = "";
        do {
            cls();
            mostrarMenu();
            opcion = sc.next();

            switch (opcion) {
                case "1":
                    cls();
                    opcion1();
                    pause();
                    break;
                case "2":
                    cls();
                    opcion2();
                    pause();
                    break;
                case "3":
                    cls();
                    opcion3();
                    pause();
                    break;
                case "4":
                    cls();
                    opcion4();
                    pause();
                    break; 
                case "5":
                    cls();
                    opcion5();
                    pause();
                    break; 
                case "6":
                    cls();
                    opcion6();
                    pause();
                    break; 
                case "7":
                    cls();
                    opcion7();
                    pause();
                    break;                      
                case "0":
                    cls();
                    System.out.println("Gracia por su visita");
                    pause();
                    System.exit(0);
                    break;
                default:
                    cls();
                    System.out.println("Opción no existe");
                    pause();
            }
        } while (true);
    }

    private static void mostrarMenu() {
        System.out.println("SISTEMA GESTION DE MATRICULAS");
        System.out.println("-----------------------------");
        System.out.println("[1] Mostrar todos los estudiantes");
        System.out.println("[2] Mostrar todos los cursos");
        System.out.println("[3] Mostrar las asignaturas de un alumno dado su id");
        System.out.println("[4] Realizar una matricula");
        System.out.println("[5] Mostrar los estudiantes de una asignatura dado su id");
        System.out.println("[6] Actualizar nombre de un estudiante dado su id");
        System.out.println("[7] Eliminar un estudiante dado su id");
        System.out.println("[0] Salir");

        System.out.print("Ingrese su opción? ");
    }

    private static void opcion1() {
        System.out.println("[1] Mostrar todos los estudiantes");
        System.out.println("---------------------------------");
        gm.mostrarTodosEstudiantes();
    }
    
    private static void opcion2() {
        System.out.println("[2] Mostrar todos los cursos");
        System.out.println("----------------------------");
        gm.mostrarTodosCursos();
    } 
    
    private static void opcion3() {
         System.out.println("[3] Mostrar las asignaturas de un alumno dado su id");
         System.out.println("---------------------------------------------------");
         System.out.println("Ingrese el id del estudiante? ");
         String idEstudiante = sc.next();
         List<String> nombresCursos = gm.obtenerAsignaturasDeUnEstudiante(idEstudiante);
         if(nombresCursos.size() > 0) {
            for(String nombre: nombresCursos) {
                System.out.println(nombre);
            }
         }else {
            System.out.println("Estudiante no matriculado o no existe dicho idEstudiante");
         }
    }
    
    private static void opcion4() {
         System.out.println("[4] Realizar una matricula");
         System.out.println("--------------------------");
         String idCurso = "";
         System.out.println("Ingrese el id del estudiante? ");
         String idEstudiante = sc.next();
         Estudiante estudiante = gm.buscarObjetoEstudiante(idEstudiante);
         if(estudiante != null) {
            System.out.println("Selecciones un curso a matricular: ");
            List<Curso> cursos = gm.getCursos();
            for(Curso curso: cursos) {
                System.out.println(curso.getIdCurso() + " " + curso.getNombre());
            }
            System.out.println("Escriba el id del curso a matricular? ");
            idCurso = sc.next();
            Curso curso = gm.buscarObjetoCurso(idCurso);
            if(curso != null) {
               Inscripcion inscripcion = new Inscripcion(estudiante,curso,"2025-01-04");
               gm.insertarObjetoInscripcion(inscripcion);
               System.out.println("Matricula realizada");
            }else {
               System.out.println("El id del curso no existe");
            }
         }else {
             System.out.println("Estudiante con dicho id no existe");
         }
    }
    
    private static void opcion5() {
        System.out.println("[5] Mostrar los estudiantes de una asignatura dado su id");
        System.out.println("--------------------------------------------------------");
        System.out.println("Ingrese el id de la asignatura? ");
        String idAsignatura = sc.next();
        List<Estudiante> estudiantes = gm.obtenerTodosEstudiantesDadoAsignatura(idAsignatura);
        if(estudiantes.size() > 0) {
           for(Estudiante estudiante: estudiantes) {
               System.out.println(estudiante);
           }
        }else {
           System.out.println("No hay alumnos matriculados o no existe dicho idAsignatura");
        }
    }
    
    private static void opcion6() {
        System.out.println("[6] Actualizar nombre de un estudiante dado su id");
        System.out.println("-------------------------------------------------");
        String nombreNuevo = "";
        System.out.println("Ingrese id del estudiante? ");
        String idEstudiante = sc.next();
        Estudiante estudiante = gm.buscarObjetoEstudiante(idEstudiante);
        if(estudiante != null) {
           System.out.println("Ingrese nombre nuevo? ");
           nombreNuevo = sc.next();
           estudiante.setNombre(nombreNuevo);
           System.out.println("Actualización del nombre satisfactorio");
        }else {
            System.out.println("El idEstudiante no existe");
        }
    }
    
    private static void opcion7() {
        System.out.println("[7] Eliminar un estudiante dado su id");
        System.out.println("-------------------------------------");
        System.out.print("Ingrese el id del estudiante a eliminar? ");
        String idEstudiante = sc.next();
        Estudiante estudiante = gm.buscarObjetoEstudiante(idEstudiante);
        if(estudiante != null) {
           gm.eliminarObjetoEstudiante(idEstudiante);
           System.out.println("Eliminacion del estudiante satisfactorio");
        }else {
           System.out.println("No existe estudiante con dicho id");
        }
    }

    private static void pause() {
        try {
            System.out.print("\nPresiona una tecla para continuar...");
            System.in.read();
        } catch (IOException e) {
        }
    }

    private static void cls() {
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    }

}
