package ejemplo01;

public class Cliente {
    
    private String nombre;
    
    public Cliente() {
        
    }

    public Cliente(String nombre) {
        this.nombre = nombre;
    }

    public void mirun() {
        for(long i=0; i<100000; i++) {
            System.out.println(nombre + " " + i);
        }
    }
}
