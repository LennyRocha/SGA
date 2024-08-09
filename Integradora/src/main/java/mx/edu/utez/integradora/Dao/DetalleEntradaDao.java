package mx.edu.utez.integradora.Dao;
import mx.edu.utez.integradora.Model.DetalleEntrada;
import mx.edu.utez.integradora.Model.Entradas;
import mx.edu.utez.integradora.Model.Producto;
import mx.edu.utez.integradora.Model.UnidMed;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DetalleEntradaDao {

    public DetalleEntrada getOne(int detalle_id) {
        DetalleEntrada detallesEntrada = new DetalleEntrada();
        Producto producto = new Producto();
        UnidMed unidMed = new UnidMed();
        String query = "SELECT d.*, e.*, p.*, um.* from Detalle_Entrada d JOIN Producto p ON p.producto_id = d.entrada_id JOIN Entradas e ON d.entrada_id = e.entrada_id JOIN Unidad_medida um ON p.unidad_medida = um.unidad_id where d.id_detalle = ?";
        try(Connection con = DatabaseConnectionManager.getConnection();){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,detalle_id);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                unidMed.setUnidad_id(rs.getInt("unidad_id"));
                unidMed.setUnidad_nombre(rs.getString("unidad_nombre"));

                producto.setProducto_id(rs.getInt("producto_id"));
                producto.setProducto_nombre(rs.getString("producto_nombre"));
                producto.setProducto_cantidad(rs.getInt("producto_cantidad"));
                producto.setProducto_precio(rs.getFloat("producto_precio"));
                producto.setProducto_unidad_medida((UnidMed) rs.getObject(unidMed.getUnidad_id()));

                detallesEntrada.setDetalle_id(rs.getInt("detalle_id"));
                detallesEntrada.setEntradas((Entradas) rs.getObject(detallesEntrada.getDetalle_id()));
                detallesEntrada.setProductos((Producto) rs.getObject(producto.getProducto_id()));
                detallesEntrada.setCantidad(rs.getInt("cantidad"));
                detallesEntrada.setValor_total(rs.getDouble("cantidad"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return detallesEntrada;
    }
}
