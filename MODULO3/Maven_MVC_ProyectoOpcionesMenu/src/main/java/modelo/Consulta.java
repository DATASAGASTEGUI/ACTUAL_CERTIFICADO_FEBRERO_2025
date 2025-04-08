package modelo;

public class Consulta {

    private String numeroConsulta;
    private String fecha;
    private String nombreMedico;
    private String deinpr;
    private String procedencia;


    private int cantidad; // Variable de instancia auxiliar

    public Consulta() {
        this.numeroConsulta = "";
        this.fecha = fecha = "";
        this.nombreMedico = nombreMedico = "";
        this.deinpr = deinpr = "";
        this.procedencia = procedencia = "";
    }

    public Consulta(String numeroConsulta, String fecha, String nombreMedico, String deinpr, String procedencia) {
        this.numeroConsulta = numeroConsulta;
        this.fecha = fecha;
        this.nombreMedico = nombreMedico;
        this.deinpr = deinpr;
        this.procedencia = procedencia;
    }
    
    public Consulta(String nombreMedico, int cantidad) {
       this.nombreMedico = nombreMedico;
       this.cantidad = cantidad;
    }
    

    public String getNumeroConsulta() {
        return numeroConsulta;
    }

    public void setNumeroConsulta(String numeroConsulta) {
        this.numeroConsulta = numeroConsulta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombreMedico() {
        return nombreMedico;
    }

    public void setNombreMedico(String nombreMedico) {
        this.nombreMedico = nombreMedico;
    }

    public String getDeinpr() {
        return deinpr;
    }

    public void setDeinpr(String deinpr) {
        this.deinpr = deinpr;
    }

    public String getProcedencia() {
        return procedencia;
    }

    public void setProcedencia(String procedencia) {
        this.procedencia = procedencia;
    }

    @Override
    public String toString() {
        return "Consulta{" + "nombreMedico=" + nombreMedico + ", cantidad=" + cantidad + '}';
    }
    
    public String miToString2() {
        return "Consulta{" + "numeroConsulta=" + numeroConsulta + ", fecha=" + fecha + ", nombreMedico=" + nombreMedico + ", deinpr=" + deinpr + ", procedencia=" + procedencia + '}';
    }

    public String miToString() {
        return nombreMedico + "    " + cantidad;
    }
    
    
}
