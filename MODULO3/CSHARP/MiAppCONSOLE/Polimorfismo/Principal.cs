using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Polimorfismo
{

    using System;

    // Clase base
    public class Figura
    {
        public void mensjar() {
            Console.Write("HOla");
        } 
        // Método virtual para calcular el área
        public virtual double CalcularArea()
        {
            return 0;
        }
    }

    // Subclase Círculo
    public class Circulo : Figura
    {
        private double radio;

        // Constructor
        public Circulo(double radio)
        {
            this.radio = radio;
        }
/*
        // Implementación del método CalcularArea para círculo
        public override double CalcularArea()
        {
            return Math.PI * radio * radio;
        }
   */     
    }

    // Subclase Rectángulo
    public class Rectangulo : Figura
    {
        private double longitud;
        private double ancho;

        // Constructor
        public Rectangulo(double longitud, double ancho)
        {
            this.longitud = longitud;
            this.ancho = ancho;
        }

        // Implementación del método CalcularArea para rectángulo
        public override double CalcularArea()
        {
            return longitud * ancho;
        }
    }

    class Principal
    {
        static void Main(string[] args)
        {
            // Crear instancias de círculo y rectángulo
            Figura circulo = new Circulo(5);
            Figura rectangulo = new Rectangulo(4, 6);

            // Calcular y mostrar el área de las figuras
            Console.WriteLine("Área del círculo: " + circulo.CalcularArea());
            Console.WriteLine("Área del rectángulo: " + rectangulo.CalcularArea());
        }
    }
}
