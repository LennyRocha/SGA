package mx.edu.utez.integradora.Model;

import org.eclipse.tags.shaded.org.apache.xpath.objects.XString;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class Salidas implements Serializable {
    private int salida_id;
    private String salida_folio;
    private Usuario usuarios;
    private Date salida_fecha;
    private Area area;
    private String salida_estado;
    private ArrayList<DetalleSalida> detalleSalida;


    public Salidas() {

    }

    public Salidas(int salida_id, String salida_folio, Usuario usuarios, Date salida_fecha, Area area, String salida_estado, ArrayList<DetalleSalida> detalleSalida) {
        this.salida_id = salida_id;
        this.salida_folio = salida_folio;
        this.usuarios = usuarios;
        this.salida_fecha = salida_fecha;
        this.area = area;
        this.salida_estado = salida_estado;
        this.detalleSalida = detalleSalida;
    }

    public void setSalida_id(int salida_id) {
        this.salida_id = salida_id;
    }
    public int getSalida_id() {
        return salida_id;
    }

    public void setSalida_folio(String salida_folio) {
        this.salida_folio = salida_folio;
    }
    public String getSalida_folio() {
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

    public void setSalida_fecha(Date salida_fecha) {
        this.salida_fecha = salida_fecha;
    }
    public Date getSalida_fecha() {
        return salida_fecha;
    }

    public void setAreas(Area area) {
        this.area = area;
    }
    public Area getAreas() {
        return area;
    }
    public String getAreasSal() {
        return area.getArea_nombre();
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
