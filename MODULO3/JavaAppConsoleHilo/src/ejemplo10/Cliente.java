package _0007_hilo;

public class Cliente implements Runnable {
    
    private String nombre;
    private Ventana ventana;
    
    public Cliente() {
        
    }

    public Cliente(String nombre, Ventana ventana) {
        this.nombre = nombre;
        this.ventana = ventana;
    }

    @Override
    public void run() {
        Metodo.proceso(nombre,ventana);
    }
    
    
}
