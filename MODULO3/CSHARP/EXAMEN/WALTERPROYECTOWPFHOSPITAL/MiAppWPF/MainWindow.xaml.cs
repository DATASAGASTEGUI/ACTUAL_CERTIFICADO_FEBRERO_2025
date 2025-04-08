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

using Microsoft.Data.Sqlite;

namespace MiAppWPF;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
        CargarNumeroConsultas();
    }

    public void CargarNumeroConsultas()
    {
        cbConsultas.Items.Clear();
        string connectionString = "Data Source=hospital.sqlite3";

        using var connection = new SqliteConnection(connectionString);
        connection.Open();

        string query = "SELECT * FROM Consulta"; //1 
        using var command = new SqliteCommand(query, connection);
        using var reader = command.ExecuteReader();

        while (reader.Read())
        {
            cbConsultas.Items.Add(reader.GetString(0));
        }
    }

    private void cbConsultas_SelectionChanged(object sender, RoutedEventArgs e)
    {
        if (cbConsultas.SelectedItem == null) return;

        string connectionString = "Data Source=hospital.sqlite3";
        using var connection = new SqliteConnection(connectionString);
        connection.Open();

        string query = "SELECT * FROM Consulta WHERE numeroConsulta=@nc";
        using var command = new SqliteCommand(query, connection);
        command.Parameters.AddWithValue("@nc", cbConsultas.SelectedItem);

        using var reader = command.ExecuteReader();
        if (reader.Read())
        {
            txtNC.Text = reader.GetString(0);
            txtFecha.Text = reader.GetString(1);
            txtMedico.Text = reader.GetString(2);
            txtDeinpr.Text = reader.GetString(3);
            txtProcedencia.Text = reader.GetString(4);

        }
    }

    private void btnInsertar_Click(object sender, RoutedEventArgs e)
    {
        txtNC.Text = GenerarNumeroConsulta().ToString();
        if (string.IsNullOrWhiteSpace(txtFecha.Text) ||
            string.IsNullOrWhiteSpace(txtMedico.Text) ||
            string.IsNullOrWhiteSpace(txtDeinpr.Text) ||
            string.IsNullOrWhiteSpace(txtProcedencia.Text))
        {
            MessageBox.Show("Todos los campos deben estar completos.", "Advertencia",
                            MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        string connectionString = "Data Source=hospital.sqlite3";
        using var connection = new SqliteConnection(connectionString);
        connection.Open();

        string query = @"INSERT INTO Consulta 
                         (numeroConsulta,fecha,nombreMedico,deinpr,procedencia) 
                         VALUES (@nc, @f, @nm, @d, @p)";

        using var command = new SqliteCommand(query, connection);
        command.Parameters.AddWithValue("@nc", txtNC.Text);
        command.Parameters.AddWithValue("@f", txtFecha.Text);
        command.Parameters.AddWithValue("@nm", txtMedico.Text);
        command.Parameters.AddWithValue("@d", txtDeinpr.Text);
        command.Parameters.AddWithValue("@p", txtProcedencia.Text);

        int rows = command.ExecuteNonQuery();

        if (rows > 0)
        {
            MessageBox.Show("Consulta insertado correctamente.",
                            "Éxito", MessageBoxButton.OK, MessageBoxImage.Information);
            CargarNumeroConsultas();
            LimpiarCampos();
        }
    }
    private void btnActualizar_Click(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtNC.Text))
        {
            MessageBox.Show("Seleccione una consulta para actualizar.", "Advertencia",
                            MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        if (string.IsNullOrWhiteSpace(txtNC.Text) ||
            string.IsNullOrWhiteSpace(txtFecha.Text) ||
            string.IsNullOrWhiteSpace(txtMedico.Text) ||
            string.IsNullOrWhiteSpace(txtDeinpr.Text) ||
            string.IsNullOrWhiteSpace(txtProcedencia.Text))
        {
            MessageBox.Show("Todos los campos deben estar completos.", "Advertencia",
                            MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        string connectionString = "Data Source=hospital.sqlite3";
        using var connection = new SqliteConnection(connectionString);
        connection.Open();

        string query = @"UPDATE Consulta SET 
                            fecha=@f, 
                            nombreMedico=@nm, 
                            deinpr=@d, 
                            procedencia=@p 
                         WHERE numeroConsulta=@nc";

        using var command = new SqliteCommand(query, connection);
        command.Parameters.AddWithValue("@f", txtFecha.Text);
        command.Parameters.AddWithValue("@nm", txtMedico.Text);
        command.Parameters.AddWithValue("@d", txtDeinpr.Text);
        command.Parameters.AddWithValue("@p", txtProcedencia.Text);
        command.Parameters.AddWithValue("@nc", txtNC.Text);


        int rows = command.ExecuteNonQuery();

        if (rows > 0)
        {
            MessageBox.Show("Consulta actualizado correctamente.",
                            "Éxito", MessageBoxButton.OK, MessageBoxImage.Information);
            CargarNumeroConsultas();
        }
    }

    private void btnEliminar_Click(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtNC.Text))
        {
            MessageBox.Show("Seleccione una consulta para eliminar.", "Advertencia",
                            MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        string connectionString = "Data Source=hospital.sqlite3";
        using var connection = new SqliteConnection(connectionString);
        connection.Open();

        string query = "DELETE FROM Consulta WHERE numeroConsulta=@nc";
        using var command = new SqliteCommand(query, connection);
        command.Parameters.AddWithValue("@nc", txtNC.Text);

        int rows = command.ExecuteNonQuery();

        if (rows > 0)
        {
            MessageBox.Show("Consulta eliminada correctamente.",
                            "Éxito", MessageBoxButton.OK, MessageBoxImage.Information);
            CargarNumeroConsultas();
            LimpiarCampos();
        }
    }

    private void btnLimpiar_Click(object sender, RoutedEventArgs e)
    {
        LimpiarCampos();
    }

    private void LimpiarCampos()
    {
        txtNC.Text = "";
        txtMedico.Text = "";
        txtFecha.Text = "";
        txtDeinpr.Text = "";
        txtProcedencia.Text = "";
        cbConsultas.SelectedItem = null;
    }

    private int GenerarNumeroConsulta()
    {
        string connectionString = "Data Source=hospital.sqlite3";
        using var connection = new SqliteConnection(connectionString);
        connection.Open();

        string query = "SELECT COUNT(*)+1 FROM Consulta";
        using var command = new SqliteCommand(query, connection);

        using var reader = command.ExecuteReader();
        int contador = 0;
        if (reader.Read())
        {
            contador = reader.GetInt32(0);
        }
        return contador;

     }



}