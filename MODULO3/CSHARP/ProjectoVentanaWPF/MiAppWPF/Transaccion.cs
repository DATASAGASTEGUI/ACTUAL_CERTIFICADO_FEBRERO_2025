using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiAppWPF
{
    public class Transaccion
    {
        public int IdTransaccion { get; set; }
        public string Ciudad { get; set; }
        public string Zona { get; set; }
        public double Ventas { get; set; }
        public string FormaPago { get; set; }
        public string Categoria { get; set; }

        public Transaccion(int idTransaccion, string ciudad, string zona, double ventas, string formaPago, string categoria)
        {
            IdTransaccion = idTransaccion;
            Ciudad = ciudad;
            Zona = zona;
            Ventas = ventas;
            FormaPago = formaPago;
            Categoria = categoria;
        }

        public Transaccion(String fila)
        {
            string[] partes = fila.Split(";");
            IdTransaccion = int.Parse(partes[0]);
            Ciudad = partes[1];
            Zona = partes[2];
            Ventas = double.Parse(partes[3]);
            FormaPago = partes[4];
            Categoria = partes[5];
        }

        public override string ToString()
        {
            return IdTransaccion + "\t" + Ciudad + "\t" + Zona;
        }

    }
}
