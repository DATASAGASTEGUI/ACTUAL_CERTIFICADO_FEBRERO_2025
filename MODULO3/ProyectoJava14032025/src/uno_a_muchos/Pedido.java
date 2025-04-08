package uno_a_muchos;

import java.sql.Date;

public class Pedido {
    private int idPedido;
    private Date fechaPedido;
    private double totalPedido;

    public Pedido() {
      this.idPedido = 0;
      this.fechaPedido = null;
      this.totalPedido = 0.0;  
    }

    public Pedido(int idPedido, Date fechaPedido, double totalPedido) {
        this.idPedido = idPedido;
        this.fechaPedido = fechaPedido;
        this.totalPedido = totalPedido;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Date getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(Date fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public double getTotalPedido() {
        return totalPedido;
    }

    public void setTotalPedido(double totalPedido) {
        this.totalPedido = totalPedido;
    }

    @Override
    public String toString() {
        return "Pedido{" + "idPedido=" + idPedido + ", fechaPedido=" + fechaPedido + ", totalPedido=" + totalPedido + '}';
    }
    
    
}
