/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.detallecompras;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudDetalleCompras {
    
    public List mostrar(String var);

    public boolean guardar(detallecompras dcom);

    public boolean editar(detallecompras dcom);

    public boolean eliminar(String numero);
    
}
