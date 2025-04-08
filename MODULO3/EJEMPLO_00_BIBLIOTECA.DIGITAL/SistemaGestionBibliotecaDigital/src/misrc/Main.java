package misrc;

import java.io.IOException;
import java.util.List;
import java.util.Scanner;

public class Main {

    static Scanner sc = new Scanner(System.in);
    static Biblioteca biblioteca = new Biblioteca();

    public static void main(String[] args) {

        String opcion = "";
        do {
            System.out.println("MENU");
            System.out.println("[1] Añadir material");
            System.out.println("[2] Mostrar todos los materiales");
            System.out.println("[3] Prestar material");
            System.out.println("[4] Devolver material");
            System.out.println("[5] Mostrar material prestado");
            System.out.println("[6] Eliminar material");
            System.out.println("[7] Actualizar material");
            System.out.println("[8] Buscar material por id");
            System.out.println("[0] Salir");

            System.out.print("Ingrese opción? ");
            opcion = sc.next();

            switch (opcion) {
                case "1":
                    cls();
                    opcion1();
                    pause();
                    break;
                case "2":
                    cls();
                    opcion2();
                    pause();
                    break;
                case "3":
                    cls();
                    opcion3();
                    pause();
                    break;
                case "4":
                    cls();
                    opcion4();
                    pause();
                    break;
                case "5":
                    cls();
                    opcion5();
                    pause();
                    break;
                case "6":
                    cls();
                    opcion6();
                    pause();
                    break;
                case "7":
                    cls();
                    opcion7();
                    pause();
                    break;
                case "8":
                    cls();
                    opcion8();
                    pause();
                    break;
                case "0":
                    cls();
                    System.out.println("Gracias por su visita");
                    pause();
                    System.exit(0);
                    break;

            }

        } while (true);

    }

    public static void pause() {
        try {
            System.out.print("\nPresiona una tecla para continuar...");
            System.in.read();
        } catch (IOException e) {
        }
    }

    public static void cls() {
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    }

    public static void opcion1() {
        System.out.println("[1] Añadir material");
        System.out.println("-------------------");
        
        List<MaterialBiblioteca> datos = Data.obtenerDatos();
        
        for(MaterialBiblioteca mb: datos) {
            biblioteca.agregarMaterial(mb);
        }

        /*
        System.out.print("Seleccione 1.Libro, 2.Revista, 3.AudioLibro? ");
        String opcion = sc.next();

        int numeroPaginas;
        String genero;

        int numeroEdicion;
        int mesPublicacion;

        String idMaterial;
        String titulo;
        String autor;
        int anioPublicacion;

        switch (opcion) {
            case "1":
                //System.out.println("Ingrese Id Material? ");
                //String idMaterial = sc.next();
                //private String titulo;
                //private String autor;
                //private int anioPublicacion;

                numeroPaginas = 34;
                genero = "Novela";
                idMaterial = "L01";
                titulo = "Cien años de soledad";
                autor = "García Marquez";
                anioPublicacion = 1980;
                MaterialBiblioteca libro = new Libro(numeroPaginas,
                        genero,
                        idMaterial,
                        titulo,
                        autor,
                        anioPublicacion);
                biblioteca.agregarMaterial(libro);
                break;
            case "2":
                //System.out.println("Ingrese Id Material? ");
                //String idMaterial = sc.next();
                //private String titulo;
                //private String autor;
                //private int anioPublicacion;

                numeroEdicion = 3;
                mesPublicacion = 2;
                idMaterial = "R01";
                titulo = "Magazin";
                autor = "Carlos Jauregui";
                anioPublicacion = 1982;
                MaterialBiblioteca revista = new Revista(numeroEdicion,
                        mesPublicacion,
                        idMaterial,
                        titulo,
                        autor,
                        anioPublicacion);
                biblioteca.agregarMaterial(revista);
                break;

        }
         */
        
        
    }

    public static void opcion2() {
        System.out.println("[2] Mostrar todos los materiales");
        System.out.println("--------------------------------");
        biblioteca.listarMateriales();
    }

    public static void opcion8() {
        System.out.println("[8] Buscar material por id");
        System.out.println("--------------------------");
        String idMaterial = "L01";
        MaterialBiblioteca material = biblioteca.buscarPorIdMaterial(idMaterial);
        if (material != null) {
            material.mostrarInformacion(); //Polimorfismo
        } else {
            System.out.println("Material con el id " + idMaterial + " No existe");
        }
    }

