package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.DetalleEntrada;
import mx.edu.utez.integradora.Model.Producto;
import mx.edu.utez.integradora.Model.UnidMed;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;

public class DetalleEntradaDao {

    public DetalleEntrada getOne(int detalle_id) {
        DetalleEntrada detalleEntrada = null;
        String query = "SELECT d.*, p.*" +
                "FROM Detalle_Entrada d " +
                "JOIN Producto p ON d.producto_id = p.producto_id " +
                "WHERE d.detalle_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalle_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                detalleEntrada = new DetalleEntrada();
                detalleEntrada.setDetalle_id(rs.getInt("detalle_id"));

                Producto producto = new Producto();
                producto.setProducto_id(rs.getInt("producto_id"));
                producto.setProducto_nombre(rs.getString("producto_nombre"));
                producto.setProducto_precio(rs.getDouble("producto_precio"));
                producto.setProducto_cantidad(rs.getInt("producto_cantidad"));

                detalleEntrada.setProductos(producto);
                detalleEntrada.setCantidad(rs.getInt("cantidad"));
                detalleEntrada.setValor_total(rs.getDouble("valor_total"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detalleEntrada;
    }

    public ArrayList<DetalleEntrada> getAllByEntradaId(int entrada_id) {
        ArrayList<DetalleEntrada> detallesList = new ArrayList<>();
        String query = "SELECT d.*, p.* " +
                "FROM Detalle_Entrada d " +
                "JOIN Producto p ON d.producto_id = p.producto_id " +
                "WHERE d.entrada_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, entrada_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DetalleEntrada detalleEntrada = new DetalleEntrada();
                detalleEntrada.setDetalle_id(rs.getInt("detalle_id"));

                Producto producto = new Producto();
                producto.setProducto_id(rs.getInt("producto_id"));
                producto.setProducto_nombre(rs.getString("producto_nombre"));
                producto.setProducto_precio(rs.getDouble("producto_precio"));
                producto.setProducto_cantidad(rs.getInt("producto_cantidad"));

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

    public ArrayList<DetalleEntrada> getAllByEntradaFolio(String entrada_folio) {
        ArrayList<DetalleEntrada> detallesList = new ArrayList<>();
        String query = "SELECT d.*, p.*" +
                "FROM Detalle_Entrada d " +
                "JOIN Producto p ON d.producto_id = p.producto_id " +
                "WHERE d.entrada_folio = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, entrada_folio);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DetalleEntrada detalleEntrada = new DetalleEntrada();
                detalleEntrada.setDetalle_id(rs.getInt("detalle_id"));

                Producto producto = new Producto();
                producto.setProducto_id(rs.getInt("producto_id"));
                producto.setProducto_nombre(rs.getString("producto_nombre"));
                producto.setProducto_precio(rs.getDouble("producto_precio"));
                producto.setProducto_cantidad(rs.getInt("producto_cantidad"));

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

    public double getTotalIngresos() {
        double totalIngresos = 0.0;
        String query = "SELECT SUM(valor_total) AS Ingresos FROM Detalle_Entrada";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalIngresos = rs.getDouble("Ingresos");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalIngresos;
    }

    public boolean updateDetalleEntrada(DetalleEntrada detalle) {
        boolean respuesta = false;
        String query = "UPDATE Detalle_Entrada SET entrada_id = ?, producto_id = ?, cantidad = ?, valor_total = ? WHERE detalle_id = ?";

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

    public boolean deleteByEntradaFolio(String detalle_folio) {
        boolean respuesta = false;
        String query = "DELETE FROM Detalle_Entrada WHERE entrada_folio = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, detalle_folio);

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }
}
