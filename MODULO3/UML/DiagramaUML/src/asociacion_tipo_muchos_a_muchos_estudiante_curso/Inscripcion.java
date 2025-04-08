package asociacion_tipo_muchos_a_muchos_estudiante_curso;

public class Inscripcion {

    // VARIABLES DE INSTANCIA
    private Estudiante estudiante;
    private Curso curso;
    private String fechaInscripcion;

    // CONSTRUCTORES
    public Inscripcion() {
        this.estudiante = null;
        this.curso = null;
        this.fechaInscripcion = "";
    }

    public Inscripcion(Estudiante estudiante, Curso curso, String fechaInscripcion) {
        this.estudiante = estudiante;
        this.curso = curso;
        this.fechaInscripcion = fechaInscripcion;
    }
    
    // METODOS SET Y GET
    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public String getFechaInscripcion() {
        return fechaInscripcion;
    }

    public void setFechaInscripcion(String fechaInscripcion) {
        this.fechaInscripcion = fechaInscripcion;
    }
    
    // METODO TOSTRING

    @Override
    public String toString() {
        return "Inscripcion{" + "estudiante=" + estudiante + ", curso=" + curso + ", fechaInscripcion=" + fechaInscripcion + '}';
    }
}
