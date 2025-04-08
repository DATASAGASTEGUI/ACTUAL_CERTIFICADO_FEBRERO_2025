/*
  Tipo punto flotante: float(7-8), double(15-16), decimal(28-29)

*/

namespace Proyecto; // Package

internal class Program3
{
    private static void Main()
    {
        // DECLARACION DE VARIABLES
        float a = 1.123456789f;   // 4 bytes
        double b = 1.5;           // 8 bytes
        decimal c = 12345678901234567890123456789m;         // 16 bytes

        // SALIDA DE RESULTADOS
        Console.WriteLine($"float: {a}");
        Console.WriteLine($"double: {b}");
        Console.WriteLine($"decimal: {c}");
    }
}