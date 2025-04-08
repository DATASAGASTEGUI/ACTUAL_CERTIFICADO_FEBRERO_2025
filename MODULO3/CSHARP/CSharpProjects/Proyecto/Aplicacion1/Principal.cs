using System;

namespace Aplicacion1;

internal class Principal
{
   private static void Main(string[] args) 
   {
      int numero1 = int.Parse(args[0]);
      int numero2 = int.Parse(args[1]);
      int resultado = numero1 + numero2;
      Console.WriteLine($"Suma es es: {resultado}");
      Console.ReadKey(true);
   }
}