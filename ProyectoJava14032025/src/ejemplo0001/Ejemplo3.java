package ejemplo0001;

public class Ejemplo3 {

/*
Generar todas las combianciones
que se pueden dar con los siguientes
conjuntos
C1 = A B C D
C2 = A B    

C1  C2    
A   A    AA
    B    AB
    
B   A    BA
    B    BB

C   A    CA
    B    CB

D   A    DA
    B    DB
*/
    public static void main(String[] args) {
       
        for(char letra1='A'; letra1<='D'; letra1++) {
            for(char letra2='A'; letra2<='B'; letra2++) {
                System.out.println(letra1 + "" + letra2);
            }
        }
    }
    
}
