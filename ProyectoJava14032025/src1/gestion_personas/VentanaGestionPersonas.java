package gestion_personas;

import java.sql.Connection;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.util.List;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class VentanaGestionPersonas extends JFrame {

    // VARIABLES DE INSTANCIA
    DefaultTableModel dtm = new DefaultTableModel();
    JTable tabla = new JTable(dtm);
    JScrollPane scroll = new JScrollPane(tabla);
    Connection conexion = null;
    Crud crud = null;

    JButton btnSalir = new JButton("Salir");
    JButton btnLimpiar = new JButton("Limpiar");
    JButton btnCargar = new JButton("Cargar");  //R (SELECT)
    JButton btnAgregar = new JButton("Agregar"); //C (INSERT)
    JButton btnEditar = new JButton("Editar");  //U (UPDATE)
    JButton btnEliminar = new JButton("Eliminar");//D (DELETE)

    JPanel agruparBotones = new JPanel(
            (new FlowLayout(FlowLayout.CENTER, 10, 10))
    );

    // CONSTRUCTOR
    public VentanaGestionPersonas() {
        conexion = Conexion.getConexion();
        if (conexion != null) {
            personalizarVentana();
            personalizarPanel();
            crud = new Crud(conexion);
            cargarDatosTabla();

        } else {
            JOptionPane.showMessageDialog(
                    null,
                    "No se pudo conectar a la base de datos.",
                    "Error",
                    JOptionPane.ERROR_MESSAGE
            );
        }
    }

    private void personalizarVentana() {
        setSize(680, 330);
        setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setTitle("VENTANA SWING");

        // Cambiar el icono de la ventana
        String ruta_relativa = "src/gestion_personas/cross1.png";
        String ruta_absoluta = new java.io.File(ruta_relativa).getAbsolutePath();
        setIconImage(new ImageIcon(ruta_absoluta).getImage());
    }

    public void personalizarPanel() {
        dtm.addColumn("Id");
        dtm.addColumn("Nombre");
        dtm.addColumn("Apellido");
        dtm.addColumn("Edad");
        dtm.addColumn("FechaRegistro");

        agruparBotones.add(btnAgregar);
        agruparBotones.add(btnEditar);
        agruparBotones.add(btnEliminar);
        agruparBotones.add(btnCargar);
        agruparBotones.add(btnLimpiar);
        agruparBotones.add(btnSalir);

        btnLimpiar.addActionListener(e -> limpiar());
        btnSalir.addActionListener(e -> salir());
        btnCargar.addActionListener(e -> cargarDatosTabla());
        btnAgregar.addActionListener(e -> agregar());
        btnEliminar.addActionListener(e -> eliminar());

        setLayout(new BorderLayout());
        this.add(scroll, BorderLayout.CENTER);
        this.add(agruparBotones, BorderLayout.SOUTH);

    }

    public void cargarDatosTabla() {
        limpiar();
        List<Personas> personas_al = crud.select();
        for (Personas p : personas_al) {
            Object[] objeto = {
                p.getId(),
                p.getNombre(),
                p.getApellido(),
                p.getEdad(),
                p.getFecha_registro()
            };

            dtm.addRow(objeto);
        }
    }

    public void limpiar() {
        dtm.setRowCount(0);
    }

    public void salir() {
        dispose();
    }

    public void agregar() {
        JTextField txtNombre = new JTextField();
        JTextField txtApellido = new JTextField();
        JTextField txtEdad = new JTextField();

        Object[] campos = {
            "Nombre", txtNombre,
            "Apellido", txtApellido,
            "Edad", txtEdad
        };

        int opcion = JOptionPane.showConfirmDialog(
                this,
                campos,
                "Ingresar Nuevo Registro",
                JOptionPane.OK_CANCEL_OPTION
        );

        if (opcion == JOptionPane.OK_OPTION) {
            Personas persona = new Personas(
                    txtNombre.getText(),
                    txtApellido.getText(),
                    Integer.parseInt(txtEdad.getText())
            );

            switch (crud.insert(persona)) {
                case Crud.INSERT_SI:
                    JOptionPane.showMessageDialog(null, "Se inserto correctamente registro", "Información",
                            JOptionPane.INFORMATION_MESSAGE);
                    cargarDatosTabla();
                    break;
                case Crud.INSERT_NO:
                    JOptionPane.showMessageDialog(null, "Se cancelo el insert", "Advertencia",
                            JOptionPane.WARNING_MESSAGE);
                    break;
                case Crud.INSERT_ERROR:
                    JOptionPane.showMessageDialog(
                            null,
                            "Se produjo un error en la query insert.",
                            "Error",
                            JOptionPane.ERROR_MESSAGE
                    );
                    break;
            }

        } else {

        }
    }
    
    public void eliminar() {
        int opcion = tabla.getSelectedRow();
        if(opcion == -1) {
            JOptionPane.showMessageDialog(null, "¡Cuidado! Debe seleccionar primero", "Advertencia", 
                              JOptionPane.WARNING_MESSAGE);
            return;
        }
        System.out.println(opcion);
        System.out.println(dtm.getValueAt(opcion,0));
    }

    // METODOS
    public static void main(String[] args) {
        new VentanaGestionPersonas().setVisible(true);
    }

}

/*
 //Dimension d = new Dimension(100, 20);
        btnAgregar.setPreferredSize(d);
        btnEditar.setPreferredSize(d);
        btnEliminar.setPreferredSize(d);
        btnCargar.setPreferredSize(d);
        btnLimpiar.setPreferredSize(d);
        btnSalir.setPreferredSize(d);
 */
// Eventos de los botones
        //btnAgregar.addActionListener(e -> agregarRegistro());
