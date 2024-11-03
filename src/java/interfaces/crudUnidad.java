/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.unidad;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudUnidad {
    
    public List mostrar();

    public boolean guardar(unidad un);

    public boolean editar(unidad un);

    public boolean eliminar(int id);
}
