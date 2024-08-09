package mx.edu.utez.integradora.Model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Salidas implements Serializable {
    private int salida_id;
    private int salida_folio;
    ArrayList<Producto> productos;
    private Usuario usuarios;
    private int salida_cantidad;
    private Timestamp salida_fecha;
    private Areas areas;
    private String estado_salida;
    private Double salida_valor_total;

    public Salidas() {

    }

    public Salidas(int salida_id, int salida_folio, ArrayList<Producto> productos, Usuario usuarios, int salida_cantidad, Timestamp salida_fecha, Areas areas, String estado_salida, Double salida_valor_total) {
        this.salida_id = salida_id;
        this.salida_folio = salida_folio;
        this.productos = productos;
        this.usuarios = usuarios;
        this.salida_cantidad = salida_cantidad;
        this.salida_fecha = salida_fecha;
        this.areas = areas;
        this.estado_salida = estado_salida;
        this.salida_valor_total = salida_valor_total;
    }

    public void setSalida_id(int salida_id) {
        this.salida_id = salida_id;
    }
    public int getSalida_id() {
        return salida_id;
    }

    public void setSalida_folio(int salida_folio) {
        this.salida_folio = salida_folio;
    }
    public int getSalida_folio() {
        return salida_folio;
    }

    public void setProductos(ArrayList<Producto> productos) {
        this.productos = productos;
    }
    public ArrayList<Producto> getProductos() {
        return productos;
    }

    public void setUsuarios(Usuario usuarios) {
        this.usuarios = usuarios;
    }
    public Usuario getUsuarios() {
        return usuarios;
    }

    public void setSalida_cantidad(int salida_cantidad) {
        this.salida_cantidad = salida_cantidad;
    }
    public int getSalida_cantidad() {
        return salida_cantidad;
    }

    public void setSalida_fecha(Timestamp salida_fecha) {
        this.salida_fecha = salida_fecha;
    }
    public Timestamp getSalida_fecha() {
        return salida_fecha;
    }

    public void setAreas(Areas areas) {
        this.areas = areas;
    }
    public Areas getAreas() {
        return areas;
    }

    public void setSalida_valor_total(Double salida_valor_total) {
        this.salida_valor_total = salida_valor_total;
    }
    public Double getSalida_valor_total() {
        return salida_valor_total;
    }

    public void setEstado_salida(String estado_salida) {
        this.estado_salida = estado_salida;
    }
    public String getEstado_salida() {
        return estado_salida;
    }

}
