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

using System.Data;
using System.Collections.ObjectModel;

namespace MiAppWPF
{
    /// <summary>
    /// Lógica de interacción para VentanaSqliteComboboxDataGrid.xaml
    /// </summary>
    public partial class VentanaSqliteComboboxDataGrid : Window
    {
        string url;
        SqliteConnection conexion;
        private ObservableCollection<Producto> productos = new ObservableCollection<Producto>();
        public VentanaSqliteComboboxDataGrid()
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
            if (CboProducto.SelectedItem == null)
            {
                return;
            }
            string query = "SELECT * FROM Producto WHERE Id_producto = @id";
            using var comando = new SqliteCommand(query, conexion);
            comando.Parameters.AddWithValue("@id", CboProducto.SelectedItem);
            using var reader = comando.ExecuteReader();
            if (reader.Read())
            {
                Producto producto = new Producto
                {
                    Id_producto = reader.GetInt32(0),
                    Nombre = reader.GetString(1),
                    Precio = reader.GetDouble(2),
                    Stock = reader.GetInt32(3),
                    Fecha_creacion = reader.GetString(4),
                    Disponible = reader.GetBoolean(5),
                    Categoria = reader.GetString(6)

                };
                productos.Clear();
                productos.Add(producto);
            }
            
            //DgProducto.ItemsSource = null;
            //DgProducto.Items.Clear();
            DgProducto.ItemsSource = productos;
            
        }
    }
}
