using System;
using Aplicacion3; //import

namespace Aplicacion4; //package

public class Principal
{
   public static void Main() 
   {
      int numero1 = Entrada.IngresarEntero("Ingrese número entero 1: ");
      int numero2 = Entrada.IngresarEntero("Ingrese número entero 2: ");
      int suma = numero1 + numero2;
      Console.WriteLine($"La suma de {numero1} y {numero2} es {suma}");
      Console.ReadKey(true);
   }
}