package herencia_figurageometrica;

public class Triangulo extends FiguraGeometrica {

    // VARIABLES DE INSTANCIA
    private double base;
    private double altura;

    // CONSTRUCTORES
    public Triangulo() {
        super("");
        this.base = 0.0;
        this.altura = 0.0;
    }

    public Triangulo(String nombre, double base, double altura) {
        super(nombre);
        this.base = base;
        this.altura = altura;
    }

    // METODOS SET Y GET
    public double getBase() {
        return base;
    }

    public void setBase(double base) {
        this.base = base;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    // METODOS ABSTRACT
    public double area() {
        return this.base * this.altura / 2;
    }

    public double perimetro() {
        return this.base + 2 * Math.sqrt(Math.pow(this.base / 2, 2) + Math.pow(this.altura, 2));
    }

    // MOSTRAR INFORMACION
    @Override
    public String toString() {
        return super.toString() + "Triangulo{" + "base=" + base + ", altura=" + altura + '}';
    }
}
