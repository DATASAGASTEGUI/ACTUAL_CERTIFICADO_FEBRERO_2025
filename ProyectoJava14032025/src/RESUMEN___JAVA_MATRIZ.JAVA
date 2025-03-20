*****************
***   MATRIZ  ***
*****************

---------------
MATRIZ ESTATICA
---------------

EJEMPLO 01: Matriz01.java
----------

// DECLAR MATRIZ DE TAMAÑO 3X2 (6 ELEMENTOS)
int[][] matriz = new int[3][2];
// LLENAR MATRIZ
matriz[0][0] = 5;
matriz[0][1] = 1;
matriz[1][0] = 3;
matriz[1][1] = 2;
matriz[2][0] = 0;
matriz[2][1] = 4;
      
	         j
        0	     1	
	0  (0,0)5   (0,1)1
i	1  (1,0)3   (1,1)2
	2  (2,0)0   (2,1)4
	
// MOSTRAR MATRIZ
for(int i = 0; i < matriz.length; i++) { //FILAS
    for(int j = 0; j < matriz[0].length; j++) { //COLUMNAS
        System.out.print(matriz[i][j] + "   ");
    }
	System.out.println();
}
	
EJEMPLO 02: Matriz02.java
----------

// DECLAR Y LLENAR MATRIZ DE TAMAÑO 3X2 (6 ELEMENTOS)
int[][] matriz = {{5, 1}, {3, 2}, {0, 4}};

// MOSTRAR MATRIZ
for(int i = 0; i < matriz.length; i++) { //FILAS
    for(int j = 0; j < matriz[0].length; j++) { //COLUMNAS
        System.out.print(matriz[i][j] + "   ");
    }
	System.out.println();
}

---------------
MATRIZ DINAMICA
---------------

EJEMPLO 01: Matriz03.java
----------

Scanner sc = new Scanner(System.in);

// DECLAR MATRIZ DE TAMAÑO 3X2 (6 ELEMENTOS)
int[][] matriz = new int[3][2];

// LLENAR MATRIZ. FORMA 1
for(int i=0; i < matriz.length; i++) { //FILAS
	for(int j=0; j < matriz[0].length; j++) { //COLUMNAS
	    System.out.print("Ingrese número posición [" + i + "][" + j + "]? ");
        matriz[i][j] = sc.nextInt();
	}
}

// MOSTRAR MATRIZ
for(int i = 0; i < matriz.length; i++) { //FILAS
    for(int j = 0; j < matriz[0].length; j++) { //COLUMNAS
        System.out.print(matriz[i][j] + "   ");
    }
	System.out.println();
}

// LLENAR MATRIZ. FORMA 2
for(int i = 0; i < matriz.length; i++) { //FILAS
    for(int j = 0; j < matriz[0].length; j++) { //COLUMNAS
        matriz[i][j] = (int) (Math.random() * 6 + 1);
    }
}

// MOSTRAR MATRIZ
for(int i = 0; i < matriz.length; i++) { //FILAS
    for(int j = 0; j < matriz[0].length; j++) { //COLUMNAS
        System.out.print(matriz[i][j] + "   ");
    }
	System.out.println();
}

-------------------
RECORRER UNA MATRIZ
-------------------

EJEMPLO 01: Matriz04.java
----------

        // DECLARAR MATRIZ DE TAMAÑO 3X2 (6 ELEMENTOS)
        int[][] matriz = new int[3][2];

        // LLENAR MATRIZ
        for (int i = 0; i < matriz.length; i++) { //FILAS
            for (int j = 0; j < matriz[0].length; j++) { //COLUMNAS
                matriz[i][j] = (int) (Math.random() * 6 + 1);
            }
        }
        // RECORRER POR FILA
        System.out.println("RECORRER POR FILA");
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[0].length; j++) {
                System.out.print(matriz[i][j] + "  ");
            }
            System.out.println();
        }
        // RECORRER POR COLUMNA
        System.out.println("RECORRER POR COLUMNA");
        for (int j = 0; j < matriz[0].length; j++) {
            for (int i = 0; i < matriz.length; i++) {
                System.out.print(matriz[i][j] + "  ");
            }
            System.out.println();
        }
		
---------------
EJEMPLOS VARIOS
---------------

EJEMPLO 01: Matriz05.java   SUMAR TODOS LOS NUMEROS DE LA MATRIZ
----------

        // DECLARAR MATRIZ DE TAMAÑO 3X2 (6 ELEMENTOS)
        int[][] matriz = new int[3][2];

        // LLENAR Y MOSTRAR MATRIZ
        for (int i = 0; i < matriz.length; i++) { //FILAS
            for (int j = 0; j < matriz[0].length; j++) { //COLUMNAS
                matriz[i][j] = (int) (Math.random() * 6 + 1);
                System.out.print(matriz[i][j] + "  ");
            }
            System.out.println();
        }

        // SUMAR TODOS NUMEROS DE LA MATRIZ
        int sumaTotal = 0;
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[0].length; j++) {
                sumaTotal = sumaTotal + matriz[i][j];
            }
        }
        System.out.println("Suma Total Números Matriz: " + sumaTotal);
		
