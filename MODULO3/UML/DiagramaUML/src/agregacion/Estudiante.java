package agregacion;

public class Estudiante {

    // VARIABLES DE INSTANCIA
    private String idEstudiante;
    private String nombre;

    // CONSTRUCTORES
    public Estudiante() {
        this.idEstudiante = "";
        this.nombre = "";
    }

    public Estudiante(String idEstudiante, String nombre) {
        this.idEstudiante = idEstudiante;
        this.nombre = nombre;
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

}
