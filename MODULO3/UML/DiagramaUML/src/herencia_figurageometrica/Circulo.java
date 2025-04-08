package herencia_figurageometrica;

public class Circulo extends FiguraGeometrica {

    // VARIABLES DE INSTANCIA
    private double radio;

    // CONSTRUCTORES
    public Circulo() {
        super("");
        this.radio = 0.0;
    }

    public Circulo(String nombre, double radio) {
        super(nombre);
        this.radio = radio;
    }

    // METODOS SET Y GET
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    // METODOS ABSTRACT
    @Override
    double area() {
        return Math.PI * this.radio * this.radio;
    }

    @Override
    double perimetro() {
        return 2 * Math.PI * this.radio;
    }

    // MOSTRAR INFORMACION
    @Override
    public String toString() {
        return super.toString() + "Circulo{" + "radio=" + radio + '}';
    }
}
