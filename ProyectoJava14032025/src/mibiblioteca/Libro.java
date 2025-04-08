package mibiblioteca;

import java.util.List;

public class Libro {

    public String titulo;
    private String autor;
    private int añoPublicacion;
    private List<String> generos;
    private double precio;

    public Libro() {
        this.titulo = "";
        this.autor = "";
        this.añoPublicacion = 0;
        this.generos = null;
        this.precio = 0.0;
    }

    public Libro(String titulo, String autor, int añoPublicacion, List<String> generos, double precio) {
        this.titulo = titulo;
        this.autor = autor;
        this.añoPublicacion = añoPublicacion;
        this.generos = generos;
        this.precio = precio;
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

    public int getAñoPublicacion() {
        return añoPublicacion;
    }

    public void setAñoPublicacion(int añoPublicacion) {
        this.añoPublicacion = añoPublicacion;
    }

    public List<String> getGeneros() {
        return generos;
    }

    public void setGeneros(List<String> generos) {
        this.generos = generos;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        //return "Libro{" + "titulo=" + titulo + ", autor=" + autor + ", a\u00f1oPublicacion=" + añoPublicacion + ", generos=" + generos + ", precio=" + precio + '}';
        return "titulo=" + titulo + ", autor=" + autor + ", a\u00f1oPublicacion=" + añoPublicacion + ", generos=" + generos + ", precio=" + precio + '}';
    }
    
    

}
