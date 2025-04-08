
package encapsulamiento;

import java.util.Arrays;


public class Secretaria extends Empleado {
    /*
    private String nombre;
    private String institucion;
    private String horario;
    */
    private String[] softwareUsa;

    public Secretaria( String nombre, String institucion, String horario,String[] softwareUsa) {
        super(nombre, institucion, horario);
        this.softwareUsa = softwareUsa;
    }

    public String[] getSoftwareUsa() {
        return softwareUsa;
    }

    public void setSoftwareUsa(String[] softwareUsa) {
        this.softwareUsa = softwareUsa;
    }

    @Override
    public String toString() {
        return "Secretaria{" + "softwareUsa=" + Arrays.toString(softwareUsa) + '}';
    }


    
}
