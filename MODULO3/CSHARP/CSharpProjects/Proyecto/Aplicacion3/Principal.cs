using System;

namespace Aplicacion3;

internal class Principal
{
   private static void Main(string[] args) 
   {
      int numero1 = Entrada.IngresarEntero("Ingrese número entero 1: ");
      int numero2 = Entrada.IngresarEntero("Ingrese número entero 2: ");
      int suma = numero1 + numero2;
      Console.WriteLine($"La suma de {numero1} y {numero2} es {suma}");
      Console.ReadKey(true);
   }
}