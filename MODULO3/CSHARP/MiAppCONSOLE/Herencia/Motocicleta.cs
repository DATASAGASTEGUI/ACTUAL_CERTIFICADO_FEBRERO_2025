namespace MiAppCONSOLE.Herencia;    

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