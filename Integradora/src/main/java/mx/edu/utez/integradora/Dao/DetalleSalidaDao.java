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
                detalleSalida.setDetalle_id(rs.getInt("id_detalle"));

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

    public ArrayList<DetalleEntrada> getAllByEntradaId(int entrada_id) {
        ArrayList<DetalleEntrada> detallesList = new ArrayList<>();
        String query = "SELECT d.*, p.*, um.* " +
                "FROM Detalle_Entrada d " +
                "JOIN Producto p ON d.producto_id = p.producto_id " +
                "JOIN Unidad_medida um ON p.unidad_medida = um.unidad_id " +
                "WHERE d.entrada_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, entrada_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DetalleEntrada detalleEntrada = new DetalleEntrada();
                detalleEntrada.setDetalle_id(rs.getInt("id_detalle"));

                Producto producto = new Producto();
                producto.setProducto_id(rs.getInt("producto_id"));
                producto.setProducto_nombre(rs.getString("producto_nombre"));
                // Set other fields of Producto if needed

                UnidMed unidadMedida = new UnidMed();
                unidadMedida.setUnidad_id(rs.getInt("unidad_id"));
                unidadMedida.setUnidad_nombre(rs.getString("unidad_nombre"));
                // Set other fields of UnidMed if needed

                detalleEntrada.setProductos(producto);
                detalleEntrada.setCantidad(rs.getInt("cantidad"));
                detalleEntrada.setValor_total(rs.getDouble("valor_total"));

                detallesList.add(detalleEntrada);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detallesList;
    }

    public boolean insertDetalleEntrada(DetalleEntrada detalle) {
        boolean respuesta = false;
        String query = "INSERT INTO Detalle_Entrada (entrada_id, producto_id, cantidad, valor_total) VALUES (?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalle.getEntradas().getEntrada_id()); // Foreign key from Entradas
            ps.setInt(2, detalle.getProductos().getProducto_id()); // Foreign key from Producto
            ps.setInt(3, detalle.getCantidad());
            ps.setDouble(4, detalle.getValor_total());

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public boolean updateDetalleEntrada(DetalleEntrada detalle) {
        boolean respuesta = false;
        String query = "UPDATE Detalle_Entrada SET entrada_id = ?, producto_id = ?, cantidad = ?, valor_total = ? WHERE id_detalle = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalle.getEntradas().getEntrada_id()); // Foreign key from Entradas
            ps.setInt(2, detalle.getProductos().getProducto_id()); // Foreign key from Producto
            ps.setInt(3, detalle.getCantidad());
            ps.setDouble(4, detalle.getValor_total());
            ps.setInt(5, detalle.getDetalle_id());

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public boolean deleteByEntradaId(int entrada_id) {
        boolean respuesta = false;
        String query = "DELETE FROM Detalle_Entrada WHERE entrada_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, entrada_id);

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public boolean deleteDetalleEntrada(int detalle_id) {
        boolean respuesta = false;
        String query = "DELETE FROM Detalle_Entrada WHERE id_detalle = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalle_id);

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }
}