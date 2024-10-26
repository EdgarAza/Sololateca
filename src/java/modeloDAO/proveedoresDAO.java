
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
public class proveedoresDAO implements crudProveedores {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    proveedores pro = new proveedores();

    @Override
    public List mostrar() {
        ArrayList<proveedores> list = new ArrayList();

        String sql = "SELECT * FROM proveedores WHERE estado = 'ACTIVO'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                proveedores pro = new proveedores();
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setRazonsocial(rs.getString("razonsocial"));
                pro.setTelefono(rs.getString("telefono"));
                pro.setCorreo(rs.getString("correo"));
                pro.setDireccion(rs.getString("direccion"));
                pro.setInfopago(rs.getString("infopago"));
                pro.setConpago(rs.getString("conpago"));
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
                pro.setNombre(rs.getString("nombre"));
                pro.setRazonsocial(rs.getString("razonsocial"));
                pro.setTelefono(rs.getString("telefono"));
                pro.setCorreo(rs.getString("correo"));
                pro.setDireccion(rs.getString("direccion"));
                pro.setInfopago(rs.getString("infopago"));
                pro.setConpago(rs.getString("conpago"));
                pro.setEstado(rs.getString("estado"));
                
            }

        } catch (Exception e) {

        }
        return pro;
    }

    @Override
    public boolean guardar(proveedores pro) {

        String sql = "INSERT INTO proveedores (nombre,razonsocial,telefono,correo,direccion, infopago, conpago, estado) VALUES (?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getNombre());
            ps.setString(2, pro.getRazonsocial());
            ps.setString(3, pro.getTelefono());
            ps.setString(4, pro.getCorreo());
            ps.setString(5, pro.getDireccion());
            ps.setString(6, pro.getInfopago());
            ps.setString(7, pro.getConpago());
            ps.setString(8, pro.getEstado());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(proveedores pro) {
        String sql = "UPDATE proveedores SET nombre = ?, razonsocial = ?, telefono = ?, correo = ?, direccion = ?,"
                + " infopago = ?, conpago = ?, estado=? WHERE id = ?";
        try {
         con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getNombre());
             ps.setString(2, pro.getRazonsocial());
            ps.setString(3, pro.getTelefono());
            ps.setString(4, pro.getCorreo());
            ps.setString(5, pro.getDireccion());
            ps.setString(6, pro.getInfopago());
            ps.setString(7, pro.getConpago());
            ps.setString(8, pro.getEstado());
            ps.setInt(9, pro.getId());
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
