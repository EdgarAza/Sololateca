/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudInventario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.inventario;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class inventarioDAO implements crudInventario {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    inventario inv = new inventario();

    @Override
    public List mostrar() {
        ArrayList<inventario> list = new ArrayList();

        String sql = "SELECT * FROM productos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                inventario inv = new inventario();
                inv.setId(rs.getInt("id"));
                inv.setCodigo(rs.getString("codigo"));
                inv.setDescripcion(rs.getString("descripcion"));
                inv.setStock(rs.getString("stock"));
                inv.setCosto(rs.getString("costo"));
                inv.setPrecio(rs.getString("precio"));
                inv.setProveedor(rs.getString("proveedor"));
                list.add(inv);

            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public inventario llenarCampos(int id) {

        String sql = "SELECT * FROM productos WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                inv.setId(rs.getInt("id"));
                inv.setCodigo(rs.getString("codigo"));
                inv.setDescripcion(rs.getString("descripcion"));
                inv.setStock(rs.getString("stock"));
                inv.setCosto(rs.getString("costo"));
                inv.setPrecio(rs.getString("precio"));
                inv.setProveedor(rs.getString("proveedor"));

            }

        } catch (Exception e) {

        }
        return inv;
    }

    @Override
    public boolean guardar(inventario inv) {
      
          String sql = "INSERT INTO productos (codigo,descripcion,stock,costo,precio, proveedor) VALUES (?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, inv.getCodigo());
            ps.setString(2, inv.getDescripcion());
            ps.setString(3, inv.getStock());
            ps.setString(4, inv.getCosto());
            ps.setString(5, inv.getPrecio());
            ps.setString(6, inv.getProveedor());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(inventario inv) {
           String sql = "UPDATE productos SET codigo = ?, descripcion = ?, stock = ?, costo = ?, precio = ?, proveedor = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, inv.getCodigo());
            ps.setString(2, inv.getDescripcion());
            ps.setString(3, inv.getStock());
            ps.setString(4, inv.getCosto());
            ps.setString(5, inv.getPrecio());
            ps.setString(6, inv.getProveedor());
            ps.setInt(7, inv.getId());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
         String sql = "DELETE FROM productos WHERE id = ?";
        Connection con = null; 
        PreparedStatement ps = null; 

        try {
            con = cn.getConnection(); 
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate(); 
            return rowsAffected > 0; 
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

}
