using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interface
{
    // Definición de la interfaz
    public interface IFormaGeometrica
    {
        double CalcularArea();
        double CalcularPerimetro();
    }

    // Clase para un círculo
    public class Circulo : IFormaGeometrica
    {
        private double radio;

        public Circulo(double radio)
        {
            this.radio = radio;
        }
/*
        public double CalcularArea()
        {
            return Math.PI * radio * radio;
        }
*/
        public double CalcularPerimetro()
        {
            return 2 * Math.PI * radio;
        }
    }

    // Clase para un rectángulo
    public class Rectangulo : IFormaGeometrica
    {
        private double longitud;
        private double ancho;

        public Rectangulo(double longitud, double ancho)
        {
            this.longitud = longitud;
            this.ancho = ancho;
        }

        public double CalcularArea()
        {
            return longitud * ancho;
        }

        public double CalcularPerimetro()
        {
            return 2 * (longitud + ancho);
        }
    }

    // Clase para un cuadrado
    public class Cuadrado : IFormaGeometrica
    {
        private double lado;

        public Cuadrado(double lado)
        {
            this.lado = lado;
        }

        public double CalcularArea()
        {
            return lado * lado;
        }

        public double CalcularPerimetro()
        {
            return 4 * lado;
        }
    }

    class Principal
    {
        static void Main(string[] args)
        {
            // Crear una lista para almacenar formas geométricas
            List<IFormaGeometrica> formas = new List<IFormaGeometrica>();
            

            // Agregar objetos de diferentes tipos a la lista
            formas.Add(new Circulo(5));
            formas.Add(new Rectangulo(4, 6));
            formas.Add(new Cuadrado(5));

            // Iterar sobre la lista y calcular el área y el perímetro de cada forma
            foreach (var forma in formas)
            {
                Console.WriteLine($"Área: {forma.CalcularArea()}, Perímetro: {forma.CalcularPerimetro()}");
            }
        }
    }
}
