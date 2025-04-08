package ventana_basica;

import java.sql.Connection;
import java.awt.Color;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class VentanaBaseDatosHospital extends JFrame {

    //VARIABLES DE INSTANCIAS
    JPanel pnlPrincipal = (JPanel) this.getContentPane();
    
    DefaultTableModel dtm = new DefaultTableModel();
    JTable tabla = new JTable(dtm);
    JScrollPane scroll = new JScrollPane(tabla);
    
    //CONSTRUCTORES
    public VentanaBaseDatosHospital() {
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
        dtm.addColumn("Consulta");
        dtm.addColumn("Médico");
        scroll.setBounds(10, 10, 445, 270);
    }
    
    private void cargarDatosTabla() {
        //Connection conexion = PrincipalSqlite.obtenerConexionSqLite();
        Connection conexion = null;
        if(conexion != null) {
           JOptionPane.showMessageDialog(null, "OK: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE); 
           String query = "SELECT numeroConsulta, nombreMedico FROM Consulta";
           try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int numeroConsulta = rs.getInt(1);
                    String nombreMedico = rs.getString(2);
                    dtm.addRow(new Object[]{numeroConsulta,nombreMedico});
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }else {
           JOptionPane.showMessageDialog(null, "ERROR: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);  
        }
    }

    //METODO PRINCIPAL
    public static void main(String[] args) {
        new VentanaBaseDatosHospital().setVisible(true); 
       /*
       VentanaBaseDatosHospital ventana = new VentanaBaseDatosHospital();
       ventana.setTitle("Ventana");
       ventana.setSize(300,100);
       ventana.setVisible(true);
       /*
        
       /* 
       VentanaBaseDatosHospital ventana1 = new VentanaBaseDatosHospital();
       ventana1.setVisible(true);
       
       String s = "hola";
       String[] x = {"hola","mundo"};

       int[] y = {1, 3};
       
       VentanaBaseDatosHospital[] v = {
            new VentanaBaseDatosHospital(),
            new VentanaBaseDatosHospital()
       };
       
       for(int i=0; i<v.length;i++) {
           v[i].setVisible(true);
       }
       
       for(int i=0; i<100; i++) {
           
           //new VentanaBaseDatosHospital().setVisible(true);
           
           VentanaBaseDatosHospital ventana = new VentanaBaseDatosHospital();
           ventana.setTitle("V: " + (i+1));
           ventana.setSize(300,100);
           ventana.setVisible(true);
           
       }
*/
       
    }
    
}
