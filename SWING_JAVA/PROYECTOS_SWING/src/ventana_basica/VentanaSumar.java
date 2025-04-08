package ventana_basica;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class VentanaSumar extends JFrame {

    JPanel pnlPrincipal = (JPanel) this.getContentPane();

    JLabel lblN1 = new JLabel("N1:");
    JLabel lblN2 = new JLabel("N2:");
    JLabel lblR = new JLabel("R:");

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
    }

    private void personalizarVentana() {
        setSize(500, 250);
        setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setTitle("VENTANA SWING");

        String ruta_relativa = "src/swing/cross1.png";
        String ruta_absoluta = new java.io.File(ruta_relativa).getAbsolutePath();
        setIconImage(new ImageIcon(ruta_absoluta).getImage());
    }

    private void personalizarComponentes() {
        Font fuente = new Font("Courier New", Font.PLAIN, 14);

        lblN1.setFont(fuente);
        lblN1.setForeground(Color.RED);
        lblN1.setBounds(60, 40, 30, 25);
        txtN1.setBounds(100, 40, 100, 25);

        lblN2.setFont(fuente);
        lblN2.setForeground(Color.RED);
        lblN2.setBounds(220, 40, 30, 25);
        txtN2.setBounds(260, 40, 100, 25);

        lblR.setFont(fuente);
        lblR.setForeground(Color.RED);
        lblR.setBounds(380, 40, 20, 25);
        txtR.setBounds(410, 40, 60, 25);
        txtR.setEditable(false);

        btnSumar.setBounds(80, 100, 100, 30);
        btnNuevo.setBounds(200, 100, 100, 30);
        btnSalir.setBounds(320, 100, 100, 30);

        btnSumar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String n1 = txtN1.getText();
                String n2 = txtN2.getText();
                String patron = "\\d+";

                if (n1.matches(patron) && n2.matches(patron)) {
                    int r = Integer.parseInt(n1) + Integer.parseInt(n2);
                    txtR.setText(String.valueOf(r));
                } else {
                    JOptionPane.showMessageDialog(null, "Introduce solo números enteros.");
                }
            }
        });

        btnNuevo.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                txtN1.setText("");
                txtN2.setText("");
                txtR.setText("");
                txtN1.requestFocus();
            }
        });

        btnSalir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dispose(); // Cierra la ventana
            }
        });
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            VentanaSumar objeto = new VentanaSumar();
            objeto.setVisible(true);
        });
    }
}
