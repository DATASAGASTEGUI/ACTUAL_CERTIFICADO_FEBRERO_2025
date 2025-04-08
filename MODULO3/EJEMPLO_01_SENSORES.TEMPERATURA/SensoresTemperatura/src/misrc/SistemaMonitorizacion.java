package misrc;

public class SistemaMonitorizacion {
    
    // VARIABLES DE INSTANCIA
    Sensor[] sensores;
    
    // CONSTRUCTORES

    public SistemaMonitorizacion() {
    }

    public SistemaMonitorizacion(Sensor[] sensores) {
        this.sensores = sensores;
    }
    
    // METODOS SET Y GET

    public Sensor[] getSensores() {
        return sensores;
    }

    public void setSensores(Sensor[] sensores) {
        this.sensores = sensores;
    }
    
    // COMPORTAMIENTO DE LA CLASE
    public void analizarLosSensores() {
       System.out.println("SISTEMA MONITORIZACION INDUSTRIAL");
       System.out.println("---------------------------------");
       Sensor smax = getSensorTemperaturaMaxima();
       Sensor smin = getSensorTemperaturaMinima();
       System.out.println("Temperatura promedio: " + getPromedio() + " °C"); 
       System.out.println("Temperatura máxima  : " + smax.getTemperatura() + " °C " + "Sensor " + smax.getIdSensor());
       System.out.println("Temperatura máxima  : " + smin.getTemperatura() + " °C " + "Sensor " + smin.getIdSensor()); 
        
       System.out.println("ESTADO SENSORES");
       System.out.println("---------------");
       for(Sensor s: sensores) {
           System.out.println("Sensor " + s.getIdSensor() + ": " + s.getTemperatura() + "°C - Estado:" + s.getEstado());
       }
       
       System.out.println("ESTADISICA");
       System.out.println("----------");
       Object[] datos = getEstadistica();
       System.out.println("Sensores Normales              : " + datos[0]);
       System.out.println("Sensores Criticos              : " + datos[1]);
       System.out.println("Porcentaje de sensores críticos: " + datos[2] + "%");
    }
    
    public double getPromedio() {
        int suma = 0;
        for(Sensor s: sensores) {
           int temperatura = s.getTemperatura();
           suma = suma + temperatura;
        }
        return (double)suma / sensores.length;
    }
    
    public Sensor getSensorTemperaturaMaxima() {
       int temperaturaMaxima = sensores[0].getTemperatura();
       Sensor s1 = null;
       for(Sensor s: sensores) {
           if(temperaturaMaxima < s.getTemperatura()) {
              temperaturaMaxima = s.getTemperatura();
              s1 = s;
           }
       }
       return s1;
    }
    
    public Sensor getSensorTemperaturaMinima() {
       int temperaturaMinima = sensores[0].getTemperatura();
       Sensor s1 = null;
       for(Sensor s: sensores) {
           if(temperaturaMinima > s.getTemperatura()) {
              temperaturaMinima = s.getTemperatura();
              s1 = s;
           }
       }
       return s1;
    }

    public Object[] getEstadistica() {
        Object[] datos = new Object[3];
        int contadorNormal = 0;
        int contadorCritico = 0;
        double porcentajeCritico;
        for(Sensor s: sensores) {
            if(s.getEstado().equalsIgnoreCase("NORMAL")) {
                contadorNormal += 1;
            }else {
                contadorCritico += 1;
            } 
        }
        porcentajeCritico = (double)contadorCritico/sensores.length*100;
        datos[0] = contadorNormal;
        datos[1] = contadorCritico;
        datos[2] = porcentajeCritico;
        return datos;
    }    
    
}
