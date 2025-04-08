using Microsoft.Data.Sqlite;
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

using System.Windows.Controls;

namespace MiAppWPF
{
    /// <summary>
    /// Lógica de interacción para VentanaSqliteCombobox.xaml
    /// </summary>
    public partial class VentanaSqliteCombobox : Window
    {
        string url;
        SqliteConnection conexion; 
        public VentanaSqliteCombobox()
        {
            InitializeComponent();
            url = "Data Source=tienda.sqlite3";
            conexion = new SqliteConnection(url);
            conexion.Open();
            CargarIdProductoCombobo();
        }

        public void CargarIdProductoCombobo()
        {
            string query = "SELECT id_producto FROM Producto";
            using var comando = new SqliteCommand(query, conexion);
            using var reader = comando.ExecuteReader();
            while (reader.Read()) 
            {
                CboProducto.Items.Add(reader.GetInt32(0));
            }
        }

        public void CboProducto_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(CboProducto.SelectedItem == null)
            {
                return;
            }
            string query = "SELECT * FROM Producto WHERE Id_producto = @id";
            using var comando = new SqliteCommand(query, conexion);
            comando.Parameters.AddWithValue("@id", CboProducto.SelectedItem);
            using var reader = comando.ExecuteReader();
            if (reader.Read()) 
            {
                 TxtId.Text = reader.GetInt32(0).ToString();
                 TxtNombre.Text = reader.GetString(1);
                 TxtPrecio.Text = reader.GetDouble(2).ToString();
                 TxtStock.Text = reader.GetInt32(3).ToString();
                 TxtFechaCreacion.Text = reader.GetString(4);
                 TxtDisponible.Text = reader.GetBoolean(5) ? "Verdadero" : "Falso";
                 TxtCategoria.Text = reader.GetString(6);

            }
        }
    }
}
