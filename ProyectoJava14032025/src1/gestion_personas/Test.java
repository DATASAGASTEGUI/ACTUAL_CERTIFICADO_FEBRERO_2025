package gestion_personas;
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