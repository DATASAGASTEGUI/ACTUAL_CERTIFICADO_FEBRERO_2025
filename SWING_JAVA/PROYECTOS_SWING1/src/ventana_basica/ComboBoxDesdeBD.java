package ventana_basica;

import javax.swing.*;
import java.awt.*;
import java.sql.*;

public class ComboBoxDesdeBD extends JFrame {

    private JComboBox<String> comboBox;

    public ComboBoxDesdeBD() {
        setTitle("ComboBox desde Base de Datos");
        setSize(300, 100);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new FlowLayout());

        comboBox = new JComboBox<>();
        add(comboBox);

        cargarCategorias();  // Cargar datos desde la base de datos

        setVisible(true);
    }

    private void cargarCategorias() {
        String url = "jdbc:mysql://localhost:3306/ejemplo";
        String usuario = "root";  // Cambia según tu configuración
        String clave = "";        // Cambia según tu configuración

        try {
            Connection conn = DriverManager.getConnection(url, usuario, clave);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT nombre FROM Categoria");

            while (rs.next()) {
                String nombre = rs.getString("nombre");
                comboBox.addItem(nombre);  // Agregar al ComboBox
            }

            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error al conectar con la base de datos");
        }
    }

    public static void main(String[] args) {
        new ComboBoxDesdeBD();
    }
}
