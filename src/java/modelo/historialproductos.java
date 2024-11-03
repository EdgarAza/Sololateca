/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class historialproductos {
    
    private int id;
    private String usuario;
    private String codigo;
    private String descripcion;
    private String costoanterior;
    private String precioanterior;
    private String costonuevo;
    private String precionuevo;
    private String fecha;
    private String mensaje;

    public historialproductos() {
    }

    public historialproductos(int id, String usuario, String codigo, String descripcion, String costoanterior, String precioanterior, String costonuevo, String precionuevo, String fecha, String mensaje) {
        this.id = id;
        this.usuario = usuario;
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.costoanterior = costoanterior;
        this.precioanterior = precioanterior;
        this.costonuevo = costonuevo;
        this.precionuevo = precionuevo;
        this.fecha = fecha;
        this.mensaje = mensaje;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCostoanterior() {
        return costoanterior;
    }

    public void setCostoanterior(String costoanterior) {
        this.costoanterior = costoanterior;
    }

    public String getPrecioanterior() {
        return precioanterior;
    }

    public void setPrecioanterior(String precioanterior) {
        this.precioanterior = precioanterior;
    }

    public String getCostonuevo() {
        return costonuevo;
    }

    public void setCostonuevo(String costonuevo) {
        this.costonuevo = costonuevo;
    }

    public String getPrecionuevo() {
        return precionuevo;
    }

    public void setPrecionuevo(String precionuevo) {
        this.precionuevo = precionuevo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    
    
    
}
