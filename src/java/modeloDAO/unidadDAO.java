/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudUnidad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.unidad;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class unidadDAO implements crudUnidad {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    unidad un = new unidad();

    @Override
    public List mostrar() {
        ArrayList<unidad> list = new ArrayList();
        String sql = "SELECT * FROM unidadmedida";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                unidad un = new unidad();
                un.setId(rs.getInt("id"));
                un.setUnidadmedida(rs.getString("unidadmedida"));
                list.add(un);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public boolean guardar(unidad un) {
        String sql = "INSERT INTO unidadmedida (unidadmedida) VALUES (?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, un.getUnidadmedida());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(unidad un) {
        String sql = "UPDATE unidadmedida SET unidadmedida = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, un.getUnidadmedida());
            ps.setInt(2, un.getId());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM unidadmedida WHERE id = ?";
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
