package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.*;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;

public class DetalleSalidaDao {

    public DetalleSalida getOne(int detalle_salida_id) {
        DetalleSalida detalleSalida = null;
        String query = "SELECT d.*, p.*, um.unidad_nombre " +
                "FROM Detalle_Salida d " +
                "JOIN Producto p ON d.salida_producto_id = p.producto_id " +
                "JOIN Unidad_medida um ON d.unidad_id = um.unidad_id " +
                "WHERE d.detalle_salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalle_salida_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                detalleSalida = new DetalleSalida();
                detalleSalida.setDetalle_id(rs.getInt("detalle_salida_id"));

                Producto producto = new Producto();
                producto.setProducto_id(rs.getInt("producto_id"));
                producto.setProducto_nombre(rs.getString("producto_nombre"));
                producto.setProducto_precio(rs.getDouble("producto_precio"));
                producto.setProducto_cantidad(rs.getInt("producto_cantidad"));

                UnidMed unidadMedida = new UnidMed();
                unidadMedida.setUnidad_id(rs.getInt("unidad_id"));
                unidadMedida.setUnidad_nombre(rs.getString("unidad_nombre"));

                detalleSalida.setProductos_salida(producto);
                detalleSalida.setCantidad(rs.getInt("detalle_salida_cantidad"));
                detalleSalida.setValor_salida(rs.getDouble("valor_salida"));
                detalleSalida.setUnidad_medida(unidadMedida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detalleSalida;
    }

    public ArrayList<DetalleSalida> getAllBySalidaId(int salida_id) {
        ArrayList<DetalleSalida> detalleSalidas = new ArrayList<>();
        String query = "SELECT d.*, p.*, um.unidad_nombre " +
                "FROM Detalle_Salida d " +
                "JOIN Producto p ON d.salida_producto_id = p.producto_id " +
                "JOIN Unidad_medida um ON d.unidad_id = um.unidad_id " +
                "WHERE d.salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, salida_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DetalleSalida detalleSalida = new DetalleSalida();
                detalleSalida.setDetalle_id(rs.getInt("detalle_salida_id"));

                Producto producto = new Producto();
                producto.setProducto_id(rs.getInt("producto_id"));
                producto.setProducto_nombre(rs.getString("producto_nombre"));
                producto.setProducto_precio(rs.getDouble("producto_precio"));
                producto.setProducto_cantidad(rs.getInt("producto_cantidad"));

                UnidMed unidadMedida = new UnidMed();
                unidadMedida.setUnidad_id(rs.getInt("unidad_id"));
                unidadMedida.setUnidad_nombre(rs.getString("unidad_nombre"));

                detalleSalida.setProductos_salida(producto);
                detalleSalida.setCantidad(rs.getInt("detalle_salida_cantidad"));
                detalleSalida.setValor_salida(rs.getDouble("valor_salida"));
                detalleSalida.setUnidad_medida(unidadMedida);

                detalleSalidas.add(detalleSalida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detalleSalidas;
    }

    public ArrayList<DetalleSalida> getAllBySalidaFoio(String salida_folio) {
        ArrayList<DetalleSalida> detalleSalidas = new ArrayList<>();
        String query = "SELECT d.*, p.*, um.unidad_nombre " +
                "FROM Detalle_Salida d " +
                "JOIN Producto p ON d.salida_producto_id = p.producto_id " +
                "JOIN Unidad_medida um ON d.unidad_id = um.unidad_id " +
                "WHERE d.salida_folio = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, salida_folio);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DetalleSalida detalleSalida = new DetalleSalida();
                detalleSalida.setDetalle_id(rs.getInt("detalle_salida_id"));

                Producto producto = new Producto();
                producto.setProducto_id(rs.getInt("producto_id"));
                producto.setProducto_nombre(rs.getString("producto_nombre"));
                producto.setProducto_precio(rs.getDouble("producto_precio"));
                producto.setProducto_cantidad(rs.getInt("producto_cantidad"));

                UnidMed unidadMedida = new UnidMed();
                unidadMedida.setUnidad_id(rs.getInt("unidad_id"));
                unidadMedida.setUnidad_nombre(rs.getString("unidad_nombre"));

                detalleSalida.setProductos_salida(producto);
                detalleSalida.setCantidad(rs.getInt("detalle_salida_cantidad"));
                detalleSalida.setValor_salida(rs.getDouble("valor_salida"));
                detalleSalida.setUnidad_medida(unidadMedida);

                detalleSalidas.add(detalleSalida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detalleSalidas;
    }


    public boolean insertDetalleSalida(DetalleSalida detalleSalida) {
        boolean respuesta = false;
        String query = "INSERT INTO Detalle_Salida (salida_id, salida_producto_id, detalle_salida_cantidad, unidad_id, valor_salida) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalleSalida.getSalidas().getSalida_id()); // Foreign key from Salida
            ps.setInt(2, detalleSalida.getProductos_salida().getProducto_id()); // Foreign key from Producto
            ps.setInt(3, detalleSalida.getCantidad());
            ps.setInt(4, detalleSalida.getUnidad_medida().getUnidad_id()); // Foreign key from Unidad_medida
            ps.setDouble(5, detalleSalida.getValor_salida());

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public boolean updateDetalleSalida(DetalleSalida detalleSalida) {
        boolean respuesta = false;
        String query = "UPDATE Detalle_Salida SET salida_id = ?, salida_producto_id = ?, detalle_salida_cantidad = ?, unidad_id = ?, valor_salida = ? WHERE detalle_salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, detalleSalida.getSalidas().getSalida_id()); // Foreign key from Salida
            ps.setInt(2, detalleSalida.getProductos_salida().getProducto_id()); // Foreign key from Producto
            ps.setInt(3, detalleSalida.getCantidad());
            ps.setInt(4, detalleSalida.getUnidad_medida().getUnidad_id()); // Foreign key from Unidad_medida
            ps.setDouble(5, detalleSalida.getValor_salida());
            ps.setInt(6, detalleSalida.getDetalle_id());

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

    public boolean deleteBySalidaFolio(String detalle_salida_folio) {
        boolean respuesta = false;
        String query = "DELETE FROM Detalle_Salida WHERE salida_folio = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, detalle_salida_folio);

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public double getTotalEgresos() {
        double totalEgreso = 0.0;
        String query = "SELECT SUM(valor_salida) AS Egreso FROM Detalle_Salida";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalEgreso = rs.getDouble("Egreso");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalEgreso;
    }
}
