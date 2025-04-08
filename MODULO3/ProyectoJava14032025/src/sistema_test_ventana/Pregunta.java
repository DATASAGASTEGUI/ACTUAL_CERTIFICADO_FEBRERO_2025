package sistema_test_ventana;

import java.util.Arrays;

public class Pregunta {
    private int idPregunta;
    private String textoPregunta;
    private int respuestaCorrecta;
    private String[] opciones;

    public Pregunta() {
    }

    public Pregunta(int idPregunta, String textoPregunta, int respuestaCorrecta, String[] opciones) {
        this.idPregunta = idPregunta;
        this.textoPregunta = textoPregunta;
        this.respuestaCorrecta = respuestaCorrecta;
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

    public int getRespuestaCorrecta() {
        return respuestaCorrecta;
    }

    public void setRespuestaCorrecta(int respuestaCorrecta) {
        this.respuestaCorrecta = respuestaCorrecta;
    }

    public String[] getOpciones() {
        return opciones;
    }

    public void setOpciones(String[] opciones) {
        this.opciones = opciones;
    }

    @Override
    public String toString() {
        return "Pregunta{" + "idPregunta=" + idPregunta + ", textoPregunta=" + textoPregunta + ", respuestaCorrecta=" + respuestaCorrecta + ", opciones=" + Arrays.asList(opciones) + '}';
    }
    
    
}
