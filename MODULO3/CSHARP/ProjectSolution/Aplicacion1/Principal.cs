using System;

namespace Aplicacion1;

public class Principal
{
   public static void Main(string[] args) 
   {
      int resultado = Aplicacion2.Calculadora.Sumar(5, 7);
      Console.WriteLine("El resultado de la suma es: " + resultado);
      Console.ReadKey(true);
   }
}
