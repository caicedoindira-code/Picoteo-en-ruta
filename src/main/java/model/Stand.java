package model;

public class Stand {

    private int idStand;
    private String nombreStand;
    private String categoria;
    private double precioBase;
    private String estado;
    private Integer idEmpleado;

    public Stand() {
    }

    public Stand(int idStand, String nombreStand, String categoria, double precioBase, String estado, Integer idEmpleado) {
        this.idStand = idStand;
        this.nombreStand = nombreStand;
        this.categoria = categoria;
        this.precioBase = precioBase;
        this.estado = estado;
        this.idEmpleado = idEmpleado;
    }

    public Stand(String nombreStand, String categoria, double precioBase, String estado, Integer idEmpleado) {
        this.nombreStand = nombreStand;
        this.categoria = categoria;
        this.precioBase = precioBase;
        this.estado = estado;
        this.idEmpleado = idEmpleado;
    }

    public int getIdStand() {
        return idStand;
    }

    public void setIdStand(int idStand) {
        this.idStand = idStand;
    }

    public String getNombreStand() {
        return nombreStand;
    }

    public void setNombreStand(String nombreStand) {
        this.nombreStand = nombreStand;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(double precioBase) {
        this.precioBase = precioBase;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Integer getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(Integer idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    @Override
    public String toString() {
        return "ID: " + idStand +
                " | Stand: " + nombreStand +
                " | Categoría: " + categoria +
                " | Precio base: " + precioBase +
                " € | Estado: " + estado +
                " | ID empleado: " + idEmpleado;
    }
}