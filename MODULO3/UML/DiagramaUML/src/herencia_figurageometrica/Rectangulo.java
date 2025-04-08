package herencia_figurageometrica;

public class Rectangulo extends FiguraGeometrica {

    // VARIABLES DE INSTANCIA
    private double ancho;
    private double alto;

    // CONSTRUCTORES
    public Rectangulo() {
        super("");
        this.ancho = 0.0;
        this.alto = 0.0;
    }

    public Rectangulo(String nombre, double ancho, double alto) {
        super(nombre);
        this.ancho = ancho;
        this.alto = alto;
    }

    // METODOS SET Y GET
    public double getAncho() {
        return ancho;
    }

    public void setAncho(double ancho) {
        this.ancho = ancho;
    }

    public double getAlto() {
        return alto;
    }

    public void setAlto(double alto) {
        this.alto = alto;
    }

    // METODOS ABSTRACT
    @Override
    double area() {
        return this.alto * this.ancho;
    }

    @Override
    double perimetro() {
        return 2 * (this.alto + this.ancho);
    }

    // MOSTRAR INFORMACION
    @Override
    public String toString() {
        return super.toString() + "Rectangulo{" + "ancho=" + ancho + ", alto=" + alto + '}';
    }
}
