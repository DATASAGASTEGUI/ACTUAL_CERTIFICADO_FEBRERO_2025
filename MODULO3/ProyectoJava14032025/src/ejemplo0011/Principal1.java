package ejemplo0011;

import java.util.Scanner;

public class Principal1 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int digito_i;
        String digito_s;
        System.out.println("Ingresa un dígito: ");
        digito_s = sc.next();//0 1 2 3 4 5 6 7 8 9 A
        
        boolean correcto = digito_s.matches("\\d");
        
        if(correcto) {
           System.out.println("Si es un dígito");
           digito_i = Integer.parseInt(digito_s);
        }else {
           System.out.println("No es un dígito");
           
        }
        
        
        
    }
    
}
