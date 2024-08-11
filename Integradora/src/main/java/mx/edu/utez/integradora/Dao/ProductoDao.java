package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.Producto;
import mx.edu.utez.integradora.Model.UnidMed;
import mx.edu.utez.integradora.Model.Producto;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductoDao {

    public Producto getOne (int producto_id){

        Producto p = new Producto();
        UnidMed ume = new UnidMed();
        String query = "select p.*, u.unidad_nombre from Producto p JOIN Unidad_medida u ON p.producto_unidad_id = u.unidad_id where p.producto_id = ?";
        try(Connection con = DatabaseConnectionManager.getConnection();){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,producto_id);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                p.setProducto_id(rs.getInt("producto_id"));
                p.setProducto_nombre(rs.getString("nombre_producto"));
                p.setProducto_precio(rs.getDouble("precio_unitario"));
                p.setProducto_cantidad(rs.getInt("cantidad"));

                ume.setUnidad_id(rs.getInt("unidad_id"));
                ume.setUnidad_nombre(rs.getString("unidad_nombre"));

                p.setProducto_unidad_medida(ume);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return p;
    }

    public ArrayList<Producto> getAll(){
        ArrayList<Producto> List = new ArrayList<>();
        String query = "select p.*, u.unidad_nombre from Producto p JOIN Unidad_medida u ON p.producto_unidad_id = u.unidad_id";

        try(Connection con = DatabaseConnectionManager.getConnection();){
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Producto pro = new Producto();
                pro.setProducto_id(rs.getInt("producto_id"));
                pro.setProducto_nombre(rs.getString("nombre_producto"));
                pro.setProducto_precio(rs.getDouble("precio_unitario"));
                pro.setProducto_cantidad(rs.getInt("cantidad"));

                UnidMed ume = new UnidMed();
                ume.setUnidad_id(rs.getInt("unidad_id"));
                ume.setUnidad_nombre(rs.getString("unidad_nombre"));

                pro.setProducto_unidad_medida(ume);

                List.add(pro);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return List;
    }

    public boolean insertProducto (Producto prod)
    {
        boolean respuesta = false;
        String query = "insert into producto(nombre_producto,precio_unitario,unidad_medida,cantidad)values(?,?,?,?)";
        try(Connection con = DatabaseConnectionManager.getConnection();){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,prod.getProducto_nombre());
            ps.setDouble(2,prod.getProducto_precio());
            ps.setInt(3,prod.getProducto_unidad_medida());
            ps.setInt(4,prod.getProducto_cantidad());
            if(ps.executeUpdate()==1){
                respuesta = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean deleteProducto (Producto prod){
        boolean respuesta = false;
        String query = "delete from Producto where producto_id = ?";
        try(Connection con = DatabaseConnectionManager.getConnection();){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,prod.getProducto_id());
            System.out.println(prod.getProducto_id());
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean updateProducto (Producto prod) {
        boolean respuesta = false;
        String query = "update producto set nombre_producto = ?, precio_unitario = ?, unidad_medida = ?, cantidad = ? where producto_id = ?";
        try(Connection con = DatabaseConnectionManager.getConnection();){
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1,prod.getProducto_nombre());
            ps.setDouble(2,prod.getProducto_precio());

            ps.setInt(3,prod.getProducto_unidad_medida());
            ps.setInt(4,prod.getProducto_cantidad());
            ps.setInt(5,prod.getProducto_id());
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public ArrayList<Producto> verCatalogo (){
        ArrayList<Producto> Listaa = new ArrayList<>();
        String query = "select * from Catalogo";

        try(Connection con = DatabaseConnectionManager.getConnection();){
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Producto pro = new Producto();
                pro.setProducto_nombre(rs.getString("Producto"));
                pro.setProducto_precio(rs.getDouble("Precio"));
                pro.setProducto_cantidad(rs.getInt("Cantidad"));

                Listaa.add(pro);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return Listaa;
    }

    public Producto verAlmacen (){
        Producto prods = new Producto();
        String query = "select * from vista_almacen";

        try(Connection con = DatabaseConnectionManager.getConnection();){
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                prods.setProducto_precio(rs.getDouble("Monto_total"));
                prods.setProducto_cantidad(rs.getInt("Cantidad_total"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return prods;
    }
}
