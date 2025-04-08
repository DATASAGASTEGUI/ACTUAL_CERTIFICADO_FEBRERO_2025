package ejemplo0009;

public class Suma {
    // VARIABLES DE INSTANCIA (ATRIBUTOS)
    //1. ENTRADA
    private double n1;
    private double n2;
    //2. SALIDA
    private double r;
    
    // CONSTRUCTORES
    public Suma() {
       this.n1 = 0.0;
       this.n2 = 0.0;
    }
    
    public Suma(double n1, double n2) {
       this.n1 = n1;
       this.n2 = n2;
       r = n1 + n2;
       //System.out.println(toString());
       //System.out.println(getN1()+"\t"+getN2()+"\t"+r);
       //System.out.println(n1+"\t"+n2+"\t"+r);
    }
    
    // METODOS SET Y GET
    public void setN1(double n1) {
        this.n1 = n1;
    }
    
    public double getN1() {
       return this.n1;
    }

    public double getN2() {
        return this.n2;
    }

    public void setN2(double n2) {
        this.n2 = n2;
    }    
    
    // METODO TOSTRING
 
    @Override
    public String toString() {
        //return "Suma{" + "n1=" + n1 + ", n2=" + n2 + ", r=" + r + '}';
        return String.format("%.2f\t%.2f\t%.2f",n1,n2,r);
    }
    
    
    // OTROS METODOS
    /*
    public void sumar() {
        r = n1 + n2;
    }
*/



}
