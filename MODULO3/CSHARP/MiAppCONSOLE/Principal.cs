namespace MiAppCONSOLE
{
    internal class Principal
    {
        static void Main1(string[] args)
        {

            int opcion;
            while (true)
            {
                Cls();
                MostrarMenu();
                opcion = Entrada.IngresarEntero("Ingrese su opción? ");

                switch(opcion) 
                {
                    case 1: Cls(); opcion1(); Pause(); break;
                    case 0: Cls(); Console.WriteLine("Gracias por su visita. ADIOS"); Pause(); Environment.Exit(0); break;
                }
            }
        }

        public static void Cls()
        { 
             Console.Clear();
        }

        public static void Pause()
        {
            Console.Write("Presione una tecla para continuar...");
            Console.ReadKey();
        }

        public static void MostrarMenu()
        {
            Console.WriteLine("[1] Mostrar todos los registros del archivo csv");
            Console.WriteLine("[2] Opcion");
            Console.WriteLine("[0] Salir");
        }

        public static void opcion1()
        {
            Console.WriteLine("[1] Mostrar todos los registros del archivo csv");
            Console.WriteLine("-----------------------------------------------");
            List<Transaccion> transacciones = ArchivoCSV.obtenerListaObjetosTransaccion();
            foreach(Transaccion transaccion in transacciones) 
            {
                Console.WriteLine(transaccion);
            }


        }





    }
}
