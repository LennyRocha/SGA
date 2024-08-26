package mx.edu.utez.integradora.Model;

import java.io.Serializable;

public class DetalleSalida implements Serializable {
    private int detalle_salida_id;
    private Salidas salidas;
    private Producto productos_salida;
    private int salida_cantidad;
    private UnidMed unidad_medida;
    private double valor_salida;

    public DetalleSalida() {

    }

    public DetalleSalida(int detalle_salida_id, Salidas salidas, Producto productos_salida, int salida_cantidad, UnidMed unidad_medida, double valor_salida){
        this.detalle_salida_id = detalle_salida_id;
        this.salidas = salidas;
        this.productos_salida = productos_salida;
        this.salida_cantidad = salida_cantidad;
        this.unidad_medida = unidad_medida;
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

    public Producto getProductos_salida() {
        return productos_salida;
    }
    public void setProductos_salida(Producto productos_salida) {
        this.productos_salida = productos_salida;
    }

    public int getCantidad() {
        return salida_cantidad;
    }
    public void setCantidad(int cantidad) {
        this.salida_cantidad = cantidad;
    }

    public UnidMed getUnidad_medida() {
        return unidad_medida;
    }
    public void setUnidad_medida(String unidad_medida) {
        this.unidad_medida = unidad_medida;
    }

    public double getValor_salida() {
        return valor_salida;
    }
    public void setValor_salida(double valor_salida) {
        this.valor_salida = valor_salida;
    }
}