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
public partial class Ventana3 : Window
{
    public Ventana3()
    {
        InitializeComponent();
    }


private void BtnSumar_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                double num1 = double.Parse(txtNumero1.Text);
                double num2 = double.Parse(txtNumero2.Text);
                double suma = num1 + num2;

                lblResultado.Text = $"Resultado: {suma}";
            }
            catch
            {
                MessageBox.Show("Por favor, introduce números válidos.",
                                "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }




}