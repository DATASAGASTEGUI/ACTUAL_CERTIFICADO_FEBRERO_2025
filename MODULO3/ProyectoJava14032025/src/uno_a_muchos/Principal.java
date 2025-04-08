package uno_a_muchos;
import java.sql.Connection;
import java.util.List;
public class Principal {

    public static void main(String[] args) {
        Connection conexion = Conexion.getConexion();
        if(conexion != null) {
           System.out.println("OK: CONEXION");
           Crud crud = new Crud(conexion);
           List<Cliente> clientes_al = crud.obtenerTodosClientes();
           clientes_al.forEach(x -> System.out.println(x.toString()));
           
           System.out.println("MOSTRAR ORDENADO POR UN ATRIBUTO DEL OBJETO");
           clientes_al.sort((x, y) -> x.getNombreCliente().compareTo(y.getNombreCliente()));
           clientes_al.forEach(x -> System.out.println(x.toString()));
           //Delete from clientes
           //clientes_al.clear();
           if(clientes_al.size() <= 0) System.out.println("Lista vacia");
           //ELIMINAR EL CLIENTE CON ID 1
           //DELETE FROM Cliente WHERE id_cliente = 1;
           System.out.println("ELIMINAR UN OBJETO DE LA LISTA");
           for(Cliente c: clientes_al) {
               if(c.getIdCliente() == 1) {
                  clientes_al.remove(c);
               }
           }
           clientes_al.forEach(x -> System.out.println(x.toString()));
           System.out.println("ACTUALIZAR UN CAMPO: NOMBRE DEL CLIENTE 3 QUE ES CARMEN POR Ana");
           for(Cliente c: clientes_al) {
               if(c.getIdCliente() == 3) {
                   c.setNombreCliente("Ana");
               }
           }
           clientes_al.forEach(x -> System.out.println(x.toString()));
           System.out.println("BUSCAR LOS PEDIDOS DE UN CLIENTE: CLIENTE 2");
           for(Cliente c: clientes_al) {
               if(c.getIdCliente() == 2) {
                  List<Pedido> listaPedidos = c.getPedidos_al();
                  listaPedidos.forEach(x -> System.out.println(x.getTotalPedido()));
               }
           }
        }else {
           System.out.println("ERROR: CONEXION");
        }
    }
    
}
