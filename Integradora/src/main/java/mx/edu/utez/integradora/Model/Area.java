package mx.edu.utez.integradora.Model;

import java.io.Serializable;

public class Area implements Serializable {

    private int area_id;
    private String area_nombre;
    private char area_identidad;

    public Area() {}

    public Area(int area_id, String area_nombre, char area_identidad) {
        this.area_id = area_id;
        this.area_nombre = area_nombre;
        this.area_identidad = area_identidad;
    }

    public Area(String area_nombre, char area_identidad) {
        this.area_nombre = area_nombre;
        this.area_identidad = area_identidad;
    }

    public int getArea_id() {
        return area_id;
    }
    public void setArea_id(int area_id) {
        this.area_id = area_id;
    }
    public String getArea_nombre() {
        return area_nombre;
    }
    public void setArea_nombre(String area_nombre) {
        this.area_nombre = area_nombre;
    }
    public char getArea_identidad() {
        return area_identidad;
    }
    public String getArea_ident(char area_identidad) {
        return String.valueOf(area_identidad);
    }
    public void setArea_identidad(String area_identidad) {
        this.area_identidad = area_identidad.charAt(0);
    }
}
