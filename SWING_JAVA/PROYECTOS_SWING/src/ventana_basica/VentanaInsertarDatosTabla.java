package ventana_basica;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class VentanaInsertarDatosTabla extends JFrame {

    //VARIABLES DE INSTANCIAS
    JPanel pnlPrincipal = (JPanel) this.getContentPane();

    DefaultTableModel dtm = new DefaultTableModel();
    JTable tabla = new JTable(dtm);
    JScrollPane scroll = new JScrollPane(tabla);
    
    JTextField txtId = new JTextField();
    JTextField txtNombre = new JTextField();
    JTextField txtDetalles = new JTextField();
    
    JButton btnInsertar = new JButton("Aceptar");
    JButton btnLimpiar = new JButton("Limpiar");
    JButton btnSalir = new JButton("Salir");
    
    
    static int contador = 0;
    

    //CONSTRUCTORES
    public VentanaInsertarDatosTabla() {
        personalizarVentana();
        personalizarPanelPrincipal();
        personalizarComponentes();
        
    }

    //METODOS OTROS
    private void personalizarVentana() {
        setSize(480, 410);
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
        pnlPrincipal.add(txtId);
        pnlPrincipal.add(txtNombre);
        pnlPrincipal.add(txtDetalles);
        pnlPrincipal.add(btnInsertar);
        pnlPrincipal.add(btnLimpiar);
        pnlPrincipal.add(btnSalir);
    }

    private void personalizarComponentes() {
        dtm.addColumn("Id");
        dtm.addColumn("Nombre");
        dtm.addColumn("Detalles");
        scroll.setBounds(10, 10, 445, 270);
        
        txtId.setBounds(10, 290, 100, 20);
        txtNombre.setBounds(120, 290, 100, 20);
        txtDetalles.setBounds(230, 290, 100, 20);
        
        btnInsertar.setBounds(10,320,100,20);
        btnLimpiar.setBounds(120,320,100,20);
        btnSalir.setBounds(230,320,100,20);
        
        btnInsertar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String[] lineablanco = {"","",""}; 
                dtm.addRow(lineablanco);
                String id = txtId.getText();
                String nombre = txtNombre.getText();
                String detalles = txtDetalles.getText();
                
                dtm.setValueAt(id, contador, 0);
                dtm.setValueAt(nombre, contador, 1);
                dtm.setValueAt(detalles, contador, 2);
                
                contador++;
            }
        }); 
        
        btnLimpiar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
               int filas = dtm.getRowCount();
               for(int i=0; i<filas; i++) {
                   dtm.removeRow(0);
               }
            }
        }); 
        
        btnSalir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
               dispose();
            }
        });

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
        new VentanaInsertarDatosTabla().setVisible(true);
    }

}

