package gestion_personas_mongodb;

public class Persona {

    // VARIABLES DE INSTANCIA (ATRIBUTOS)
    private Object _id; 
    private String nombre;
    private String apellido;
    private int edad;

    public Persona() {
    }

    public Persona(Object _id, String nombre, String apellido, int edad) {
        this._id = _id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }

    public Persona(String nombre, String apellido, int edad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    
    
    

    public Object getId() {
        return _id;
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

    @Override
    public String toString() {
        return "Persona{" + "_id=" + _id + ", nombre=" + nombre + ", apellido=" + apellido + ", edad=" + edad + '}';
    }



}
