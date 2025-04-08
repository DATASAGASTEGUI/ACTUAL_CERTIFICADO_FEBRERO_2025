package ejemplo0015;

public class ConvertirCartesianaPolar {
    // VARIABLES DE INSTANCIA (ATRIBUTOS)
    // 1. ENTRADA
    private double x;
    private double y;
    
    // 2. SALIDA
    private double r;
    private double a;
    
    // CONSTRUCTORES
    public ConvertirCartesianaPolar() {
       this.x = 0.0;
       this.y = 0.0;
    }

    public ConvertirCartesianaPolar(double x, double y) {
        this.x = x;
        this.y = y;
    }    

    // METODOS SET Y GET
    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        r = Math.sqrt(x*x + y*y);
        return r;
    }

    public double getA() {
        a = Math.atan2(y, x);
        return a;
    }
    
    public void mostrarInformacion() {
        System.out.println("X: " + x);
        System.out.println("Y: " + y);
        System.out.printf("R: %.2f\n", getR());
        System.out.printf("A: %.2f\n", getA());
    }    
}