EJEMPLO 02: Matriz06.java   SUMAR LOS NUMEROS DE CADA FILA Y DE CADA COLUMNA (VERSION 1/3)
----------

        // DECLARAR MATRIZ DE TAMAÑO 3X2 (6 ELEMENTOS)
        int[][] matriz = new int[3][2];

        int sumaTotalFila = 0, sumaTotalColumna = 0;
        int sumaTotalF = 0, sumaTotalC = 0;

        // LLENAR Y MOSTRAR MATRIZ
        for (int i = 0; i < matriz.length; i++) { //FILAS
            for (int j = 0; j < matriz[0].length; j++) { //COLUMNAS
                matriz[i][j] = (int) (Math.random() * 6 + 1);
                System.out.print(matriz[i][j] + "  ");
            }
            System.out.println();
        }

        // SUMAR FILAS DE LA MATRIZ
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[0].length; j++) {
                sumaTotalFila = sumaTotalFila + matriz[i][j];
            }
            System.out.println("Suma Total Fila " + i + " : " + sumaTotalFila);
            sumaTotalF = sumaTotalF + sumaTotalFila;
            sumaTotalFila = 0;
        }
        System.out.println("Suma Total Filas Matriz: " + sumaTotalF);

        // SUMAR COLUMNAS DE LA MATRIZ
        for (int j = 0; j < matriz[0].length; j++) {
            for (int i = 0; i < matriz.length; i++) {
                sumaTotalColumna = sumaTotalColumna + matriz[i][j];
            }
            System.out.println("Suma Total Columna " + j + " : " + sumaTotalColumna);
            sumaTotalC = sumaTotalC + sumaTotalColumna;
            sumaTotalColumna = 0;
        }
        System.out.println("Suma Total Columnas Matriz: " + sumaTotalC);
		
EJEMPLO 03: Matriz09.java   SUMAR LOS NUMEROS DE CADA FILA Y DE CADA COLUMNA (VERSION 2/3)
----------

        // DECLARAR MATRIZ DIMENSION 2X3
        int[][] matriz = {
            {6, 3, 2},
            {3, 4, 5}
        };
        // MOSTRAR MATRIZ
        for (int i = 0; i < matriz.length; i++) { //FILAS
            for (int j = 0; j < matriz[0].length; j++) {//COLUMNAS
                System.out.print(matriz[i][j] + "    ");
            }
            System.out.println();
        }
        // RECORRER MATRIZ POR FILA PARA SUMAR LAS COLUMNAS
        int sc0 = 0, sc1 = 0, sc2 = 0;
        for (int i = 0; i < matriz.length; i++) { //FILAS
            for (int j = 0; j < matriz[0].length; j++) {//COLUMNAS
                if (j == 0) {
                    sc0 = sc0 + matriz[i][j];
                }
                if (j == 1) {
                    sc1 = sc1 + matriz[i][j];
                }
                if (j == 2) {
                    sc2 = sc2 + matriz[i][j];
                }
            }
        }
        System.out.println("Suma Columna 0: " + sc0);
        System.out.println("Suma Columna 1: " + sc1);
        System.out.println("Suma Columna 2: " + sc2);
        // RECORRER MATRIZ POR FILA PARA SUMAR LAS FILAS
        int sf0 = 0, sf1 = 0;
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[0].length; j++) {
                if (i == 0) {
                    sf0 = sf0 + matriz[i][j];
                }
                if (i == 1) {
                    sf1 = sf1 + matriz[i][j];
                }
            }
        }
        System.out.println("Suma Fila 0: " + sf0);
        System.out.println("Suma Fila 1: " + sf1);
		
EJEMPLO 04: Matriz10.java   SUMAR LOS NUMEROS DE CADA FILA Y DE CADA COLUMNA (VERSION 3/3)
----------

        // DECLARAR MATRIZ DIMENSION 2X3
        int[][] matriz = {
            {6, 3, 2},
            {3, 4, 5}
        };
        // DECLARAR VECTOR FILAS
        int[] sf = new int[matriz.length];
        // DECLARAR VECTOR COLUMNAS
        int[] sc = new int[matriz[0].length];
        // MOSTRAR MATRIZ
        for (int i = 0; i < matriz.length; i++) { //FILAS
            for (int j = 0; j < matriz[0].length; j++) {//COLUMNAS
                System.out.print(matriz[i][j] + "    ");
            }
            System.out.println();
        }
        // RECORRER MATRIZ POR COLUMNA PARA SUMAR LAS COLUMNAS
        for (int j = 0; j < matriz[0].length; j++) { //COLUMNAS
            for (int i = 0; i < matriz.length; i++) {//FILAS
                sc[j] = sc[j] + matriz[i][j];
            }
        }
        for (int i = 0; i < sc.length; i++) {
            System.out.println("Suma Columna " + i + " : " + sc[i]);
        }
        // RECORRER MATRIZ POR FILA PARA SUMAR LAS FILAS
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[0].length; j++) {
                sf[i] = sf[i] + matriz[i][j];
            }
        }
        for (int i = 0; i < sf.length; i++) {
            System.out.println("Suma Fila " + i + " : " + sf[i]);
        }

