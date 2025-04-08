package ejemplo0007;

class Main {
    public static void main(String[] args) {
        ConvertirCartesianaPolar cp = new ConvertirCartesianaPolar();
        cp.setX(5);
        cp.setY(7);
        cp.calculo();
        System.out.println(cp);
    }
    
}


class ConvertirCartesianaPolar {
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

    // METODO TOSTRING
    @Override
    public String toString() {
        return "ConvertirCartesianaPolar{" + "x=" + x + ", y=" + y + ", r=" + r + ", a=" + a + '}';
    }
    
    // METODOS CALCULO
    public void calculo() {
        r = Math.sqrt(x*x + y*y);
        a = Math.atan2(y, x);
        System.out.printf("Radio  : %7.2f\n", r);
        System.out.printf("Angulo : %7.2f\n", a * 180 / Math.PI);
    }

}