    private static void opcion3() {
        System.out.println("[3] Prestar material");
        System.out.println("--------------------");
        System.out.println("Ingrese el material para prestar? ");
        String idMaterial = sc.next(); //L001, R001
        String respuesta = "";
        MaterialBiblioteca material = biblioteca.buscarPorIdMaterial(idMaterial);
        if(material instanceof AudioLibro) {
           System.out.println("Los AudioLibros no se pueden prestar");
           return;
        }
        
        if (material != null) {
            material.mostrarInformacion(); //Polimorfismo
            System.out.println("Desea llevarselo S/N? ");
            respuesta = sc.next();
            if (material instanceof Libro && respuesta.equalsIgnoreCase("S")) {
                ((Libro) material).prestar();
            }
            if (material instanceof Revista && respuesta.equalsIgnoreCase("S")) {
                ((Revista) material).prestar();
            }
        } else {
            System.out.println("Material con el id " + idMaterial + " No existe");
        }

    }
    
    private static void opcion4() {
        System.out.println("[4] Devolver material");
        System.out.println("---------------------");
        System.out.println("Ingrese el material para devolver? ");
        String idMaterial = sc.next(); //L001, R001
        String respuesta = "";
        MaterialBiblioteca material = biblioteca.buscarPorIdMaterial(idMaterial);
        if(material instanceof AudioLibro) {
           System.out.println("Los AudioLibros no se pueden prestar");
           return;
        }
        
        if (material != null) {
            
            if(((Libro)material).estaPrestado() || ((Revista)material).estaPrestado()) {
                material.mostrarInformacion(); //Polimorfismo
                System.out.println("Desea devolver S/N? ");
                respuesta = sc.next();
                if (material instanceof Libro && respuesta.equalsIgnoreCase("S")) {
                    ((Libro) material).devolver();
                }
                if (material instanceof Revista && respuesta.equalsIgnoreCase("S")) {
                    ((Revista) material).devolver();
                }
            }
            
        } else {
            System.out.println("Material con el id " + idMaterial + " No existe");
        }

    }    

    private static void opcion5() {
        System.out.println("[5] Mostrar material prestado");
        System.out.println("-----------------------------");
        biblioteca.mostrarMaterialPrestado();
    }

    private static void opcion6() {
        System.out.println("[6] Eliminar material");
        System.out.println("---------------------");
        System.out.print("Ingresar id del material a eliminar? ");
        String idMaterial = sc.next();
        if(biblioteca.eliminarMaterial(idMaterial)) {
            System.out.println("Material con id " + idMaterial + " eliminado");
        }else {
            System.out.println("Material con id " + idMaterial + " no existe");
        }
    }
    
    private static void opcion7() {
        System.out.println("[7] Actualizar material");
        System.out.println("-----------------------");
        System.out.println("Ingrese id del material para actualizar? ");
        String idMaterial = sc.next();
        MaterialBiblioteca material = biblioteca.buscarPorIdMaterial(idMaterial);
        if(material == null) {
           System.out.println("Material con id " + idMaterial + " no existe");
           return;
        }
        
        material.mostrarInformacion();
        
        //PEDIR LOS ATRIBUTOS EN COMUN A TODOS LOS HIJOS
        String titulo = "Titulo nuevo";
        String autor = "Autor nuevo";
        int anioPublicacion = 2025;
        
        if(material instanceof Libro) {
           int numeroPaginas = 100;
           String genero = "Genero nuevo";
           Libro libro = new Libro(numeroPaginas, genero, idMaterial, titulo, autor, anioPublicacion);
           if(biblioteca.actualizarMaterial(libro)) {
              System.out.println("Se actulizo correctamente libro");
           }else {
              System.out.println("Error en actualizar libro"); 
           }
        }
        
        if(material instanceof Revista) {
            int numeroEdicion = 5;
            int mesPublicacion = 1;
            Revista revista = new Revista(numeroEdicion, mesPublicacion, idMaterial, titulo, autor, anioPublicacion);
           if(biblioteca.actualizarMaterial(revista)) {
              System.out.println("Se actulizo correctamente revista");
           }else {
              System.out.println("Error en actualizar revista"); 
           }
        }
        
         if(material instanceof AudioLibro) {
            int duracionMinutos = 1000;
            String narrador = "Arturo";
             AudioLibro audiolibro = new AudioLibro(duracionMinutos, narrador, idMaterial, titulo, autor, anioPublicacion);
           if(biblioteca.actualizarMaterial(audiolibro)) {
              System.out.println("Se actulizo correctamente audiolibro");
           }else {
              System.out.println("Error en actualizar audiolibro"); 
           }
        }
        
    }
}
