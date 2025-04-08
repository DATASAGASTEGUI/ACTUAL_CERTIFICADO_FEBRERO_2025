package asociacion_tipo_muchos_a_muchos_estudiante_curso;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class GestionMatricula {

    // VARIABLES DE INSTANCIA
    private List<Estudiante> estudiantes;
    private List<Curso> cursos;
    private List<Inscripcion> inscripciones;

    // CONSTRUCTORES
    public GestionMatricula() {
        this.estudiantes = null;
        this.cursos = null;
        this.inscripciones = null;
    }

    public GestionMatricula(List<Estudiante> estudiantes, List<Curso> cursos, List<Inscripcion> inscripciones) {
        this.estudiantes = estudiantes;
        this.cursos = cursos;
        this.inscripciones = inscripciones;
    }

    // METODOS SET Y GET
    public List<Estudiante> getEstudiantes() {
        return estudiantes;
    }

    public void setEstudiantes(List<Estudiante> estudiantes) {
        this.estudiantes = estudiantes;
    }

    public List<Curso> getCursos() {
        return cursos;
    }

    public void setCursos(List<Curso> cursos) {
        this.cursos = cursos;
    }

    public List<Inscripcion> getInscripciones() {
        return inscripciones;
    }

    public void setInscripciones(List<Inscripcion> inscripciones) {
        this.inscripciones = inscripciones;
    }
    
    // METODO TOSTRING
    @Override
    public String toString() {
        return "GestionMatricula{" + "estudiantes=" + estudiantes + ", cursos=" + cursos + ", inscripciones=" + inscripciones + '}';
    }
    
    // METODOS CRUD
    // READ
    public void mostrarTodosEstudiantes() {
       for(Estudiante e: this.estudiantes) {
           System.out.println(e);
       }
    }
    
    // READ
    public void mostrarTodosCursos() {
       for(Curso c: this.cursos) {
           System.out.println(c);
       }
    } 
    
    // READ
    public List<String> obtenerAsignaturasDeUnEstudiante(String idEstudiante) {
        List<String> nombresCursos = new ArrayList<>();
        for(Inscripcion inscripcion: this.inscripciones) {
            Curso curso = inscripcion.getCurso();
            Estudiante estudiante = inscripcion.getEstudiante();
            if(estudiante.getIdEstudiante().equalsIgnoreCase(idEstudiante)) {
               nombresCursos.add(curso.getNombre());
            }
        }
        return nombresCursos;
    }
    
    // READ
    public Estudiante buscarObjetoEstudiante(String idEstudiante) {
        for(Estudiante estudiante: this.estudiantes) {
            if(estudiante.getIdEstudiante().equalsIgnoreCase(idEstudiante)) {
               return estudiante; 
            }
        }
        return null;
    }
    // READ
    public Curso buscarObjetoCurso(String idCurso) {
        for(Curso curso: this.cursos) {
            if(curso.getIdCurso().equalsIgnoreCase(idCurso)) {
               return curso; 
            }
        }
        return null;
    }
    
    // CREATE (INSERT = inscripciones.add)
    public void insertarObjetoInscripcion(Inscripcion inscripcion) {
       this.inscripciones.add(inscripcion);
    }
    
    // READ
    public List<Estudiante> obtenerTodosEstudiantesDadoAsignatura(String idAsignatura) {
        List<Estudiante> estudiantes = new ArrayList<>();
        for(Inscripcion inscripcion: this.inscripciones) {
            Curso curso = inscripcion.getCurso();
            Estudiante estudiante = inscripcion.getEstudiante();
            if(curso.getIdCurso().equalsIgnoreCase(idAsignatura)) {
               estudiantes.add(estudiante);
            }
        }
        return estudiantes;
    }
    
    // DELETE
    public void eliminarObjetoEstudiante(String idEstudiante) {
        Iterator<Estudiante> iterator = estudiantes.iterator();
        while (iterator.hasNext()) {
              Estudiante estudiante = iterator.next();
              if(estudiante.getIdEstudiante().equalsIgnoreCase(idEstudiante)) {
                 iterator.remove(); // Eliminación segura usando el iterador
              }
        }        
    }
    
}
