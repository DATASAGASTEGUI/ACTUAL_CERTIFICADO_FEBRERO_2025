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
    public VentanaGestionPersonas(boolean agregar, boolean eliminar, boolean editar,
                                  boolean cargar, boolean limpiar, boolean salir) {
        
        btnAgregar.setEnabled(agregar);
        btnEliminar.setEnabled(eliminar);
        btnEditar.setEnabled(editar);
        btnCargar.setEnabled(cargar);
        btnLimpiar.setEnabled(limpiar);
        btnSalir.setEnabled(salir);
        
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
        btnEditar.addActionListener(e -> editar());

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
                    cargarDatosTabla();
                    JOptionPane.showMessageDialog(null, "Se inserto correctamente registro", "Información",
                            JOptionPane.INFORMATION_MESSAGE);

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
        int opcion = tabla.getSelectedRow(); //-1 si no selecciono nada

        if (opcion == -1) {
            JOptionPane.showMessageDialog(null, "¡Cuidado! Debe seleccionar primero", "Advertencia",
                    JOptionPane.WARNING_MESSAGE);
            return;
        }
        int confirmacion = JOptionPane.showConfirmDialog(null, "¿Está seguro de eliminar registro?", "Confirmación",
                JOptionPane.YES_NO_OPTION);
        if (confirmacion == JOptionPane.YES_OPTION) {
            int id = (int) dtm.getValueAt(opcion, 0); //2objeto con el cast convierte a un valor 2
            switch (crud.delete(id)) {
                case Crud.DELETE_SI:
                    cargarDatosTabla();
                    JOptionPane.showMessageDialog(null, "Registro se elimino correctamente", "Información",
                            JOptionPane.INFORMATION_MESSAGE);
                    break;
                case Crud.DELETE_NO:
                    JOptionPane.showMessageDialog(null, "¡Cuidado! No se pudo eliminar registro", "Advertencia",
                            JOptionPane.WARNING_MESSAGE);
                    break;
                case Crud.DELETE_ERROR:
                    JOptionPane.showMessageDialog(null, "Posible error en la query delete", "Error",
                            JOptionPane.ERROR_MESSAGE);
                    break;
            }
        }
    }

    public void editar() {
        int filaSeleccionada = tabla.getSelectedRow();//si no se leccionamos -1

        if (filaSeleccionada == -1) {
            JOptionPane.showMessageDialog(null, "¡Cuidado! Debe seleccionar primero.", "Advertencia",
                    JOptionPane.WARNING_MESSAGE);
            return;
        }

        // OBTENER LOS VALORES DE CADA COLUMNA DE LA FILA SELECCIONADA
        int id = (int) dtm.getValueAt(filaSeleccionada, 0);
        String nombre = (String) dtm.getValueAt(filaSeleccionada, 1);
        String apellido = (String) dtm.getValueAt(filaSeleccionada, 2);
        int edad = (int) dtm.getValueAt(filaSeleccionada, 3);

        JTextField txtNombre = new JTextField(nombre);
        JTextField txtApellido = new JTextField(apellido);
        JTextField txtEdad = new JTextField(edad + "");

        Object[] campos = {
            "Nombre", txtNombre,
            "Apellido", txtApellido,
            "Edad", txtEdad
        };

        int opcion = JOptionPane.showConfirmDialog(
                this,
                campos,
                "Editar Registro",
                JOptionPane.OK_CANCEL_OPTION
        );

        if (opcion == JOptionPane.OK_OPTION) {
            Personas persona = new Personas(
                    id,
                    txtNombre.getText(),
                    txtApellido.getText(),
                    Integer.parseInt(txtEdad.getText())
            );
            switch (crud.update(persona)) {
                case Crud.UPDATE_SI:
                    cargarDatosTabla();
                    JOptionPane.showMessageDialog(null, "Registro se actualizo correctamente", "Información",
                            JOptionPane.INFORMATION_MESSAGE);
                    break;
                case Crud.UPDATE_NO:
                    JOptionPane.showMessageDialog(null, "¡Cuidado! No se pudo actualizar registro", "Advertencia",
                            JOptionPane.WARNING_MESSAGE);
                    break;
                case Crud.UPDATE_ERROR:
                    JOptionPane.showMessageDialog(null, "Posible error en la query update", "Error",
                            JOptionPane.ERROR_MESSAGE);
                    break;
            }

        }

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
