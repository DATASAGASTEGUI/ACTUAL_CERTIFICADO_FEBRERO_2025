package mitreeset;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class PrincipalTreeSet {

    public static void main(String[] args) {
        {
            System.out.println("EJEMPLO LIST");
            System.out.println("------------");
            List<Integer> coleccion = new ArrayList<Integer>();
            coleccion.add(5);
            coleccion.add(3);
            coleccion.add(5);
            coleccion.add(1);
            for (int i=0; i<coleccion.size(); i++) {
                System.out.println(coleccion.get(i));
            }
            for (Integer x : coleccion) {
                System.out.println(x);
            }
        }
        {
            System.out.println("EJEMPLO SET");
            System.out.println("-----------");
            Set<Integer> coleccion = new TreeSet<Integer>();
            coleccion.add(5);
            coleccion.add(3);
            coleccion.add(5);
            coleccion.add(1);
            for (Integer x : coleccion) {
                System.out.println(x);
            }
        }
    }
}
