package mx.edu.utez.integradora.Model;

import java.io.Serializable;

public class Producto implements Serializable {
    private int producto_id;
    private String producto_nombre;
    private double producto_precio;
    private UnidMed producto_unidad_medida;
    private int producto_cantidad;

    public Producto(){

    }

    public Producto(int producto_id, String producto_nombre, double producto_precio, UnidMed producto_unidad_medida, int producto_cantidad) {
        this.producto_id = producto_id;
        this.producto_nombre = producto_nombre;
        this.producto_precio = producto_precio;
        this.producto_unidad_medida = producto_unidad_medida;
        this.producto_cantidad = producto_cantidad;
    }

    public int getProducto_id() {
        return producto_id;
    }
    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public String getProducto_nombre() {
        return producto_nombre;
    }
    public void setProducto_nombre(String producto_nombre) {
        this.producto_nombre = producto_nombre;
    }

    public double getProducto_precio() {
        return producto_precio;
    }
    public void setProducto_precio(double producto_precio) {
        this.producto_precio = producto_precio;
    }

    public int getProducto_unidad_medida() {
        return producto_unidad_medida.getUnidad_id();
    }
    public void setProducto_unidad_medida(UnidMed producto_unidad_medida) {
        this.producto_unidad_medida = producto_unidad_medida;
    }

    public int getProducto_cantidad() {
        return producto_cantidad;
    }
    public void setProducto_cantidad(int producto_cantidad) {
        this.producto_cantidad = producto_cantidad;
    }


}