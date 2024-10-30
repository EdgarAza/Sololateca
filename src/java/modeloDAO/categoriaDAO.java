/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudCategoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.categoria;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class categoriaDAO implements crudCategoria{
 conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    categoria cat = new categoria();
    
    @Override
    public List mostrar() {
        ArrayList<categoria> list = new ArrayList();
        String sql = "SELECT * FROM categoria";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                categoria cat = new categoria();
                cat.setId(rs.getInt("id"));
                cat.setCategoria(rs.getString("categoria"));
                list.add(cat);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public boolean guardar(categoria cat) {
          String sql = "INSERT INTO categoria (categoria) VALUES (?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cat.getCategoria());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(categoria cat) {
       String sql = "UPDATE categoria SET categoria = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cat.getCategoria());
            ps.setInt(2, cat.getId());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
       String sql = "DELETE FROM categoria WHERE id = ?";
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
