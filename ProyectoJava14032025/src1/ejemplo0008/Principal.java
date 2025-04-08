package ejemplo0008;

import java.util.Scanner;

public class Principal {

    public static void main(String[] args) {
       Scanner sc = new Scanner(System.in);
       
       System.out.println("Ingresar radio del circulo? ");
       double radio = sc.nextDouble();
        
       CalculoPerimetroAreaCirculo cpac = new CalculoPerimetroAreaCirculo(radio);
       cpac.calculo();
       
       System.out.println(cpac); //cpac.toString()
       
    }
    
}

class CalculoPerimetroAreaCirculo {
    // DECLARAR VARIABLES DE INSTANCIA (ATRIBUTO)
    //1. ENTRADA
    private double r;
    
    //2. SALIDA
    private double p;
    private double a;
    
    // CONSTRUCTORES

    public CalculoPerimetroAreaCirculo() {
       this.r = 0.0; 
    }

    public CalculoPerimetroAreaCirculo(double r) {
        this.r = r;
        calculo1();
    }
    
    // METODOS SET Y GET

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }

    public double getP() {
        return p;
    }

    public double getA() {
        return a;
    }
    
    
    
    // METODO TOSTRING

    @Override
    public String toString() {
        //return "CalculoPerimetroAreaCirculo{" + "r=" + r + ", p=" + p + ", a=" + a + '}';
        return String.format("r = %6.2f\np = %6.2f\na = %6.2f",r,p,a);
    }
    
    // METODO CALCULO
    public void calculo() {
       p = 2 * Math.PI * r;
       a = Math.PI * r * r;
       System.out.printf("Perimetro : %12.2f\n", p);
       System.out.printf("Area      : %12.2f\n", a);
    }
    
    public void calculo1() {
       p = 2 * Math.PI * r;
       a = Math.PI * r * r;
    }
    
}




