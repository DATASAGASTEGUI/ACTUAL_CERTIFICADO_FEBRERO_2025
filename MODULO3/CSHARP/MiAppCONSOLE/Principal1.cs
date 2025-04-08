using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiAppCONSOLE
{
    public class Principal1
    {
        public static void Main1()
        {

            //int dato = int.Parse("54");
            
            string entrada = "54";
            int valor;
            if (int.TryParse(entrada, out valor))
            {
                Console.WriteLine(valor);
            } else
            { 
                Console.WriteLine(valor);
            }

            int x = Convert.ToInt32("54");
           


            string rna = "C:\\CERTIFICADO_27022025_MODULO1\\MODULO3\\CSHARP\\ProjectoVentanaWPF\\MiAppWPF\\bin\\Debug\\net8.0-windows";

            string rna2= "C:/CERTIFICADO_27022025_MODULO1/MODULO3/CSHARP/ProjectoVentanaWPF/MiAppWPF/bin/Debug/net8.0-windows";


            string rna1 = @"C:\CERTIFICADO_27022025_MODULO1\MODULO3\CSHARP\ProjectoVentanaWPF\MiAppWPF\bin\Debug\net8.0-windows";

            int b = 6;
            int a = 5;
            int mayor = (a > b) ? a : b;

            Math.Pow(2, 0.5);
            Math.Sqrt(2);
            Math.Round(4.3432423, 2);
            double z = Math.PI;
            Console.WriteLine(z);

            for(char letra='A'; letra<='F'; letra++)
            {
                Console.WriteLine(letra + "\t" + (int)letra);
            }

            Random random = new Random();
            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine((random.Next(5) + 1)); //0 1 2 3 4 --> [1,5]
            }

            //LETRAS ALEATORIAS
            //RANGO DE LETRA[65, 90] = 91 - 65

            // random.Next(26) + 65
            for (int i = 0; i < 10; i++)
            {
                int codigo = random.Next(26) + 65;
                Console.WriteLine((char)codigo);
            }

            Console.Write("Luis");
            for(int i=0; i<30;i++)
            {
                Console.Write((char)32);
            }
            Console.Write("Alva");

            Console.ReadKey(true);

        }
    }
}
