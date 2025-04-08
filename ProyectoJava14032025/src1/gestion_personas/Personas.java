package gestion_personas;
import java.sql.Timestamp;

public class Personas {
    // VARIABLES DE INSTANCIAS (ATRIBUTOS)
    private int id;
    private String nombre;
    private String apellido;
    private int edad;
    private Timestamp fecha_registro;
    
    // CONSTRUCTOR
    public Personas() {
    }

    public Personas(int id, String nombre, String apellido, int edad, Timestamp fecha_registro) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.fecha_registro = fecha_registro;
    }

    public Personas(String nombre, String apellido, int edad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    
    

    // METODOS SET Y GET

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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public Timestamp getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Timestamp fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
    
    // METODO TOSTRING

    @Override
    public String toString() {
        return "Personas{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", edad=" + edad + ", fecha_registro=" + fecha_registro + '}';
    }
    
    

}
