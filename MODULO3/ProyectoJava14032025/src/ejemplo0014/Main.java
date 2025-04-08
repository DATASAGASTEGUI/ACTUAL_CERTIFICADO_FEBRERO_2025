package ejemplo0014;

public class Main {

    public static void main(String[] args) {
        Estudiante[] estudiantes = new Estudiante[5];
        String nombre;
        int edad;
        double calificacion;
        // LLENAR
        for(int i=0; i<5; i++) {
            System.out.println("Ingresar estudiante: " + (i+1));
            nombre = ValidarEntrada.nombre();
            edad = ValidarEntrada.edad();
            calificacion = ValidarEntrada.calificacion();
            Estudiante e = new Estudiante(nombre,edad,calificacion);
            estudiantes[i] = e;
        }
        // MOSTRAR
        for(int i=0; i<5; i++) {
            estudiantes[i].mostrarInformacion();
        }
    }
}
