package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.UnidMed;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class UnidadDao {

    public UnidMed getOne (int id){
        UnidMed um = new UnidMed();
        String query = "select * from Unidad_medida where unidad_id = ?";

        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                um.setUnidad_nombre(rs.getString("unidad_nombre"));
                um.setUnidad_id(rs.getInt("unidad_id"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return um;
    }

    public ArrayList<UnidMed> getAll(){
        ArrayList<UnidMed> Lista = new ArrayList<>();
        String query = "select * from Unidad_medida";

        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                UnidMed um = new UnidMed();
                um.setUnidad_id(rs.getInt("unidad_id"));
                um.setUnidad_nombre(rs.getString("unidad_nombre"));
                Lista.add(um);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return Lista;
    }

    public boolean insertUnidad(UnidMed um)
    {
        boolean respuesta = false;
        String query = "insert into Unidad_medida(unidad_nombre)values(?)";
        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,um.getUnidad_nombre());
            if(ps.executeUpdate()==1){
                respuesta = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean updateUnidad(UnidMed um) {
        boolean respuesta = false;
        String query = "update Unidad_medida set unidad_nombre = ? where unidad_id = ?";
        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,um.getUnidad_nombre());
            ps.setInt(2,um.getUnidad_id());
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean deleteUnidad (UnidMed um){
        boolean respuesta = false;
        String query = "delete from Unidad_medida where unidad_id = ?";
        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,um.getUnidad_id());
            System.out.println(um.getUnidad_id());
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }
}
