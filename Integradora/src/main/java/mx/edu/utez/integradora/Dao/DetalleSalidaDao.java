package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.*;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;

public class DetalleSalidaDao {

    public DetalleSalida getOne(int detalle_salida_id) {
        DetalleSalida detalleSalida = null;
        String query = "SELECT d.*, p.*, um.* " +
                "FROM Detalle_Salida d " +
                "JOIN Producto p ON d.producto_id = p.producto_id " +
                "JOIN Unidad_medida um ON p.unidad_medida = um.unidad_id " +
                "WHERE d.detalle_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalle_salida_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                detalleSalida = new DetalleSalida();
                detalleSalida.setDetalle_id(rs.getInt("id_detalle_salida"));

                Producto producto = new Producto();
                producto.setProducto_id(rs.getInt("producto_id"));
                producto.setProducto_nombre(rs.getString("producto_nombre"));
                // Set other fields of Producto if needed

                UnidMed unidadMedida = new UnidMed();
                unidadMedida.setUnidad_id(rs.getInt("unidad_id"));
                unidadMedida.setUnidad_nombre(rs.getString("unidad_nombre"));
                // Set other fields of UnidMed if needed

                detalleSalida.setProductos(producto);
                detalleSalida.setCantidad(rs.getInt("cantidad"));
                detalleSalida.setValor_salida(rs.getDouble("valor_total"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detalleSalida;
    }

    public ArrayList<DetalleSalida> getAllBySalidaId(int salida_id) {
        ArrayList<DetalleSalida> detalleSalidas = new ArrayList<>();
        String query = "SELECT d.*, p.*, um.* " +
                "FROM Detalle_Salida " +
                "JOIN Producto p ON d.producto_id = p.producto_id " +
                "JOIN Unidad_medida um ON p.unidad_medida = um.unidad_id " +
                "WHERE d.salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, salida_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DetalleSalida detalleSal= new DetalleSalida();
                detalleSal.setDetalle_id(rs.getInt("detalle_salida_id"));

                Producto producto = new Producto();
                producto.setProducto_id(rs.getInt("producto_id"));
                producto.setProducto_nombre(rs.getString("producto_nombre"));
                // Set other fields of Producto if needed

                UnidMed unidadMedida = new UnidMed();
                unidadMedida.setUnidad_id(rs.getInt("unidad_id"));
                unidadMedida.setUnidad_nombre(rs.getString("unidad_nombre"));
                // Set other fields of UnidMed if needed

                detalleSal.setProductos(producto);
                detalleSal.setCantidad(rs.getInt("cantidad"));
                detalleSal.setValor_salida(rs.getDouble("valor_salida"));

                detalleSalidas.add(detalleSal);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detalleSalidas;
    }

    public boolean insertDetalleSalida(DetalleSalida detalleSal) {
        boolean respuesta = false;
        String query = "INSERT INTO Detalle_Salida (detalle_salida_id, salidas, productos, salida_cantidad, valor_salida) VALUES (?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalleSal.getSalidas().getSalida_id()); // Foreign key from Entradas
            ps.setInt(2, detalleSal.getProductos().getProducto_id()); // Foreign key from Producto
            ps.setInt(3, detalleSal.getCantidad());
            ps.setDouble(4, detalleSal.getValor_salida());

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public boolean updateDetalleSalida(DetalleSalida detalleSal) {
        boolean respuesta = false;
        String query = "UPDATE Detalle_Salida SET salida_id = ?, producto_id = ?, cantidad = ?, valor_total = ? WHERE id_detalle = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalleSal.getSalidas().getSalida_id()); // Foreign key from Entradas
            ps.setInt(2, detalleSal.getProductos().getProducto_id()); // Foreign key from Producto
            ps.setInt(3, detalleSal.getCantidad());
            ps.setDouble(4, detalleSal.getValor_salida());
            ps.setInt(5, detalleSal.getDetalle_id());

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public boolean deleteBySalidaId(int salida_id) {
        boolean respuesta = false;
        String query = "DELETE FROM Detalle_Salida WHERE salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, salida_id);

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public boolean deleteDetalleSalida(int detalle_salida_id) {
        boolean respuesta = false;
        String query = "DELETE FROM Detalle_Salida WHERE detalle_salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalle_salida_id);

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }
}
