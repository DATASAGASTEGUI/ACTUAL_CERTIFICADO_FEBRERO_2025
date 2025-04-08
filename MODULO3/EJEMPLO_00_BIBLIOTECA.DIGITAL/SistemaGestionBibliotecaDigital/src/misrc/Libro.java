package misrc;

public class Libro extends MaterialBiblioteca implements Prestable {

    // VARIABLES DE INSTANCIA
    private int numeroPaginas;
    private String genero;
    private boolean prestado;
    
    // CONSTRUCTOR

    public Libro() {
        super("","","",0);
        this.numeroPaginas = 0;
        this.genero = "";
    }

    public Libro(int numeroPaginas, String genero, String idMaterial, String titulo, String autor, int anioPublicacion) {
        super(idMaterial, titulo, autor, anioPublicacion);
        this.numeroPaginas = numeroPaginas;
        this.genero = genero;
        this.prestado = false;
    }

    // METODOS SET Y GET

    public int getNumeroPaginas() {
        return numeroPaginas;
    }

    public void setNumeroPaginas(int numeroPaginas) {
        this.numeroPaginas = numeroPaginas;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    @Override
    public void mostrarInformacion() {
       System.out.printf("%10s %50s %30s %10d %10d %10s %5s\n", getIdMaterial(), getTitulo(), getAutor(), getAnioPublicacion(), numeroPaginas, genero, prestado ? "No Disponible" : "Disponible");    
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
       System.out.printf("%10s %50s %30s %10s %10s %10s\n", "IDMATERIAL", "TITULO", "AUTOR", "PUBLICACION", "PAGINAS", "GENERO");    
    }
    
}
