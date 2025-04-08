using System;
using Aplicacion3; //import Entrada

namespace Aplicacion5; //package

public class Principal
{
   public static void Main() 
   {
      double numero1 = Entrada.IngresarDouble("Ingrese número double 1: ");
      double numero2 = Entrada.IngresarDouble("Ingrese número double 2: ");
      double suma = Math.Round((numero1 + numero2), 2); // Redondear a 2 decimales;
      Console.WriteLine($"La suma de {numero1} y {numero2} es {suma}");
      Console.ReadKey(true);
   }
}