EJEMPLO 05: Matriz07.java   SUMAR DOS MATRICES (VERSION 1/2)
----------

        // DECLARAR MATRIZ DE TAMAÑO 3X2 (6 ELEMENTOS)
        int nf = 3, nc = 2;
        int[][] a = new int[nf][nc];
        int[][] b = new int[nf][nc];
        int[][] c = new int[nf][nc];

        // LLENAR Y SUMAR MATRIZ
        for (int i = 0; i < a.length; i++) { //FILAS
            for (int j = 0; j < a[0].length; j++) { //COLUMNAS
                a[i][j] = (int) (Math.random() * 6 + 1);
                b[i][j] = (int) (Math.random() * 6 + 1);
                c[i][j] = a[i][j] + b[i][j];
            }
        }

        // MOSTRAR MATRIZ A
        System.out.println("MATRIZ A");
        for (int i = 0; i < a.length; i++) { //FILAS
            for (int j = 0; j < a[0].length; j++) { //COLUMNAS
                System.out.print(a[i][j] + "   ");
            }
            System.out.println();
        }

        // MOSTRAR MATRIZ B
        System.out.println("MATRIZ B");
        for (int i = 0; i < b.length; i++) { //FILAS
            for (int j = 0; j < b[0].length; j++) { //COLUMNAS
                System.out.print(b[i][j] + "   ");
            }
            System.out.println();
        }

        // MOSTRAR MATRIZ C
        System.out.println("MATRIZ B");
        for (int i = 0; i < c.length; i++) { //FILAS
            for (int j = 0; j < c[0].length; j++) { //COLUMNAS
                System.out.print(c[i][j] + "   ");
            }
            System.out.println();
        }

EJEMPLO 06: Matriz08.java   SUMAR DOS MATRICES (VERSION 2/2)
----------

        // DECLARAR MATRIZ DE TAMAÑO 3X2 (6 ELEMENTOS)
        int nf = 3, nc = 2;
        int[][] a = new int[nf][nc];
        int[][] b = new int[nf][nc];
        int[][] c = new int[nf][nc];

        // LLENAR Y SUMAR MATRIZ
        for (int i = 0; i < a.length; i++) { //FILAS
            for (int j = 0; j < a[0].length; j++) { //COLUMNAS
                a[i][j] = (int) (Math.random() * 6 + 1);
                b[i][j] = (int) (Math.random() * 6 + 1);
                c[i][j] = a[i][j] + b[i][j];
            }
        }

        // MOSTRAR MATRIZ A
        System.out.println("MATRIZ A     MATRIZ B     MATRIZ C");
        for (int i = 0; i < a.length; i++) { //FILAS
            for (int j = 0; j < a[0].length; j++) { //COLUMNAS
                System.out.print(a[i][j] + "   ");
            }
            System.out.print("     ");

            for (int j = 0; j < b[0].length; j++) { //COLUMNAS
                System.out.print(b[i][j] + "   ");
            }
            System.out.print("     ");

            for (int j = 0; j < c[0].length; j++) { //COLUMNAS
                System.out.print(c[i][j] + "\t");
            }
            System.out.println();
        }

EJEMPLO 07: Matriz11.java   MATRIZ DE LETRAS CONTAR CUANTOS SON VOCALES (VERSION 1/2)
----------

        //DECLAR MATRIZ DIMENSION 4X3
        char[][] matriz = {
            {'A', 'J', 'I'},
            {'X', 'I', 'O'},
            {'B', 'Z', 'U'},
            {'B', 'Z', 'L'}
        };
        // MOSTRAR MATRIZ
        for (int i = 0; i < matriz.length; i++) { // FILAS
            for (int j = 0; j < matriz[0].length; j++) { // COLUMNAS
                System.out.print(matriz[i][j] + "    ");
            }
            System.out.println();
        }
        //RECORRER MATRIZ POR FILA
        int c = 0;
        for (int i = 0; i < matriz.length; i++) { // FILAS
            for (int j = 0; j < matriz[0].length; j++) { // COLUMNAS
                if (matriz[i][j] == 'A' || matriz[i][j] == 'E' || matriz[i][j] == 'I' || matriz[i][j] == 'O' || matriz[i][j] == 'U') {
                    c = c + 1;
                }
            }
        }
        System.out.println("Cantidad Vocales: " + c);
		
