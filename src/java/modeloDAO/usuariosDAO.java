/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudUsuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.usuarios;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class usuariosDAO implements crudUsuarios {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    usuarios usu = new usuarios();

    @Override
    public List mostrar() {
        ArrayList<usuarios> list = new ArrayList();

        String sql = "SELECT * FROM usuarios";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuarios usu = new usuarios();
                usu.setId(rs.getInt("id"));
                usu.setRol(rs.getString("rol"));
                usu.setUsuario(rs.getString("usuario"));
                usu.setClave(rs.getString("clave"));
                usu.setDpi(rs.getString("dpi"));
                usu.setNombres(rs.getString("nombres"));
                usu.setApellidos(rs.getString("apellidos"));
                usu.setTelefono(rs.getString("telefono"));
                usu.setDireccion(rs.getString("direccion"));
                usu.setEstado(rs.getString("estado"));
                list.add(usu);

            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public usuarios llenarCampos(int id) {
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                usu.setId(rs.getInt("id"));
                usu.setRol(rs.getString("rol"));
                usu.setUsuario(rs.getString("usuario"));
                usu.setClave(rs.getString("clave"));
                usu.setDpi(rs.getString("dpi"));
                usu.setNombres(rs.getString("nombres"));
                usu.setApellidos(rs.getString("apellidos"));
                usu.setTelefono(rs.getString("telefono"));
                usu.setDireccion(rs.getString("direccion"));
                usu.setEstado(rs.getString("estado"));
            }

        } catch (Exception e) {

        }
        return usu;
    }

    @Override
    public boolean guardar(usuarios usu) {
        String sql = "INSERT INTO usuarios (rol,usuario,clave,dpi,nombres,apellidos,telefono, direccion, estado) VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getRol());
            ps.setString(2, usu.getUsuario());
            ps.setString(3, usu.getClave());
            ps.setString(4, usu.getDpi());
            ps.setString(5, usu.getNombres());
            ps.setString(6, usu.getApellidos());
            ps.setString(7, usu.getTelefono());
            ps.setString(8, usu.getDireccion());
            ps.setString(9, usu.getEstado());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(usuarios usu) {
        String sql = "UPDATE usuarios SET rol = ?, usuario=?, clave=?, dpi = ?, nombres = ?, apellidos = ?, telefono = ?, direccion = ?, estado = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getRol());
             ps.setString(2, usu.getUsuario());
            ps.setString(3, usu.getClave());
            ps.setString(4, usu.getDpi());
            ps.setString(5, usu.getNombres());
            ps.setString(6, usu.getApellidos());
            ps.setString(7, usu.getTelefono());
            ps.setString(8, usu.getDireccion());
            ps.setString(9, usu.getEstado());
            ps.setInt(10, usu.getId());

            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM usuarios WHERE id = ?";
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
