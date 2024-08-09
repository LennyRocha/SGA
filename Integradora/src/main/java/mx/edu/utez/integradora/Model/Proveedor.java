package mx.edu.utez.integradora.Model;

import java.io.Serializable;

public class Proveedor implements Serializable {

    private String proveedor_nombre;
    private int proveedor_id;

    public Proveedor() {}

    public Proveedor(String proveedor_nombre, int proveedor_id) {
        this.proveedor_nombre = proveedor_nombre;
        this.proveedor_id = proveedor_id;
    }

    public Proveedor(String proveedor_nombre) {
        this.proveedor_nombre = proveedor_nombre;
    }

    public Proveedor(int proveedor_id) {
        this.proveedor_id = proveedor_id;
    }

    public String getProveedor_nombre() {
        return proveedor_nombre;
    }
    public void setProveedor_nombre(String proveedor_nombre) {
        this.proveedor_nombre = proveedor_nombre;
    }
    public int getProveedor_id() {
        return proveedor_id;
    }
    public void setProveedor_id(int proveedor_id) {
        this.proveedor_id = proveedor_id;
    }
}
