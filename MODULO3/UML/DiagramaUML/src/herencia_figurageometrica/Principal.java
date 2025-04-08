package herencia_figurageometrica;

import java.util.ArrayList;
import java.util.List;

public class Principal {

    public static void main(String[] args) {
        List<FiguraGeometrica> lista = new ArrayList<>();

        lista.add(new Triangulo("T1", 2, 3));
        lista.add(new Triangulo("T2", 8, 4));
        lista.add(new Rectangulo("R1", 2, 3));
        lista.add(new Circulo("C1", 2));
        lista.add(new Circulo("C2", 4));

        GestionModelo gm = new GestionModelo(lista);

        gm.mostrarTodosFigurasGeometricas();
    }
}
