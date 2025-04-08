package ejemplo_hilo_3;


public class Cliente implements Runnable  {
    
    private String nombre;
    
    public Cliente() {
        
    }

    public Cliente(String nombre) {
        this.nombre = nombre;
    }

    public void mirun() {
        for(long i=0; i<2; i++) {
            System.out.println(nombre + " " + i);
        }
    }

    @Override
    public void run() {
        for(long i=0; i<2; i++) {
            System.out.println(nombre + " " + i);
        }
    }
}
