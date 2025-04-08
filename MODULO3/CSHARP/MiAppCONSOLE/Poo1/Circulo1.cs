using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiAppCONSOLE.Poo1;

public class Circulo1() 
{
   public double Radio {get; set;}

   public double Area()
   {
      return Util.Redondear(Math.PI * Math.Pow(Radio, 2));
   }

   public double Perimetro()
   {
      return Util.Redondear(2 * Math.PI * Radio);
   }

   public override string ToString() // Método de instancia
   {
     return "Circulo{" + "radio=" + Radio + ", area=" + Area() + ", perimetro=" + Perimetro() + '}';
   }
}