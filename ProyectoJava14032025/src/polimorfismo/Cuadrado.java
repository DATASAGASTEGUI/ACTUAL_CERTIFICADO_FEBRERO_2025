package polimorfismo;

public class Cuadrado extends FigurasGeometricas {
    
    private double lado;

    public Cuadrado() {
    }

    public Cuadrado(double lado) {
        this.lado = lado;
    }

    public double getLado() {
        return lado;
    }

    public void setLado(double lado) {
        this.lado = lado;
    }

    @Override
    public String toString() {
        return "Cuadrado{" + "lado=" + lado + '}';
    }

    @Override
    double area() {
       return Math.pow(lado, 2);
    }

    @Override
    public void mostrarMensaje() {
       System.out.println("Soy un Cuadrado");
   }

 
}
