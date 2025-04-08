package herencia_figurageometrica;

import java.util.List;

public class GestionModelo {
    // VARIABLES DE INSTANCIA
    private List<FiguraGeometrica> lista;
    
    // CONSTRUCTORES
    public GestionModelo() {
        this.lista = null;
    }

    public GestionModelo(List<FiguraGeometrica> lista) {
        this.lista = lista;
    }
    
    // METODOS SET Y GET
    public List<FiguraGeometrica> getLista() {
        return lista;
    }

    public void setLista(List<FiguraGeometrica> lista) {
        this.lista = lista;
    }
    
    // METODOS CRUD
    // READ
    public void mostrarTodosFigurasGeometricas() {
        for(FiguraGeometrica fg: this.lista) {
               System.out.println(fg);
        }
    }
}
