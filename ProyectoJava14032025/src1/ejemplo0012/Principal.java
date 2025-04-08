package ejemplo0012;

public class Principal {

    public static void main(String[] args) {
        {
            System.out.println("POR VALOR");
            int n1 = 5, n2 = 7;
            int suma = sumar_v(n1, n2);
            System.out.println("Suma: " + suma);
        }
        {
            System.out.println("POR REFERENCIA");
            int n1 = 5, n2 = 7;
            Suma s = new Suma();
            sumar_r(n1,n2,s);
            System.out.println("Suma: " + s.getSuma());
        }
        {
            System.out.println("POR REFERENCIA");
            int n1 = 5, n2 = 7;
            OperacionAritmetica oa = new OperacionAritmetica();
            sumar_restar_r(n1,n2,oa);
            System.out.println("Suma: " + oa.getSuma());            
            System.out.println("Resta: " + oa.getResta()); 
            System.out.println("Multiplicacion: " + oa.getMultiplicacion()); 
        }        
        
    }

    public static int sumar_v(int n1, int n2) {
        return n1 + n2;
    }
    
    public static void sumar_r(int n1, int n2, Suma s) {
        s.setN1(n1);
        s.setN2(n2);
    }

    public static void sumar_restar_r(int n1, int n2, OperacionAritmetica oa) {
        oa.setN1(n1);
        oa.setN2(n2);
    }    
}

class Suma {
    // 1. VARIABLES DE INSTANCIA (ATRIBUTOS)
    // ENTRADA
    private int n1;
    private int n2;
    // SALIDA
    private int suma;
    // 2. CONSTRUCTORES

    public Suma() {
    }

    public Suma(int n1, int n2) {
        this.n1 = n1;
        this.n2 = n2;
    }


    // 3. METODOS SET Y GET

    public int getN1() {
        return n1;
    }

    public void setN1(int n1) {
        this.n1 = n1;
    }

    public int getN2() {
        return n2;
    }

    public void setN2(int n2) {
        this.n2 = n2;
    }

    public int getSuma() {
        suma = n1 + n2;
        return suma;
    }

   
}

class OperacionAritmetica {
    // 1. VARIABLES DE INSTANCIA (ATRIBUTOS)
    // ENTRADA
    private int n1;
    private int n2;
    // SALIDA
    private int suma;
    private int resta;
    private int multiplicacion;
    // 2. CONSTRUCTORES

    public OperacionAritmetica() {
    }

    public OperacionAritmetica(int n1, int n2) {
        this.n1 = n1;
        this.n2 = n2;
    }


    // 3. METODOS SET Y GET

    public int getN1() {
        return n1;
    }

    public void setN1(int n1) {
        this.n1 = n1;
    }

    public int getN2() {
        return n2;
    }

    public void setN2(int n2) {
        this.n2 = n2;
    }

    public int getSuma() {
        suma = n1 + n2;
        return suma;
    }

    public int getResta() {
        resta = n1 - n2;
        return resta;
    }

    public int getMultiplicacion() {
        multiplicacion = n1 * n2;
        return multiplicacion;
    }

   
}
