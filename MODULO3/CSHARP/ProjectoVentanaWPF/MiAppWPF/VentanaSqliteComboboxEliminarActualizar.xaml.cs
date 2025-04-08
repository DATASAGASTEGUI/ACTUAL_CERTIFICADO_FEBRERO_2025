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
    /// Lógica de interacción para VentanaSqliteComboboxEliminarActualizar.xaml
    /// </summary>
    public partial class VentanaSqliteComboboxEliminarActualizar : Window
    {
        string url;
        SqliteConnection conexion;
        private ObservableCollection<Producto> productos = new ObservableCollection<Producto>();
        public VentanaSqliteComboboxEliminarActualizar()
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
                TxtIdProducto.Text = reader.GetInt32(0).ToString();
                TxtNombre.Text = reader.GetString(1);
                TxtPrecio.Text = reader.GetDouble(2).ToString();
                TxtStock.Text = reader.GetInt32(3).ToString();
                TxtFechaCreacion.Text = reader.GetString(4);
                TxtDisponible.Text = reader.GetBoolean(5) ? "Verdadero" : "Falso";
                TxtCategoria.Text = reader.GetString(6);

            }
        }

        public void BtnActualizar_Click(object sender, EventArgs e)
        {
            string query = @"UPDATE Producto SET nombre=@Nombre,
                                                 precio=@Precio,
                                                 stock=@Stock,
                                                 fecha_creacion=@FechaCreacion,
                                                 disponible=@Disponible,
                                                 categoria=@Categoria WHERE id_producto=@Id";
            using var comando = new SqliteCommand(query, conexion);
            comando.Parameters.AddWithValue("@Id", int.Parse(TxtIdProducto.Text));
            comando.Parameters.AddWithValue("@Nombre", TxtNombre.Text);
            comando.Parameters.AddWithValue("@Precio", double.Parse(TxtPrecio.Text));
            comando.Parameters.AddWithValue("@Stock", int.Parse(TxtStock.Text));
            comando.Parameters.AddWithValue("@FechaCreacion", TxtFechaCreacion.Text);
            comando.Parameters.AddWithValue("@Disponible", TxtDisponible.Text);
            comando.Parameters.AddWithValue("@Categoria", TxtCategoria.Text);

            int filas = comando.ExecuteNonQuery();
            if (filas > 0)
            {
                MessageBox.Show("Producto se actualizo correctamente.", "Exito", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                MessageBox.Show("No se pudo actualizar el producto.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void BtnEliminar_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrWhiteSpace(TxtIdProducto.Text)) 
            {
                MessageBox.Show("Debe seleccionar un producto.", "Aviso", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            string query = "DELETE FROM Producto WHERE id_producto=@Id";
            using var comando = new SqliteCommand(query, conexion);
            comando.Parameters.AddWithValue("@Id", int.Parse(TxtIdProducto.Text));

            int filas = comando.ExecuteNonQuery();
            if (filas > 0)
            {
                MessageBox.Show("Producto se elimino correctamente.", "Exito", MessageBoxButton.OK, MessageBoxImage.Information);
                CboProducto.Items.Clear();
                CargarIdProductoCombobo();
                TxtIdProducto.Text = "";
                TxtNombre.Text = "";
                TxtPrecio.Text = "";
                TxtStock.Text = "";
                TxtFechaCreacion.Text = "";
                TxtDisponible.Text = "";
                TxtCategoria.Text = "";
            }
            else
            {
                MessageBox.Show("No se pudo eliminar el producto.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }



        }

    }
}
