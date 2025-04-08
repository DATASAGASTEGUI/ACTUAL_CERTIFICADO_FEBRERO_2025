package ventana_basica;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class VentanaBotonRadioTable extends JFrame {
    
    //VARIABLES ESTATICAS
    static String centroEstudio = "CampusFp";
    
    //VARIABLE DE INSTANCIA
    String nombre;

    //VARIABLES DE INSTANCIAS
    JPanel pnlPrincipal = (JPanel) this.getContentPane();

    DefaultTableModel dtm = new DefaultTableModel();
    JTable tabla = new JTable(dtm);
    JScrollPane scroll = new JScrollPane(tabla);

    JRadioButton radSuperiorLC = new JRadioButton();
    JRadioButton radInferiorLC = new JRadioButton();

    ButtonGroup grupo = new ButtonGroup();
    
    JLabel lblMensaje = new JLabel();
    
    JButton btnSuperiorLC = new JButton("LC Superior");
    JButton btnInferiorLC = new JButton("LC Inferior");
    
    int bandera1 = 0;
    int bandera2 = 0;
    
    int contador = 0;
    

    public VentanaBotonRadioTable() {
        personalizarVentana();
        personalizarPanelPrincipal();
        personalizarComponentes();
        lblMensaje.setText("Límite Crédito: " + obtenerPromedioLimiteCredito()+"");
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
        pnlPrincipal.add(radSuperiorLC);
        pnlPrincipal.add(radInferiorLC);
        pnlPrincipal.add(lblMensaje);
        pnlPrincipal.add(btnSuperiorLC);
        pnlPrincipal.add(btnInferiorLC);
    }

    private void personalizarComponentes() {
        dtm.addColumn("IdCliente");
        dtm.addColumn("Empresa");
        dtm.addColumn("Limite Credito");
        scroll.setBounds(10, 10, 445, 270);
        radSuperiorLC.setBounds(10, 290, 350, 20);
        radSuperiorLC.setText("Mostrar clientes superior promedio limite credito");
        btnSuperiorLC.setBounds(365,290, 100,20);


        radInferiorLC.setBounds(10, 320, 350, 20);
        radInferiorLC.setText("Mostrar clientes inferior promedio limite credito");

        grupo.add(radSuperiorLC);
        grupo.add(radInferiorLC);
        
        lblMensaje.setBounds(10,350, 400,20);
        lblMensaje.setText("Límite Crédito");

        radSuperiorLC.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                limpiarTabla();
                if(bandera1 == 0) {
                   radSuperiorLC.setForeground(Color.RED);
                   radInferiorLC.setForeground(Color.BLACK);
                   bandera1 = 1;
                   bandera2 = 0;
                }
                System.out.println(radSuperiorLC.getForeground());
                cargarDatosTabla("SELECT idCliente, empresa, limite_credito FROM CLIENTE WHERE limite_credito > (SELECT AVG(limite_credito) FROM Cliente)");
            }
        });
        
        


        radInferiorLC.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                limpiarTabla();
                if(bandera2 == 0) {
                   radInferiorLC.setForeground(Color.red);
                   radSuperiorLC.setForeground(Color.BLACK);
                   bandera1 = 0;
                   bandera2 = 1;
                }
                cargarDatosTabla("SELECT idCliente, empresa, limite_credito FROM CLIENTE WHERE limite_credito < (SELECT AVG(limite_credito) FROM Cliente)");
            }
        });
        
                btnSuperiorLC.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
               contador();    
            }
        });
    }
    
    public void contador() {
        contador++;
        System.out.println(contador);
    }

    public void limpiarTabla() {
        int filas = dtm.getRowCount();
        for (int i = 0; i < filas; i++) {
            dtm.removeRow(0);
        }
    }

    private void cargarDatosTabla(String miquery) {
        Connection conexion = obtenerConexionMySql();
        if (conexion != null) {
            //JOptionPane.showMessageDialog(null, "OK: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
            String query = miquery;
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int idCliente = rs.getInt(1);
                    String empresa = rs.getString(2);
                    double limiteCredito = rs.getDouble(3);
                    dtm.addRow(new Object[]{idCliente, empresa, limiteCredito});
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } else {
            JOptionPane.showMessageDialog(null, "ERROR: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
        }
    }
    
    public double obtenerPromedioLimiteCredito() {
        Connection conexion = obtenerConexionMySql();
        double promedioLimiteCredito = 0;
        if (conexion != null) {
            //JOptionPane.showMessageDialog(null, "OK: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
            String query = "SELECT AVG(limite_credito) FROM Cliente";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    promedioLimiteCredito = rs.getDouble(1);
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } else {
            JOptionPane.showMessageDialog(null, "ERROR: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
        }        
        
        return promedioLimiteCredito;
    }

    private Connection obtenerConexionMySql() {
        String url = "jdbc:mysql://localhost:3307/factoria";
        String usuario = "root";
        String clave = "12345678";
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
        }
        return conexion;
    }

    public static void main(String[] args) {
        new VentanaBotonRadioTable().setVisible(true);
    }

}
