/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.diario;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudDiario {
    
      public List mostrar();

    public boolean guardar(diario dia);

    public boolean eliminar(int id);
}
