package ejemplo0017;

public class OperacionAritmetica {
    //VARIABLES DE INSTANCIA (ATRIBUTOS)
    //1. ENTRADA
    private double n1;
    private double n2;
    private char operacion;
    //2. SALIDA (CALCULO)
    private double resultado;
    
    //CONSTRUCTORES
    public OperacionAritmetica() {
      this.n1 = 0;
      this.n2 = 0;
      this.operacion = '+';
      calculo();
    }
    public OperacionAritmetica(double n1, double n2, char operacion) {
        this.n1 = n1;
        this.n2 = n2;
        this.operacion = operacion;
        calculo();
    }
    //METODOS SET Y GET

    public double getN1() {
        return n1;
    }

    public void setN1(double n1) {
        this.n1 = n1;
    }

    public double getN2() {
        return n2;
    }

    public void setN2(double n2) {
        this.n2 = n2;
    }

    public char getOperacion() {
        return operacion;
    }

    public void setOperacion(char operacion) {
        this.operacion = operacion;
    }

    public double getResultado() {
        return resultado;
    }
    
    public void calculo() {
        switch (operacion) {
            case '+' -> resultado = n1 + n2;
            case '-' -> resultado = n1 - n2;
            case '*' -> resultado = n1 * n2;
            case '/' -> resultado = n1 / n2;
            case '^' -> resultado = Math.pow(n1, n2);
        }
    }
}
    




    
    
    
}
