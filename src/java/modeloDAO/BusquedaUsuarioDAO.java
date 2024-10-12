/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.BusquedaUsuarios;
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
public class BusquedaUsuarioDAO implements BusquedaUsuarios {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    usuarios usu = new usuarios();

    @Override
    public List mostrar(String dato) {
        ArrayList<usuarios> list = new ArrayList();

        String sql = "SELECT * FROM usuarios WHERE "
                + "nombres  LIKE '%" + dato + "%' or nombres  LIKE '%" + dato + "%'  or apellidos  LIKE '%" + dato + "%'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuarios usu = new usuarios();
                usu.setId(rs.getInt("id"));
                usu.setRol(rs.getString("rol"));
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

}
