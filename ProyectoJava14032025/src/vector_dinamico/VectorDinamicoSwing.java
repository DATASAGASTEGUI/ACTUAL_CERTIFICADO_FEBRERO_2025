package vector_dinamico;

import java.awt.BorderLayout;
import java.awt.Font;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

public class VectorDinamicoSwing extends JFrame {

    // VARIABLES DE INSTANCIA
    JPanel panelSuperior = new JPanel();
    JLabel lbaTitulo = new JLabel("Seleccione tamaño del vector? ");
    JComboBox cboNumeros = new JComboBox();
    
    EmptyBorder border = new EmptyBorder(10, 10, 10, 10);
    
    JPanel panelInferior = new JPanel();
    
    JTextField txtMinimo = new JTextField("      ");
    JTextField txtMaximo = new JTextField("      ");
    JTextField txtSuma =   new JTextField("      ");
    JTextField txtMedia =  new JTextField("      ");
    
    JButton btnCrear = new JButton("Crear");
    JButton btnProcesar = new JButton("Procesar");
    
    JPanel panelEntrada = new JPanel();

    // CONSTRUCTOR
    public VectorDinamicoSwing() {
        personalizarVentana();
        
        // PANEL SUPERIOR
        panelSuperior.setBorder(border);//arriba,derecha,abajo,izquirda
        panelSuperior.add(lbaTitulo);
        panelSuperior.add(cboNumeros);
        this.add(panelSuperior, BorderLayout.NORTH);
        
        // LLENAR COMBOBOX
        for(int i=1; i<=10; i++) {
            cboNumeros.addItem(i);
        }
        
        // PANEL INFERIOR
        panelInferior.setBorder(border);
        
        panelInferior.add(new JLabel("Mínimo:"));
        panelInferior.add(txtMinimo);
        
        panelInferior.add(new JLabel("Maximo:"));
        panelInferior.add(txtMaximo);
        
        panelInferior.add(new JLabel("Suma:"));
        panelInferior.add(txtSuma);
        
        panelInferior.add(new JLabel("Promedio:"));
        panelInferior.add(txtMedia);
        
        panelInferior.add(btnCrear);
        panelInferior.add(btnProcesar);
        
        this.add(panelInferior, BorderLayout.SOUTH);
        
        // MANEJO DE EVENTOS
        btnCrear.addActionListener(e -> crear());
        //btnProcesar.addActionListener(e -> procesar());
        
        // PANEL CENTRO
        panelEntrada.setBorder(border);
        this.add(panelEntrada, BorderLayout.CENTER);
        
    }

    // METODOS 
    private void personalizarVentana() {
        this.setSize(680, 330);
        this.setResizable(false);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setLocationRelativeTo(null);
        this.setLayout(new BorderLayout());//norte centro sur este oeste
        this.setTitle("VENTANA SWING");

        // Cambiar el icono de la ventana
        String ruta_relativa = "src/gestion_personas/cross1.png";
        String ruta_absoluta = new java.io.File(ruta_relativa).getAbsolutePath();
        this.setIconImage(new ImageIcon(ruta_absoluta).getImage());
    }
    
    public void crear() {
        panelEntrada.removeAll();
        int cantidad = (int)cboNumeros.getSelectedItem(); //Tamaño del array
        for(int i=0; i<cantidad; i++) {
            JTextField cajita = new JTextField("  0   ");
            cajita.setForeground(new java.awt.Color(255, 0, 0));//RGB
	    cajita.setFont(new java.awt.Font("Courier New", 0, 12));
            cajita.setHorizontalAlignment(javax.swing.JTextField.CENTER);
            panelEntrada.add(new JLabel("Número : " + (i+1)));
            panelEntrada.add(cajita);
        }
        panelEntrada.revalidate();
        panelEntrada.repaint();
    }

    public static void main(String[] args) {
        new VectorDinamicoSwing().setVisible(true);
    }

}
