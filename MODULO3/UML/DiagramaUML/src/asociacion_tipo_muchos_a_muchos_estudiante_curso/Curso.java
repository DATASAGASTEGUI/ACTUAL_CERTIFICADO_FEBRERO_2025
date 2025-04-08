package asociacion_tipo_muchos_a_muchos_estudiante_curso;

import java.util.ArrayList;
import java.util.List;

public class Curso {

    // VARIABLES DE INSTANCIA
    private String idCurso;
    private String nombre;
    private List<Inscripcion> inscripciones;

    // CONSTRUCTORES
    public Curso() {
        this.idCurso = "";
        this.nombre = "";
        this.inscripciones = null;
    }

    public Curso(String idCurso, String nombre) {
        this.idCurso = idCurso;
        this.nombre = nombre;
        this.inscripciones = new ArrayList<>();
    }

    // METODOS SET Y GET
    public String getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(String idCurso) {
        this.idCurso = idCurso;
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
        return "Curso{" + "idCurso=" + idCurso + ", nombre=" + nombre + '}';
    }

    // METODO RELACION INSCRIPCION
    public void agregarInscripcion(Inscripcion inscripcion) {
        this.inscripciones.add(inscripcion);
    }
}


