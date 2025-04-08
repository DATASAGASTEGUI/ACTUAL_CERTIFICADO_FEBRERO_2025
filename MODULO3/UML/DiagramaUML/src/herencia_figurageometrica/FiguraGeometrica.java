package herencia_figurageometrica;

public abstract class FiguraGeometrica {

    // VARIABLES DE INSTANCIA
    private String nombre;

    // CONSTRUCTORES
    public FiguraGeometrica() {
        this.nombre = "";
    }

    public FiguraGeometrica(String nombre) {
        this.nombre = nombre;
    }

    // METODOS SET Y GET
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    // METODOS ABSTRACT
    abstract double area();
    abstract double perimetro();
    
    // MOSTRAR INFORMACION
    @Override
    public String toString() {
        return "FiguraGeometrica{" + "nombre=" + nombre + '}';
    }
}
