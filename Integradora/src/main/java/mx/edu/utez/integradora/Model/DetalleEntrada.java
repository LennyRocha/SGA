package mx.edu.utez.integradora.Model;

import java.io.Serializable;

public class DetalleEntrada implements Serializable {
    private int detalle_id;
    private Entradas entradas;
    private Producto productos;
    private int cantidad;
    private double valor_total;

    public DetalleEntrada() {

    }

    public DetalleEntrada(int detalle_id, Entradas entradas, Producto productos, int cantidad, double valor_total){
        this.detalle_id = detalle_id;
        this.entradas = entradas;
        this.productos = productos;
        this.cantidad = cantidad;
        this.valor_total = valor_total;
    }
    public int getDetalle_id() {
        return detalle_id;
    }
    public void setDetalle_id(int detalle_id) {
        this.detalle_id = detalle_id;
    }

    public Entradas getEntradas() {
        return entradas;
    }
    public void setEntradas(Entradas entradas) {
        this.entradas = entradas;
    }

    public Producto getProductos() {
        return productos;
    }
    public void setProductos(Producto productos) {
        this.productos = productos;
    }

    public int getCantidad() {
        return cantidad;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getValor_total() {
        return valor_total;
    }
    public void setValor_total(double valor_total) {
        this.valor_total = valor_total;
    }
}
