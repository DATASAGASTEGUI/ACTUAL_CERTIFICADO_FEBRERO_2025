package ejemplo0004;

public class Principal {
    
    public static void main(String[] args) {
        Estudiante e1 = new Estudiante();
        System.out.println(e1); //toString
        e1.setCodigo("E1");
        e1.setNombresApellidos("Luis");
        e1.setEdad(23);
        e1.setFacultad("Sistemas");
        e1.setCorreo("luis@email.es");
        System.out.println(e1); //toString
  
        Estudiante e2 = new Estudiante("E2","Miguel",
                                       23,"Informática",
                                       "miguel@email.es");
        System.out.println(e2);
    }
    
}
