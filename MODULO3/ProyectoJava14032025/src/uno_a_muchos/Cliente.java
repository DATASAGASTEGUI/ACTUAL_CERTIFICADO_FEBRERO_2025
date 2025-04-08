package uno_a_muchos;

import java.util.List;

public class Cliente {

    // VARIABLES DE INSTANCIA(ATRIBUTOS9
    private int idCliente;
    private String nombreCliente;
    private List<Pedido> pedidos_al;

    // CONSTRUCTORES
    public Cliente() {
        this.idCliente = 0;
        this.nombreCliente = "";
        this.pedidos_al = null;
    }

    public Cliente(int idCliente, String nombreCliente, List<Pedido> pedidos_al) {
        this.idCliente = idCliente;
        this.nombreCliente = nombreCliente;
        this.pedidos_al = pedidos_al;
    }

    // METODOS SET Y GET
    public List<Pedido> getPedidos_al() {
        return pedidos_al;
    }

    public void setPedidos_al(List<Pedido> pedidos_al) {
        this.pedidos_al = pedidos_al;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    // METODO TOSTRING
    @Override
    public String toString() {
        return "Cliente{" + "idCliente=" + idCliente + ", nombreCliente=" + nombreCliente + ", pedidos_al=" + pedidos_al + '}';
    }

    // OTROS METODOS


}
