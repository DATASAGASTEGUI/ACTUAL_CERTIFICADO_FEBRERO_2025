package operaciones_aritmeticas;

public class OperacionesAritmeticas {
    // VARIABLES DE CLASE

    // VARIABLES DE INSTANCIA: 
    private double numero1;
    private double numero2;
    // FIRMA DEL METODO
    // SOBRECARGAR EL METODO

    // CONSTRUCTORES
    public OperacionesAritmeticas() {
        this.numero1 = 0.0;
        this.numero2 = 0.0;
    }

    public OperacionesAritmeticas(double numero1, double numero2) {
        this.numero1 = numero1;
        this.numero2 = numero2;
    }

    // METODOS SET Y GET
    public double getNumero1() {
        return numero1;
    }

    public void setNumero1(double numero1) {
        this.numero1 = numero1;
    }

    public double getNumero2() {
        return numero2;
    }

    public void setNumero2(double numero2) {
        this.numero2 = numero2;
    }

    // METODO TOSTRING
    @Override
    public String toString() {
        return "OperacionesAritmeticas{" + "numero1=" + numero1 + ", numero2=" + numero2 + '}';
    }

    // OTROS METODOS
    public double suma() {
        return this.numero1 + this.numero2;
    }

    public double resta() {
        return this.numero1 - this.numero2;
    }

    public double multiplicacion() {
        return this.numero1 * this.numero2;
    }

    public double division() {
        if (this.numero2 != 0) {
            return this.numero1 / this.numero2;
        } else {
            return 0;
        }
    }

    public static void cabecera() {
        System.out.printf("%10s %10s %10s\n", "NUMERO 1", "NUMERO 2", "SUMA");
        System.out.printf("%10s %10s %10s\n", "--------", "--------", "----");
    }

    public void cuerpo() {
        System.out.printf("%10.2f %10.2f %10.2f\n", this.numero1, this.numero2, suma());
    }

    public static void tablaDeObjetos() {
        OperacionesAritmeticas.cabecera();
        for (int i = 0; i < 100; i++) {
            int numero1 = (int) (Math.random() * 100 + 1);
            int numero2 = (int) (Math.random() * 100 + 1);
            OperacionesAritmeticas oa = new OperacionesAritmeticas(numero1, numero2);
            oa.cuerpo();
        }
    }
}
