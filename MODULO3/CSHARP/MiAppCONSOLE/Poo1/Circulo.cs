using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiAppCONSOLE.Poo1  //Package
{
    public class Circulo
    {
        //(1) VARIABLES DE INSTANCIA

        //ENTRADA
        private int radio;

        //SALIDA (CALCULO)
        private double area;
        private double perimetro;

        //(2) CONSTRUCTORES
        public Circulo(int radio)
        {
            this.radio = radio;
        }

        public Circulo()
        {
        }

        //(3) METODOS SET Y GET (ENTRADA)
        public int GetRadio()
        {
            return radio;
        }

        public void SetRadio(int radio)
        {
            this.radio = radio;
        }

        //(4) METODOS CALCULO (SALIDA)
        public double Area()
        {
            this.area = Util.Redondear(Math.PI * Math.Pow(this.radio, 2));
            return this.area;
        }

        public double Perimetro()
        {
            this.perimetro = Util.Redondear(2 * Math.PI * this.radio);
            return this.perimetro;
        }

        //(5) METODOS MOSTRAR VARIABLES DE INSTANCIA DE LA CLASE
        public static void Cabecera() // Método de clase
        {
            Console.WriteLine("{0,4} {1,6} {2,10} {3,10}", "N", "RADIO", "AREA", "PERIMETRO");
            Console.WriteLine("{0,4} {1,6} {2,10} {3,10}", "-", "-----", "----", "---------");
        }

        public void Cuerpo(int i) // Método de instancia
        {
            Console.WriteLine("{0,4} {1,6} {2,10:0.00} {3,10:0.00}", i, this.radio, this.Area(), this.Perimetro());
        }

        public override string ToString() // Método de instancia
        {
            return "Circulo{" + "radio=" + radio + ", area=" + Area() + ", perimetro=" + Perimetro() + '}';
        }
    }
}
