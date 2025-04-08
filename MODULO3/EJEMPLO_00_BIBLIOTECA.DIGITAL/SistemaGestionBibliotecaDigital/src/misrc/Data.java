package misrc;

import java.util.ArrayList;
import java.util.List;

public class Data {
    
    public static List<MaterialBiblioteca> obtenerDatos() {
        List<MaterialBiblioteca> datos = new ArrayList<>();

        // LIBROS
        Libro l1 = new Libro(523, "Realismo mágico", "L001", "Cien años de soledad", "Gabriel García Márquez", 1967);
        Libro l2 = new Libro(863, "Clásico", "L002", "Don Quijote de la Mancha", "Miguel de Cervantes", 1605);
        Libro l3 = new Libro(328, "Distopía", "L003", "1984", "George Orwell", 1949);
        Libro l4 = new Libro(279, "Romance", "L004", "Orgullo y prejuicio", "Jane Austen", 1813);
        Libro l5 = new Libro(1216, "Fantasía", "L005", "El señor de los anillos", "J.R.R. Tolkien", 1954);
        Libro l6 = new Libro(215, "Realismo mágico", "L006", "Crónica de una muerte anunciada", "Gabriel García Márquez", 1981);
        Libro l7 = new Libro(736, "Ficción", "L007", "Rayuela", "Julio Cortázar", 1963);
        Libro l8 = new Libro(158, "Ciencia ficción", "L008", "Fahrenheit 451", "Ray Bradbury", 1953);
        Libro l9 = new Libro(281, "Drama", "L009", "Matar a un ruiseñor", "Harper Lee", 1960);
        
       // REVISTAS
        Revista r1 = new Revista(45, 3, "R001", "National Geographic", "NatGeo", 2020);
        Revista r2 = new Revista(52, 6, "R002", "Science", "American Association for the Advancement of Science", 2021);
        Revista r3 = new Revista(612, 7, "R003", "Nature", "Springer Nature", 2022);
        Revista r4 = new Revista(123, 11, "R004", "Time", "Time USA, LLC", 2019);
        Revista r5 = new Revista(78, 5, "R005", "Forbes", "Forbes Media", 2021);
        Revista r6 = new Revista(98, 1, "R006", "The Economist", "The Economist Group", 2020);
        Revista r7 = new Revista(64, 9, "R007", "Muy Interesante", "Prisa Revistas", 2018);
        Revista r8 = new Revista(22, 12, "R008", "Wired", "Condé Nast", 2022);
        Revista r9 = new Revista(34, 2, "R009", "National Geographic Kids", "NatGeo", 2021);
        Revista r10= new Revista(56, 4, "R010", "Scientific American", "Springer Nature", 2020);
        Revista r11= new Revista(88, 8, "R011", "Economist Intelligence Unit", "EIU", 2019);
        Revista r12= new Revista(110,10, "R012", "Reader's Digest", "Trusted Media Brands", 2021);
        Revista r13= new Revista(29, 11,"R013", "Time for Kids", "Time USA, LLC", 2022);
        Revista r14= new Revista(15, 7, "R014", "National Geographic Traveller", "NatGeo", 2021);
        Revista r15= new Revista(37, 3, "R015", "Popular Science", "Bonnier Corporation", 2020);
        
        
        // AUDIOLIBROS
        AudioLibro a1 = new AudioLibro(905, "Juan Pérez", "A001", "Sapiens", "Yuval Noah Harari", 2011);
        AudioLibro a2 = new AudioLibro(380, "Ana Gómez", "A002", "El poder del ahora", "Eckhart Tolle", 1997);
        AudioLibro a3 = new AudioLibro(848, "Luis Torres", "A003", "La historia interminable", "Michael Ende", 1979);
        AudioLibro a4 = new AudioLibro(453, "Carmen Díaz", "A004", "La chica del tren", "Paula Hawkins", 2015);
        AudioLibro a5 = new AudioLibro(1150, "Pedro Martínez", "A005", "Dune", "Frank Herbert", 1965);
        AudioLibro a6 = new AudioLibro(970, "Laura Sánchez", "A006", "Steve Jobs", "Walter Isaacson", 2011);
        AudioLibro a7 = new AudioLibro(220, "Juan Pérez", "A007", "El alquimista", "Paulo Coelho", 1988);
        AudioLibro a8 = new AudioLibro(450, "Ana Gómez", "A008", "1984", "George Orwell", 1949);
        AudioLibro a9 = new AudioLibro(316, "Luis Torres", "A009", "Matar a un ruiseñor", "Harper Lee", 1960);
        AudioLibro a10 = new AudioLibro(520, "Carmen Díaz", "A010", "Cien años de soledad", "Gabriel García Márquez", 1967);
        
        datos.add(l1);datos.add(l2);datos.add(l3);datos.add(l4);datos.add(l5);
        datos.add(l6);datos.add(l7);datos.add(l8);datos.add(l9);
        
        datos.add(r1);datos.add(r2);datos.add(r3);datos.add(r4);datos.add(r5);
        datos.add(r6);datos.add(r7);datos.add(r8);datos.add(r9);datos.add(r10);
        datos.add(r11);datos.add(r12);datos.add(r13);datos.add(r14);datos.add(r15);
        
        datos.add(a1);datos.add(a2);datos.add(a3);datos.add(a4);datos.add(a5);
        datos.add(a6);datos.add(a7);datos.add(a8);datos.add(a9);datos.add(a10);
        
        return datos;
    }
    
}
