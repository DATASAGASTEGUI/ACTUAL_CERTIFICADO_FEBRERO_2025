package encapsulamiento;

import java.util.Arrays;

public class Conserje extends Empleado implements MisMetodos{
    
    /*
    private String nombre;
    private String institucion;
    private String horario;
    */
    private String[] herramientas;

    public Conserje(String nombre, String institucion, String horario,String[] herramientas) {
        super(nombre,institucion,horario);
        this.herramientas = herramientas;
    }

    public String[] getHerramientas() {
        return herramientas;
    }

    public void setHerramientas(String[] herramientas) {
        this.herramientas = herramientas;
    }

    @Override
    public String toString() {
        return "Conserje{" + "herramientas=" + Arrays.toString(herramientas) + '}';
    }

    @Override
    public void mostrarTodosLosRegistros() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int sumar(int a, int b) {
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        return 5;
    }








 
    
    
}
