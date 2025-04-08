using System;

namespace Aplicacion2;

internal class Principal
{
   private static void Main(string[] args) 
   {
      Console.Write("Ingrese número 1: ");
      string? numero1 = Console.ReadLine();
      if (!(numero1 == null || numero1 == ""))
      {
         Console.Write("Procesar dato ...");
      }
      Console.Write("Ingrese número 2: ");
      string? numero2 = Console.ReadLine();
      if (!(numero2 == null || numero2 == ""))
      {
         Console.Write("Procesar dato...");
      }
      

      Console.ReadKey(true);
   }
}