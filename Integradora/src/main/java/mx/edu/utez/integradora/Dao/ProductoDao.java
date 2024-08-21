package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.Producto;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductoDao {

    public Producto getOne(int producto_id) {
        Producto p = new Producto();
        String query = "SELECT * FROM Producto WHERE producto_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, producto_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p.setProducto_id(rs.getInt("producto_id"));
                p.setProducto_nombre(rs.getString("producto_nombre"));
                p.setProducto_precio(rs.getDouble("producto_precio"));
                p.setProducto_cantidad(rs.getInt("producto_cantidad"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    public Producto getOne(String nombre) {
        Producto p = new Producto();
        String query = "SELECT * FROM Producto WHERE producto_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nombre);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p.setProducto_id(rs.getInt("producto_id"));
                p.setProducto_nombre(rs.getString("producto_nombre"));
                p.setProducto_precio(rs.getDouble("producto_precio"));
                p.setProducto_cantidad(rs.getInt("producto_cantidad"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    public ArrayList<Producto> getAll() {
        ArrayList<Producto> lista = new ArrayList<>();
        String query = "SELECT * FROM Producto WHERE producto_cantidad > 0";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Producto pro = new Producto();
                pro.setProducto_id(rs.getInt("producto_id"));
                pro.setProducto_nombre(rs.getString("producto_nombre"));
                pro.setProducto_precio(rs.getDouble("producto_precio"));
                pro.setProducto_cantidad(rs.getInt("producto_cantidad"));

                lista.add(pro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean insertProducto(Producto prod) {
        boolean respuesta = false;
        String query = "INSERT INTO Producto (producto_nombre, producto_precio, producto_cantidad) VALUES (?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, prod.getProducto_nombre());
            ps.setDouble(2, prod.getProducto_precio());
            ps.setInt(3, prod.getProducto_cantidad());

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean anadirProducto(String nombreProducto, int cantidad) {
        boolean respuesta = false;
        String query = "UPDATE Producto SET producto_cantidad = producto_cantidad + ? WHERE producto_nombre = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cantidad);
            ps.setString(2, nombreProducto);

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean deleteProducto(Producto prod) {
        boolean respuesta = false;
        String query = "DELETE FROM Producto WHERE producto_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, prod.getProducto_id());

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean updateProducto(Producto prod) {
        boolean respuesta = false;
        String query = "UPDATE Producto SET producto_nombre = ?, producto_precio = ?, producto_cantidad = ? WHERE producto_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, prod.getProducto_nombre());
            ps.setDouble(2, prod.getProducto_precio());
            ps.setInt(3, prod.getProducto_cantidad());
            ps.setInt(4, prod.getProducto_id());

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return respuesta;
    }

    public boolean updateProduct(Producto prod) {
        boolean respuesta = false;
        String query = "UPDATE Producto SET producto_nombre = ?, producto_precio = ?, producto_cantidad = ? WHERE producto_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, prod.getProducto_nombre());
            ps.setDouble(2, prod.getProducto_precio());
            ps.setInt(3, prod.getProducto_cantidad());
            ps.setInt(4, prod.getProducto_id());

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return respuesta;
    }

    public ArrayList<Producto> verCatalogo() {
        ArrayList<Producto> lista = new ArrayList<>();
        String query = "SELECT * FROM Catalogo";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Producto pro = new Producto();
                pro.setProducto_nombre(rs.getString("Producto"));
                pro.setProducto_precio(rs.getDouble("Precio"));
                pro.setProducto_cantidad(rs.getInt("Cantidad"));

                lista.add(pro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public Producto verAlmacen() {
        Producto prods = new Producto();
        String query = "SELECT * FROM vista_almacen";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                prods.setProducto_precio(rs.getDouble("Monto_total"));
                prods.setProducto_cantidad(rs.getInt("Cantidad_total"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return prods;
    }
}
