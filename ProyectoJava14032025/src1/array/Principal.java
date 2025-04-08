package array;

public class Principal {

    public static void main(String[] args) {
        System.out.println("VECTOR");
        System.out.println("------");
        int[] vector = {1, 2, 3, 4, 5, 6};
        int lonVector = vector.length;
        System.out.println("Longitud Vector: " + lonVector); //6
        for (int i = 0; i < lonVector; i++) {
            System.out.print(vector[i] + "  ");
        }
        System.out.println("\n");

        System.out.println("MATRIZ");
        System.out.println("------");
        int[][] matriz = {
            {1, 2, 3, 4, 5, 6},
            {1, 2, 3, 4, 5, 6},
            {1, 2, 3, 4, 5, 6}
        };//3x6 = fxc

        int filasMatriz = matriz.length;
        int columnasMatriz = matriz[0].length;
        System.out.println("Filas Matriz   : " + filasMatriz);
        System.out.println("Columnas Matriz: " + columnasMatriz);

        for (int f = 0; f < filasMatriz; f++) {
            for (int c = 0; c < columnasMatriz; c++) {
                System.out.print(matriz[f][c] + "\t");
            }
            System.out.println();
        };
        System.out.println("\n");

        System.out.println("CUBO");
        System.out.println("----");
        int[][][] cubo = {
            {
                {1, 2, 3, 4, 5, 6},
                {1, 2, 3, 4, 5, 6},
                {1, 2, 3, 4, 5, 6}
            },//3x6
            {
                {1, 2, 3, 4, 5, 6},
                {1, 2, 3, 4, 5, 6},
                {1, 2, 3, 4, 5, 6}
            }//3x6
        };//2x3x6  matrices x filas * columnas

        int cantidadMatricesCubo = cubo.length;
        int filasDeCadaMatrizCubo = cubo[0].length;
        int columnasDeCadaMatrizCubo = cubo[0][2].length; //1.Matriz 2.Fila
        System.out.println("Cantidad Matrices Cubo (Espesor o Profundidad o Cantidad Hojas): " + cantidadMatricesCubo);
        System.out.println("Filas de la Matriz del Cubo   : " + filasDeCadaMatrizCubo);
        System.out.println("Columnas de la Matriz del Cubo: " + columnasDeCadaMatrizCubo);
        
        for(int h=0; h<cantidadMatricesCubo; h++) {
            for(int f=0; f<filasDeCadaMatrizCubo; f++) {
                for(int c=0; c<columnasDeCadaMatrizCubo; c++) {
                    System.out.print(cubo[h][f][c] + "\t");
                }
                System.out.println();
            }
            System.out.println("\n");
        }
        
        System.out.println("TETRA");
        System.out.println("-----");
        int[][][][] tetra = {
            {
                {
                    {1, 2, 3, 4, 5, 6},
                    {1, 2, 3, 4, 5, 6},
                    {1, 2, 3, 4, 5, 6},},
                {
                    {1, 2, 3, 4, 5, 6},
                    {1, 2, 3, 4, 5, 6},
                    {1, 2, 3, 4, 5, 6}
                }
            },
            {
                {
                    {1, 2, 3, 4, 5, 6},
                    {1, 2, 3, 4, 5, 6},
                    {1, 2, 3, 4, 5, 6}
                },
                {
                    {1, 2, 3, 4, 5, 6},
                    {1, 2, 3, 4, 5, 6},
                    {1, 2, 3, 4, 5, 6}
                }
            }
        };// 2x2x3x6  cubos x matrices x filas x columnas
        
        for(int c=0; c<tetra.length; c++) {
            for(int m=0; m<tetra[0].length; m++) {
                for(int f=0; f<tetra[0][0].length; f++) {
                    for(int co=0; co<tetra[0][0][0].length; co++) {
                        System.out.print(tetra[c][m][f][co] + "\t");
                    }
                    System.out.println();
                }
                System.out.println("\n");
            }
            System.out.println("\n");
        }

    }
}
/*
*
* * *
* * * * *
*/