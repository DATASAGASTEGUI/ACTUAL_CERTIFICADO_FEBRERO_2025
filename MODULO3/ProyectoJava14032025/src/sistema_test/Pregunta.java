package sistema_test;

public class Pregunta {
    private int idPregunta;
    private String textoPregunta;
    private int respuestaPregunta; //1
    private String[] opciones; // {"Sistema Operativo",
                               //  "Sistema de Gestión de Base de Datos"};

    public Pregunta() {
        this.idPregunta = 0;
        this.textoPregunta = "";
        this.respuestaPregunta = 0;
        this.opciones = null;
    }

    public Pregunta(int idPregunta, String textoPregunta, int respuestaPregunta, String[] opciones) {
        this.idPregunta = idPregunta;
        this.textoPregunta = textoPregunta;
        this.respuestaPregunta = respuestaPregunta;
        this.opciones = opciones;
    }

    public int getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(int idPregunta) {
        this.idPregunta = idPregunta;
    }

    public String getTextoPregunta() {
        return textoPregunta;
    }

    public void setTextoPregunta(String textoPregunta) {
        this.textoPregunta = textoPregunta;
    }

    public int getRespuestaPregunta() {
        return respuestaPregunta;
    }

    public void setRespuestaPregunta(int respuestaPregunta) {
        this.respuestaPregunta = respuestaPregunta;
    }

    public String[] getOpciones() {
        return opciones;
    }

    public void setOpciones(String[] opciones) {
        this.opciones = opciones;
    }

    @Override
    public String toString() {
        return "Pregunta{" + "idPregunta=" + idPregunta + ", textoPregunta=" + textoPregunta + ", respuestaPregunta=" + respuestaPregunta + ", opciones=" + opciones + '}';
    }
    
    
           
}
