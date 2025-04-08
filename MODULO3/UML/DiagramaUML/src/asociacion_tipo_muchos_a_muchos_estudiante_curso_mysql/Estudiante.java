package asociacion_tipo_muchos_a_muchos_estudiante_curso_mysql;

import java.util.ArrayList;
import java.util.List;

public class Estudiante {

    // VARIABLES DE INSTANCIA
    private String idEstudiante;
    private String nombre;
    private List<Inscripcion> inscripciones; //Relación con inscripción

    // CONSTRUCTORES
    public Estudiante() {
        this.idEstudiante = "";
        this.nombre = "";
        this.inscripciones = null;
    }

    public Estudiante(String idEstudiante, String nombre) {
        this.idEstudiante = idEstudiante;
        this.nombre = nombre;
        inscripciones = new ArrayList<>();
    }
    
    // METODOS SET Y GET
    public String getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(String idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    // METODO TOSTRING
    @Override
    public String toString() {
        return "Estudiante{" + "idEstudiante=" + idEstudiante + ", nombre=" + nombre + '}';
    }
    
    // METODO RELACION INSCRIPCION
    public void inscribirCurso(Curso curso, String fechaInscripcion) {
        Inscripcion inscripcion = new Inscripcion(this,curso,fechaInscripcion);
        this.inscripciones.add(inscripcion);
    }
}
