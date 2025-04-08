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
public partial class Ventana5 : Window
{
    public Ventana5()
    {
        InitializeComponent();
    }

    private void EvaluarTexto_Click(object sender, RoutedEventArgs e)
    {
        string patron = @"^[a-zA-Z\s]+$"; //   [a-zA-Z]+
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



}