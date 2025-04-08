package misrc;

public class AudioLibro extends MaterialBiblioteca {

    // VARIABLES DE INSTANCIA
    private int duracionMinutos;
    private String narrador;

    // CONSTRUCTOR
    public AudioLibro() {
        super("", "", "", 0);
        this.duracionMinutos = 0;
        this.narrador = "";
    }

    public AudioLibro(int duracionMinutos, String narrador, String idMaterial, String titulo, String autor, int anioPublicacion) {
        super(idMaterial, titulo, autor, anioPublicacion);
        this.duracionMinutos = duracionMinutos;
        this.narrador = narrador;
    }

    // METODOS SET Y GET
    public int getDuracionMinutos() {
        return duracionMinutos;
    }

    public void setDuracionMinutos(int duracionMinutos) {
        this.duracionMinutos = duracionMinutos;
    }

    public String getNarrador() {
        return narrador;
    }

    public void setNarrador(String narrador) {
        this.narrador = narrador;
    }

    @Override
    public void mostrarInformacion() {
        System.out.printf("%10s %50s %30s %10d %10d %10s\n", getIdMaterial(), getTitulo(), getAutor(), getAnioPublicacion(), duracionMinutos, narrador);    
    }

    @Override
    public void cabecera() {
       System.out.printf("%10s %50s %30s %10s %10s %10s\n", "IDMATERIAL", "TITULO", "AUTOR", "PUBLICACION", "DURACION", "NARRADOR");    
    }

}
