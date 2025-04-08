package ventana_basica;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.DefaultTableModel;

public class VentanaBaseDatos extends JFrame {
    
    // VARIABLES DE INSTANCIAS
    
    JPanel pnlPrincipal = (JPanel) this.getContentPane();

    JLabel lblIdVendedor = new JLabel("IdVendedor");
    JLabel lblNombre = new JLabel("Nombre");
    JLabel lblEdad = new JLabel("Edad");

    JButton btnBuscar = new JButton("Buscar");
    JButton btnNuevo = new JButton("Nuevo");
    JButton btnSalir = new JButton("Salir");

    JTextField txtIdVendedor = new JTextField();
    JTextField txtNombre = new JTextField();
    JTextField txtEdad = new JTextField();

    DefaultTableModel dtm = new DefaultTableModel();
    JTable tabla = new JTable(dtm);
    JScrollPane scroll = new JScrollPane(tabla);

    // CONSTRUCTORES
    public VentanaBaseDatos() {
        personalizarVentana();
        personalizarPanelPrincipal();
        personalizarComponentes();
        personalizarTabla();
        cargarDatosTabla();
    }

    private void personalizarTabla() {
        dtm.addColumn("IdVendedor");
        dtm.addColumn("Nombre");
        dtm.addColumn("Edad");
        dtm.addColumn("Contrato");
        dtm.addColumn("Cuota");
        dtm.addColumn("Ventas");
        dtm.addColumn("Columna1");
        dtm.addColumn("Columna2");
        dtm.addColumn("Columna3");
        dtm.addColumn("Columna4");
        dtm.addColumn("Columna5");
    }

    // OTROS METODOS
    private Connection obtenerConexionMySql() {
        String url = "jdbc:mysql://localhost:3307/factoria";
        String usuario = "root";
        String clave = "12345678";
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
            //System.out.println("Error: Conexion");
        }
        return conexion;
    }

    public static Connection obtenerConexionOracle() {
        String url = "jdbc:oracle:thin:@//localhost:1521/xepdb1";
        String usuario = "FACTORIA";
        String clave = "12345678";
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
            //System.out.println("Error: Conexion");
        }
        return conexion;
    }

    private String[] obtenerDatosVendedor(int idVendedor) {
        String query = "SELECT nombre, edad FROM Vendedor WHERE idVendedor = ?";
        Connection conexion = obtenerConexionOracle(); //INICIAR CONEXION
        String[] datos = new String[2];
        if (conexion != null) {
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ps.setInt(1, idVendedor);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String nombre = rs.getString(1);
                    int edad = rs.getInt(2);
                    datos[0] = nombre;
                    datos[1] = edad + "";
                }

            } catch (SQLException ex) {
                Logger.getLogger(VentanaBaseDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {

            System.out.println("ERROR: CONEXION");
        }

        try {
            conexion.close(); // CERRAR CONEXION
        } catch (SQLException ex) {
            Logger.getLogger(VentanaBaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;

    }

    public void cargarDatosTabla() {
        Connection conexion = obtenerConexionMySql();
        String query = "SELECT idVendedor,nombre,edad,contrato,cuota,ventas FROM Vendedor";
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int idVendedor = rs.getInt(1);
                    String nombre = rs.getString(2);
                    int edad = rs.getInt(3);
                    Date contrato = rs.getDate((4));
                    double cuota = rs.getDouble(5);
                    double ventas = rs.getDouble(6);
                    System.out.println(nombre);

                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    String contratoTexto = sdf.format(contrato);

                    dtm.addRow(new Object[]{idVendedor, nombre, edad, contratoTexto, cuota, ventas});
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    private void personalizarPanelPrincipal() {
        pnlPrincipal.setLayout(null);
        pnlPrincipal.setBackground(Color.lightGray);

        pnlPrincipal.add(lblIdVendedor);
        pnlPrincipal.add(lblNombre);
        pnlPrincipal.add(lblEdad);
        pnlPrincipal.add(txtIdVendedor);
        pnlPrincipal.add(txtNombre);
        pnlPrincipal.add(txtEdad);

        pnlPrincipal.add(btnBuscar);
        pnlPrincipal.add(btnNuevo);
        pnlPrincipal.add(btnSalir);

        pnlPrincipal.add(scroll);

        //pnlPrincipal.add(btnOcultar);
    }

    private void personalizarVentana() {
        setSize(480, 330);
        setResizable(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setTitle("VENTANA SWING");

        // Cambiar el icono de la ventana
        String ruta_relativa = "src/swing/cross1.png";
        String ruta_absoluta = new java.io.File(ruta_relativa).getAbsolutePath();
        setIconImage(new ImageIcon(ruta_absoluta).getImage());
    }

    private void personalizarComponentes() {
        lblIdVendedor.setFont(new Font("Courier New", Font.PLAIN, 14));
        lblIdVendedor.setForeground(Color.RED);
        lblIdVendedor.setHorizontalAlignment(SwingConstants.CENTER);
        lblIdVendedor.setBounds(30, 60, 100, 20);

        txtIdVendedor.setBounds(140, 60, 100, 20);

        lblNombre.setFont(new Font("Courier New", Font.PLAIN, 14));
        lblNombre.setForeground(Color.RED);
        lblNombre.setHorizontalAlignment(SwingConstants.CENTER);
        lblNombre.setBounds(250, 60, 100, 20);

        txtNombre.setBounds(360, 60, 100, 20);

        lblEdad.setFont(new Font("Courier New", Font.PLAIN, 14));
        lblEdad.setForeground(Color.RED);
        lblEdad.setHorizontalAlignment(SwingConstants.CENTER);
        lblEdad.setBounds(30, 90, 50, 20);

        txtEdad.setBounds(90, 90, 50, 20);

        btnBuscar.setBounds(60, 150, 100, 20);
        btnNuevo.setBounds(170, 150, 100, 20);
        btnSalir.setBounds(280, 150, 100, 20);

        scroll.setBounds(10, 180, 447, 100);

        btnBuscar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String idVendedor = txtIdVendedor.getText();
                String[] datos = obtenerDatosVendedor(Integer.parseInt(idVendedor));
                txtNombre.setText(datos[0]);
                txtEdad.setText(datos[1]);

            }
        });

        /*
        btnOcultar.setText("OCULTAR");
        btnOcultar.setBounds(250, 190, 100, 20);
        btnOcultar.setFont(new Font("Courier New", Font.PLAIN, 10));
        btnOcultar.setBackground(Color.RED);
        btnOcultar.setForeground(Color.WHITE);
        btnOcultar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ocultar();
            }
        });
         */
    }

    private void mostrar() {
        //lblMensaje.setText("WALTER ISMAEL SAGASTEGUI LESCANO");
    }

    private void ocultar() {
        // lblMensaje.setText("");
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                VentanaBaseDatos objeto = new VentanaBaseDatos();
                objeto.setVisible(true);
                //new VentanaSwing_005().setVisible(true);
            }
        });
    }
}
