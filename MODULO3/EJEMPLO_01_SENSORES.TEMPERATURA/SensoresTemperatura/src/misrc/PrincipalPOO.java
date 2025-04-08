package misrc;

public class PrincipalPOO {

    public static void main(String[] args) {
        int[] medidasSensores = {22, 38, 52, 41, 19, 48, 35, 55};
        Sensor[] sensores = new Sensor[medidasSensores.length];
        for(int i=0; i<medidasSensores.length; i++) {
            Sensor s = new Sensor((i+1),medidasSensores[i]);
            sensores[i] = s;
        }
        SistemaMonitorizacion sm = new SistemaMonitorizacion(sensores);
        sm.analizarLosSensores();
    }
    
}
