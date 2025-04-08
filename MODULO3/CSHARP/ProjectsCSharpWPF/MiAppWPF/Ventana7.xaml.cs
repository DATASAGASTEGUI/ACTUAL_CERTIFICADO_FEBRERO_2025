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
public partial class Ventana7 : Window
{
    public Ventana7()
    {
        InitializeComponent();
    }

    private void BtnSeparar_Click(object sender, RoutedEventArgs e)
    {
        string texto = TxtMiTexto.Text.Trim();

        if (string.IsNullOrEmpty(texto))
        {
            MessageBox.Show("El campo de entrada está vacío.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
        }

        string[] palabras = texto.Split("");

        TxtCodigo.Text = palabras[0].Trim();
        TxtNombre.Text = palabras[1].Trim();    
        TxtEstatura.Text = palabras[2].Trim();
        TxtEdad.Text = palabras[3].Trim();
        TxtCasado.Text = palabras[4].Trim();

    }


}