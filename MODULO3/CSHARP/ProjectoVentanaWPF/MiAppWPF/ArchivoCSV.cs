using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiAppWPF
{
    public class ArchivoCSV
    {
        public static List<Transaccion> obtenerListaObjetosTransaccion()
        {
            var transacciones = new List<Transaccion>();
            string fila;
            try
            {
                using (var bf = new StreamReader("Transaccion.csv"))
                {
                    int i = 0;
                    while ((fila = bf.ReadLine()) != null)
                    {
                        if (i != 0)
                        {
                            Transaccion transaccion = new Transaccion(fila);
                            transacciones.Add(transaccion);
                        }
                        i++;

                    }
                }
            }
            catch (IOException e)
            {
                Console.WriteLine("Error de lectura");
            }

            return transacciones;
        }
    }
}
