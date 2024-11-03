/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudProvCategorias;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.provcategorias;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class provcategoriasDAO implements crudProvCategorias {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    provcategorias proc = new provcategorias();

    @Override
    public List mostrar() {
        ArrayList<provcategorias> list = new ArrayList();

        String sql = "SELECT * FROM provcategoria";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                provcategorias proc = new provcategorias();
                proc.setId(rs.getInt("id"));
                proc.setCategoria(rs.getString("categoria"));
                proc.setProveedor(rs.getString("proveedor"));
                list.add(proc);
            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(provcategorias cli) {
        String sql = "INSERT INTO provcategoria (categoria,proveedor) VALUES (?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getCategoria());
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
        String sql = "DELETE FROM provcategoria WHERE id = ?";
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
