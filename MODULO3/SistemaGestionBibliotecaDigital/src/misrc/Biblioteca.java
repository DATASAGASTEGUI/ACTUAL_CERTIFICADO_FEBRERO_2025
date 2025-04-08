package misrc;

import java.util.ArrayList;
import java.util.List;

public class Biblioteca {

    // VARIABLES DE INSTANCIA
    private List<MaterialBiblioteca> materiales;

    public Biblioteca() {
        this.materiales = new ArrayList<>();
    }

    public void agregarMaterial(MaterialBiblioteca materialBiblioteca) {
        this.materiales.add(materialBiblioteca);
    }

    public void listarMateriales() {
        int i = 0;
        // LIBROS

        for (MaterialBiblioteca material : this.materiales) {
            if (material instanceof Libro) {
                if (i == 0) {
                    material.cabecera();
                    i++;
                }
                material.mostrarInformacion(); //Polimorfismo
            }
        }
    }

    public MaterialBiblioteca buscarPorIdMaterial(String idMaterial) {
        for (MaterialBiblioteca material : this.materiales) {
            if (material.getIdMaterial().equalsIgnoreCase(idMaterial)) {
                return material;
            }
        }
        return null;
    }

    public void mostrarMaterialPrestado() {
        for (MaterialBiblioteca material : this.materiales) {
            if (material instanceof Libro) {
                if (((Libro) material).estaPrestado() == true) {
                    material.mostrarInformacion();
                }
            }
            if (material instanceof Revista) {
                if (((Revista) material).estaPrestado() == true) {
                    material.mostrarInformacion();
                }
            }
        }
    }

    public boolean eliminarMaterial(String idMaterial) {
        boolean eliminado = false;
        for (MaterialBiblioteca material : this.materiales) {
            if (material instanceof Libro) {
                if ((material.getIdMaterial().equalsIgnoreCase(idMaterial) && 
                        ((Libro) material).estaPrestado() == false ||
                         ((Revista) material).estaPrestado() == false)) {
                    this.materiales.remove(material);
                    eliminado = true;
                }
            }
            
        }
        return eliminado;
    }
}
