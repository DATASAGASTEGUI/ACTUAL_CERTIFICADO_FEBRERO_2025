package ventana_basica;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SumaBonito extends JFrame {

    private JTextField campoNumero1;
    private JTextField campoNumero2;
    private JLabel resultadoLabel;

    public SumaBonito() {
        setTitle("Sumador de Números");
        setSize(400, 250);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setResizable(false);
        setLayout(new BorderLayout());

        // Panel principal con fondo bonito
        JPanel panel = new JPanel();
        panel.setLayout(new GridBagLayout());
        panel.setBackground(new Color(240, 248, 255)); // Azul muy claro
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.fill = GridBagConstraints.HORIZONTAL;

        Font fuenteBonita = new Font("Segoe UI", Font.PLAIN, 16);

        // Campo 1
        gbc.gridx = 0;
        gbc.gridy = 0;
        panel.add(new JLabel("Número 1:"), gbc);

        campoNumero1 = new JTextField();
        campoNumero1.setFont(fuenteBonita);
        gbc.gridx = 1;
        panel.add(campoNumero1, gbc);

        // Campo 2
        gbc.gridx = 0;
        gbc.gridy = 1;
        panel.add(new JLabel("Número 2:"), gbc);

        campoNumero2 = new JTextField();
        campoNumero2.setFont(fuenteBonita);
        gbc.gridx = 1;
        panel.add(campoNumero2, gbc);

        // Botón de sumar
        JButton botonSumar = new JButton("Sumar");
        botonSumar.setFont(fuenteBonita);
        botonSumar.setBackground(new Color(100, 149, 237)); // Azul cornflower
        botonSumar.setForeground(Color.WHITE);
        botonSumar.setFocusPainted(false);
        botonSumar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    double num1 = Double.parseDouble(campoNumero1.getText());
                    double num2 = Double.parseDouble(campoNumero2.getText());
                    double suma = num1 + num2;
                    resultadoLabel.setText("Resultado: " + suma);
                } catch (NumberFormatException ex) {
                    resultadoLabel.setText("Por favor ingresa números válidos.");
                }
            }
        });

        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2;
        panel.add(botonSumar, gbc);

        // Etiqueta de resultado
        resultadoLabel = new JLabel("Resultado: ");
        resultadoLabel.setFont(new Font("Segoe UI", Font.BOLD, 16));
        resultadoLabel.setHorizontalAlignment(SwingConstants.CENTER);

        add(panel, BorderLayout.CENTER);
        add(resultadoLabel, BorderLayout.SOUTH);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new SumaBonito().setVisible(true);
        });
    }
}

