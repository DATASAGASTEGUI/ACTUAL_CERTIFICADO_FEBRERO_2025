package sistema_gestion_secciones_alumnos;

import java.util.List;

public class GestorSistemaSeccionesAlumnos {

    // VARIABLES DE INSTANCIA
    private List<Alumno> alumnos;

    // CONSTRUCTORES
    public GestorSistemaSeccionesAlumnos() {
        this.alumnos = null;
    }

    public GestorSistemaSeccionesAlumnos(List<Alumno> alumnos) {
        this.alumnos = alumnos;
    }

    // METODOS SET Y GET
    public List<Alumno> getAlumnos() {
        return alumnos;
    }

    public void setAlumnos(List<Alumno> alumnos) {
        this.alumnos = alumnos;
    }

    // METODOS DE INSTANCIA:
    public void mostrarTodosAlumnosConNotasPromedio() {
        if (this.alumnos != null) {
            for (Alumno alumno : this.alumnos) {
                alumno.mostrarInformacion();
            }
        }else {
            System.out.println("Lista vacia");
        }
    }

}
