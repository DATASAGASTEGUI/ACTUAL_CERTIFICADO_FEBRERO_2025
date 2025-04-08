package encapsulamiento;


public class Profesor extends Empleado {
    /*
    private String nombre;
    private String institucion;
    private String horario;
    */
    private String materia;

    public Profesor(String nombre, String institucion, String horario, String materia) {
        super(nombre, institucion, horario);
        this.materia = materia;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    @Override
    public String toString() {
        return "Profesor{" + "materia=" + materia + '}';
    }
    
    
    
}
