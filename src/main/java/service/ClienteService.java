package service;

import dao.ClienteDAO;
import model.Cliente;

import java.util.List;

public class ClienteService {

    private final ClienteDAO clienteDAO = new ClienteDAO();

    public List<Cliente> listarClientes() {
        return clienteDAO.listarClientes();
    }

    public Cliente buscarClientePorId(int idCliente) {
        return clienteDAO.buscarClientePorId(idCliente);
    }

    public void insertarCliente(Cliente cliente) {
        if (validarCliente(cliente)) {
            clienteDAO.insertarCliente(cliente);
        }
    }

    public void actualizarCliente(Cliente cliente) {
        if (validarCliente(cliente)) {
            clienteDAO.actualizarCliente(cliente);
        }
    }

    public void eliminarCliente(int idCliente) {
        clienteDAO.eliminarCliente(idCliente);
    }

    private boolean validarCliente(Cliente cliente) {
        if (cliente.getNombreCliente().isBlank()) {
            System.out.println("Error: el nombre no puede estar vacío.");
            return false;
        }

        if (cliente.getApellidoCliente().isBlank()) {
            System.out.println("Error: el apellido no puede estar vacío.");
            return false;
        }

        if (cliente.getTelefono().isBlank()) {
            System.out.println("Error: el teléfono no puede estar vacío.");
            return false;
        }

        if (!emailValido(cliente.getEmail())) {
            System.out.println("Error: el email no tiene un formato válido.");
            return false;
        }

        return true;
    }

    private boolean emailValido(String email) {
        return email != null &&
                email.contains("@") &&
                email.contains(".");
    }
}