package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.Proveedor;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ProveedorDao {

    public Proveedor getOne (int id){
        Proveedor p = new Proveedor();
        String query = "select * from Proveedor where proveedor_id = ?";
        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                p.setProveedor_nombre(rs.getString("proveedor_nombre"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return p;
    }

    public ArrayList<Proveedor> getAll(){
        ArrayList<Proveedor> Lista = new ArrayList<>();
        String query = "select * from Proveedor";

        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Proveedor p = new Proveedor();
                p.setProveedor_id(rs.getInt("proveedor_id"));
                p.setProveedor_nombre(rs.getString("proveedor_nombre"));
                Lista.add(p);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return Lista;
    }

    public boolean insertProveedor(Proveedor p)
    {
        boolean respuesta = false;
        String query = "insert into Proveedor(proveedor_nombre)values(?)";
        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,p.getProveedor_nombre());
            if(ps.executeUpdate()==1){
                respuesta = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean updateProveedor(Proveedor p) {
        boolean respuesta = false;
        String query = "update Proveedor set proveedor_nombre = ? where proveedor_id = ?";
        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,p.getProveedor_nombre());
            ps.setInt(2,p.getProveedor_id());
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean deleteProveedor (Proveedor p){
        boolean respuesta = false;
        String query = "delete from Proveedor where proveedor_id = ?";
        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,p.getProveedor_id());
            System.out.println(p.getProveedor_id());
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }
}
