package ejemplo0014;

public class Estudiante {
    private String nombre;
    private int edad;
    private double calificacion;

    public Estudiante() {
        this.nombre = "";
        this.edad = 0;
        this.calificacion = 0.0;
    }

    public Estudiante(String nombre, int edad, double calificacion) {
        this.nombre = nombre;
        this.edad = edad;
        this.calificacion = calificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(double calificacion) {
        this.calificacion = calificacion;
    }
    
    public void mostrarInformacion() {
        System.out.println("Nombre      : " + this.nombre);
        System.out.println("Edad        : " + this.edad);
        System.out.println("Calificacion: " + this.calificacion);
    }
}
