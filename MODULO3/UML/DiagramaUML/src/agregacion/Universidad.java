package agregacion;

import java.util.List;

public class Universidad {
    // VARIABLES DE INSTANCIA
    private String idUniversidad;
    private String nombre;
    private List<Estudiante> estudiantes;
    
    // CONSTRUCTORES
    public Universidad() {
        this.idUniversidad = "";
        this.nombre = "";
        this.estudiantes = null;
    }

    public Universidad(String idUniversidad, String nombre, List<Estudiante> estudiantes) {
        this.idUniversidad = idUniversidad;
        this.nombre = nombre;
        this.estudiantes = estudiantes;
    }
    
    // METODOS SET Y GET

    public String getIdUniversidad() {
        return idUniversidad;
    }

    public void setIdUniversidad(String idUniversidad) {
        this.idUniversidad = idUniversidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Estudiante> getEstudiantes() {
        return estudiantes;
    }

    public void setEstudiantes(List<Estudiante> estudiantes) {
        this.estudiantes = estudiantes;
    }
    
    // METODO TOSTRING
    @Override
    public String toString() {
        return "Universidad{" + "idUniversidad=" + idUniversidad + ", nombre=" + nombre + ", estudiantes=" + estudiantes + '}';
    }
    
    
}
