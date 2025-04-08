package misrc;

public class Revista extends MaterialBiblioteca implements Prestable {

    // VARIABLES DE INSTANCIA
    private int numeroEdicion;
    private int mesPublicacion;
    private boolean prestado;

    // CONSTRUCTOR
    public Revista() {
        super("", "", "", 0);
        this.numeroEdicion = 0;
        this.mesPublicacion = 0;
    }

    public Revista(int numeroEdicion, int mesPublicacion, String idMaterial, String titulo, String autor, int anioPublicacion) {
        super(idMaterial, titulo, autor, anioPublicacion);
        this.numeroEdicion = numeroEdicion;
        this.mesPublicacion = mesPublicacion;
    }
    
    // METODOS SET Y GET

    public int getNumeroEdicion() {
        return numeroEdicion;
    }

    public void setNumeroEdicion(int numeroEdicion) {
        this.numeroEdicion = numeroEdicion;
    }

    public int getMesPublicacion() {
        return mesPublicacion;
    }

    public void setMesPublicacion(int mesPublicacion) {
        this.mesPublicacion = mesPublicacion;
    }

    @Override
    public void mostrarInformacion() {
        System.out.printf("%10s %10s %10s %5d %5d %5d\n", getIdMaterial(), getTitulo(), getAutor(), getAnioPublicacion(), numeroEdicion, mesPublicacion);    
    }

    @Override
    public void prestar() {
       prestado = true; 
    }

    @Override
    public void devolver() {
        prestado = false;
    }

    @Override
    public boolean estaPrestado() {
        return prestado;
    }

    @Override
    public void cabecera() {
        System.out.printf("%10s %50s %30s %10s %10s %10s\n", "IDMATERIAL", "TITULO", "AUTOR", "PUBLICACION", "EDICION", "PUBLICACION");    
    }
    
    

}
