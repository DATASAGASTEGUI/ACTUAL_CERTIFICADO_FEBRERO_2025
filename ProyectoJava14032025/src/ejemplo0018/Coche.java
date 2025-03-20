package ejemplo0018;


public class Coche {
    // VARIABLES DE INSTANCIA (ATRIBUTOS)
    //1. Entrada
    private String marca;
    private String modelo;
    private String color;
    private double precio;
    private int numeroPuertas;

    // CONSTRUCTORES
    public Coche() {
        this.marca = "";
        this.modelo = "";
        this.color = "";
        this.precio = 0.0;
        this.numeroPuertas = 0;
    }
    public Coche(String marca, String modelo, String color, double precio, int numeroPuertas) {
        this.marca = marca;
        this.modelo = modelo;
        this.color = color;
        this.precio = precio;
        this.numeroPuertas = numeroPuertas;
    } 
    // METODOS SET Y GET

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getNumeroPuertas() {
        return numeroPuertas;
    }

    public void setNumeroPuertas(int numeroPuertas) {
        this.numeroPuertas = numeroPuertas;
    }

    // ACCIONES DEL COCHE
    
    public void arrancar() {
        System.out.println("Start");
    }
    
    public void parar() {
        System.out.println("Stop");
    }
    
    public void acelerar() {
       System.out.println("Acelerar");
    }
    
    public void mostrarInformacion() {
       System.out.println(marca+";"+modelo+";"+color+";"+precio+";"+numeroPuertas);
        
    }
}
