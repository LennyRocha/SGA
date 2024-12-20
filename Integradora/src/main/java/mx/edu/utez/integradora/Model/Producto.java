package mx.edu.utez.integradora.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Producto implements Serializable {
    private int producto_id;
    private String producto_nombre;
    private double producto_precio;
    private int producto_cantidad;
    private List<Producto> producto_Lista_medida;
    private int unidad_id;

    public Producto(){

    }

    public Producto(int producto_id, String producto_nombre, double producto_precio, int producto_cantidad) {
        this.producto_id = producto_id;
        this.producto_nombre = producto_nombre;
        this.producto_precio = producto_precio;
        this.producto_cantidad = producto_cantidad;
    }

    public Producto(String producto_nombre, double producto_precio, int producto_cantidad) {
        this.producto_nombre = producto_nombre;
        this.producto_precio = producto_precio;
        this.producto_cantidad = producto_cantidad;
    }

    public Producto(String producto_nombre, double producto_precio, int producto_cantidad, int unidad_id) {
        this.producto_nombre = producto_nombre;
        this.producto_precio = producto_precio;
        this.producto_cantidad = producto_cantidad;
        this.unidad_id = unidad_id;
    }

    public Producto(ArrayList<Producto> producto_Lista_medida) {
        this.producto_Lista_medida = producto_Lista_medida;
    }

    public Producto(String producto_nombre, int unidad_id) {
        this.producto_nombre = producto_nombre;
        this.unidad_id = unidad_id;
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

    public int getProducto_cantidad() {
        return producto_cantidad;
    }
    public void setProducto_cantidad(int producto_cantidad) {
        this.producto_cantidad = producto_cantidad;
    }

    public int getUnidad_id() {return unidad_id;}
    public void setUnidad_id(int unidad_id) {this.unidad_id = unidad_id;}

    public List<Producto> getProducto_Lista_medida() {
        return producto_Lista_medida;
    }

    public void setProducto_Lista_medida(List<Producto> producto_Lista_medida) {
        this.producto_Lista_medida = producto_Lista_medida;
    }
}