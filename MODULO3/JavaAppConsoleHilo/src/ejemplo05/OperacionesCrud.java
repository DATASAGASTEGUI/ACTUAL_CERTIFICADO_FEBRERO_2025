package ejemplo05;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OperacionesCrud {
    
    private Connection conexion;

    public OperacionesCrud(Connection conexion) {
        this.conexion = conexion;
    }

    public List<Consulta> obtenerTodasLasConsultas() {
        String query = "select * from consulta";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            List<Consulta> consultas_al = new ArrayList<Consulta>();
            while (rs.next()) {
                consultas_al.add(new Consulta(rs.getString(1), rs.getDate(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
            return consultas_al;
        } catch (SQLException e) {
            return null;
        }
    }

}
