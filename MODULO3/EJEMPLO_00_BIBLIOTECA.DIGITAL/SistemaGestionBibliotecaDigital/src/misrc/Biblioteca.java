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

        // REVISTA
        i = 0;
        for (MaterialBiblioteca material : this.materiales) {
            if (material instanceof Revista) {
                if (i == 0) {
                    material.cabecera();
                    i++;
                }
                material.mostrarInformacion(); //Polimorfismo
            }
        }

        // AUDIOLIBROS
        i = 0;
        for (MaterialBiblioteca material : this.materiales) {
            if (material instanceof AudioLibro) {
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

    /**
     * Descripcion del método aquí
     */
    public boolean eliminarMaterial(String idMaterial) {//L001, R001, A001

        boolean eliminado = false;
        try {
            for (MaterialBiblioteca material : this.materiales) {
                if (material instanceof Libro || material instanceof Revista) {
                    if ((material.getIdMaterial().equalsIgnoreCase(idMaterial)
                            && (((Libro) material).estaPrestado() == false
                            || ((Revista) material).estaPrestado() == false))) {
                        this.materiales.remove(material);
                        eliminado = true;
                        break;
                    }
                } else {
                    if (material.getIdMaterial().equalsIgnoreCase(idMaterial)) {
                        this.materiales.remove(material);
                        eliminado = true;
                        break;
                    }
                }

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eliminado;
    }

    /**
     *
     * @param idMaterial buscar
     * @return
     */
    public boolean actualizarMaterial(MaterialBiblioteca material) {//L001, R001, A001
        boolean bandera = false;
        for (MaterialBiblioteca mb : this.materiales) {
            mb.setTitulo(material.getTitulo());
            mb.setAutor(material.getAutor());
            mb.setAnioPublicacion(material.getAnioPublicacion());
            if (mb.getIdMaterial().equalsIgnoreCase(material.getIdMaterial())
                    && material instanceof Libro) {
                mb.setTitulo(material.getTitulo());
                mb.setAutor(material.getAutor());
                mb.setAnioPublicacion(material.getAnioPublicacion());
                ((Libro) mb).setNumeroPaginas(((Libro) material).getNumeroPaginas());
                ((Libro) mb).setGenero(((Libro) material).getGenero());
                bandera = true;
                break;
            }
            if (mb.getIdMaterial().equalsIgnoreCase(material.getIdMaterial())
                    && material instanceof Revista) {
                mb.setTitulo(material.getTitulo());
                mb.setAutor(material.getAutor());
                mb.setAnioPublicacion(material.getAnioPublicacion());
                ((Revista) mb).setNumeroEdicion(((Revista) material).getNumeroEdicion());
                ((Revista) mb).setMesPublicacion(((Revista) material).getMesPublicacion());
                bandera = true;
                break;
            }
            if (mb.getIdMaterial().equalsIgnoreCase(material.getIdMaterial())
                    && material instanceof AudioLibro) {
                mb.setTitulo(material.getTitulo());
                mb.setAutor(material.getAutor());
                mb.setAnioPublicacion(material.getAnioPublicacion());
                ((AudioLibro) mb).setDuracionMinutos(((AudioLibro) material).getDuracionMinutos());
                ((AudioLibro) mb).setNarrador(((AudioLibro) material).getNarrador());
                bandera = true;
                break;
            }
        }
        return bandera;
    }
}

/*
    else if (material instanceof Audiolibro) {
        System.out.print("Nueva duración (min): ");
        int nuevaDur = sc.nextInt(); sc.nextLine();
        System.out.print("Nuevo narrador: ");
        String nuevoNarr = sc.nextLine();
        actualizado = biblioteca.actualizarMaterial(idActualizar, nuevoTitulo, nuevoAutor, 
                                                  nuevoAnio, nuevaDur, nuevoNarr);
    } 


 */
