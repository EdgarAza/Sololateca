/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.categoria;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudCategoria {

    public List mostrar();

    public boolean guardar(categoria cat);

    public boolean editar(categoria cat);

    public boolean eliminar(int id);
}
