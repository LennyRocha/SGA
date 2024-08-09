package mx.edu.utez.integradora.Model;

import java.io.Serializable;

public class UnidMed implements Serializable {

    private int unidad_id;
    private String unidad_nombre;

    public UnidMed() {}

    public UnidMed(int unidad_id, String unidad_nombre) {
        this.unidad_id = unidad_id;
        this.unidad_nombre = unidad_nombre;
    }

    public int getUnidad_id() {
        return unidad_id;
    }
    public void setUnidad_id(int unidad_id) {
        this.unidad_id = unidad_id;
    }

    public String getUnidad_nombre() {
        return unidad_nombre;
    }
    public void setUnidad_nombre(String unidad_nombre) {
        this.unidad_nombre = unidad_nombre;
    }
}
