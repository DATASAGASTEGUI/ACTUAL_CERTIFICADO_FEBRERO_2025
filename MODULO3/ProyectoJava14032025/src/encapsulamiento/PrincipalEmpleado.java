package encapsulamiento;

import java.util.ArrayList;
import java.util.List;

public class PrincipalEmpleado {

    public static void main(String[] args) {
        String[] h = {"Llaves", "Linterna"};
        Conserje c = new Conserje("Luis", "UPAO", "Mañana", h);
        Conserje c1 = new Conserje("Carlos","UPAO","Tarde", new String[]{"Escoba"});
        String[] sof = {"Word", "Excel"};
        Secretaria s = new Secretaria("María", "UPAO", "Tarde", sof);
        Profesor p = new Profesor("Arturo", "UPAO", "Tarde", "Matemática");

        List<Empleado> empleados = new ArrayList<>();
        empleados.add(c);
        empleados.add(s);
        empleados.add(p);

        for (Empleado e : empleados) {
            if (e instanceof Profesor) {
                System.out.println("Nombre: " + e.getNombre());
                System.out.println("Institución: " + e.getInstitucion());
                System.out.println("Horario: " + e.getHorario());
                System.out.println("Materia: " + ((Profesor) e).getMateria());
            }

        }
    }

}
