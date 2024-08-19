package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.DetalleEntrada;
import mx.edu.utez.integradora.Model.Entradas;
import mx.edu.utez.integradora.Model.Proveedor;
import mx.edu.utez.integradora.Model.Usuario;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;

public class EntradasDao {

    public Entradas getOne(int entrada_id) {
        Entradas entrada = new Entradas();
        String query = "SELECT e.*, p.*, u.* " +
                "FROM Entrada e " +
                "JOIN Proveedor p ON e.entrada_proveedor_id = p.proveedor_id " +
                "JOIN Usuarios u ON e.entrada_usuario_id = u.id " +
                "WHERE e.entrada_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, entrada_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                entrada.setEntrada_id(rs.getInt("entrada_id"));
                entrada.setEntrada_folio(rs.getString("entrada_folio"));
                entrada.setEntrada_fecha(rs.getDate("entrada_fecha"));

                // Obtener información del proveedor
                Proveedor proveedor = new Proveedor();
                proveedor.setProveedor_id(rs.getInt("proveedor_id"));
                proveedor.setProveedor_nombre(rs.getString("proveedor_nombre"));
                entrada.setProveedor(proveedor);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre_usuario(rs.getString("nombre"));
                entrada.setUsuario(usuario);

                entrada.setEstado(rs.getString("estado"));

                // Obtener los detalles asociados
                DetalleEntradaDao detalleDao = new DetalleEntradaDao();
                ArrayList<DetalleEntrada> detalles = detalleDao.getAllByEntradaId(entrada_id);
                entrada.setDetalles(detalles);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return entrada;
    }

