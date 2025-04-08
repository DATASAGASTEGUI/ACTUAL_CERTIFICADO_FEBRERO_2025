package ejemplo09;

public class Cliente {
    
    private String nombre;
    private Ventana ventana;
    
    public Cliente() {
        
    }

    public Cliente(String nombre, Ventana ventana) {
        this.nombre = nombre;
        this.ventana = ventana;
    }

    public void mirun() {
        for(long i=0; i<1000000; i++) {
            //System.out.println(nombre + " " + i);
            ventana.escribir(i);
        }
    }
    
    
}
