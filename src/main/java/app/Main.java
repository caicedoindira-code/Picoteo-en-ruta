package app;

import service.ClienteService;
import service.StandService;
import model.Cliente;
import model.Stand;

import java.util.List;
import java.util.Scanner;

public class Main {

    private static final Scanner scanner = new Scanner(System.in);
    private static final ClienteService clienteService = new ClienteService();
    private static final StandService standService = new StandService();

    public static void main(String[] args) {

        int opcion;

        do {
            mostrarMenuPrincipal();
            opcion = leerEntero("Elige una opción: ");

            switch (opcion) {
                case 1:
                    menuClientes();
                    break;
                case 2:
                    menuStands();
                    break;
                case 0:
                    System.out.println("Saliendo de Picoteo en Ruta...");
                    break;
                default:
                    System.out.println("Opción no válida.");
            }

        } while (opcion != 0);
    }

    private static void mostrarMenuPrincipal() {
        System.out.println("\n===== PICOTEO EN RUTA =====");
        System.out.println("1. Gestionar clientes");
        System.out.println("2. Gestionar stands");
        System.out.println("0. Salir");
    }

    // =========================
    // MENÚ CLIENTES
    // =========================

    private static void menuClientes() {
        int opcion;

        do {
            mostrarMenuClientes();
            opcion = leerEntero("Elige una opción: ");

            switch (opcion) {
                case 1:
                    agregarCliente();
                    break;
                case 2:
                    listarClientes();
                    break;
                case 3:
                    buscarCliente();
                    break;
                case 4:
                    modificarCliente();
                    break;
                case 5:
                    eliminarCliente();
                    break;
                case 0:
                    System.out.println("Volviendo al menú principal...");
                    break;
                default:
                    System.out.println("Opción no válida.");
            }

        } while (opcion != 0);
    }

    private static void mostrarMenuClientes() {
        System.out.println("\n===== GESTIÓN DE CLIENTES =====");
        System.out.println("1. Añadir cliente");
        System.out.println("2. Listar clientes");
        System.out.println("3. Buscar cliente por ID");
        System.out.println("4. Modificar cliente");
        System.out.println("5. Eliminar cliente");
        System.out.println("0. Volver al menú principal");
    }

    private static void agregarCliente() {
        System.out.println("\n--- AÑADIR CLIENTE ---");

        String nombre = leerTexto("Nombre: ");
        String apellido = leerTexto("Apellido: ");
        String telefono = leerTexto("Teléfono: ");
        String email = leerTexto("Email: ");

        Cliente cliente = new Cliente(nombre, apellido, telefono, email);
        clienteService.insertarCliente(cliente);
    }

    private static void listarClientes() {
        System.out.println("\n--- LISTADO DE CLIENTES ---");

        List<Cliente> clientes = clienteService.listarClientes();

        if (clientes.isEmpty()) {
            System.out.println("No hay clientes registrados.");
        } else {
            for (Cliente cliente : clientes) {
                System.out.println(cliente);
            }
        }
    }

    private static void buscarCliente() {
        System.out.println("\n--- BUSCAR CLIENTE ---");

        int idCliente = leerEntero("Introduce el ID del cliente: ");
        Cliente cliente = clienteService.buscarClientePorId(idCliente);

        if (cliente != null) {
            System.out.println(cliente);
        } else {
            System.out.println("No se encontró ningún cliente con ese ID.");
        }
    }

    private static void modificarCliente() {
        System.out.println("\n--- MODIFICAR CLIENTE ---");

        int idCliente = leerEntero("Introduce el ID del cliente a modificar: ");
        Cliente clienteExistente = clienteService.buscarClientePorId(idCliente);

        if (clienteExistente == null) {
            System.out.println("No existe ningún cliente con ese ID.");
            return;
        }

        String nombre = leerTexto("Nuevo nombre: ");
        String apellido = leerTexto("Nuevo apellido: ");
        String telefono = leerTexto("Nuevo teléfono: ");
        String email = leerTexto("Nuevo email: ");

        Cliente clienteActualizado = new Cliente(idCliente, nombre, apellido, telefono, email);
        clienteService.actualizarCliente(clienteActualizado);
    }

    private static void eliminarCliente() {
        System.out.println("\n--- ELIMINAR CLIENTE ---");

        int idCliente = leerEntero("Introduce el ID del cliente a eliminar: ");
        Cliente clienteExistente = clienteService.buscarClientePorId(idCliente);

        if (clienteExistente == null) {
            System.out.println("No existe ningún cliente con ese ID.");
            return;
        }

        System.out.println("Cliente encontrado:");
        System.out.println(clienteExistente);

        String confirmacion = leerTexto("¿Seguro que quieres eliminarlo? (s/n): ");

        if (confirmacion.equalsIgnoreCase("s")) {
            clienteService.eliminarCliente(idCliente);
        } else {
            System.out.println("Eliminación cancelada.");
        }
    }

    // =========================
    // MENÚ STANDS
    // =========================

