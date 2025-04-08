package ejemplo0002;

import java.util.Scanner;

public class Ejemplo1 {

    public static void main(String[] args) {
        Alumno objeto1 = new Alumno();
        objeto1.setDni("12345678A");
        System.out.println("Dni Objeto 1: " + objeto1.getDni());
        
        Alumno objeto2 = new Alumno("43514543B", "Luis","Echevarrya",28,1.72,false,'H');
        System.out.println("Dni    Objeto 2: " + objeto2.getDni());
        System.out.println("Nombre Objeto 2: " + objeto2.getNombres());
        
        //Cambiar el valor de un atributo
        objeto2.setNombres("Luis Carlos");
        System.out.println("Nombre Objeto 2: " + objeto2.getNombres());
        
        System.out.println("IMPRIMIR TODOS LOS ATRIBUTOS DEL OBJETO");
        System.out.println(objeto2);
        System.out.println(objeto2.toString());
        
        System.out.println(objeto2.miPresentacion());

    }
    
}

class Alumno {
    //VARIABLES DE INSTANCIA (ATRIBUTOS)
    private String dni; //Identificador
    private String nombres;
    private String apellidos;
    private int edad;
    private double estatura;
    private boolean casado; //true, false
    private char sexo;
    //CONSTRUCTORES (INICIALIZAR LOS ATRIBUTOS)
    public Alumno() {
       this.dni = "";
       this.nombres = "";
       this.apellidos = "";
       this.edad = 0;
       this.estatura = 0.0;
       this.casado = false;
       this.sexo = 'M';
    }
    public Alumno(String dni, String nombres, String apellidos, int edad, double estatura, boolean casado, char sexo) {
        this.dni = dni;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.edad = edad;
        this.estatura = estatura;
        this.casado = casado;
        this.sexo = sexo;
    }

    //METODOS SET Y GET (GESTIONAMOS LOS VALORES DE LOS ATRIBUTOS)

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getEstatura() {
        return estatura;
    }

    public void setEstatura(double estatura) {
        this.estatura = estatura;
    }

    public boolean getCasado() {
        return casado;
    }

    public void setCasado(boolean casado) {
        this.casado = casado;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }
    
    //TOSTRING (IMPRIMIR TODOS LOS ATRIBUTOS DEL OBJETO

    @Override
    public String toString() {
        return "Alumno{" + 
               "dni=" + dni + 
               ", nombres=" + nombres + 
               ", apellidos=" + apellidos + 
               ", edad=" + edad + 
               ", estatura=" + estatura + 
               ", casado=" + casado + 
               ", sexo=" + sexo + '}';
    }
    
    public String miPresentacion() {
        return dni+";"+
               nombres+";"+
               apellidos+";"+
               edad+";"+
               estatura+";"+
               casado+";"+
               sexo;
    }
} 



