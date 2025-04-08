package array;


public class Vector {


    public static void main(String[] args) {
        // TIPOS DE DATOS SIMPLES
        /*
        ENTERO              byte(1), int(*4), short(2), long(8), 
        PUNTO FLOTANTE      float(4), double(*8)
        LOGICO              boolean
        CADENA              String
        CARACTER            char
        */
        
        String[] nombres = {"Luis","Miguel"};
        double[] estaturas = {1.72, 3.2};
        
        //[1, 3.2, "Hola", "x",]
        
        Object[] cualquieroCosa = {1, 3.2, "Luis", true, false};
        
        //COMO RECORRER UN VECTOR: POR ELEMENTO, POR INDICE
        
        //POR ELEMENTO
        for(String nombre: nombres) {
            System.out.println(nombre);
        }
        //POR INDICE
        for(int i=0; i<nombres.length; i++) {
            System.out.println(nombres[i]);
        }
        //--------------------------------
        //POR ELEMENTO
        for(Object obj: cualquieroCosa) {
            System.out.println(obj);
        }
        //POR INDICE
        for(int i=0; i<cualquieroCosa.length; i++) {
            System.out.println(cualquieroCosa[i]);
        }
        
        int dni = 51019534; //Z
       
                        //0                    22
        String letras = "TRWAGMYFPDXBNJZSQVHLCKE";
        char[] letras1 = {'T','R','W','A'};
        int indice = dni % 23; //0...22
        System.out.println(letras.charAt(indice));
        for(int i=0; i<letras1.length; i++) {
            if(i % 2 == 0) {
               System.out.println(letras1[i]);
            }
        }
        
        imprimirVector(letras1);
        
        imprimirVector(new char[]{'a','b'});
        
    }
    
    public static void imprimirVector(char[] v) {
        for(char elemento: v) {
            System.out.println(elemento);
        }
    }
    
}
