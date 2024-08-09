package mx.edu.utez.integradora.Model;

import java.io.Serializable;

public class DetalleSalida implements Serializable {
    private int detalle_salida_id;
    private Salidas salidas;
    private Producto productos;
    private int salida_cantidad;
    private double valor_salida;

    public DetalleSalida() {

    }

    public DetalleSalida(int detalle_salida_id, Salidas salidas, Producto productos, int salida_cantidad, double valor_salida){
        this.detalle_salida_id = detalle_salida_id;
        this.salidas = salidas;
        this.productos = productos;
        this.salida_cantidad = salida_cantidad;
        this.valor_salida = valor_salida;
    }
    public int getDetalle_id() {
        return detalle_salida_id;
    }
    public void setDetalle_id(int detalle_id) {
        this.detalle_salida_id = detalle_id;
    }

    public Salidas getSalidas() {
        return salidas;
    }
    public void setSalidas(Salidas salidas) {
        this.salidas = salidas;
    }

    public Producto getProductos() {
        return productos;
    }
    public void setProductos(Producto productos) {
        this.productos = productos;
    }

    public int getCantidad() {
        return salida_cantidad;
    }
    public void setCantidad(int cantidad) {
        this.salida_cantidad = cantidad;
    }

    public double getValor_salida() {
        return valor_salida;
    }
    public void setValor_salida(double valor_salida) {
        this.valor_salida = valor_salida;
    }
}