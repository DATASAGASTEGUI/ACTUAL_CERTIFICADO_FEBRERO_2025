/*
    Cast y la division entera y punto flotante.
*/

namespace Proyecto; // Package

internal class Program4
{
    private static void Main()
    {
        // DECLARACION DE VARIABLES
        int x = 0;
        int y = 3;

        // DIVISION ENTERA
        int resultadoEntero = x / y; // 3  no 3.3333333
        Console.WriteLine($"Division entera: {resultadoEntero}");
        double resultadoEntero2 = x / y; // 3.0 no 3.3333333
        Console.WriteLine($"Division entera: {resultadoEntero2}");
        double resultadoEntero3 = (double)x / y; // si 3.3333333

        // DIVISION PUNTO FLOTANTE
        float resultadoFlotante = (float)x / y;
        Console.WriteLine($"Division punto flotante: {resultadoFlotante}");

        // CASTING
        double z = 5.7;
        int resultadoCasting = (int)z; // 5
        Console.WriteLine($"Resultado de casting: {resultadoCasting}");


        int entero1 = 5;
        System.Int32 entero2 = 10;
         
        

    }
}