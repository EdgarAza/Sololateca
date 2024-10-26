/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class proveedores {
    
    private int id;
   private String razonsocial;
   private String nombre;
   private String telefono;
   private String correo;
   private String direccion;
   private String infopago;
   private String conpago;
   private String estado;
   

    public proveedores() {
    }

    public proveedores(int id, String razonsocial, String nombre, String telefono, String correo, String direccion, String infopago, String conpago, String estado) {
        this.id = id;
        this.razonsocial = razonsocial;
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
        this.direccion = direccion;
        this.infopago = infopago;
        this.conpago = conpago;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRazonsocial() {
        return razonsocial;
    }

    public void setRazonsocial(String razonsocial) {
        this.razonsocial = razonsocial;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getInfopago() {
        return infopago;
    }

    public void setInfopago(String infopago) {
        this.infopago = infopago;
    }

    public String getConpago() {
        return conpago;
    }

    public void setConpago(String conpago) {
        this.conpago = conpago;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    
}
    