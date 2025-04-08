package ejemplo0018;

public class Principal {

    public static void main(String[] args) {
        //marca,modelo,color,precio,numeroPuertas
        Object[] r1 = {"Luis","Miguel",5,1.7};
        
        Object[][] baseDatos = {
            {"Toyota","Corolla","Azul",25000.50,4},
            {"Ford","Mustang","Rojo",45000.75,2},
            {"Volkswagen","Golf","Blanco",22000.00,5},
            {"Honda","Civic","Negro",23000.25,4},
            {"Tesla","Model 3","Plata",50000.99,4}
        };
        
       
        for(int f=0; f<baseDatos.length; f++) {
                String marca = (String)baseDatos[f][0];
                String modelo = (String)baseDatos[f][1];
                String color = (String)baseDatos[f][2];
                double precio = (double)baseDatos[f][3];
                int numeroPuertas = (int)baseDatos[f][4];
                Coche c = new Coche(marca,modelo,color,precio, numeroPuertas);
                c.mostrarInformacion();
        }

        
    } 
        
    
}
