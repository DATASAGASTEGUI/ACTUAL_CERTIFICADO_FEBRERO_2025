package ventana_basica;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.sql.*;

public class TablaDesdeBD extends JFrame {

    JTable tabla;
    DefaultTableModel modelo;

    public TablaDesdeBD() {
        setTitle("Tabla desde Base de Datos");
        setSize(500, 300);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        // Crear modelo con columnas
        modelo = new DefaultTableModel();
        modelo.addColumn("ID");
        modelo.addColumn("Nombre");
        modelo.addColumn("Edad");

        // Crear JTable con el modelo
        tabla = new JTable(modelo);
        JScrollPane scroll = new JScrollPane(tabla);
        add(scroll);

        // Cargar los datos
        cargarDatos();

        setVisible(true);
    }

    private void cargarDatos() {
        String url = "jdbc:mysql://localhost:3306/ejemplo";
        String usuario = "root"; // Cambia según tu configuración
        String clave = "";       // Cambia según tu configuración

        try {
            // Conectar a la base de datos
            Connection conn = DriverManager.getConnection(url, usuario, clave);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Persona");

            // Recorrer los resultados y agregarlos al modelo
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                int edad = rs.getInt("edad");

                modelo.addRow(new Object[]{id, nombre, edad});
            }

            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error al conectar con la base de datos");
        }
    }

    public static void main(String[] args) {
        new TablaDesdeBD();
    }
}
