using System.Windows;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;

namespace MiAppWPF;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class VentanaMysql : Window
{
    private ObservableCollection<Cliente> clientes = new ObservableCollection<Cliente>();
     
    public VentanaMysql()
    {
        InitializeComponent();
        CargarClientesDataGrid();
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