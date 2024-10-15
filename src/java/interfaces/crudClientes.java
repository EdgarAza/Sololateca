/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.clientes;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudClientes {

    public List mostrar();

    public clientes llenarCampos(int id);

    public boolean guardar(clientes cli);

    public boolean editar(clientes cli);

    public boolean eliminar(int id);
}
