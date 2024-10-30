/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.marca;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudMarca {
    
    
    public List mostrar();

    public boolean guardar(marca mar);

    public boolean editar(marca mar);

    public boolean eliminar(int id);
}
