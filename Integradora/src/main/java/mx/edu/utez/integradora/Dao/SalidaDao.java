package mx.edu.utez.integradora.Dao;

import mx.edu.utez.integradora.Model.*;
import mx.edu.utez.integradora.Utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;

public class SalidaDao {

    public Salidas getOne(int salida_id) {
        Salidas salida = null;
        String query = "SELECT s.salida_id, s.salida_folio, s.salida_fecha, s.salida_estado, " +
                "asa.area_id, asa.area_nombre, asa.area_identidad, " +
                "u.usuario_id, u.usuario_nombre " +
                "FROM Salidas s " +
                "JOIN area_salida asa ON s.salida_area_id = asa.area_id " +
                "JOIN Usuario u ON s.salida_usuario_id = u.usuario_id " +
                "WHERE s.salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, salida_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                salida = new Salidas();
                salida.setSalida_id(rs.getInt("salida_id"));
                salida.setSalida_folio(rs.getInt("salida_folio"));
                salida.setSalida_fecha(rs.getTimestamp("salida_fecha"));
                salida.setSalida_estado(rs.getString("salida_estado"));

                // Obtener información del area
                Areas area = new Areas();
                area.setArea_id(rs.getInt("area_id"));
                area.setArea_nombre(rs.getString("area_nombre"));
                area.setArea_identidad(rs.getString("area_identidad"));
                salida.setAreas(area);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usuario_id"));
                usuario.setNombre_usuario(rs.getString("usuario_nombre"));
                salida.setUsuarios(usuario);

                // Obtener los detalles asociados
                DetalleSalidaDao detallesDao = new DetalleSalidaDao();
                ArrayList<DetalleSalida> detalles = detallesDao.getAllBySalidaId(salida_id);
                salida.setDetalleSalida(detalles);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salida;
    }

    public ArrayList<Salidas> getAll() {
        ArrayList<Salidas> salidasList = new ArrayList<>();
        String query = "SELECT s.salida_id, s.salida_folio, s.salida_fecha, s.salida_estado, " +
                "asa.area_id, asa.area_nombre, asa.area_identidad, " +
                "u.usuario_id, u.usuario_nombre " +
                "FROM Salidas s " +
                "JOIN area_salida asa ON s.salida_area_id = asa.area_id " +
                "JOIN Usuario u ON s.salida_usuario_id = u.usuario_id";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Salidas salida = new Salidas();
                salida.setSalida_id(rs.getInt("salida_id"));
                salida.setSalida_folio(rs.getInt("salida_folio"));
                salida.setSalida_fecha(rs.getTimestamp("salida_fecha"));
                salida.setSalida_estado(rs.getString("salida_estado"));

                // Obtener información del area
                Areas area = new Areas();
                area.setArea_id(rs.getInt("area_id"));
                area.setArea_nombre(rs.getString("area_nombre"));
                area.setArea_identidad(rs.getString("area_identidad"));
                salida.setAreas(area);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usuario_id"));
                usuario.setNombre_usuario(rs.getString("usuario_nombre"));
                salida.setUsuarios(usuario);

                // Obtener los detalles asociados
                DetalleSalidaDao detalleSDao = new DetalleSalidaDao();
                ArrayList<DetalleSalida> detalles = detalleSDao.getAllBySalidaId(salida.getSalida_id());
                salida.setDetalleSalida(detalles);

                salidasList.add(salida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salidasList;
    }

    public ArrayList<Salidas> getAllUnfinished() {
        ArrayList<Salidas> salidasList = new ArrayList<>();
        String query = "SELECT s.salida_id, s.salida_folio, s.salida_fecha, s.salida_estado, " +
                "asa.area_id, asa.area_nombre, asa.area_identidad, " +
                "u.usuario_id, u.usuario_nombre " +
                "FROM Salidas s " +
                "JOIN area_salida asa ON s.salida_area_id = asa.area_id " +
                "JOIN Usuario u ON s.salida_usuario_id = u.usuario_id " +
                "WHERE s.salida_estado = 'pendiente'";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Salidas salida = new Salidas();
                salida.setSalida_id(rs.getInt("salida_id"));
                salida.setSalida_folio(rs.getInt("salida_folio"));
                salida.setSalida_fecha(rs.getTimestamp("salida_fecha"));
                salida.setSalida_estado(rs.getString("salida_estado"));

                // Obtener información del area
                Areas area = new Areas();
                area.setArea_id(rs.getInt("area_id"));
                area.setArea_nombre(rs.getString("area_nombre"));
                area.setArea_identidad(rs.getString("area_identidad"));
                salida.setAreas(area);

                // Obtener información del usuario
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usuario_id"));
                usuario.setNombre_usuario(rs.getString("usuario_nombre"));
                salida.setUsuarios(usuario);

                // Obtener los detalles asociados
                DetalleSalidaDao detalleSDao = new DetalleSalidaDao();
                ArrayList<DetalleSalida> detalles = detalleSDao.getAllBySalidaId(salida.getSalida_id());
                salida.setDetalleSalida(detalles);

                salidasList.add(salida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salidasList;
    }

    public boolean insertSalida(Salidas salida) {
        boolean respuesta = false;
        String query = "INSERT INTO Salidas (salida_folio, salida_fecha, salida_area_id, salida_usuario_id, salida_estado) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Insertar la salida
            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, salida.getSalida_folio());
            ps.setTimestamp(2, salida.getSalida_fecha());
            ps.setInt(3, salida.getAreas().getArea_id());
            ps.setInt(4, salida.getUsuarios().getId());
            ps.setString(5, salida.getSalida_estado());

            if (ps.executeUpdate() > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    salida.setSalida_id(generatedKeys.getInt(1));

                    // Insertar los detalles asociados
                    DetalleSalidaDao detallesDao = new DetalleSalidaDao();
                    for (DetalleSalida detalle : salida.getDetalleSalida()) {
                        detalle.setSalidas(salida); // Asignar la salida a cada detalle
                        if (!detallesDao.insertDetalleSalida(detalle)) {
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
            // Añadir manejo de error más detallado si es necesario
        }

        return respuesta;
    }

    public boolean updateSalida(Salidas salida) {
        boolean respuesta = false;
        String query = "UPDATE Salidas SET salida_folio = ?, salida_fecha = ?, salida_area_id = ?, salida_usuario_id = ?, salida_estado = ? WHERE salida_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            con.setAutoCommit(false);

            // Actualizar la salida
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, salida.getSalida_folio());
            ps.setTimestamp(2, salida.getSalida_fecha());
            ps.setInt(3, salida.getAreas().getArea_id());
            ps.setInt(4, salida.getUsuarios().getId());
            ps.setString(5, salida.getSalida_estado());
            ps.setInt(6, salida.getSalida_id());

            if (ps.executeUpdate() > 0) {
                // Actualizar los detalles asociados
                DetalleSalidaDao detalleSDao = new DetalleSalidaDao();
                for (DetalleSalida detalle : salida.getDetalleSalida()) {
                    detalle.setSalidas(salida); // Asegurar que los detalles tienen la referencia correcta a la salida
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
            // Añadir manejo de error más detallado si es necesario
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

            // Eliminar la salida
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
            // Añadir manejo de error más detallado si es necesario
        }

        return respuesta;
    }
}