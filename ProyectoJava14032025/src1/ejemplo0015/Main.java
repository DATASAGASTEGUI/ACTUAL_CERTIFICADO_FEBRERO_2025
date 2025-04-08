package ejemplo0015;

public class Main {

    public static void main(String[] args) {
        double x = ValidarEntrada.coordenada("Ingresar coordenda x? ");
        double y = ValidarEntrada.coordenada("Ingresar coordenda y? ");
        Nose cp = new Nose(x,y);
        cp.mostrarInformacion();
    }
    
}
