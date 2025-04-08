package ventana_basica;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class VentanaSumar extends JFrame {

    JPanel pnlPrincipal = (JPanel) this.getContentPane();

    JLabel lblN1 = new JLabel("N1");
    JLabel lblN2 = new JLabel("N2");
    JLabel lblR = new JLabel("R");
    
    JButton btnSumar = new JButton("Sumar");
    JButton btnNuevo = new JButton("Nuevo");
    JButton btnSalir = new JButton("Salir");
    
    JTextField txtN1 = new JTextField();
    JTextField txtN2 = new JTextField();
    JTextField txtR = new JTextField();
    

    public VentanaSumar() {
        personalizarVentana();
        personalizarPanelPrincipal();
        personalizarComponentes();
    }

    private void personalizarPanelPrincipal() {
        pnlPrincipal.setLayout(null);
        pnlPrincipal.setBackground(Color.lightGray);
        
        pnlPrincipal.add(lblN1);
        pnlPrincipal.add(lblN2);
        pnlPrincipal.add(lblR);
        pnlPrincipal.add(txtN1);
        pnlPrincipal.add(txtN2);
        pnlPrincipal.add(txtR);
        
        pnlPrincipal.add(btnSumar);
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
        lblN1.setFont(new Font("Courier New", Font.PLAIN, 14));
        lblN1.setForeground(Color.RED);
        lblN1.setHorizontalAlignment(SwingConstants.CENTER);
        lblN1.setBounds(30, 60, 30, 20);
        
        txtN1.setBounds(60, 60, 50, 20);
        
        lblN2.setFont(new Font("Courier New", Font.PLAIN, 14));
        lblN2.setForeground(Color.RED);
        lblN2.setHorizontalAlignment(SwingConstants.CENTER);
        lblN2.setBounds(120, 60, 30, 20);
        
        txtN2.setBounds(190, 60, 50, 20);
        
        lblR.setFont(new Font("Courier New", Font.PLAIN, 14));
        lblR.setForeground(Color.RED);
        lblR.setHorizontalAlignment(SwingConstants.CENTER);
        lblR.setBounds(300, 60, 30, 20);
        
        txtR.setBounds(340, 60, 50, 20);
        
        btnSumar.setBounds(60, 90, 100, 20);
        btnNuevo.setBounds(170, 90, 100, 20);
        btnSalir.setBounds(280, 90, 100, 20);
        
                
        btnSumar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
               String n1 = txtN1.getText();
               String n2 = txtN2.getText();
               String patron = "[0-9]*";
               
               if(n1.matches(patron) && n2.matches(patron)) {
                  int r = Integer.parseInt(n1) + Integer.parseInt(n2);
                  txtR.setText(r+"");
               }
               
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
                VentanaSumar objeto = new VentanaSumar();
                objeto.setVisible(true);
                //new VentanaSwing_005().setVisible(true);
            }
        });
    }
}

