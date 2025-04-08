package ejemplo03;

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
        for(long i=0; i<1000000; i++) {
            //System.out.println(nombre + " " + i);
            ventana.escribir(i);
        }
    }
    
    
}
