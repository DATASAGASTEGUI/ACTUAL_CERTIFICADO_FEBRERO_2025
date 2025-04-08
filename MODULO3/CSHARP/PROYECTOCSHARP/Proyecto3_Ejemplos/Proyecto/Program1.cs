/*
   Calcular las coordenadas polares a partir de las coordenadas cartesianas.
*/

namespace Proyecto; // Package

internal class Program1
{
    private static void Main()
    {
        // DECLARACION DE VARIABLES
        double x, y, angulo, radio;

        // ENTRADA DE DATOS
        Console.WriteLine("Ingrese el valor de X: ");
        x = Convert.ToDouble(Console.ReadLine()); // "1.72" --> 1.72
        Console.WriteLine("Ingrese el valor de Y: ");
        y = Convert.ToDouble(Console.ReadLine());

        // PROCESAMIENTO
        radio = Math.Sqrt(Math.Pow(x, 2) + Math.Pow(y, 2)); //Math.sqrt()
        angulo = Math.Atan2(y, x) * 180 / Math.PI;

        // SALIDA DE RESULTADOS
        Console.WriteLine("Coordenadas polares:");
        Console.WriteLine($"Radio: {Math.Round(radio,2)}"); // f"Radio: {radio}"
        Console.WriteLine($"Ángulo: {Math.Round(angulo,2)}");
    }
}
