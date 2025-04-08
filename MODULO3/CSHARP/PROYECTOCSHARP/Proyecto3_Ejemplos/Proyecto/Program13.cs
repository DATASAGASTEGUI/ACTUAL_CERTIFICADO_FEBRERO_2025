namespace Proyecto; // Package

internal class Program13
{
    private static void Main()
    {
        int[] cubo = { 1, 2, 3, 5, 6, 7, 4, 5, 8 }; // 1D array
                        // Cubo de 2x2x3 (2 matrices de 2x2) capa, fila, columna
        for (int k = 0; k < cubo.GetLength(0); k++) // Capas
        {
            for (int i = 0; i < cubo.GetLength(0); i++) // Filas
            {
                for (int j = 0; j < cubo.GetLength(0); j++) // Columnas
                {
                    Console.WriteLine($"{cubo[k]},{cubo[i]},{cubo[j]}");
                }
            }
            Console.WriteLine();
        }   
    }
} 