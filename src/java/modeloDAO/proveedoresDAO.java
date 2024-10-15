/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudProveedores;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.proveedores;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class proveedoresDAO implements crudProveedores{

     conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    proveedores pro = new proveedores();
    
    @Override
    public List mostrar() {
        ArrayList<proveedores> list = new ArrayList();

        String sql = "SELECT * FROM proveedores";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                proveedores pro = new proveedores();
                pro.setId(rs.getInt("id"));
                pro.setCodigo(rs.getString("codigo"));
                pro.setNombre(rs.getString("nombre"));
                pro.setComercial(rs.getString("comercial"));
                pro.setDireccion(rs.getString("direccion"));
                pro.setCorreo(rs.getString("correo"));
                pro.setTelefono(rs.getString("telefono"));
                pro.setNota(rs.getString("nota"));
                list.add(pro);

            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public proveedores llenarCampos(int id) {
      
        String sql = "SELECT * FROM proveedores WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro.setId(rs.getInt("id"));
                pro.setCodigo(rs.getString("codigo"));
                pro.setNombre(rs.getString("descripcion"));
                pro.setComercial(rs.getString("stock"));
                pro.setDireccion(rs.getString("costo"));
                pro.setCorreo(rs.getString("precio"));
                pro.setTelefono(rs.getString("proveedor"));
                pro.setNota(rs.getString("minimo"));
                

            }

        } catch (Exception e) {

        }
        return pro;
    }

    @Override
    public boolean guardar(proveedores pro) {
       
          String sql = "INSERT INTO proveedores (codigo,nombre,comercial,direccion,correo, telefono, nota) VALUES (?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getCodigo());
            ps.setString(2, pro.getNombre());
            ps.setString(3, pro.getComercial());
            ps.setString(4, pro.getDireccion());
            ps.setString(5, pro.getCorreo());
            ps.setString(6, pro.getTelefono());
            ps.setString(7, pro.getNota());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(proveedores inv) {
        String sql = "UPDATE proveedores SET codigo = ?, nombre = ?, comercial = ?, direccion = ?, correo = ?, telefono = ?, nota = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, inv.getCodigo());
            ps.setString(2, inv.getNombre());
            ps.setString(3, inv.getComercial());
            ps.setString(4, inv.getDireccion());
            ps.setString(5, inv.getCorreo());
            ps.setString(6, inv.getTelefono());
            ps.setString(7, inv.getNota());
            ps.setInt(8, inv.getId());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM proveedores WHERE id = ?";
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
