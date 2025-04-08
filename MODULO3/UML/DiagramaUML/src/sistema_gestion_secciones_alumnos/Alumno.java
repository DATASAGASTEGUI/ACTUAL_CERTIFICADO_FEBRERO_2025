package sistema_gestion_secciones_alumnos;

import java.util.Arrays;

public class Alumno {
    // VARIABLES DE INSTANCIA
    private int idAlumno;
    private String nombres;
    private String apellidos;
    private String seccion;
    private double[] notas;
    
    // CONSTRUCTORES
    public Alumno() {
        this.idAlumno = 0;
        this.nombres = "";
        this.apellidos = "";
        this.seccion = "";
        this.notas = null;
    }

    public Alumno(int idAlumno, String nombres, String apellidos, String seccion, double[] notas) {
        this.idAlumno = idAlumno;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.seccion = seccion;
        this.notas = notas;
    }
    
    // METODOS SET Y GET

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getSeccion() {
        return seccion;
    }

    public void setSeccion(String seccion) {
        this.seccion = seccion;
    }

    public double[] getNotas() {
        return notas;
    }

    public void setNotas(double[] notas) {
        this.notas = notas;
    }
    
    // OTROS METODOS DE INSTANCIA
    public double promedio() {
        double suma = 0.0;
        for(double nota: this.notas) {
            suma = suma + nota;
        }
        return suma / this.notas.length;
    }
    
    public String obtenerNombreCompleto() {
        return this.nombres + " " + this.apellidos;
    }
    
    // METODO TOSTRING
    @Override
    public String toString() {
        return "Alumno{" + "idAlumno=" + idAlumno + ", nombres=" + nombres + ", apellidos=" + apellidos + ", seccion=" + seccion + ", notas=" + notas + '}';
    }
    
    public void mostrarInformacion() {
        System.out.println("(" + this.idAlumno + ")" + this.nombres + ", " + this.apellidos +
                            Arrays.asList(notas) + "\t");
    }
    
    
    
    
}
