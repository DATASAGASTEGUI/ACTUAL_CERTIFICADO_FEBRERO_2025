using System;

namespace Aplicacion3;

public class Entrada
{
    public static int IngresarEntero(string mensaje)
    {
        int valor;
        while (true)
        {
            Console.Write(mensaje);
            string? entrada = Console.ReadLine();//6
            if (int.TryParse(entrada, out valor))
            {
                return valor;
            }
            Console.WriteLine("Entrada inválida. Por favor, ingrese un número entero.");

        }
    }
   
    public static double IngresarDouble(string mensaje)
    {
        double valor;
        while (true)
        {
            Console.Write(mensaje);
            string? entrada = Console.ReadLine();
            if (double.TryParse(entrada, out valor))
            {
                return valor;
            }
            Console.WriteLine("Entrada inválida. Por favor, ingrese un número decimal.");
        }
    }

}