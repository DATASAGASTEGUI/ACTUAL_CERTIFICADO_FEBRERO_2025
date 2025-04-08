using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MiAppWPF
{
    /// <summary>
    /// Lógica de interacción para VentanaCsv.xaml
    /// </summary>
    public partial class VentanaCsv : Window
    {
        public VentanaCsv()
        {
            InitializeComponent();
            CargarDataGridCsv();
        }

        public void CargarDataGridCsv()
        {
            List<Transaccion> transacciones = ArchivoCSV.obtenerListaObjetosTransaccion();
           dgTransacciones.ItemsSource = transacciones;
        }

    }
}
