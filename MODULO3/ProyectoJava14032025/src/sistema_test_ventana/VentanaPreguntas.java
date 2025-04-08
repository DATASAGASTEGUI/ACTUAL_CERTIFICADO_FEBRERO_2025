package sistema_test_ventana;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import java.sql.Connection;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.BoxLayout;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextField;

public class VentanaPreguntas extends JFrame {

    // VARIABLES DE INSTANCIAS
    List<Pregunta> preguntas;
    JPanel panelPrincipal;
    ButtonGroup[] grupoOpciones; // Por cada pregunta tenemos que agrupar sus opciones
    JRadioButton[][] radioButtons;
    JTextField txtEntrada = null;

    // CONSTRUCTOR
    public VentanaPreguntas() {
        try {
            // Configurar la codificación de salida a UTF-8
            System.setOut(new PrintStream(System.out, true, "UTF-8"));
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(VentanaPreguntas.class.getName()).log(Level.SEVERE, null, ex);
        }
        personalizarVentana();
        

        //construirInterfaz();
        panelPrincipal = new JPanel();
        panelPrincipal.setLayout(new BoxLayout(panelPrincipal, BoxLayout.Y_AXIS));
        //panelPrincipal.setBackground(Color.red);
        panelPrincipal.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        JScrollPane scrollPane = new JScrollPane(panelPrincipal);
        this.add(scrollPane, BorderLayout.CENTER);

        // PANEL DE BOTONES (SUR)
        JPanel panelBotones = new JPanel(new FlowLayout(FlowLayout.CENTER, 10, 10));
        this.add(panelBotones, BorderLayout.SOUTH);

        JButton btnEnviar = new JButton("Enviar");
        btnEnviar.addActionListener(e -> obtenerPuntaje());
        panelBotones.add(btnEnviar);

        JButton btnReset = new JButton("Reset");
        btnReset.addActionListener(e -> resetPreguntas());
        panelBotones.add(btnReset);

        // PANEL DE ENTRADA (NORTE)
        JPanel panelEntrada = new JPanel(new FlowLayout(FlowLayout.CENTER, 10, 10));
        this.add(panelEntrada, BorderLayout.NORTH);

        txtEntrada = new JTextField("                 ");
        JButton btnIniciar = new JButton("Iniciar");
        panelEntrada.add(txtEntrada);
        panelEntrada.add(btnIniciar);

        btnIniciar.addActionListener(e -> iniciar());

    }

    // METODOS
    private void personalizarVentana() {
        this.setSize(700, 500);
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

    public void obtenerConexion(Set<Integer> idspreguntas) {
        Connection conexion = Conexion.getConexion();
        if (conexion != null) {
            JOptionPane.showMessageDialog(null, "Conexion satisfactoria.", "Información",
                    JOptionPane.INFORMATION_MESSAGE);
            preguntas = new Crud(conexion).obtenerTodasPreguntasAleatorias(idspreguntas);
            //preguntas.forEach(x -> System.out.println(x));
        } else {
            JOptionPane.showMessageDialog(null, "Ocurrió un error en la conexion.", "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    public void construirInterfaz() {
        System.out.println("ENTRADA");
        int cantidad = 0;
        try {
            String entrada = txtEntrada.getText().trim();
            cantidad = Integer.parseInt(entrada);
        } catch (Exception e) {
            return;
        }
 
        Set<Integer> idspreguntas = idPreguntasAleatorias(cantidad);
        System.out.println(idspreguntas.toString());
        
        obtenerConexion(idspreguntas);

        
        //PINTAR LAS PREGUNTAS
        // Array de grupo de opciones
        grupoOpciones = new ButtonGroup[preguntas.size()];
        radioButtons = new JRadioButton[preguntas.size()][4];

        for (int i = 0; i < preguntas.size(); i++) {
            Pregunta p = preguntas.get(i);
            JLabel lblPregunta = new JLabel((i + 1) + ". " + p.getTextoPregunta());
            lblPregunta.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
            String[] opciones = p.getOpciones();
            grupoOpciones[i] = new ButtonGroup();
            panelPrincipal.add(lblPregunta);
            for (int j = 0; j < opciones.length; j++) {
                radioButtons[i][j] = new JRadioButton(opciones[j]);
                grupoOpciones[i].add(radioButtons[i][j]);

                panelPrincipal.add(radioButtons[i][j]);
            }
        }
        panelPrincipal.add(Box.createRigidArea(new Dimension(0, 10)));

        panelPrincipal.revalidate();
        panelPrincipal.repaint();
    }

    public void obtenerPuntaje() {
        int correctas = 0, incorrectas = 0, sinresponder = 0;
        int nseleccionado = -1;
        for (int i = 0; i < preguntas.size(); i++) {
            Pregunta p = preguntas.get(i);
            nseleccionado = -1;
            int j;
            for (j = 0; j < 4; j++) {
                JRadioButton rb = radioButtons[i][j];
                if (rb.isSelected()) {
                    nseleccionado = j; //0
                    break;
                }
            }
            if ((p.getRespuestaCorrecta() - 1) == j) { // 2 == 0
                correctas++;
            } else if (nseleccionado == -1) {
                sinresponder++;
            } else {
                incorrectas++;
            }
        }

        double puntaje = correctas * 1 - incorrectas * 0.25;

        String resultado = "Puntaje       : " + puntaje + "\n"
                + "Sin Responder : " + sinresponder + "\n"
                + "Correctas     : " + correctas + "\n"
                + "Incorrectas   : " + incorrectas + "\n";

        JOptionPane.showMessageDialog(null, resultado, "Información",
                JOptionPane.INFORMATION_MESSAGE);
    }

    public void resetPreguntas() {
        for (ButtonGroup grupo : grupoOpciones) {
            grupo.clearSelection();
        }
    }

    public void iniciar() {
        construirInterfaz();
    }

    public Set<Integer> idPreguntasAleatorias(int cantidad) { //Double Integer String
        int aleatorio;
        Set numeros = new TreeSet();
        for (; true;) {
            aleatorio = (int) (Math.random() * 50 + 1);
            numeros.add(aleatorio);
            if (numeros.size() == cantidad) {
                break;
            }
        }
        return numeros;
    }

    public static void main(String[] args) {
        new VentanaPreguntas().setVisible(true);
    }

}
