using System.Windows;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using Microsoft.Data.Sqlite;
using System.Data;
using System.Windows;
using System.Collections.ObjectModel;

namespace MiAppWPF;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class VentanaPestanas : Window
{
    private ObservableCollection<Producto> productos = new ObservableCollection<Producto>();
    private ObservableCollection<Cliente> clientes = new ObservableCollection<Cliente>();

    public VentanaPestanas()
    {
        InitializeComponent();
        CargarProductosDataGrid();
        CargarClientesDataGrid();
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

    public void CargarClientesDataGrid()
    {
        try
        {
            string server = "localhost";
            string database = "factoria";
            string uid = "root";
            string password = "12345678";
            int port = 3307;

            string connectionString = $"Server={server};Port={port};Database={database};Uid={uid};Pwd={password};";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM Cliente";
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            clientes.Add(new Cliente
                            {
                                IdCliente = reader.GetInt32(0),
                                Empresa = reader.GetString(1),
                                IdVendedor = reader.GetInt32(2),
                                Limite_credito = reader.GetDouble(3),
                            });
                        }
                        dgClientes.ItemsSource = clientes;
                    }
                }
            }
        }
        catch (MySqlException e)
        {
            Console.WriteLine("ERROR: \n" + e.Message);
            MessageBox.Show($"Error de base de datos: {e.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }


}