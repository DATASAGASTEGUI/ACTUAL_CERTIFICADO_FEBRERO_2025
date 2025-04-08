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

namespace MiAppWPF;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class Ventana4 : Window
{
    public Ventana4()
    {
        InitializeComponent();
    }

     private void OperacionSeleccionada(object sender, RoutedEventArgs e)
        {
            if (rbSumar.IsChecked == true)
            {
                Sumar();
            }
            else if (rbLimpiar.IsChecked == true)
            {
                Limpiar();
            }
            else if (rbCerrar.IsChecked == true)
            {
                CerrarVentana();
            }
        }

        private void Sumar()
        {
            try
            {
                double n1, n2, suma;
                n1 = double.Parse(txtN1.Text);
                n2 = double.Parse(txtN2.Text);
                suma = n1 + n2;
                txtSuma.Text = Convert.ToString(Math.Round(suma, 2));
            }
            catch (FormatException)
            {
                MessageBox.Show("ENTRADA INCORRECTA", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Reiniciar(object sender, RoutedEventArgs e)
        {
            /*
            txtN1.Text = "";
            txtN2.Text = "";
            txtSuma.Text = "";
            */
            rbSumar.IsChecked = false;
            rbLimpiar.IsChecked = false;
            rbCerrar.IsChecked = false;
        }

        private void Limpiar()
        {
            txtN1.Text = "";
            txtN2.Text = "";
            txtSuma.Text = "";
        }

        private void CerrarVentana()
        {
            this.Close();
        }




}