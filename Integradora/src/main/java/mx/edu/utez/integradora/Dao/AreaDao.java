package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.Areas;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class AreaDao {

    public Areas getOne (int id){
        Areas a = new Areas();
        String query = "select * from Area_salida where area_id = ?";

        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            //3) Obtener la información
            if(rs.next()){
                //Entonces llenamos la información del usuario
                a.setArea_nombre(rs.getString("area_nombre"));
                a.setArea_identidad(rs.getString("area_identidad"));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return a;
    }

    public ArrayList<Areas> getAll(){
        ArrayList<Areas> Lista = new ArrayList<>();
        String query = "select * from Area_salida";

        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Areas a = new Areas();
                a.setArea_id(rs.getInt("area_id"));
                a.setArea_nombre(rs.getString("area_nombre"));
                a.setArea_identidad(rs.getString("area_identidad"));
                Lista.add(a);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return Lista;
    }

    public boolean insertArea(Areas a)
    {
        boolean respuesta = false;
        String query = "insert into Area_salida(area_nombre,area_identidad)values(?,?)";
        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,a.getArea_nombre());
            ps.setString(2,a.getArea_ident(a.getArea_identidad()));
            if(ps.executeUpdate()==1){
                respuesta = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean updateArea(Areas a) {
        boolean respuesta = false;
        String query = "update Area_salida set area_nombre = ?, area_identidad = ? where area_id = ?";
        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,a.getArea_nombre());
            ps.setString(2,a.getArea_ident(a.getArea_identidad()));
            ps.setInt(3,a.getArea_id());
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean deleteArea (Areas a){
        boolean respuesta = false;
        String query = "delete from Area_salida where area_id = ?";
        try(Connection con = DatabaseConnectionManager.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,a.getArea_id());
            System.out.println(a.getArea_id());
            if(ps.executeUpdate()>0){
                respuesta = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return respuesta;
    }
}
