package interfaz_dinamica;

import java.awt.BorderLayout;
import java.awt.Color;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

public class Ventana extends JFrame {

    // VARIABLES DE INSTANCIA
    JPanel panelInferior = new JPanel();
    JButton btnCrear = new JButton("Crear");
    JButton btnLimpiar = new JButton("Limpiar");

    JPanel panelSuperior = new JPanel();
    JLabel lbaTitulo = new JLabel("Seleccione cantidad de botones? ");
    JComboBox cboNumeros = new JComboBox();
    
    JPanel panelCentro = new JPanel();

    // CONSTRUCTOR 
    public Ventana() {
        personalizarVentana();
        // PANEL SUPERIOR
        panelInferior.setBorder(new EmptyBorder(10, 10, 10, 10));//arriba,derecha,abajo,izquirda
        panelInferior.setBackground(Color.YELLOW);
        panelInferior.add(btnCrear);
        panelInferior.add(btnLimpiar);
        this.add(panelInferior, BorderLayout.SOUTH);
        // PANEL INFERIOR
        panelSuperior.setBorder(new EmptyBorder(10, 10, 10, 10));//arriba,derecha,abajo,izquirda
        panelSuperior.setBackground(Color.GREEN);
        panelSuperior.add(lbaTitulo);
        panelSuperior.add(cboNumeros);
        this.add(panelSuperior, BorderLayout.NORTH);
        // PANEL CENTRO
        panelCentro.setBorder(new EmptyBorder(10, 10, 10, 10));//arriba,derecha,abajo,izquirda
        panelCentro.setBackground(Color.red);
        this.add(panelCentro, BorderLayout.CENTER);
        
        // MANEJO DE EVENTOS
        btnCrear.addActionListener(e -> crear());
        btnLimpiar.addActionListener(e -> limpiar());
        
        // LLENAR EL COMBOBOX
        for(int i=1; i<=10; i++) {
            cboNumeros.addItem(i);
        }
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
        panelCentro.removeAll();
        int cantidad = (int)cboNumeros.getSelectedItem();//Object -> int (cast) 
        for(int i=0; i<cantidad; i++) {
            JButton boton = new JButton("Botón:" + (i+1));
            panelCentro.add(boton);
        }
        panelCentro.revalidate();
        panelCentro.repaint();
    }
    
    public void limpiar() {
        panelCentro.removeAll();
        // VOLVER A REPITAR PARA VER LOS CAMBIOS
        panelCentro.revalidate();
        panelCentro.repaint();
    }

    public static void main(String[] args) {
        new Ventana().setVisible(true);
    }

}
