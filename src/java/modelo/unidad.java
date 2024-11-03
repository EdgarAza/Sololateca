/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class unidad {
    
    private int id;
    private String unidadmedida;

    public unidad() {
    }

    public unidad(int id, String unidadmedida) {
        this.id = id;
        this.unidadmedida = unidadmedida;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUnidadmedida() {
        return unidadmedida;
    }

    public void setUnidadmedida(String unidadmedida) {
        this.unidadmedida = unidadmedida;
    }
    
    
}
