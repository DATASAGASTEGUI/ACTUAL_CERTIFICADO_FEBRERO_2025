namespace Proyecto; // Package

internal class Program7
{
    private static void Main()
    {
        Console.WriteLine("Programa7_1: Condicional simple");
        {
            int numero = 5;
            if (numero > 0)
            {
                Console.WriteLine("El número es positivo.");
            }
        }

        Console.WriteLine("Programa7_2: Condicional doble");
        {
            int numero = 5;
            if (numero > 0)
            {
                Console.WriteLine("El número es positivo.");
            }
            else
            {
                Console.WriteLine("El número es negativo.");
            }
        }

        Console.WriteLine("Programa7_3: Condicional multiple (mas de dos opciones)");
        {
            int numero = 0;
            if (numero > 0)
            {
                Console.WriteLine("El número es positivo.");
            }
            else if (numero < 0)
            {
                Console.WriteLine("El número es negativo.");
            }
            else
            {
                Console.WriteLine("El número es cero.");
            }
        }
        Console.WriteLine("Programa7_4: Operador Tenario o Operador Condicional");
        {
            int numero1 = -3;
            string resultado = (numero1 >= 0) ? "Positivo" : "Negativo";
            Console.WriteLine($"El número {numero1} es: {resultado}");
            Console.WriteLine($"El número {numero1} es: {((numero1 >= 0) ? "Positivo" : "Negativo")}");
            Console.WriteLine($"El número {numero1} es: " + (numero1 >= 0 ? "Positivo" : "Negativo"));
        }

        Console.WriteLine("Programa7_5: Operador condicional ternario anidado");
        {
            int numero1 = 0;
            string resultado = (numero1 > 0) ? "Positivo" : (numero1 < 0) ? "Negativo" : "Cero";
            Console.WriteLine($"El número {numero1} es: {resultado}");

        }

        Console.WriteLine("Programa7_6: Sentencial condicional anidado");
        {
            int numero = 0;
            if (numero > 0)
            {
                Console.WriteLine("El número es positivo.");
            }
            else
            {
                if (numero < 0)
                {
                    Console.WriteLine("El número es negativo.");
                }
                else
                {
                    Console.WriteLine("El número es cero.");
                }
            }
        }
    }
}
    