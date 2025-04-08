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
using System.Text.RegularExpressions;

namespace MiAppWPF;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class Ventana6 : Window
{
    public Ventana6()
    {
        InitializeComponent();
    }

    private void OperacionSeleccionada(object sender, RoutedEventArgs e)
    {

        string patron = "";

        if (rbLetras.IsChecked == true)
        {
            patron = @"^[a-zA-Z\s]+$"; //   [a-zA-Z]+
            string texto = TxtMiTexto.Text.Trim();

            if (string.IsNullOrEmpty(texto))
            {
                MessageBox.Show("El campo de entrada está vacío.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            bool correcto = Regex.IsMatch(texto, patron);

            if (correcto)
            {
                TxtMensaje.Text = "El texto es válido.";
            }
            else
            {
                TxtMensaje.Text = "El texto no es válido. Solo se permiten letras.";
            }

        }
        else if (rbNumeros.IsChecked == true)
        {
            patron = @"^[0-9]+$"; //   [0-9]+
            string texto = TxtMiTexto.Text.Trim();

            if (string.IsNullOrEmpty(texto))
            {
                MessageBox.Show("El campo de entrada está vacío.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            bool correcto = Regex.IsMatch(texto, patron);

            if (correcto)
            {
                TxtMensaje.Text = "El texto es válido.";
            }
            else
            {
                TxtMensaje.Text = "El texto no es válido. Solo se permiten numeros.";
            }

        }
        else if (rbCerrar.IsChecked == true)
        {
            this.Close();

        }

    }

    private void BtnReiniciar_Click(object sender, RoutedEventArgs e)
    {
        TxtMensaje.Text = "";
        TxtMiTexto.Text = "";
        rbLetras.IsChecked = false;
        rbNumeros.IsChecked = false;
        rbCerrar.IsChecked = false;
}






}