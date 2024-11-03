/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudProvMarca;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.provmarca;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class provmarcaDAO implements crudProvMarca {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    provmarca provmarca = new provmarca();

    @Override
    public List mostrar() {
        ArrayList<provmarca> list = new ArrayList();

        String sql = "SELECT * FROM provmarca";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                provmarca proc = new provmarca();
                proc.setId(rs.getInt("id"));
                proc.setMarca(rs.getString("marca"));
                proc.setProveedor(rs.getString("proveedor"));
                list.add(proc);
            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(provmarca cli) {
        String sql = "INSERT INTO provmarca (marca,proveedor) VALUES (?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getMarca());
            ps.setString(2, cli.getProveedor());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM provmarca WHERE id = ?";
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
