package misrc.modelo;

public class Alumno {
    private int id;
    private String nombre;
    private String direccion;
    private double estatura;

    public Alumno() {
        this.id = 0;
        this.nombre = "";
        this.direccion = "";
        this.estatura = 0.0; 
    }

    public Alumno(int id, String nombre, String direccion, double estatura) {
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion;
        this.estatura = estatura;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getEstatura() {
        return estatura;
    }

    public void setEstatura(double estatura) {
        this.estatura = estatura;
    }

    @Override
    public String toString() {
        return "Alumno{" + "id=" + id + ", nombre=" + nombre + ", direccion=" + direccion + ", estatura=" + estatura + '}';
    }
 
}
