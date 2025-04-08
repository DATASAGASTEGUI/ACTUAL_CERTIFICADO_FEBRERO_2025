package array;

public class Principal2 {

    public static void main(String[] args) {
        int matriz[][] = new int[13][4];//Filas:Meses, Columnas:Productos
        // LLENAR LOS DATOS - MOSTRAMOS
        for (int i = 0; i < 12; i++) {
            for (int j = 0; j < 3; j++) {
                matriz[i][j] = (int) (Math.random() * 401 + 100); //99[100-500] cast
                System.out.print(matriz[i][j] + "\t");
            }
            System.out.println();
        }

        //VENTAS DE CADA MES
        int ventaPORmes[] = new int[12];
        int a;
        for (int i = 0; i < 12; i++) {
            a = 0;
            for (int j = 0; j < 3; j++) {
                a = a + matriz[i][j];
            }
            ventaPORmes[i] = a;
        }

        // LLENAR LA COLUMNA 4
        for (int i = 0; i < 12; i++) {
            matriz[i][3] = ventaPORmes[i];
        }

        System.out.println("MOSTRAR TODA LA MATRIZ");
        for (int i = 0; i < 12; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print(matriz[i][j] + "\t");
            }
            System.out.println();
        }

        // SUMA POR ARTICULO
        int ventaPORarticulo[] = new int[3];
        int sa;
        for (int j = 0; j < 3; j++) {
            sa = 0;
            for (int i = 0; i < 12; i++) {
                sa = sa + matriz[i][j];// 00 10 20
            }
            ventaPORarticulo[j] = sa;
        }

        // LLENAR LA FILA 13 VENTA POR ARTICULO
        for (int j = 0; j < 3; j++) {
            matriz[12][j] = ventaPORarticulo[j];
        }

        matriz[12][3] = ventaPORarticulo[0] +
                        ventaPORarticulo[1] +
                        ventaPORarticulo[2];
                
        // MOSTRAR TODA LA TABLA COMPLETA VENTAS POR MES Y VENTAS POR ARTICULO
        for(int i = 0; i < 13; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.printf("%7d",matriz[i][j]);
            }
            System.out.println();
        }

    }

}
