package misrc;


public class Principal {
    public static void main(String[] args) {
       // ENTRADA
       int[] medidasSensores = {22, 38, 52, 41, 19, 48, 35, 55};
       
       int suma = 0;
       double promedio;
       int temperaturaMaxima = medidasSensores[0];
       int temperaturaMinima = medidasSensores[0];
       int posicionMaxima = 0;
       int posicionMinima = 0;
       int cantidadNormal = 0, cantidadCritico = 0;
       
       // PROCESO
       for(int i=0; i<medidasSensores.length; i++) {
           suma += medidasSensores[i];
           
           if(temperaturaMaxima > medidasSensores[i]) {
              temperaturaMaxima = medidasSensores[i];
              posicionMaxima = i;
           }
           
           if(temperaturaMinima < medidasSensores[i]) {
              temperaturaMinima = medidasSensores[i];
              posicionMinima = i;
           }
       }
       promedio = (double)suma / medidasSensores.length;

       // SALIDA
       
       System.out.println("SISTEMA MONITORIZACION INDUSTRIAL");
       System.out.println("---------------------------------");
       System.out.println("Temperatura promedio: " + promedio + " °C"); 
       System.out.println("Temperatura máxima  : " + temperaturaMaxima + " °C " + "Sensor " + (posicionMaxima+1));
       System.out.println("Temperatura mínima  : " + temperaturaMinima + " °C " + "Sensor " + (posicionMinima+1));  

       System.out.println("ESTADO SENSORES");
       System.out.println("---------------");
       for(int i=0; i<medidasSensores.length; i++) {
           int temperatura = medidasSensores[i];
           if(temperatura >= 18 && temperatura <= 45) {
              System.out.println("Sensor " + (i+1) + ": " + temperatura + "°C - Estado:" + "NORMARL");
              cantidadNormal += 1;
           }else {
              System.out.println("Sensor " + (i+1) + ": " + temperatura + "°C - Estado:" + "CRITICO"); 
              cantidadCritico += 1;
           }
       }
       System.out.println("ESTADISICA");
       System.out.println("----------");
       System.out.println("Sensores Normales              : " + cantidadNormal);
       System.out.println("Sensores Criticos              : " + cantidadCritico);
       System.out.println("Porcentaje de sensores críticos: " + (double)cantidadCritico/medidasSensores.length*100 + "%");
    }
    
}
