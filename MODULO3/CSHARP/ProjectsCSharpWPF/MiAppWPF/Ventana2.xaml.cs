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
public partial class Ventana2 : Window
{
    public Ventana2()
    {
        InitializeComponent();
    }

private void Sumar_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                double numero1 = double.Parse(txtNumero1.Text);
                double numero2 = double.Parse(txtNumero2.Text);
                double suma = numero1 + numero2;
                txtSuma.Text = suma.ToString("N2");
            }
            catch (Exception ex)
            {
                MessageBox.Show("ENTRADA INCORRECTA", "ERROR", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Reiniciar_Click(object sender, RoutedEventArgs e)
        {
            txtNumero1.Clear();
            txtNumero2.Clear();
            txtSuma.Clear();
        }

        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }





}