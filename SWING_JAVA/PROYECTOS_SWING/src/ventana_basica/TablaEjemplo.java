package ventana_basica;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class TablaEjemplo {

    public static void main(String[] args) {
        // Datos de ejemplo para la tabla
        String[][] datos = {
            {"1", "Ana", "22"},
            {"2", "Luis", "25"},
            {"3", "Carlos", "30"},
            {"4", "Marta", "27"}
        };

        // Encabezados de las columnas
        String[] columnas = {"ID", "Nombre", "Edad"};

        // Crear la JTable con los datos y las columnas
        JTable tabla = new JTable(datos, columnas);

        // Poner la tabla en un JScrollPane para que tenga barra de desplazamiento
        JScrollPane scrollPane = new JScrollPane(tabla);

        // Crear la ventana (JFrame)
        JFrame frame = new JFrame("Ejemplo de JTable");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 200);
        frame.add(scrollPane);  // Agregar la tabla con scroll a la ventana
        frame.setVisible(true);
    }
}

