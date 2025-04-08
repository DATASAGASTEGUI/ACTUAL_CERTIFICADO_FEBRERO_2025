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
public partial class Ventana1 : Window
{
    public Ventana1()
    {
        InitializeComponent();
        CargarDatosDataGrid();
    }

    public void CargarDatosDataGrid()
    {
        // Creamos un array de personas
        Persona[] personas = new Persona[]
        {
                new Persona { Nombre = "Ana", Edad = 25, Ciudad = "Madrid" },
                new Persona { Nombre = "Luis", Edad = 30, Ciudad = "Barcelona" },
                new Persona { Nombre = "Marta", Edad = 28, Ciudad = "Valencia" }
        };

        // Asignamos el array como fuente de datos al DataGrid
        miDataGrid.ItemsSource = personas;
    }


}