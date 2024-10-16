package mx.edu.utez.integradora.Model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Entradas implements Serializable {
    private int entrada_id;
    private String entrada_folio;
    private int entrada_folio_factura;
    private Date entrada_fecha;
    private Proveedor proveedor;
    private Usuario usuario;
    private String estado;
    private ArrayList<DetalleEntrada> detalles;

    public Entradas(){

    }

    public Entradas(int entrada_id, String entrada_folio, int entrada_folio_factura, Date entrada_fecha, Proveedor proveedor, Usuario usuario, String estado, ArrayList<DetalleEntrada> detalles){
        this.entrada_id = entrada_id;
        this.entrada_folio = entrada_folio;
        this.entrada_folio_factura = entrada_folio_factura;
        this.entrada_fecha = entrada_fecha;
        this.proveedor = proveedor;
        this.usuario = usuario;
        this.estado = estado;
        this.detalles = detalles;
    }

    public Entradas(String entrada_folio, int entrada_folio_factura, Date entrada_fecha, Proveedor proveedor, Usuario usuario , String estado, ArrayList<DetalleEntrada> detalles){
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

    public String getEntrada_folio() {
        return entrada_folio;
    }
    public void setEntrada_folio(String entrada_folio) {
        this.entrada_folio = entrada_folio;
    }

    public int getEntrada_folio_factura() {return entrada_folio_factura;}
    public void setEntrada_folio_factura(int entrada_folio_factura) {this.entrada_folio_factura = entrada_folio_factura; }

    public Date getEntrada_fecha() {
        return entrada_fecha;
    }
    public void setEntrada_fecha(Date entrada_fecha) {
        this.entrada_fecha = entrada_fecha;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }

    public String getProveedorNombre() {
        return proveedor.getProveedor_nombre();
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public String getUsuarioNombre() {
        return usuario.getNombre_usuario();
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

    public ArrayList<DetalleEntrada> getDetalles() {
        return detalles;
    }
    public void setDetalles(ArrayList<DetalleEntrada> detalles) {
        this.detalles = detalles;
    }

}