    private static void menuStands() {
        int opcion;

        do {
            mostrarMenuStands();
            opcion = leerEntero("Elige una opción: ");

            switch (opcion) {
                case 1:
                    agregarStand();
                    break;
                case 2:
                    listarStands();
                    break;
                case 3:
                    buscarStand();
                    break;
                case 4:
                    modificarStand();
                    break;
                case 5:
                    eliminarStand();
                    break;
                case 0:
                    System.out.println("Volviendo al menú principal...");
                    break;
                default:
                    System.out.println("Opción no válida.");
            }

        } while (opcion != 0);
    }

    private static void mostrarMenuStands() {
        System.out.println("\n===== GESTIÓN DE STANDS =====");
        System.out.println("1. Añadir stand");
        System.out.println("2. Listar stands");
        System.out.println("3. Buscar stand por ID");
        System.out.println("4. Modificar stand");
        System.out.println("5. Eliminar stand");
        System.out.println("0. Volver al menú principal");
    }

    private static void agregarStand() {
        System.out.println("\n--- AÑADIR STAND ---");

        mostrarValoresPermitidosStand();

        String nombreStand = leerTexto("Nombre del stand: ");
        String categoria = leerTexto("Categoría: ");
        double precioBase = leerDouble("Precio base: ");
        String estado = leerTexto("Estado: ");

        String empleadoTexto = leerTexto("ID empleado, deja vacío si no tiene: ");

        Integer idEmpleado = null;

        if (!empleadoTexto.isBlank()) {
            try {
                idEmpleado = Integer.parseInt(empleadoTexto);
            } catch (NumberFormatException e) {
                System.out.println("ID empleado no válido. Se guardará como vacío.");
            }
        }

        Stand stand = new Stand(nombreStand, categoria, precioBase, estado, idEmpleado);
        standService.insertarStand(stand);
    }

    private static void listarStands() {
        System.out.println("\n--- LISTADO DE STANDS ---");

        List<Stand> stands = standService.listarStands();

        if (stands.isEmpty()) {
            System.out.println("No hay stands registrados.");
        } else {
            for (Stand stand : stands) {
                System.out.println(stand);
            }
        }
    }

    private static void buscarStand() {
        System.out.println("\n--- BUSCAR STAND ---");

        int idStand = leerEntero("Introduce el ID del stand: ");
        Stand stand = standService.buscarStandPorId(idStand);

        if (stand != null) {
            System.out.println(stand);
        } else {
            System.out.println("No se encontró ningún stand con ese ID.");
        }
    }

    private static void modificarStand() {
        System.out.println("\n--- MODIFICAR STAND ---");

        int idStand = leerEntero("Introduce el ID del stand a modificar: ");
        Stand standExistente = standService.buscarStandPorId(idStand);

        if (standExistente == null) {
            System.out.println("No existe ningún stand con ese ID.");
            return;
        }

        System.out.println("Stand actual:");
        System.out.println(standExistente);

        mostrarValoresPermitidosStand();

        String nombreStand = leerTexto("Nuevo nombre del stand: ");
        String categoria = leerTexto("Nueva categoría: ");
        double precioBase = leerDouble("Nuevo precio base: ");
        String estado = leerTexto("Nuevo estado: ");

        String empleadoTexto = leerTexto("Nuevo ID empleado, deja vacío si no tiene: ");

        Integer idEmpleado = null;

        if (!empleadoTexto.isBlank()) {
            try {
                idEmpleado = Integer.parseInt(empleadoTexto);
            } catch (NumberFormatException e) {
                System.out.println("ID empleado no válido. Se guardará como vacío.");
            }
        }

        Stand standActualizado = new Stand(idStand, nombreStand, categoria, precioBase, estado, idEmpleado);
        standService.actualizarStand(standActualizado);
    }

    private static void eliminarStand() {
        System.out.println("\n--- ELIMINAR STAND ---");

        int idStand = leerEntero("Introduce el ID del stand a eliminar: ");
        Stand standExistente = standService.buscarStandPorId(idStand);

        if (standExistente == null) {
            System.out.println("No existe ningún stand con ese ID.");
            return;
        }

        System.out.println("Stand encontrado:");
        System.out.println(standExistente);

        String confirmacion = leerTexto("¿Seguro que quieres eliminarlo? (s/n): ");

        if (confirmacion.equalsIgnoreCase("s")) {
            standService.eliminarStand(idStand);
        } else {
            System.out.println("Eliminación cancelada.");
        }
    }

    private static void mostrarValoresPermitidosStand() {
        System.out.println("\nValores permitidos:");
        System.out.println("Nombre stand: Coctelería, Frutas y batidos, Café e infusiones, Arepera, Sushi, Hot Pot, Barbacoa, Quesos y embutidos, Helados, Postres, Gofres y Creps");
        System.out.println("Categoría: dulce, salado, bebidas");
        System.out.println("Estado: disponible, ocupado, mantenimiento, inactivo");
        System.out.println();
    }

    // =========================
    // MÉTODOS AUXILIARES
    // =========================

    private static String leerTexto(String mensaje) {
        System.out.print(mensaje);
        return scanner.nextLine();
    }

    private static int leerEntero(String mensaje) {
        while (true) {
            try {
                System.out.print(mensaje);
                return Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Introduce un número válido.");
            }
        }
    }

    private static double leerDouble(String mensaje) {
        while (true) {
            try {
                System.out.print(mensaje);
                return Double.parseDouble(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Introduce un número decimal válido.");
            }
        }
    }
}