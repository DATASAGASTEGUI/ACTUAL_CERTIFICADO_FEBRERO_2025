package ejemplo0004;

public class Estudiante {
    
    // VARIABLES DE INSTANCIA (ATRIBUTOS)
    private String codigo;
    private String nombresApellidos;
    private int edad;
    private String facultad;
    private String correo;
    
    // CONSTRUCTORES
    public Estudiante() {
      this.codigo = "";
      this.nombresApellidos = "";
      this.edad = 0;
      this.facultad = "";
      this.correo = "";  
    }
    public Estudiante(String codigo, String nombresApellidos, int edad, String facultad, String correo) {
        this.codigo = codigo;
        this.nombresApellidos = nombresApellidos;
        this.edad = edad;
        this.facultad = facultad;
        this.correo = correo;
    }
    
    // METODOS SET Y GET

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombresApellidos() {
        return nombresApellidos;
    }

    public void setNombresApellidos(String nombresApellidos) {
        this.nombresApellidos = nombresApellidos;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getFacultad() {
        return facultad;
    }

    public void setFacultad(String facultad) {
        this.facultad = facultad;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    //TOSTRING

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Estudiante{");
        sb.append("codigo=").append(codigo);
        sb.append(", nombresApellidos=").append(nombresApellidos);
        sb.append(", edad=").append(edad);
        sb.append(", facultad=").append(facultad);
        sb.append(", correo=").append(correo);
        sb.append('}');
        return sb.toString();
    }


    
}
