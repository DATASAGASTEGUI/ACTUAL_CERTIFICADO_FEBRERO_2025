package ejemplo0005;

import java.time.LocalDate;

import java.util.Date;
//import java.sql.Date;


public class Principal {


    public static void main(String[] args) {
        LocalDate fecha = LocalDate.now();
        int anio = fecha.getYear();
        int mes = fecha.getMonthValue();
        int dia = fecha.getDayOfMonth();
        System.out.println("Año: " + anio);
        System.out.println("Mes: " + mes);
        System.out.println("Día: " + dia);
        
        java.sql.Date d = new java.sql.Date(1,1,1);
        
        Estudiante e3 = new 
        
    }
    
}
