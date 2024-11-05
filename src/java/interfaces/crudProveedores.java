/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.proveedores;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudProveedores {

    public List mostrar();
    
       public List mostrarActivos();

    public boolean guardar(proveedores pro);

    public boolean editar(proveedores pro);


}
