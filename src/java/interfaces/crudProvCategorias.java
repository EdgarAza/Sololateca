/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.provcategorias;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudProvCategorias {

    public List mostrar();

    public boolean guardar(provcategorias cli);

    public boolean eliminar(int id);

}