EJEMPLO 08: Matriz12.java   MATRIZ DE LETRAS CONTAR CUANTOS SON VOCALES (VERSION 2/2)
----------

        //DECLAR MATRIZ DIMENSION 4X3
        char[][] matriz = new char[4][3];
        // MOSTRAR MATRIZ
        for (int i = 0; i < matriz.length; i++) { // FILAS
            for (int j = 0; j < matriz[0].length; j++) { // COLUMNAS
                matriz[i][j] = (char) (int) (Math.random() * 26 + 65); // [65,90]
                System.out.print(matriz[i][j] + "    ");
            }
            System.out.println();
        }
        //RECORRER MATRIZ POR FILA
        int c = 0;
        for (int i = 0; i < matriz.length; i++) { // FILAS
            for (int j = 0; j < matriz[0].length; j++) { // COLUMNAS
                if (matriz[i][j] == 'A' || matriz[i][j] == 'E' || matriz[i][j] == 'I' || matriz[i][j] == 'O' || matriz[i][j] == 'U') {
                    c = c + 1;
                }
            }
        }
        System.out.println("Cantidad Vocales: " + c);
		
EJEMPLO 09: Matriz13.java   SUMAR PARES DE UNA MATRIZ RECORRIENDO POR COLUMNA Y FILA
----------

        int sumaTotal = 0;
        // DECLARAR MATRIZ DIMENSION 4X3
        int[][] numero = new int[4][3];
        // LLENAR MATRIZ
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
                numero[i][j] = (int) (Math.random() * 6 + 1);
            }
        }
        // MOSTRAR MATRIZ POR FILA
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
                System.out.print(numero[i][j] + "  ");
            }
            System.out.println();
        }
        //RECORRER LA MATRIZ POR FILA - SUMAR SOLO PARES
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
                if (numero[i][j] % 2 == 0) {
                    sumaTotal = sumaTotal + numero[i][j];
                }
            }
        }
        System.out.println("Suma Total: " + sumaTotal);

        //MOSTRAR MATRIZ POR COLUMNA
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print(numero[j][i] + "  ");
            }
            System.out.println();
        }
        //RECORRER LA MATRIZ POR COLUMNA - SUMAR SOLO PARES
        sumaTotal = 0;
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                if (numero[j][i] % 2 == 0) {
                    sumaTotal = sumaTotal + numero[j][i];
                }
            }
        }
        System.out.println("Suma Total: " + sumaTotal);
		
		
EJEMPLO 10: Matriz14.java   FOREACH
----------
		
		// DECLARAR MATRIZ DIMENSION 2X3
        String[][] nombre = {
            {"Luis", "Miguel", "Carlos"},
            {"María", "Silvia", "Lucho"}
        };
        //MOSTRARLO POR COLUMNA
        for (int i = 0; i < nombre[0].length; i++) {
            for (int j = 0; j < nombre.length; j++) {
                System.out.print(nombre[j][i] + "\t");
            }
            System.out.println();
        }

        //FOREACH: QUIERO MOSTRAR SOLO LOS NOMBRES DE LA FILA 1
        System.out.println("FOREACH: FILA 1");
        for (String elemento : nombre[1]) {
            System.out.println(elemento);
        }
		
EJEMPLO 11: Matriz15.java   MOSTRAR MATRIZ POR FILA Y COLUMAS EN DOS FORMAS DISTINTAS
----------

        // DECLARAR MATRIZ DIMENSION 3X2
        char[][] matriz = {
            {'A', 'J'},
            {'X', 'I'},
            {'B', 'Z'}
        };
        // MOSTRAR MATRIZ POR FILA
        for (int i = 0; i < matriz.length; i++) { //FILAS
            for (int j = 0; j < matriz[0].length; j++) { //COLUMNAS
                System.out.print(matriz[i][j] + "\t");
            }
            System.out.println();
        }

        System.out.println();

        // MOMSTRAR MATRIZ POR COLUMNA FORMA 1
        for (int i = 0; i < matriz[0].length; i++) { //COLUMNAS
            for (int j = 0; j < matriz.length; j++) { //FILAS
                System.out.print(matriz[j][i] + "\t");
            }
            System.out.println();
        }

        System.out.println();

        // MOMSTRAR MATRIZ POR COLUMNA FORMA 2
        for (int j = 0; j < matriz[0].length; j++) { //COLUMNAS
            for (int i = 0; i < matriz.length; i++) { //FILAS
                System.out.print(matriz[i][j] + "\t");
            }
            System.out.println();
        }


