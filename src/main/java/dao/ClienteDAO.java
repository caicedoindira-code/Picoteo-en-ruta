package dao;

import database.ConexionBD;
import model.Cliente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    public List<Cliente> listarClientes() {
        List<Cliente> clientes = new ArrayList<>();

        String sql = "SELECT ID_Cliente, nombreCliente, apellidoCliente, telefono, email FROM cliente";

        try (Connection conexion = ConexionBD.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Cliente cliente = new Cliente(
                        rs.getInt("ID_Cliente"),
                        rs.getString("nombreCliente"),
                        rs.getString("apellidoCliente"),
                        rs.getString("telefono"),
                        rs.getString("email")
                );

                clientes.add(cliente);
            }

        } catch (SQLException e) {
            System.out.println("Error al listar clientes: " + e.getMessage());
        }

        return clientes;
    }

    public void insertarCliente(Cliente cliente) {
        String sql = "INSERT INTO cliente (nombreCliente, apellidoCliente, telefono, email) VALUES (?, ?, ?, ?)";

        try (Connection conexion = ConexionBD.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, cliente.getNombreCliente());
            ps.setString(2, cliente.getApellidoCliente());
            ps.setString(3, cliente.getTelefono());
            ps.setString(4, cliente.getEmail());

            ps.executeUpdate();

            System.out.println("Cliente añadido correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al insertar cliente: " + e.getMessage());
        }
    }

    public Cliente buscarClientePorId(int idCliente) {
        String sql = "SELECT ID_Cliente, nombreCliente, apellidoCliente, telefono, email FROM cliente WHERE ID_Cliente = ?";
        Cliente cliente = null;

        try (Connection conexion = ConexionBD.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setInt(1, idCliente);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cliente = new Cliente(
                            rs.getInt("ID_Cliente"),
                            rs.getString("nombreCliente"),
                            rs.getString("apellidoCliente"),
                            rs.getString("telefono"),
                            rs.getString("email")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Error al buscar cliente: " + e.getMessage());
        }

        return cliente;
    }

    public void actualizarCliente(Cliente cliente) {
        String sql = "UPDATE cliente SET nombreCliente = ?, apellidoCliente = ?, telefono = ?, email = ? WHERE ID_Cliente = ?";

        try (Connection conexion = ConexionBD.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, cliente.getNombreCliente());
            ps.setString(2, cliente.getApellidoCliente());
            ps.setString(3, cliente.getTelefono());
            ps.setString(4, cliente.getEmail());
            ps.setInt(5, cliente.getIdCliente());

            int filasActualizadas = ps.executeUpdate();

            if (filasActualizadas > 0) {
                System.out.println("Cliente actualizado correctamente.");
            } else {
                System.out.println("No se encontró ningún cliente con ese ID.");
            }

        } catch (SQLException e) {
            System.out.println("Error al actualizar cliente: " + e.getMessage());
        }
    }

    public void eliminarCliente(int idCliente) {
        String sql = "DELETE FROM cliente WHERE ID_Cliente = ?";

        try (Connection conexion = ConexionBD.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setInt(1, idCliente);

            int filasEliminadas = ps.executeUpdate();

            if (filasEliminadas > 0) {
                System.out.println("Cliente eliminado correctamente.");
            } else {
                System.out.println("No se encontró ningún cliente con ese ID.");
            }

        } catch (SQLException e) {
            System.out.println("Error al eliminar cliente: " + e.getMessage());
        }
    }
}