package uno_a_muchos;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Crud {
    private Connection conexion;

    public Crud(Connection conexion) {
        this.conexion = conexion;
    }
    public List<Cliente> obtenerTodosClientes() {
        List<Cliente> clientes_al = new ArrayList<>();
        String query = "SELECT * FROM Cliente";
        try {
           PreparedStatement ps = conexion.prepareStatement(query);
           ResultSet rs = ps.executeQuery();
           while(rs.next()) {
               int idCliente = rs.getInt("id_cliente");//1
               String nombreCliente = rs.getString("nombre_cliente");//2
               List<Pedido> pedidos_al = obtenerPedidosPorCliente(idCliente);
               Cliente cliente = new Cliente(idCliente,nombreCliente,pedidos_al);
               clientes_al.add(cliente);
           }
        } catch (SQLException e) {

        }
        return clientes_al;
    }
    
    public List<Pedido> obtenerPedidosPorCliente(int idCliente) {
        List<Pedido> pedidos_al = new ArrayList<>();
        String query = "SELECT * FROM Pedido WHERE id_cliente = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int idPedido = rs.getInt("id_pedido");
                Date fechaPedido = rs.getDate("fecha_pedido");
                double totalPedido = rs.getDouble("total_pedido");
                Pedido pedido = new Pedido(idPedido,fechaPedido,totalPedido);
                pedidos_al.add(pedido);
            }
            
        }catch(SQLException e) {
            
        }
        return pedidos_al;
    }
    
    
    
    

}
