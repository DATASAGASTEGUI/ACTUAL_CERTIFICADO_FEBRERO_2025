package ejemplo06;

public class Cliente implements Runnable {
    
    private String nombre;
    
    public Cliente() {
        
    }

    public Cliente(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public void run() {
        Metodo.proceso(nombre);
    }
    
}
