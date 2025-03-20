package ejemplo0001;

public class Ejemplo4 {
    
/*
Generar todas las combinaciones
de 4 caracteres que se pueden
formar con todas las letras del alfabeto ingles

C1  C2  C3  C4
A   A   A   A
    
            Z
    
        Z
    Z
    
Z
*/
/*
EN QUE POSICION ESTA LA PALABRA HOLA
    */
    public static void main(String[] args) {
       int cont = 0;
       String palabra;
       for(char c1='A'; c1<='Z'; c1++) {
           for(char c2='A'; c2<='Z'; c2++) {
               for(char c3='A'; c3<='Z'; c3++) {
                   for(char c4='A'; c4<='Z'; c4++) {
                       palabra = "" + c1 + c2 + c3 + c4;
                       ++cont;
                       if(palabra.equalsIgnoreCase("TELE")) {
                          System.out.println(++cont + "\t\t" + palabra);
                          System.exit(0);
                       }
                   }
               }
           }
       }
    }
}
