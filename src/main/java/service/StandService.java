package service;

import dao.StandDAO;
import model.Stand;

import java.util.List;

public class StandService {

    private final StandDAO standDAO = new StandDAO();

    public List<Stand> listarStands() {
        return standDAO.listarStands();
    }

    public Stand buscarStandPorId(int idStand) {
        return standDAO.buscarStandPorId(idStand);
    }

    public void insertarStand(Stand stand) {
        if (validarStand(stand)) {
            standDAO.insertarStand(stand);
        }
    }

    public void actualizarStand(Stand stand) {
        if (validarStand(stand)) {
            standDAO.actualizarStand(stand);
        }
    }

    public void eliminarStand(int idStand) {
        standDAO.eliminarStand(idStand);
    }

    private boolean validarStand(Stand stand) {
        if (!nombreStandValido(stand.getNombreStand())) {
            System.out.println("Error: el nombre del stand no es válido.");
            return false;
        }

        if (!categoriaValida(stand.getCategoria())) {
            System.out.println("Error: la categoría debe ser dulce, salado o bebidas.");
            return false;
        }

        if (stand.getPrecioBase() < 0) {
            System.out.println("Error: el precio base no puede ser negativo.");
            return false;
        }

        if (!estadoValido(stand.getEstado())) {
            System.out.println("Error: el estado debe ser disponible, ocupado, mantenimiento o inactivo.");
            return false;
        }

        return true;
    }

    private boolean nombreStandValido(String nombreStand) {
        return nombreStand.equals("Coctelería") ||
                nombreStand.equals("Frutas y batidos") ||
                nombreStand.equals("Café e infusiones") ||
                nombreStand.equals("Arepera") ||
                nombreStand.equals("Sushi") ||
                nombreStand.equals("Hot Pot") ||
                nombreStand.equals("Barbacoa") ||
                nombreStand.equals("Quesos y embutidos") ||
                nombreStand.equals("Helados") ||
                nombreStand.equals("Postres") ||
                nombreStand.equals("Gofres y Creps");
    }

    private boolean categoriaValida(String categoria) {
        return categoria.equals("dulce") ||
                categoria.equals("salado") ||
                categoria.equals("bebidas");
    }

    private boolean estadoValido(String estado) {
        return estado.equals("disponible") ||
                estado.equals("ocupado") ||
                estado.equals("mantenimiento") ||
                estado.equals("inactivo");
    }
}