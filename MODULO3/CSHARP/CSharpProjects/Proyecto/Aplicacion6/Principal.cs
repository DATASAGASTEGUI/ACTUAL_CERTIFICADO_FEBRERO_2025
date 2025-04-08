using System;

namespace Aplicacion6; //package

internal class Principal
{
   private static void Main(string[] args) 
   {
      Console.WriteLine("Ingrese Aplicación a ejecutar 4 o 5:");
      string? opcion = Console.ReadLine();
      switch(opcion)
      {
         case "4":
            Aplicacion4.Principal.Main();
            break;
         case "5":
            Aplicacion5.Principal.Main();
            break;
         default:
            Console.WriteLine("Opción inválida");
            break;
      }
      Console.ReadKey(true);
   }
}