    public Entradas getRecent() {
        Entradas entrada = new Entradas();
        String query = "SELECT e.*, p.*, u.* " +
                "FROM Entrada e " +
                "JOIN Proveedor p ON e.entrada_proveedor_id = p.proveedor_id " +
                "JOIN Usuarios u ON e.entrada_usuario_id = u.id " +
                "ORDER BY entrada_fecha DESC LIMIT 1";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                entrada.setEntrada_id(rs.getInt("entrada_id"));
                entrada.setEntrada_folio(rs.getString("entrada_folio"));
                entrada.setEntrada_fecha(rs.getDate("entrada_fecha"));

                // Obtener información del proveedor
                Proveedor proveedor = new Proveedor();
                proveedor.setProveedor_id(rs.getInt("proveedor_id"));
                proveedor.setProveedor_nombre(rs.getString("proveedor_nombre"));
                entrada.setProveedor(proveedor);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre_usuario(rs.getString("nombre"));
                entrada.setUsuario(usuario);

                entrada.setEstado(rs.getString("estado"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return entrada;
    }

    public Entradas getOne(String folio) {
        Entradas entrada = new Entradas();
        String query = "SELECT e.*, p.*, u.* " +
                "FROM Entrada e " +
                "JOIN Proveedor p ON e.entrada_proveedor_id = p.proveedor_id " +
                "JOIN Usuarios u ON e.entrada_usuario_id = u.id " +
                "WHERE e.entrada_folio = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, folio);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                entrada.setEntrada_id(rs.getInt("entrada_id"));
                entrada.setEntrada_folio(rs.getString("entrada_folio"));
                entrada.setEntrada_fecha(rs.getDate("entrada_fecha"));

                // Obtener información del proveedor
                Proveedor proveedor = new Proveedor();
                proveedor.setProveedor_id(rs.getInt("proveedor_id"));
                proveedor.setProveedor_nombre(rs.getString("proveedor_nombre"));
                entrada.setProveedor(proveedor);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre_usuario(rs.getString("nombre"));
                entrada.setUsuario(usuario);

                entrada.setEstado(rs.getString("estado"));

                // Obtener los detalles asociados
                DetalleEntradaDao detalleDao = new DetalleEntradaDao();
                ArrayList<DetalleEntrada> detalles = detalleDao.getAllByEntradaFolio(folio);
                entrada.setDetalles(detalles);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return entrada;
    }

    public ArrayList<Entradas> getAll() {
        ArrayList<Entradas> entradasList = new ArrayList<>();
        String query = "SELECT e.*, p.*, u.* " +
                "FROM Entrada e " +
                "JOIN Proveedor p ON e.entrada_proveedor_id = p.proveedor_id " +
                "JOIN Usuarios u ON e.entrada_usuario_id = u.id";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Entradas entrada = new Entradas();
                entrada.setEntrada_id(rs.getInt("entrada_id"));
                entrada.setEntrada_folio(rs.getString("entrada_folio"));
                entrada.setEntrada_fecha(rs.getDate("entrada_fecha"));

                // Obtener información del proveedor
                Proveedor proveedor = new Proveedor();
                proveedor.setProveedor_id(rs.getInt("proveedor_id"));
                proveedor.setProveedor_nombre(rs.getString("proveedor_nombre"));
                entrada.setProveedor(proveedor);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre_usuario(rs.getString("nombre"));
                entrada.setUsuario(usuario);

                entrada.setEstado(rs.getString("entrada_estado"));

                // Obtener los detalles asociados
                DetalleEntradaDao detalleDao = new DetalleEntradaDao();
                ArrayList<DetalleEntrada> detalles = detalleDao.getAllByEntradaId(entrada.getEntrada_id());
                entrada.setDetalles(detalles);

                entradasList.add(entrada);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return entradasList;
    }

    public ArrayList<Entradas> getSome() {
        ArrayList<Entradas> entradasList = new ArrayList<>();
        String query = "SELECT e.*, p.*, u.* " +
                "FROM Entrada e " +
                "JOIN Proveedor p ON e.entrada_proveedor_id = p.proveedor_id " +
                "JOIN Usuarios u ON e.entrada_usuario_id = u.id where e.entrada_estado = 'exitoso'";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Entradas entrada = new Entradas();
                entrada.setEntrada_id(rs.getInt("entrada_id"));
                entrada.setEntrada_folio(rs.getString("entrada_folio"));
                entrada.setEntrada_fecha(rs.getDate("entrada_fecha"));

                // Obtener información del proveedor
                Proveedor proveedor = new Proveedor();
                proveedor.setProveedor_id(rs.getInt("proveedor_id"));
                proveedor.setProveedor_nombre(rs.getString("proveedor_nombre"));
                entrada.setProveedor(proveedor);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre_usuario(rs.getString("nombre"));
                entrada.setUsuario(usuario);

                entrada.setEstado(rs.getString("entrada_estado"));

                // Obtener los detalles asociados
                DetalleEntradaDao detalleDao = new DetalleEntradaDao();
                ArrayList<DetalleEntrada> detalles = detalleDao.getAllByEntradaId(entrada.getEntrada_id());
                entrada.setDetalles(detalles);

                entradasList.add(entrada);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return entradasList;
    }

    public ArrayList<Entradas> getAllUnfinished() {
        ArrayList<Entradas> entradasList = new ArrayList<>();
        String query = "SELECT e.*, p.*, u.* " +
                "FROM Entrada e " +
                "JOIN Proveedor p ON e.entrada_proveedor_id = p.proveedor_id " +
                "JOIN Usuarios u ON e.entrada_usuario_id = u.id " +
                "WHERE e.entrada_estado = 'pendiente'";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Entradas entrada = new Entradas();
                entrada.setEntrada_id(rs.getInt("entrada_id"));
                entrada.setEntrada_folio(rs.getString("entrada_folio"));
                entrada.setEntrada_fecha(rs.getDate("entrada_fecha"));

                // Obtener información del proveedor
                Proveedor proveedor = new Proveedor();
                proveedor.setProveedor_id(rs.getInt("proveedor_id"));
                proveedor.setProveedor_nombre(rs.getString("proveedor_nombre"));
                entrada.setProveedor(proveedor);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre_usuario(rs.getString("nombre"));
                entrada.setUsuario(usuario);

                entrada.setEstado(rs.getString("entrada_estado"));

                // Obtener los detalles asociados
                DetalleEntradaDao detalleDao = new DetalleEntradaDao();
                ArrayList<DetalleEntrada> detalles = detalleDao.getAllByEntradaId(entrada.getEntrada_id());
                entrada.setDetalles(detalles);

                entradasList.add(entrada);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return entradasList;
    }

    public boolean insertEntrada(Entradas entrada) {
        boolean respuesta = false;
        String query = "INSERT INTO Entrada (entrada_folio, entrada_fecha, entrada_proveedor_id, entrada_usuario_id, entrada_usuario_id) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Insertar la entrada
            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, entrada.getEntrada_folio());
            ps.setDate(2, entrada.getEntrada_fecha());
            ps.setInt(3, entrada.getProveedor().getProveedor_id());
            ps.setInt(4, entrada.getUsuario().getId());
            ps.setString(5, entrada.getEstado());

            if (ps.executeUpdate() > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    entrada.setEntrada_id(generatedKeys.getInt(1));

                    // Insertar los detalles asociados
                    DetalleEntradaDao detalleDao = new DetalleEntradaDao();
                    for (DetalleEntrada detalle : entrada.getDetalles()) {
                        detalle.setEntradas(entrada); // Asignar la entrada a cada detalle
                        if (!detalleDao.insertDetalleEntrada(detalle)) {
                            con.rollback();
                            return false;
                        }
                    }
                }
                con.commit();
                respuesta = true;
            } else {
                con.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public boolean updateEntrada(Entradas entrada) {
        boolean respuesta = false;
        String query = "UPDATE Entrada SET entrada_folio = ?, entrada_fecha = ?, entrada_proveedor_id = ?, entrada_usuario_id = ?, entrada_estado = ? WHERE entrada_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Actualizar la entrada
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, entrada.getEntrada_folio());
            ps.setDate(2, entrada.getEntrada_fecha());
            ps.setInt(3, entrada.getProveedor().getProveedor_id());
            ps.setInt(4, entrada.getUsuario().getId());
            ps.setString(5, entrada.getEstado());
            ps.setInt(6, entrada.getEntrada_id());

            if (ps.executeUpdate() > 0) {
                // Actualizar los detalles asociados
                DetalleEntradaDao detalleDao = new DetalleEntradaDao();
                for (DetalleEntrada detalle : entrada.getDetalles()) {
                    detalle.setEntradas(entrada); // Asegurar que los detalles tienen la referencia correcta a la entrada
                    if (!detalleDao.updateDetalleEntrada(detalle)) {
                        con.rollback();
                        return false;
                    }
                }
                con.commit();
                respuesta = true;
            } else {
                con.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public boolean deleteEntrada(int entrada_id) {
        boolean respuesta = false;
        String query = "DELETE FROM Entrada WHERE entrada_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Eliminar los detalles asociados
            DetalleEntradaDao detalleDao = new DetalleEntradaDao();
            if (!detalleDao.deleteByEntradaId(entrada_id)) {
                con.rollback();
                return false;
            }

            // Eliminar la entrada
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, entrada_id);

            if (ps.executeUpdate() > 0) {
                con.commit();
                respuesta = true;
            } else {
                con.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }

    public boolean deleteEntrada(String entrada_folio) {
        boolean respuesta = false;
        String query = "DELETE FROM Entrada WHERE entrada_folio = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Eliminar los detalles asociados
            DetalleEntradaDao detalleDao = new DetalleEntradaDao();
            if (!detalleDao.deleteByEntradaFolio(entrada_folio)) {
                con.rollback();
                return false;
            }

            // Eliminar la entrada
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, entrada_folio);

            if (ps.executeUpdate() > 0) {
                con.commit();
                respuesta = true;
            } else {
                con.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return respuesta;
    }
}
