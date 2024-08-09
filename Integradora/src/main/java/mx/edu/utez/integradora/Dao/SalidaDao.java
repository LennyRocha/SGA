package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.*;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;

public class SalidaDao {

    public Salidas getOne(int entrada_id) {
        Salidas salida = new Salidas();
        String query = "SELECT s.*, asa.*, u.* " +
                "FROM Salidas s " +
                "JOIN area_salida asa ON s.area_id = asa.area_id " +
                "JOIN Usuario u ON s.usuario_id = u.usuario_id " +
                "WHERE s.salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, entrada_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                salida.setSalida_id(rs.getInt("entrada_id"));
                salida.setSalida_folio(rs.getInt("entrada_folio"));
                salida.setSalida_fecha(rs.getTimestamp("entrada_fecha"));

                // Obtener información del area
                Areas aria = new Areas();
                aria.setArea_id(rs.getInt("area_id"));
                aria.setArea_nombre(rs.getString("area_nombre"));
                aria.setArea_identidad(rs.getString("area_identidad"));
                salida.setAreas(aria);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usuario_id"));
                usuario.setNombre_usuario(rs.getString("usuario_nombre"));
                salida.setUsuarios(usuario);
                salida.setEstado_salida(rs.getString("estado"));

                // Obtener los detalles asociados
                DetalleSalidaDao detalleSDao = new DetalleSalidaDao();
                ArrayList<DetalleSalida> detalles = detalleSDao.getAllBySalidaId(salida_id);
                salida.setDetalle(detalles);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salida;
    }

    public ArrayList<Salidas> getAll() {
        ArrayList<Salidas> entradasList = new ArrayList<>();
        String query = "SELECT s.*, asa.*, u.* " +
                "FROM Salidas s " +
                "JOIN area_salida asa ON s.area_id = asa.area_id " +
                "JOIN Usuario u ON s.usuario_id = u.usuario_id ";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Salidas salida = new Salidas();
                salida.setSalida_id(rs.getInt("salida_id"));
                salida.setSalida_folio(rs.getInt("salida_folio"));
                salida.setSalida_fecha(rs.getTimestamp("salida_fecha"));

                // Obtener información del area
                Areas aria = new Areas();
                aria.setArea_id(rs.getInt("area_id"));
                aria.setArea_nombre(rs.getString("area_nombre"));
                aria.setArea_identidad(rs.getString("area_identidad"));
                salida.setAreas(aria);


                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usuario_id"));
                usuario.setNombre_usuario(rs.getString("usuario_nombre"));
                salida.setUsuarios(usuario);

                salida.setEstado_salida(rs.getString("estado"));

                // Obtener los detalles asociados
                DetalleSalidaDao detalleSDao = new DetalleSalidaDao();
                ArrayList<DetalleSalida> detalles = detalleSDao.getAllBySalidaId(salida.getSalida_id());
                salida.setDetalles(detalles);

                entradasList.add(salida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return entradasList;
    }

    public ArrayList<Salidas> getAllUnfinished() {
        ArrayList<Salidas> salidasList = new ArrayList<>();
        String query = "SELECT s.*, asa.*, u.* " +
                "FROM Salidas s " +
                "JOIN area_salida asa ON s.area_id = asa.area_id " +
                "JOIN Usuario u ON s.usuario_id = u.usuario_id "+
                "WHERE s.estado_salida = 'pendiente' ";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Salidas salida = new Salidas();
                salida.setSalida_id(rs.getInt("salida_id"));
                salida.setSalida_folio(rs.getInt("salida_folio"));
                salida.setSalida_fecha(rs.getTimestamp("salida_fecha"));

                // Obtener información del area
                Areas aria = new Areas();
                aria.setArea_id(rs.getInt("area_id"));
                aria.setArea_nombre(rs.getString("area_nombre"));
                aria.setArea_identidad(rs.getString("area_identidad"));
                salida.setAreas(aria);


                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usuario_id"));
                usuario.setNombre_usuario(rs.getString("usuario_nombre"));
                salida.setUsuarios(usuario);

                salida.setEstado_salida(rs.getString("estado"));

                // Obtener los detalles asociados
                DetalleSalidaDao detalleSDao = new DetalleSalidaDao();
                ArrayList<DetalleSalida> detalles = detalleSDao.getAllBySalidaId(salida.getSalida_id());
                salida.setDetalles(detalles);

                salidasList.add(salida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salidasList;
    }

    public boolean insertSalida(Salidas salida) {
        boolean respuesta = false;
        String query = "INSERT INTO Salidas (salida_folio,salida_fecha,area_id,usuario,estado) " +
                "VALUES (?,?,?,?,?)";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Insertar la entrada
            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, salida.getSalida_folio());
            ps.setTimestamp(2, salida.getSalida_fecha());
            ps.setInt(3, salida.getAreas().getArea_id());
            ps.setInt(4, salida.getUsuarios().getId());
            ps.setString(5, String.valueOf(salida.getEstado_salida()));

            if (ps.executeUpdate() > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    salida.setSalida_id(generatedKeys.getInt(1));

                    // Insertar los detalles asociados
                    DetalleSalidaDao detallesDao = new DetalleSalidaDao();
                    for (DetalleSalida detalle : salida.getDetalles()) {
                        detalle.setSalidas(salida); // Asignar la entrada a cada detalle
                        if (!detalleSDao.insertDetalleSalida(detalle)) {
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

    public boolean updateSalida(Salidas salida) {
        boolean respuesta = false;
        String query = "UPDATE Salidas SET salid_folio = ?, salida_fecha = ?, area_id = ?, usuario_id = ?, estado = ? WHERE salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Actualizar la entrada
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, salida.getSalida_folio());
            ps.setTimestamp(2, salida.getSalida_fecha());
            ps.setInt(3, salida.getAreas().getArea_id());
            ps.setInt(4, salida.getUsuarios().getId());
            ps.setString(5, String.valueOf(salida.getEstado_salida()));
            ps.setInt(6, salida.getSalida_id());

            if (ps.executeUpdate() > 0) {
                // Actualizar los detalles asociados
                DetalleSalidaDao detalleSDao = new DetalleSalidaDao();
                for (DetalleSalida detalle : salida.getDetalles()) {
                    detalle.setSalidas(salida); // Asegurar que los detalles tienen la referencia correcta a la entrada
                    if (!detalleSDao.updateDetalleSalida(detalle)) {
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

    public boolean deleteSalida(int salida_id) {
        boolean respuesta = false;
        String query = "DELETE FROM Salidas WHERE salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Eliminar los detalles asociados
            DetalleSalidaDao detalleSDao = new DetalleSalidaDao();
            if (!detalleSDao.deleteBySalidaId(salida_id)) {
                con.rollback();
                return false;
            }

            // Eliminar la entrada
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, salida_id);

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
