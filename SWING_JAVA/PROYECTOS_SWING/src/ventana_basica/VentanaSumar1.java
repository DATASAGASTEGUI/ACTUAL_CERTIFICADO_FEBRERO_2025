package ventana_basica;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class VentanaSumar1 extends JFrame {

    // Componentes
    JLabel lblN1 = new JLabel("N1:");
    JLabel lblN2 = new JLabel("N2:");
    JLabel lblR = new JLabel("R:");

    JTextField txtN1 = new JTextField(10);
    JTextField txtN2 = new JTextField(10);
    JTextField txtR = new JTextField(10);

    JButton btnSumar = new JButton("Sumar");
    JButton btnNuevo = new JButton("Nuevo");
    JButton btnSalir = new JButton("Salir");

    public VentanaSumar1() {
        setTitle("VENTANA SWING");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(500, 250);
        setLocationRelativeTo(null);
        setResizable(false);

        // Icono
        String ruta_relativa = "src/swing/cross1.png";
        String ruta_absoluta = new java.io.File(ruta_relativa).getAbsolutePath();
        setIconImage(new ImageIcon(ruta_absoluta).getImage());

        // Panel principal
        JPanel panel = new JPanel(new GridBagLayout());
        panel.setBackground(Color.LIGHT_GRAY);
        add(panel);

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10); // Espaciado

        Font fuente = new Font("Courier New", Font.PLAIN, 14);
        Color rojo = Color.RED;

        // ======= Fila 1 =======
        gbc.gridx = 0; gbc.gridy = 0;
        lblN1.setFont(fuente); lblN1.setForeground(rojo);
        panel.add(lblN1, gbc);

        gbc.gridx = 1;
        panel.add(txtN1, gbc);

        gbc.gridx = 2;
        lblN2.setFont(fuente); lblN2.setForeground(rojo);
        panel.add(lblN2, gbc);

        gbc.gridx = 3;
        panel.add(txtN2, gbc);

        gbc.gridx = 4;
        lblR.setFont(fuente); lblR.setForeground(rojo);
        panel.add(lblR, gbc);

        gbc.gridx = 5;
        txtR.setEditable(false);
        panel.add(txtR, gbc);

        // ======= Fila 2 =======
        gbc.gridy = 1;
        gbc.gridx = 1;
        gbc.gridwidth = 1;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel.add(btnSumar, gbc);

        gbc.gridx = 2;
        panel.add(btnNuevo, gbc);

        gbc.gridx = 3;
        panel.add(btnSalir, gbc);

        // ======= Funcionalidad =======
        btnSumar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String n1 = txtN1.getText();
                String n2 = txtN2.getText();
                String patron = "\\d+";

                if (n1.matches(patron) && n2.matches(patron)) {
                    int resultado = Integer.parseInt(n1) + Integer.parseInt(n2);
                    txtR.setText(String.valueOf(resultado));
                } else {
                    JOptionPane.showMessageDialog(null, "Por favor, introduce solo números enteros.");
                }
            }
        });

        btnNuevo.addActionListener(e -> {
            txtN1.setText("");
            txtN2.setText("");
            txtR.setText("");
            txtN1.requestFocus();
        });

        btnSalir.addActionListener(e -> dispose());
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new VentanaSumar1().setVisible(true);
        });
    }
}
