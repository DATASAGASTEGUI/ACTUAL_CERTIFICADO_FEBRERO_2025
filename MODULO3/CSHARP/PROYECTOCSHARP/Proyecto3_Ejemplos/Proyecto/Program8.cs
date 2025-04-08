namespace Proyecto;

using System;
enum DiaSemana { Lunes, Martes, Miércoles, Jueves, Viernes, Sábado, Domingo };
       
internal class Program8
{
    private static void Main()
    {
 
        {
            int dia = 9;
            string nombreDia = dia switch
            {
                1 => "Lunes",
                2 => "Martes",
                3 => "Miércoles",
                4 => "Jueves",
                5 => "Viernes",
                6 => "Sábado",
                7 => "Domingo",
                _ => "Día inválido"
            };
            Console.WriteLine($"El día {dia} es: {nombreDia}");
        }
        {
            int numero = 3;
            string resultado = numero switch
            {
                > 0 => "Positivo",
                < 0 => "Negativo",
                0 => "Cero"
            };
            Console.WriteLine($"El número {numero} es: {resultado}");
        }

        {
            char letra = 'A';
            string tipoLetra = letra switch
            {
                >= 'A' and <= 'Z' => "Mayúscula",
                >= 'a' and <= 'z' => "Minúscula",
                _ => "No es una letra"
            };
            Console.WriteLine($"La letra '{letra}' es: {tipoLetra}");
        }

        {
            int numero = 5;
            string resultado = numero switch
            {
                int n when (n % 2 == 0) => "Par",
                int n when (n % 2 != 0) => "Impar",
                _ => "No es un número entero"
            };
            Console.WriteLine($"El número {numero} es: {resultado}");
        }

        {
            int numero = 15;
            string resultado = numero switch
            {
                int n when (n >= 1 && n <= 10) => "Entre 1 y 10",
                int n when (n >= 11 && n <= 20) => "Entre 11 y 20",
                int n when (n > 20) => "Mayor que 20",
                _ => "Número inválido"
            };
            Console.WriteLine($"El número {numero} es: {resultado}");
        }

        {
            object obj = 3.14;
            string tipo = obj switch
            {
                int => "Entero",
                double => "Doble",
                string => "Cadena",
                _ => "Tipo desconocido"
            };
            Console.WriteLine($"El objeto es de tipo: {tipo}");
        }
        {
            Console.WriteLine("EJEMPLO TIPO DINAMICO");
            dynamic obj = "Hola Mundo";
            string tipo = obj switch
            {
                int => "Entero",
                double => "Doble",
                string => "Cadena",
                _ => "Tipo desconocido"
            };
            Console.WriteLine($"El objeto es de tipo: {tipo}");
        }

        {
            int numero = 7;
            string resultado = numero switch
            {
                1 or 3 or 5 or 7 or 9 => "Impar",
                2 or 4 or 6 or 8 or 10 => "Par",
                _ => "Número fuera de rango"
            };
            Console.WriteLine($"El número {numero} es: {resultado}");
        }
        {
            int dia = 3;
            switch (dia)
            {
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                    Console.WriteLine("Día laborable");
                    break;
                case 6:
                case 7:
                    Console.WriteLine("Fin de semana");
                    break;
                default:
                    Console.WriteLine("Día inválido");
                    break;
            }
        }

        {
            int numero = 4;
            switch (numero)
            {
                case int n when (n > 0):
                    Console.WriteLine("El número es positivo.");
                    break;
                case int n when (n < 0):
                    Console.WriteLine("El número es negativo.");
                    break;
                case 0:
                    Console.WriteLine("El número es cero.");
                    break;
                default:
                    Console.WriteLine("No es un número entero.");
                    break;
            }
        }
        {
            int numero = -2;
            switch (numero)
            {
                case > 0:
                    Console.WriteLine("El número es positivo.");
                    break;
                case < 0:
                    Console.WriteLine("El número es negativo.");
                    break;
                case 0:
                    Console.WriteLine("El número es cero.");
                    break;
                default:
                    Console.WriteLine("No es un número entero.");
                    break;
            }
        }

        {
            string color = "Rojo";
            switch (color)
            {
                case "Rojo":
                    Console.WriteLine("El color es Rojo.");
                    break;
                case "Verde":
                    Console.WriteLine("El color es Verde.");
                    break;
                case "Azul":
                    Console.WriteLine("El color es Azul.");
                    break;
                default:
                    Console.WriteLine("Color desconocido.");
                    break;
            }
        }

        {
            DiaSemana dia = DiaSemana.Miércoles;
            switch (dia)
            {
                case DiaSemana.Lunes:
                    Console.WriteLine("Hoy es Lunes.");
                    break;
                case DiaSemana.Martes:
                    Console.WriteLine("Hoy es Martes.");
                    break;
                case DiaSemana.Miércoles:
                    Console.WriteLine("Hoy es Miércoles.");
                    break;
                case DiaSemana.Jueves:
                    Console.WriteLine("Hoy es Jueves.");
                    break;
                case DiaSemana.Viernes:
                    Console.WriteLine("Hoy es Viernes.");
                    break;
                case DiaSemana.Sábado:
                    Console.WriteLine("Hoy es Sábado.");
                    break;
                case DiaSemana.Domingo:
                    Console.WriteLine("Hoy es Domingo.");
                    break;
                default:
                    Console.WriteLine("Día inválido.");
                    break;
            }
        }
    }
}
    
