namespace Proyecto; // Package

internal class Program12
{
    private static void Main()
    {
        int[,,] cubo = {
                          {
                            { 1, 2, 4 },
                            { 3, 4, 5 }
                          },
                          {
                            { 5, 6, 8 },
                            { 7, 8, 9 }
                          },
                                                    {
                            { 5, 6, 8 },
                            { 7, 8, 9 }
                          }
                       }; // Cubo de 2x2x3 (2 matrices de 2x2) capa, fila, columna
        for (int k = 0; k < cubo.GetLength(0); k++) // Capas
        {
            Console.WriteLine($"Capa {k}:");
            for (int i = 0; i < cubo.GetLength(1); i++) // Filas
            {
                for (int j = 0; j < cubo.GetLength(2); j++) // Columnas
                {
                    Console.Write($"{cubo[k, i, j]}\t");
                }
                Console.WriteLine();
            }
            Console.WriteLine();
        }   
    }
} 