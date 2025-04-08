package misrc;

public class Sensor {
    // VARIABLES DE INSTANCIA
    private int idSensor;
    private int temperatura;
    
    // CONSTRUCTORES

    public Sensor() {
        this.idSensor = 0;
        this.temperatura = 0;
    }

    public Sensor(int idSensor, int temperatura) {
        this.idSensor = idSensor;
        this.temperatura = temperatura;
    }
    
    // METODOS SET Y GET

    public int getIdSensor() {
        return idSensor;
    }

    public void setIdSensor(int idSensor) {
        this.idSensor = idSensor;
    }

    public int getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(int temperatura) {
        this.temperatura = temperatura;
    }
    
    // COMPORTAMIENTO DE LA CLASE
    public boolean esCritico() {
        return !(temperatura >= 18 && temperatura <= 45);
    }
    
    public String getEstado() {
        return esCritico() ? "CRITICO" : "NORMAL";
    }
}
