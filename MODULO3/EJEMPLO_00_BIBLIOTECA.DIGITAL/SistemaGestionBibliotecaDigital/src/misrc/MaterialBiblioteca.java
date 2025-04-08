package misrc;

public abstract class MaterialBiblioteca {

    // VARIABLES DE INSTANCIA
    private String idMaterial;
    private String titulo;
    private String autor;
    private int anioPublicacion;

    // CONSTRUCTOR
    public MaterialBiblioteca() {
        this.idMaterial = "";
        this.titulo = "";
        this.autor = "";
        this.anioPublicacion = 0;
    }

    public MaterialBiblioteca(String idMaterial, String titulo, String autor, int anioPublicacion) {
        this.idMaterial = idMaterial;
        this.titulo = titulo;
        this.autor = autor;
        this.anioPublicacion = anioPublicacion;
    }
    
    // METODOS SET Y GET

    public String getIdMaterial() {
        return idMaterial;
    }

    public void setIdMaterial(String idMaterial) {
        this.idMaterial = idMaterial;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public int getAnioPublicacion() {
        return anioPublicacion;
    }

    public void setAnioPublicacion(int anioPublicacion) {
        this.anioPublicacion = anioPublicacion;
    }
    // OBLIGAR A CADA HIJO SU IMPLEMENTACION
    public abstract void mostrarInformacion();
    public abstract void cabecera();
    

}
