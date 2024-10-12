/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.inventario;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudInventario {
    
      public List mostrar();
    public inventario llenarCampos(int id);
    public boolean guardar(inventario inv);
    public boolean editar(inventario inv);
    public boolean eliminar(int usu);
    
}
