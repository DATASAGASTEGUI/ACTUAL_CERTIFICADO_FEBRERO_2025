package sistema_gestion_secciones_alumnos;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

public class Data {

    public static List<Alumno> obtenerTodosObjetosAlumno(String rutaNombreArchivo) {
        List<Alumno> alumnos = new ArrayList<>();
        File f = null;
        FileReader fr = null;
        BufferedReader br = null;
        String linea = "";
        String[] partes = null;
        String[] apellidosNombres = null;
        Alumno alumno = null;
        int id = 1;
        int bandera = 0;

        try {
            f = new File(rutaNombreArchivo);
            fr = new FileReader(f);
            br = new BufferedReader(fr);

            while ((linea = br.readLine()) != null) {
                System.out.println("ENTRO");
                if (bandera != 0) {
                    partes = linea.split(";");
                    apellidosNombres = partes[0].split(",");
                    double[] notas = {Double.parseDouble(partes[2]),
                        Double.parseDouble(partes[3]),
                        Double.parseDouble(partes[4])};
                    alumno = new Alumno(id++,
                            apellidosNombres[1].trim(),
                            apellidosNombres[0].trim(),
                            partes[1],
                            notas
                    );
                    alumnos.add(alumno);
                    System.out.println(alumno);
                }
                bandera = 1;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            alumnos = null;
        }
        return alumnos;

    }

}
