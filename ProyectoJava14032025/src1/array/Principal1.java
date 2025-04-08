package array;

import java.util.Arrays;


public class Principal1 {

    public static void main(String[] args) {
        int[][] matriz = {
            {1},
            {1,2},
            {1,2,3},
            {1,2,3,4},
            {1,2,3,4,5}
        };
        
        for(int i=0; i<matriz.length; i++) {
            for(int j=0; j<matriz[i].length; j++) {
                System.out.print(matriz[i][j] + "\t");
            }
            System.out.println();
        }
        
        System.out.println();
        
        System.out.println(Arrays.toString(matriz[4]));
        
        for(int i=0; i<matriz.length; i++) {
            System.out.println(Arrays.toString(matriz[i]));
        }
        
        String vector = Arrays.toString(matriz[3]); 
        
        
        Object[][] registros = {
            {"A1","Luis",23,1.72,true,'H'},
            {"A2","Miguel",22,1.72,false,'H'},
            {"A3","Vanessa",25,1.71,false,'M'}
        };

        System.out.println("TABLA");
        System.out.printf("%-8s%-8s%6s%12s  %-8s%6s\n","Código","Nombre","Edad","Estatura","Casado","Sexo");
        System.out.printf("%-8s%-8s%6s%12s  %-8s%6s\n","------","------","----","--------","------","----");
        for(int i=0; i<registros.length; i++) {
        System.out.printf("%-8s%-8s%6d%12.2f  %-8s%6c\n",registros[i][0],
                                                     registros[i][1],
                                                     registros[i][2],
                                                     registros[i][3],
                                                     registros[i][4],
                                                     registros[i][5]);
        };

        
        
        String[] cabeceras = {"Código","Nombre","Edad","Estatura ","Casado","Sexo"};
        Object[][] registros1 = {
            {"A1","Luis",23,1.72," ",true,'H'},
            {"A2","Miguel",22,1.72," ",false,'H'},
            {"A3","Vanessa",25,1.71," ",false,'M'}
        };
        System.out.println("\n");
        for(int i=0; i<6; i++) {
            System.out.print(cabeceras[i] + "\t");
        }
        System.out.println();
        for(int i=0; i<3; i++) {
            for(int j=0; j<7; j++) {
                System.out.print(registros1[i][j] + "\t");
            }
            System.out.println();
        }
        
        
        
        
        
        
    }
    
}

/*
1
1 2
1 2 3
1 2 3 4
1 2 3 4 5

filas = 5
*/
