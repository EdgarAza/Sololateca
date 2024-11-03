/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.provmarca;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudProvMarca {

    public List mostrar();

    public boolean guardar(provmarca cli);

    public boolean eliminar(int id);

}
