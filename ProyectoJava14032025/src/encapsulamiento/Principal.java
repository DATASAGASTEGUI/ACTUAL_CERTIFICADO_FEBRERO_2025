package encapsulamiento;

import java.util.Scanner;

public class Principal {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Ingrese nombre del alumno? ");
        String nombre = sc.next();
        
        System.out.print("Ingres nota participacion activa? ");
        double pa = sc.nextDouble();
        
        System.out.print("Ingres nota practica? ");
        double p = sc.nextDouble();
        
        System.out.print("Ingres nota prueba conocimiento parcial? ");
        double pcp = sc.nextDouble();
        
        System.out.print("Ingres nota prueba conocimiento general? ");
        double pcg = sc.nextDouble();
        
        Promedio promedio = new Promedio(pa,p,pcp,pcg);
        
        System.out.println("Promedio: " + promedio.getPromedio());
        
        //promedio.setPcp(10);
        

        MiPromedio mp = new MiPromedio(1,2,4,5);
        System.out.println("Promedio: " + mp.getPromedio());
        
        System.out.println(mp);
    }
    
}
