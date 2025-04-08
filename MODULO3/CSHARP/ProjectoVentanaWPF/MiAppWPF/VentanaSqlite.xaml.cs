/*
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
*/

using Microsoft.Data.Sqlite;
using System.Data;
using System.Windows;
using System.Collections.ObjectModel;

namespace MiAppWPF;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class VentanaSqlite : Window
{
    private ObservableCollection<Producto> productos = new ObservableCollection<Producto>();
    public VentanaSqlite()
    {
        InitializeComponent();
        CargarProductosDataGrid();
    }

    private void CargarProductosDataGrid()
    {
        string connectionString = "Data Source=tienda.sqlite3";

        using var connection = new SqliteConnection(connectionString);
        connection.Open();

        string query = "SELECT * FROM Producto";
        using var command = new SqliteCommand(query, connection);//
        using var reader = command.ExecuteReader();

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

        dgProductos.ItemsSource = productos;
    }
}