namespace Proyecto; // Package

internal class Program11
{
    private static void Main()
    {
        {
            //Declaración e inicialización
            int[,] matriz = {
                          { 1, 2, 3 },
                          { 4, 5, 6 },
                          { 7, 8, 9 }
                       }; // Matriz de 3x3 (3 filas y 3 columnas)
            for (int i = 0; i < matriz.GetLength(0); i++) //0 1 2
            {
                for (int j = 0; j < matriz.GetLength(1); j++) //0 1 2
                {
                    Console.WriteLine($"matriz[{i},{j}] = {matriz[i, j]}");
                }
            }
        }

        {
            //Declaración e inicialización
            int[,] matriz = {
                          { 1, 2, 3 },
                          { 4, 5, 6 },
                          { 7, 8, 9 }
                       }; // Matriz de 3x3 (3 filas y 3 columnas)
            for (int i = 0; i < matriz.GetLength(0); i++)
            {
                for (int j = 0; j < matriz.GetLength(1); j++)
                {
                    Console.Write($"{matriz[i, j]}\t");
                }
                Console.WriteLine();
            }
        }

        {

            int[,] matriz = {
                          { 1, 2, 3 },
                          { 4, 5, 6 }

            }; // Matriz de 2x3 (2 filas y 3 columnas
            Console.WriteLine("Recorrido por columnas:");
            for (int j = 0; j < matriz.GetLength(1); j++) // Columnas
            {
                for (int i = 0; i < matriz.GetLength(0); i++)// Filas
                {
                    Console.Write($"{matriz[i, j]}\t");
                }
                Console.WriteLine();
            }

            Console.WriteLine("Recorrido por filas");
            for (int i = 0; i < matriz.GetLength(0); i++)// Filas
            {
                for (int j = 0; j < matriz.GetLength(1); j++) // Columnas
                {
                    Console.Write($"{matriz[i, j]}\t");
                }
                Console.WriteLine();
            }
        }

        {
            Console.WriteLine("SUMA DE LAS FILAS");
            int[,] matriz = {
                          { 1, 2, 3 },
                          { 4, 5, 6 }

            }; // Matriz de 2x3 (2 filas y 3 columnas
            int suma = 0;
            int[] sumaFilas = new int[matriz.GetLength(0)]; // Array para almacenar la suma de cada fila

            for (int i = 0; i < matriz.GetLength(0); i++)// Filas 0 1 2
            {
                for (int j = 0; j < matriz.GetLength(1); j++) // Columnas
                {
                    suma = suma + matriz[i, j];
                    Console.Write($"{matriz[i, j]}\t");
                }
                sumaFilas[i] = suma;
                suma = 0;
                Console.WriteLine();
            }
            for (int i = 0; i < sumaFilas.Length; i++)
            {
                Console.WriteLine($"Suma de la fila {i}: {sumaFilas[i]}");
            }
        }

    }
}