using Microsoft.Data.Sqlite;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Lógica de interacción para VentanaSqliteComboboxDataGridCategoria.xaml
    /// </summary>
    public partial class VentanaSqliteComboboxDataGridCategoria : Window
    {
        string url;
        SqliteConnection conexion;
        private ObservableCollection<Producto> productos = new ObservableCollection<Producto>();

        public VentanaSqliteComboboxDataGridCategoria()
        {
            InitializeComponent();
            url = "Data Source=tienda.sqlite3";
            conexion = new SqliteConnection(url);
            conexion.Open();
            CargarCategoriaCombobox();
        }

        public void CargarCategoriaCombobox()
        {
            string query = "SELECT DISTINCT categoria FROM Producto";
            using SqliteCommand comando = new SqliteCommand(query, conexion);
            using SqliteDataReader reader = comando.ExecuteReader();
            while (reader.Read())
            {
                CboProducto.Items.Add(reader.GetString(0));
            }
        }

        public void CboProducto_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var query = "SELECT * FROM Producto WHERE categoria = @categoria";
            using var comando = new SqliteCommand(query, conexion);
            comando.Parameters.AddWithValue("@categoria", CboProducto.SelectedItem);
            using var reader = comando.ExecuteReader();
            productos.Clear();
            while (reader.Read())
            {
                productos.Add(new Producto
                {
                    Id_producto = reader.GetInt32(0),
                    Nombre = reader.GetString(1),
                    Precio = reader.GetDouble(2),
                    Stock = reader.GetInt32(3),
                    Fecha_creacion = reader.GetString(4),
                    Disponible = reader.GetBoolean(5),
                    Categoria = reader.GetString(6)
                });
            }
            DgProducto.ItemsSource = productos;
        }




    }
}
