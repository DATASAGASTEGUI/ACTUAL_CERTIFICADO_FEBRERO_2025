package rollback;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class Ventana extends JFrame {
    
    Connection conexion = null;

    //VARIABLES DE INSTANCIAS (OBJETOS GRAFICOS JBUTTON, JTextField...)
    JPanel pnlPrincipal = (JPanel) this.getContentPane();
    JComboBox cboOrigen = new JComboBox();
    JComboBox cboDestino = new JComboBox();
    JTextField txtSaldoOrigen = new JTextField();
    EventoComboBox ecb = new EventoComboBox();
    

    JTextField txtDineroEnviar = new JTextField();
    JButton btnTransaccion = new JButton("Transacción");

    JButton btnConfirmarCancelar = new JButton("Confirmar/Cancelar");

    DefaultTableModel dtm = new DefaultTableModel();
    JTable tabla = new JTable(dtm);
    JScrollPane scroll = new JScrollPane(tabla);

    //CONSTRUCTOR
    public Ventana() {
        conexion = obtenerConexionMySql();
        if(conexion == null) {
            System.out.println("ERROR AL INICIAR");
        }
        personalizarVentana();
        personalizarPanelPrincipal();
        personalizarComponentes();

        cargarDatosTabla();
    }

    //METODOS
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
        pnlPrincipal.add(cboOrigen);
        pnlPrincipal.add(cboDestino);
        pnlPrincipal.add(txtSaldoOrigen);
        pnlPrincipal.add(btnTransaccion);
        pnlPrincipal.add(txtDineroEnviar);
        pnlPrincipal.add(btnConfirmarCancelar);
        pnlPrincipal.add(scroll);
    }

    private void personalizarComponentes() {
        dtm.addColumn("Id");
        dtm.addColumn("Nombre");
        dtm.addColumn("Saldo");
        cboOrigen.setBounds(40, 10, 100, 20);
        cboDestino.setBounds(150, 10, 100, 20);
        cargarComboBox(cboOrigen);
        cargarComboBox(cboDestino);

        txtSaldoOrigen.setBounds(40, 40, 100, 20);
        txtSaldoOrigen.setEditable(false);
        cboOrigen.addItemListener(ecb);

        btnTransaccion.setBounds(40, 70, 100, 20);
        txtDineroEnviar.setBounds(150, 70, 100, 20);

        btnConfirmarCancelar.setBounds(40, 100, 200, 20);

        btnTransaccion.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                double dineroEnviar = Double.parseDouble(txtDineroEnviar.getText());
                int cuentaOrigen = 1;
                int cuentaDestino = 2;
                transaccion(dineroEnviar, cuentaOrigen, cuentaDestino);
                cargarDatosTabla();
            }
        });

        btnConfirmarCancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int opcion = JOptionPane.showConfirmDialog(null, "¿Deseas confirmar la operación?", "Confirmar", JOptionPane.YES_NO_OPTION);
                if (opcion == JOptionPane.YES_OPTION) {
                    try {
                        conexion.commit();
                        cargarDatosTabla();
                    } catch (SQLException ex) {
                        Logger.getLogger(Ventana.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    try {
                        conexion.rollback();
                        cargarDatosTabla();
                    } catch (SQLException ex) {
                        Logger.getLogger(Ventana.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        });

        scroll.setBounds(20, 130, 400, 200);
    }

    private Connection obtenerConexionMySql() {
        String url = "jdbc:mysql://localhost:3307/BANCO";
        String usuario = "root";
        String clave = "12345678";

        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
            conexion.setAutoCommit(false); //START TRANSACTION
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conexion;
    }

    private double recuperarSaldoCuenta(int idCuenta) {
        double saldo = 0;
        if (conexion != null) {
            String query = "SELECT saldo FROM Cuenta WHERE id = ?";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ps.setInt(1, idCuenta);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    saldo = rs.getDouble("saldo");
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "ERROR: QUERY", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(null, "ERROR: CONEXION", "Error", JOptionPane.ERROR_MESSAGE);
        }
        return saldo;
    }

    private void cargarComboBox(JComboBox combobox) {

        if (conexion != null) {
            JOptionPane.showMessageDialog(null, "OK: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
            String query = "SELECT id,nombre,saldo FROM Cuenta";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nombre = rs.getString("nombre");
                    double saldo = rs.getDouble(3);
                    String cadena = id + " - " + nombre;
                    combobox.addItem(cadena);

                }
                System.out.println("salio");
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "ERRORuuu: QUERY " + e.getMessage(), "Mensaje", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(null, "ERRORzzz: CONEXION", "Mensaje", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void cboOrigenAccion() {
        String cuenta = (String) cboOrigen.getSelectedItem();
        String[] parte = cuenta.split("-");
        double saldo = recuperarSaldoCuenta(Integer.parseInt(parte[0].trim()));
        txtSaldoOrigen.setText(saldo + "");
    }

    // GESTOR DE EVENTOS PARA EL COMBOBOX
    private class EventoComboBox implements ItemListener {

        @Override
        public void itemStateChanged(ItemEvent e) {
            if (e.getSource() == cboOrigen) {
                cboOrigenAccion();
            }
        }
    }

    public void transaccion(double saldoEnviar, int cuentaOrigen, int cuentaDestino) {
        String query1 = "UPDATE Cuenta SET saldo = saldo - ? WHERE id = ?";
        String query2 = "UPDATE Cuenta SET saldo = saldo + ? WHERE id = ?";
        PreparedStatement ps = null;
        try {
            //RESTA
            ps = conexion.prepareStatement(query1);
            ps.setDouble(1, saldoEnviar);
            ps.setInt(2, cuentaOrigen);
            ps.executeUpdate();
            //SUMA
            ps = conexion.prepareStatement(query2);
            ps.setDouble(1, saldoEnviar);
            ps.setInt(2, cuentaDestino);
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "OK: TRANSACCION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
            cargarDatosTabla();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: TRANSACCION", "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

    private void cargarDatosTabla() {
        limpiarTabla();
        String query = "SELECT * FROM Cuenta";
        if (conexion != null) {
            //JOptionPane.showMessageDialog(null, "OK: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String nombre = rs.getString(2);
                    double saldo = rs.getDouble(3);
                    dtm.addRow(new Object[]{id, nombre, saldo});
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } else {
            JOptionPane.showMessageDialog(null, "ERROR: CONEXIONzzzzz", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
        }
    }

    public void limpiarTabla() {
        int filas = dtm.getRowCount();
        for (int i = 0; i < filas; i++) {
            dtm.removeRow(0);
        }
    }

    public static void main(String[] args) {
        new Ventana().setVisible(true);
    }

}
