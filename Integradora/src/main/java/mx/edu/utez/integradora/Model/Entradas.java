package mx.edu.utez.integradora.Model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Entradas implements Serializable {
    private int entrada_id;
    private int entrada_folio;
    private int entrada_folio_factura;
    private Timestamp entrada_fecha;
    private Proveedor proveedor;
    private Usuario usuario;
    private String estado;
    private Double entrada_valor_total;
    private ArrayList<DetalleEntrada> detalles;

    public Entradas(){

    }

    public Entradas(int entrada_id, int entrada_folio, Timestamp entrada_fecha, Usuario usuario, int entrada_folio_factura, String estado, ArrayList<DetalleEntrada> detalles){
        this.entrada_id = entrada_id;
        this.entrada_folio = entrada_folio;
        this.entrada_folio_factura = entrada_folio_factura;
        this.entrada_fecha = entrada_fecha;
        this.usuario = usuario;
        this.estado = estado;
        this.detalles = detalles;
    }

    public Entradas(int entrada_folio, Timestamp entrada_fecha, Usuario usuario, int entrada_folio_factura, String estado, ArrayList<DetalleEntrada> detalles){
        this.entrada_folio = entrada_folio;
        this.entrada_fecha = entrada_fecha;
        this.entrada_folio_factura = entrada_folio_factura;
        this.usuario = usuario;
        this.estado = estado;
        this.detalles = detalles;
    }
    public int getEntrada_id() {
        return entrada_id;
    }
    public void setEntrada_id(int entrada_id) {
        this.entrada_id = entrada_id;
    }

    public int getEntrada_folio() {
        return entrada_folio;
    }
    public void setEntrada_folio(int entrada_folio) {
        this.entrada_folio = entrada_folio;
    }

    public int getEntrada_folio_factura() {return entrada_folio_factura;}
    public void setEntrada_folio_factura(int entrada_folio_factura) {this.entrada_folio_factura = entrada_folio_factura; }

    public Timestamp getEntrada_fecha() {
        return entrada_fecha;
    }
    public void setEntrada_fecha(Timestamp entrada_fecha) {
        this.entrada_fecha = entrada_fecha;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }
    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
    }

    public Usuario getUsuario() {
        return usuario;
    }
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getEstado() {
        return estado;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Double getEntrada_valor_total() {return entrada_valor_total;}
    public void setEntrada_valor_total(Double entrada_valor_total) { this.entrada_valor_total = entrada_valor_total; }

    public ArrayList<DetalleEntrada> getDetalles() {
        return detalles;
    }
    public void setDetalles(ArrayList<DetalleEntrada> detalles) {
        this.detalles = detalles;
    }

}