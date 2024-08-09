package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.DetalleEntrada;
import mx.edu.utez.integradora.Model.Entradas;
import mx.edu.utez.integradora.Model.Proveedor;
import mx.edu.utez.integradora.Model.Usuario;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.lang.String;

public class EntradasDao {

    public Entradas getOne(int entrada_id) {
        Entradas entrada = new Entradas();
        String query = "SELECT e.*, p.*, u.* " +
                "FROM Entradas e " +
                "JOIN Proveedor p ON e.proveedor_id = p.proveedor_id " +
                "JOIN Usuario u ON e.usuario_id = u.usuario_id " +
                "WHERE e.entrada_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, entrada_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                entrada.setEntrada_id(rs.getInt("entrada_id"));
                entrada.setEntrada_folio(rs.getInt("entrada_folio"));
                entrada.setEntrada_fecha(rs.getTimestamp("entrada_fecha"));

                // Obtener información del proveedor
                Proveedor proveedor = new Proveedor();
                proveedor.setProveedor_id(rs.getInt("proveedor_id"));
                proveedor.setProveedor_nombre(rs.getString("proveedor_nombre"));
                entrada.setProveedor(proveedor);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usuario_id"));
                usuario.setNombre_usuario(rs.getString("usuario_nombre"));
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

    public ArrayList<Entradas> getAll() {
        ArrayList<Entradas> entradasList = new ArrayList<>();
        String query = "SELECT e.*, p.*, u.* " +
                "FROM Entradas e " +
                "JOIN Proveedor p ON e.proveedor_id = p.proveedor_id " +
                "JOIN Usuario u ON e.usuario_id = u.usuario_id";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Entradas entrada = new Entradas();
                entrada.setEntrada_id(rs.getInt("entrada_id"));
                entrada.setEntrada_folio(rs.getInt("entrada_folio"));
                entrada.setEntrada_fecha(rs.getTimestamp("entrada_fecha"));

                // Obtener información del proveedor
                Proveedor proveedor = new Proveedor();
                proveedor.setProveedor_id(rs.getInt("proveedor_id"));
                proveedor.setProveedor_nombre(rs.getString("proveedor_nombre"));
                entrada.setProveedor(proveedor);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usuario_id"));
                usuario.setNombre_usuario(rs.getString("usuario_nombre"));
                entrada.setUsuario(usuario);

                entrada.setEstado(rs.getString("estado"));

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
        String query = "INSERT INTO Entradas (entrada_folio, entrada_fecha, proveedor, usuario, estado) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Insertar la entrada
            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, entrada.getEntrada_folio());
            ps.setTimestamp(2, entrada.getEntrada_fecha());
            ps.setInt(3, entrada.getProveedor().getProveedor_id());
            ps.setInt(4, entrada.getUsuario().getId());
            ps.setString(5, String.valueOf(entrada.getEstado()));

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
        String query = "UPDATE Entradas SET entrada_folio = ?, entrada_fecha = ?, proveedor_id = ?, usuario_id = ?, estado = ? WHERE entrada_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Actualizar la entrada
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, entrada.getEntrada_folio());
            ps.setTimestamp(2, entrada.getEntrada_fecha());
            ps.setInt(3, entrada.getProveedor().getProveedor_id());
            ps.setInt(4, entrada.getUsuario().getId());
            ps.setString(5, String.valueOf(entrada.getEstado()));
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
        String query = "DELETE FROM Entradas WHERE entrada_id = ?";

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
}