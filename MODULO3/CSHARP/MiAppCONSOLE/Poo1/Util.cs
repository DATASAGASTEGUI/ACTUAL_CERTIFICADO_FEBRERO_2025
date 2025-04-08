using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiAppCONSOLE.Poo1
{
    public class Util
    {
        public static double Redondear(double x)
        {
            return Math.Round(x * 100.0) / 100.0;
            //return Math.Round(x,2);
        }

        public static int Dado()
        {
            Random random = new Random();
            return random.Next(1, 7); // Devuelve un número aleatorio entre 1 y 6
        }
                public static void Cls()
        {
            Console.Clear();
        }

        public static void Pause()
        {
            Console.Write("Presione Enter para continuar...");
            Console.ReadLine();
        }
    }
}
