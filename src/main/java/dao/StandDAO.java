package dao;

import database.ConexionBD;
import model.Stand;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StandDAO {

    public List<Stand> listarStands() {
        List<Stand> stands = new ArrayList<>();

        String sql = "SELECT ID_Stand, nombreStand, categoria, precioBase, estado, ID_Empleado FROM stand";

        try (Connection conexion = ConexionBD.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Integer idEmpleado = rs.getObject("ID_Empleado") != null
                        ? rs.getInt("ID_Empleado")
                        : null;

                Stand stand = new Stand(
                        rs.getInt("ID_Stand"),
                        rs.getString("nombreStand"),
                        rs.getString("categoria"),
                        rs.getDouble("precioBase"),
                        rs.getString("estado"),
                        idEmpleado
                );

                stands.add(stand);
            }

        } catch (SQLException e) {
            System.out.println("Error al listar stands: " + e.getMessage());
        }

        return stands;
    }

    public void insertarStand(Stand stand) {
        String sql = "INSERT INTO stand (nombreStand, categoria, precioBase, estado, ID_Empleado) VALUES (?, ?, ?, ?, ?)";

        try (Connection conexion = ConexionBD.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, stand.getNombreStand());
            ps.setString(2, stand.getCategoria());
            ps.setDouble(3, stand.getPrecioBase());
            ps.setString(4, stand.getEstado());

            if (stand.getIdEmpleado() != null) {
                ps.setInt(5, stand.getIdEmpleado());
            } else {
                ps.setNull(5, java.sql.Types.INTEGER);
            }

            ps.executeUpdate();

            System.out.println("Stand añadido correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al insertar stand: " + e.getMessage());
        }
    }

    public Stand buscarStandPorId(int idStand) {
        String sql = "SELECT ID_Stand, nombreStand, categoria, precioBase, estado, ID_Empleado FROM stand WHERE ID_Stand = ?";
        Stand stand = null;

        try (Connection conexion = ConexionBD.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setInt(1, idStand);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Integer idEmpleado = rs.getObject("ID_Empleado") != null
                            ? rs.getInt("ID_Empleado")
                            : null;

                    stand = new Stand(
                            rs.getInt("ID_Stand"),
                            rs.getString("nombreStand"),
                            rs.getString("categoria"),
                            rs.getDouble("precioBase"),
                            rs.getString("estado"),
                            idEmpleado
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Error al buscar stand: " + e.getMessage());
        }

        return stand;
    }

    public void actualizarStand(Stand stand) {
        String sql = "UPDATE stand SET nombreStand = ?, categoria = ?, precioBase = ?, estado = ?, ID_Empleado = ? WHERE ID_Stand = ?";

        try (Connection conexion = ConexionBD.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, stand.getNombreStand());
            ps.setString(2, stand.getCategoria());
            ps.setDouble(3, stand.getPrecioBase());
            ps.setString(4, stand.getEstado());

            if (stand.getIdEmpleado() != null) {
                ps.setInt(5, stand.getIdEmpleado());
            } else {
                ps.setNull(5, java.sql.Types.INTEGER);
            }

            ps.setInt(6, stand.getIdStand());

            int filasActualizadas = ps.executeUpdate();

            if (filasActualizadas > 0) {
                System.out.println("Stand actualizado correctamente.");
            } else {
                System.out.println("No se encontró ningún stand con ese ID.");
            }

        } catch (SQLException e) {
            System.out.println("Error al actualizar stand: " + e.getMessage());
        }
    }

    public void eliminarStand(int idStand) {
        String sql = "DELETE FROM stand WHERE ID_Stand = ?";

        try (Connection conexion = ConexionBD.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setInt(1, idStand);

            int filasEliminadas = ps.executeUpdate();

            if (filasEliminadas > 0) {
                System.out.println("Stand eliminado correctamente.");
            } else {
                System.out.println("No se encontró ningún stand con ese ID.");
            }

        } catch (SQLException e) {
            System.out.println("Error al eliminar stand: " + e.getMessage());
        }
    }
}
