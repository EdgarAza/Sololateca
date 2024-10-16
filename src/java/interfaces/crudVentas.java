/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.ventas;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudVentas {
    
    
      public List mostrar();

    public boolean guardar(ventas ven);

    public boolean eliminar(int id);
}
