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

    public List mostrar(String var);

    public List mostrarVenta(String var);

    public boolean guardar(clientes cli);

    public boolean editar(clientes cli);

}
