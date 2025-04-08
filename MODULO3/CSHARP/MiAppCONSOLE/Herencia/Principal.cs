using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiAppCONSOLE.Herencia
{
    // Clase base
    public class Vehiculo
    {
        protected string marca;
        protected string modelo;
        protected int anio;

        // Constructor
        public Vehiculo(string marca, string modelo, int anio)
        {
            this.marca = marca;
            this.modelo = modelo;
            this.anio = anio;
        }

        // Método para mostrar información del vehículo
        public virtual void MostrarInformacion()
        {
            Console.WriteLine($"Marca: {marca}, Modelo: {modelo}, Año: {anio}");
        }
    }

    // Clase derivada (subclase) Automovil
    public class Automovil : Vehiculo
    {
        private int puertas;

        // Constructor
        public Automovil(string marca, string modelo, int anio, int puertas) : base(marca, modelo, anio)
        {
            this.puertas = puertas;
        }

        // Método para mostrar información del automóvil
        public override void MostrarInformacion()
        {
            base.MostrarInformacion();
            Console.WriteLine($"Número de puertas: {puertas}");
        }
    }

    // Clase derivada (subclase) Camion
    public class Camion : Vehiculo
    {
        private double cargaMaxima;

        // Constructor
        public Camion(string marca, string modelo, int anio, double cargaMaxima) : base(marca, modelo, anio)
        {
            this.cargaMaxima = cargaMaxima;
        }

        // Método para mostrar información del camión
        public override void MostrarInformacion()
        {
            base.MostrarInformacion();
            Console.WriteLine($"Carga máxima: {cargaMaxima} toneladas");
        }
    }
    /*
    // Clase derivada (subclase) Motocicleta
    public class Motocicleta : Vehiculo
    {
        private string tipo;

        // Constructor
        public Motocicleta(string marca, string modelo, int anio, string tipo) : base(marca, modelo, anio)
        {
            this.tipo = tipo;
        }

        // Método para mostrar información de la motocicleta
        public override void MostrarInformacion()
        {
            base.MostrarInformacion();
            Console.WriteLine($"Tipo: {tipo}");
        }
    }
*/
    class Principal
    {
        static void Main(string[] args)
        {
            // Crear una instancia de la clase Automovil
            Automovil miAutomovil = new Automovil("Toyota", "Corolla", 2022, 4);

            // Crear una instancia de la clase Camion
            Camion miCamion = new Camion("Ford", "F-150", 2021, 2.5);

            // Crear una instancia de la clase Motocicleta
            Motocicleta miMotocicleta = new Motocicleta("Honda", "CBR500R", 2023, "Deportiva");

            // Mostrar información del automóvil
            Console.WriteLine("Información del automóvil:");
            miAutomovil.MostrarInformacion();

            Console.WriteLine();

            // Mostrar información del camión
            Console.WriteLine("Información del camión:");
            miCamion.MostrarInformacion();

            Console.WriteLine();

            // Mostrar información de la motocicleta
            Console.WriteLine("Información de la motocicleta:");
            miMotocicleta.MostrarInformacion();
        }
    }
}
