namespace Proyecto; // Package

internal class Program9
{
    private static void Main()
    {
        {
            Console.WriteLine("BUCLE WHILE (TEST AL INICIO)");
            int i = 0;      // Inicialización
            while (i < 5)   // Condición  true = bucle infinito
            {
                Console.WriteLine($"Iteración {i}");
                i++;        // Incremento
            }
        }

        {
            Console.WriteLine("BUCLE DO-WHILE (TEST AL FINAL)");
            int i = 0;              // Inicialización
            do
            {
                Console.WriteLine($"Iteración {i}");
                i++;                // Incremento
            } while (i < 5);       // Condición
        }

        {
            Console.WriteLine("BUCLE FOR");
            for (int i = 0; i < 5; i++) // Inicialización, Condición, Incremento
            {
                Console.WriteLine($"Iteración {i}");
            }
        }

        {
            Console.WriteLine("BUCLE FOREACH");
            string[] frutas = { "Manzana", "Banana", "Cereza" };
            foreach (string fruta in frutas)
            {
                Console.WriteLine($"Fruta: {fruta}");
            }

            for (int i = 0; i < frutas.Length; i++)
            {
                Console.WriteLine($"Fruta {i + 1}: {frutas[i]}");
            }
        }
    }
}