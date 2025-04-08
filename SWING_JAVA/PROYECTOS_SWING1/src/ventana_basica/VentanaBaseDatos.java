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
import java.util.logging.Level;
import java.util.logging.Logger;

public class VentanaBaseDatos extends JFrame {
    Connection conexion1 = null; //Pool
    Connection conexion2 = null;
    // VARIABLES DE INSTANCIAS
    
    JPanel pnlPrincipal = (JPanel) this.getContentPane();

    //ENTRADA
    JLabel lblIdVendedor = new JLabel("IdVendedor");
    //SALIDA
    JLabel lblNombre = new JLabel("Nombre");
    JLabel lblEdad = new JLabel("Edad");
    
    
    JButton btnBuscar = new JButton("Buscar");
    JButton btnNuevo = new JButton("Nuevo");
    JButton btnSalir = new JButton("Salir");
    
    JTextField txtIdVendedor = new JTextField();
    JTextField txtNombre = new JTextField();
    JTextField txtEdad = new JTextField();
    
    // CONSTRUCTORES
    
    public VentanaBaseDatos() {
        conexion1 = obtenerConexion();
        conexion2 = obtenerConexion();
      
        personalizarVentana();
        personalizarPanelPrincipal();
        personalizarComponentes();

    }

    
    // OTROS METODOS
    
    private Connection obtenerConexion() {
        String url = "jdbc:mysql://localhost:3307/factoria";
        String usuario = "root";
        String clave = "12345678";
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(url,usuario,clave);
        }catch(SQLException e) {
            //System.out.println("Error: Conexion");
        }
        return conexion;
    }
    
    private String[] obtenerDatosVendedor(int idVendedor) {
        String query = "SELECT nombre, edad FROM Vendedor WHERE idVendedor = ?";
        Connection conexion = obtenerConexion(); //INICIAR CONEXION
        String[] datos = new String[2];
        if(conexion != null)  {
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ps.setInt(1, idVendedor);
                
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()) {
                    String nombre = rs.getString(1);
                    int edad = rs.getInt(2);
                    datos[0] = nombre;
                    datos[1] = edad + "";
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(VentanaBaseDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
                   }else {
            
 System.out.println("ERROR: CONEXION");
}
        
        
        try {
            conexion.close(); // CERRAR CONEXION
        } catch (SQLException ex) {
            Logger.getLogger(VentanaBaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
        
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


