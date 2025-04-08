package ejemplo04;

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
        for(long i=0; i<100000; i++) {
            //System.out.println(nombre + " " + i);
            ventana.escribir(i);
        }
    }
    
    
}
