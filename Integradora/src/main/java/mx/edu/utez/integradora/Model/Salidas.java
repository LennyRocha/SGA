package mx.edu.utez.integradora.Model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Salidas implements Serializable {
    private int salida_id;
    private int salida_folio;
    private Usuario usuarios;
    private Timestamp salida_fecha;
    private Areas areas;
    private String salida_estado;
    private ArrayList<DetalleSalida> detalleSalida;


    public Salidas() {

    }

    public Salidas(int salida_id, int salida_folio, Usuario usuarios, Timestamp salida_fecha, Areas areas, String salida_estado, ArrayList<DetalleSalida> detalleSalida) {
        this.salida_id = salida_id;
        this.salida_folio = salida_folio;
        this.usuarios = usuarios;
        this.salida_fecha = salida_fecha;
        this.areas = areas;
        this.salida_estado = salida_estado;
        this.detalleSalida = detalleSalida;
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

    public void setUsuarios(Usuario usuarios) {
        this.usuarios = usuarios;
    }
    public Usuario getUsuarios() {
        return usuarios;
    }
    public String getUsuarioName() {
        return usuarios.getNombre_usuario();
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
    public String getAreasSal() {
        return areas.getArea_nombre();
    }

    public void setSalida_estado(String salida_estado) {
        this.salida_estado = salida_estado;
    }
    public String getSalida_estado() {
        return salida_estado;
    }

    public void setDetalleSalida(ArrayList<DetalleSalida> detalleSalida) {
        this.detalleSalida = detalleSalida;
    }
    public ArrayList<DetalleSalida> getDetalleSalida() {
        return detalleSalida;
    }
}
