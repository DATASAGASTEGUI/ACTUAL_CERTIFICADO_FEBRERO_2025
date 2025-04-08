package encapsulamiento;

public class Promedio {
    // CONSTANTES
    private static final double PA  = 0.35;
    private static final double P   = 0.15;
    private static final double PCP = 0.30;
    private static final double PCG = 0.30;
    
    // VARIABLES DE INSTANCIA (ATRIBUTOS ENTRADA)
    // Inmutable = final
    private final double pa;
    private final double p;
    private final double pcp;
    private final double pcg;
    
    // ATRIBUTO (SALIDA)
    private double promedio;
    
    //CONSTRUCTORES
    public Promedio() {
        this.pa = 0.0;
        this.p = 0.0;
        this.pcp = 0.0;
        this.pcg = 0.0; 
    }

    public Promedio(double pa, double p, double pcp, double pcg) {
        //  (pa<0 || pa>10)
        if((pa<0 || pa>10) || (p<0 || p>10) || (pcp<0 || pcp>10) || (pcg<0 || pcg>10)) {
           //throw new IllegalArgumentException("Las notas no pueden ser negativas ni mayores a 10"); 
           System.out.println("Las notas no pueden ser negativas ni mayores a 10");
           System.exit(0);
        }
        
        this.pa = pa;
        this.p = p;
        this.pcp = pcp;
        this.pcg = pcg;
    }
    
    // METODOS SET Y GET (ENTRADA)

    public double getPa() {
        return pa;
    }
/*
    public void setPa(double pa) {
        this.pa = pa;
    }
*/
    public double getP() {
        return p;
    }
/*
    public void setP(double p) {
        this.p = p;
    }
*/
    public double getPcp() {
        return pcp;
    }
/*
    public void setPcp(double pcp) {
        this.pcp = pcp;
    }
*/
    public double getPcg() {
        return pcg;
    }
/*
    public void setPcg(double pcg) {
        this.pcg = pcg;
    }
*/    
    // METODOS GET (SALIDA) 

    public double getPromedio() {
      
        promedio = PA * pa + P * p + PCP * pcp + PCG * pcg;
        return promedio;
    }
    
    // METODO TOSTRING (MOSTRAR TODOS LOS VALORES DADO A LOS ATRIBUTOS)

    @Override
    public String toString() {
        return "Promedio{" + "pa=" + pa + ", p=" + p + ", pcp=" + pcp + ", pcg=" + pcg + ", promedio=" + promedio + '}';
    }
 
}
