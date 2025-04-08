package ejemplo0011;

import java.util.Scanner;

public class Principal2 {

    public static void main(String[] args) {
       String patron = "[0-9]+"; //222, 2, 22, 222, 341234123
       String edad_s;
       int edad_i;
       Scanner sc = new Scanner(System.in);
       System.out.println("Ingresar edad? ");
       edad_s = sc.next();
       boolean correcto = edad_s.matches(patron) && Integer.parseInt(edad_s) > 0 && Integer.parseInt(edad_s) < 150;
       if(correcto) {
          System.out.println("Edad correcto");
          edad_i = Integer.parseInt(edad_s);
       }else {
          System.out.println("Edad no correcto"); 
       }
       
       //Integer.parseInt("125") --> 125 < 150
       
    }
    
}
