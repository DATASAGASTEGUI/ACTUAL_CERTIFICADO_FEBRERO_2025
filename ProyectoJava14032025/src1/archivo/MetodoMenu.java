package archivo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

import java.util.Set;
import java.util.TreeSet;

public class MetodoMenu {

    public static File existeArhivo(String archivo) {
        File f = new File(archivo);
        if (f.exists()) {
            return f;
        } else {
            return null;
        }
    }

    public static void cantidadPalabras(String archivo) {
        File f;
        String linea;
        int cantidadPalabras;
        int s = 0;
        if ((f = existeArhivo(archivo)) != null) {
            try {
                FileReader fr = new FileReader(f);
                BufferedReader br = new BufferedReader(fr);
                while ((linea = br.readLine()) != null) {
                    if (!linea.equalsIgnoreCase("")) {
                        String[] palabras = linea.split("\\s+");// palabras = {"italian","al","pie"};
                        cantidadPalabras = palabras.length;
                        s += cantidadPalabras;
                    }
                }
                System.out.println("Cantidad palabras: " + s);

            } catch (IOException e) {
                System.out.println("Error");
            }

        } else {
            System.out.println("Archivo no existe");
        }
    }

    public static void palabrasDistintas(String archivo) {
        Set<String> coleccion = new TreeSet();
        File f;
        String linea;
        int cantidadPalabras;
        int s = 0;
        if ((f = existeArhivo(archivo)) != null) {
            try {
                FileReader fr = new FileReader(f);
                BufferedReader br = new BufferedReader(fr);
                while ((linea = br.readLine()) != null) {
                    if (!linea.equalsIgnoreCase("")) {
                        String[] palabras = linea.split("\\s+");
                        for (int i = 0; i < palabras.length; i++) {
                            coleccion.add(palabras[i]);
                        }
                    }
                }
                System.out.println("Cantidad palabras distintas: " + coleccion.size());
                for (String s1 : coleccion) {
                    System.out.println(s1);
                }

            } catch (Exception e) {
                System.out.println("Error");
            }

        }
    }

    public static void contarRepeticionPalabra(String archivo) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Ingrese palabra a buscar? ");
        String palabraBuscar = sc.next();
        File f;
        String linea;
        int c = 0;
        if ((f = existeArhivo(archivo)) != null) {
            try {
                FileReader fr = new FileReader(f);
                BufferedReader br = new BufferedReader(fr);
                while ((linea = br.readLine()) != null) {
                    if (!linea.equalsIgnoreCase("")) {
                        String[] palabras = linea.split("\\s+");
                        for (String palabra : palabras) {
                            if (palabraBuscar.equalsIgnoreCase(palabra)) {
                                c++;
                            }
                        }
                    }
                }
                System.out.println("Cantidad repeticiones: " + c);

            } catch (IOException e) {
                System.out.println("Error");
            }

        }
    }

    public static void contarPalabrasDisintas(String archivo) {
        File f;
        FileReader fr;
        BufferedReader br;
        String linea;
        Set<String> coleccion = new TreeSet();
        if ((f = existeArhivo(archivo)) != null) {
            try {
                fr = new FileReader(f);
                br = new BufferedReader(fr);
                while ((linea = br.readLine()) != null) {
                    String[] palabras = linea.split("\\s+");
                    for (String palabra : palabras) {
                        coleccion.add(palabra);
                    }
                }
                 for (String palabra : coleccion) {
                         int cantidad = contarRepeticionPalabra1(archivo,palabra);
                         System.out.println(palabra+"="+cantidad);
                    }
                br.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }    
            

    public static int contarRepeticionPalabra1(String archivo, String palabraBuscar) {
        File f;
        String linea;
        int c = 0;
        if ((f = existeArhivo(archivo)) != null) {
            try {
                FileReader fr = new FileReader(f);
                BufferedReader br = new BufferedReader(fr);
                while ((linea = br.readLine()) != null) {
                    if (!linea.equalsIgnoreCase("")) {
                        String[] palabras = linea.split("\\s+");
                        for (String palabra : palabras) {
                            if (palabraBuscar.equalsIgnoreCase(palabra)) {
                                c++;
                            }
                        }
                    }
                }
               
                br.close();
            } catch (IOException e) {
                System.out.println("Error");
            }
        }
            return c;
        }
    }



