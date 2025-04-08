package ventana_basica;

import java.awt.Color;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class VentanaBaseDatosTiendaPostgresql extends JFrame {

    //VARIABLES DE INSTANCIAS
    JPanel pnlPrincipal = (JPanel) this.getContentPane();

    DefaultTableModel dtm = new DefaultTableModel();
    JTable tabla = new JTable(dtm);
    JScrollPane scroll = new JScrollPane(tabla);

    //CONSTRUCTORES
    public VentanaBaseDatosTiendaPostgresql() {
        personalizarVentana();
        personalizarPanelPrincipal();
        personalizarComponentes();
        cargarDatosTabla();
    }

    //METODOS OTROS
    private void personalizarVentana() {
        setSize(480, 330);
        setResizable(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setTitle("VENTANA SWING");

        // Cambiar el icono de la ventana
        String ruta_relativa = "src/ventana_basica/cross1.png";
        String ruta_absoluta = new java.io.File(ruta_relativa).getAbsolutePath();
        setIconImage(new ImageIcon(ruta_absoluta).getImage());
    }

    private void personalizarPanelPrincipal() {
        pnlPrincipal.setLayout(null);
        pnlPrincipal.setBackground(Color.lightGray);
        pnlPrincipal.add(scroll);
    }

    private void personalizarComponentes() {
        dtm.addColumn("Id");
        dtm.addColumn("Nombre");
        dtm.addColumn("Detalles");
        scroll.setBounds(10, 10, 445, 270);
        tabla.setEnabled(false);
    }

    private void cargarDatosTabla() {
        Connection conexion = obtenerConexionPostgresql();
        if (conexion != null) {
            JOptionPane.showMessageDialog(null, "OK: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
            String query = "SELECT id, nombre, detalles->'especificaciones'->'procesador' FROM PRODUCTO";
            
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String nombre = rs.getString(2);
                    String detalles = rs.getString(3);
                    dtm.addRow(new Object[]{id, nombre, detalles});
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "ERROR: QUERY " + e.getMessage(), "Mensaje", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(null, "ERROR: CONEXION", "Mensaje", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public static Connection obtenerConexionPostgresql() {
        String url = "jdbc:postgresql://localhost:5432/tienda";
        String usuario = "postgres";
        String clave = "12345678";
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
        }
        return conexion;
    }

    //METODO PRINCIPAL (MOSTRAR VENTANA)
    public static void main(String[] args) {
        new VentanaBaseDatosTiendaPostgresql().setVisible(true);
        new VentanaBaseDatosTiendaPostgresql().setVisible(true);
    }

}
