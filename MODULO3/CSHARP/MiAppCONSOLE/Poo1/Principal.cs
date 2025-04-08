using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiAppCONSOLE.Poo1
{
    public class Principal
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("EJEMPLO 01");
            Console.WriteLine("----------");
            {
                int radio = 5;
                Circulo circulo = new Circulo(radio);
                Console.WriteLine(circulo);

                
                Circulo1 circulo1 = new Circulo1
                {
                  Radio = radio
                };

                Console.WriteLine("Radio: " + circulo1.Radio);
                Console.WriteLine(circulo1);
            }
/*
            Console.WriteLine("EJEMPLO 02");
            Console.WriteLine("----------");
            {
                int radio = 5;
                Circulo circulo = new Circulo(radio);
                Circulo.Cabecera();
                circulo.Cuerpo(1);
            }
            Console.WriteLine("EJEMPLO 03");
            Console.WriteLine("----------");
            {
                int radio = 5;
                Circulo circulo = new Circulo();
                circulo.SetRadio(radio);
                Circulo.Cabecera();
                circulo.Cuerpo(1);
            }
            Console.WriteLine("EJEMPLO 04");
            Console.WriteLine("----------");
            {
                Circulo.Cabecera();
                for (int i = 0; i < 100; i++)
                {
                    Circulo circulo = new Circulo(Util.Dado());
                    circulo.Cuerpo(i + 1);
                }
            }
            */
        }
    }
}
