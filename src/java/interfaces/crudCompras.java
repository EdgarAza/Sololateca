/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.compras;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudCompras {
    
    public List mostrar();

    public boolean guardar(compras comp);

    public boolean editar(compras comp);

    public boolean eliminar(String numero);
}
