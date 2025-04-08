package encapsulamiento;


public class Empleado {
    
    private String nombre;
    private String institucion;
    private String horario;

    public Empleado(String nombre, String institucion, String horario) {
        this.nombre = nombre;
        this.institucion = institucion;
        this.horario = horario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getInstitucion() {
        return institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    @Override
    public String toString() {
        return "Empleado{" + "nombre=" + nombre + ", institucion=" + institucion + ", horario=" + horario + '}';
    }
    
    
}
