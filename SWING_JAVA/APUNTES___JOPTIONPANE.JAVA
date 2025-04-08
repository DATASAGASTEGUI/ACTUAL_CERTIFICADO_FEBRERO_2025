--------------------------------------------------------------------------------
-- 1. Mostrar un mensaje de información
--------------------------------------------------------------------------------
JOptionPane.showMessageDialog(null, "Este es un mensaje informativo.", "Información", 
                              JOptionPane.INFORMATION_MESSAGE);
--------------------------------------------------------------------------------
-- 2. Mostrar un mensaje de advertencia

JOptionPane.showMessageDialog(null, "¡Cuidado! Algo podría estar mal.", "Advertencia", 
                              JOptionPane.WARNING_MESSAGE);
--------------------------------------------------------------------------------
-- 3. Mostrar un mensaje de error

JOptionPane.showMessageDialog(null, "Ocurrió un error al guardar el archivo.", "Error", 
                              JOptionPane.ERROR_MESSAGE);
--------------------------------------------------------------------------------
-- 4. Mostrar un mensaje con icono personalizado (por ejemplo, una carita feliz)

ImageIcon icono = new ImageIcon("ruta/a/icono.png"); // Asegúrate de que el icono exista
JOptionPane.showMessageDialog(null, "Mensaje con icono personalizado.", "Personalizado", 
                              JOptionPane.PLAIN_MESSAGE, icono);
--------------------------------------------------------------------------------
-- 5. Pedir al usuario que ingrese un dato (input dialog)

String nombre = JOptionPane.showInputDialog("¿Cuál es tu nombre?");
System.out.println("Nombre ingresado: " + nombre);
--------------------------------------------------------------------------------
-- 6. Confirmación (Sí / No)

int respuesta = JOptionPane.showConfirmDialog(null, "¿Deseas continuar?", "Confirmación", 
                                              JOptionPane.YES_NO_OPTION);
if (respuesta == JOptionPane.YES_OPTION) {
    System.out.println("El usuario quiere continuar.");
}
--------------------------------------------------------------------------------
-- 7. Confirmación (Sí / No / Cancelar)

int opcion = JOptionPane.showConfirmDialog(null, "¿Guardar cambios?", "Guardar", JOptionPane.YES_NO_CANCEL_OPTION);
switch (opcion) {
    case JOptionPane.YES_OPTION:
        System.out.println("Sí");
        break;
    case JOptionPane.NO_OPTION:
        System.out.println("No");
        break;
    case JOptionPane.CANCEL_OPTION:
        System.out.println("Cancelar");
        break;
}
--------------------------------------------------------------------------------
-- 8. Menú con varias opciones (personalizadas)

String[] opciones = { "Opción 1", "Opción 2", "Opción 3" };
int seleccion = JOptionPane.showOptionDialog(
    null,
    "Elige una opción:",
    "Opciones múltiples",
    JOptionPane.DEFAULT_OPTION,
    JOptionPane.QUESTION_MESSAGE,
    null,
    opciones,
    opciones[0]
);
System.out.println("Elegiste: " + opciones[seleccion]);
--------------------------------------------------------------------------------
-- 9. Entrada con selección de opciones (combo box)

String[] colores = { "Rojo", "Verde", "Azul" };
String colorSeleccionado = (String) JOptionPane.showInputDialog(
    null,
    "Elige un color:",
    "Selección de color",
    JOptionPane.QUESTION_MESSAGE,
    null,
    colores,
    colores[0]
);
System.out.println("Color elegido: " + colorSeleccionado);
--------------------------------------------------------------------------------
-- Usar JOptionPane.PLAIN_MESSAGE para un cuadro simple sin ícono

JOptionPane.showMessageDialog(null, "Esto es un mensaje simple sin ícono.", "Mensaje", JOptionPane.PLAIN_MESSAGE);
--------------------------------------------------------------------------------