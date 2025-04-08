package ejemplo02;

public class Cliente implements Runnable {
    
    private String nombre;
    
    public Cliente() {
        
    }

    public Cliente(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public void run() {
        for(long i=0; i<100000; i++) {
            System.out.println(nombre + " " + i);
        }
    }
    
    
}
