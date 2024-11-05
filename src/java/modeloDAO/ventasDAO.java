/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudVentas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.ventas;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class ventasDAO implements crudVentas {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ventas ven = new ventas();

    @Override
    public List mostrar(String var) {
        ArrayList<ventas> list = new ArrayList();

       
        String sql = "SELECT * FROM ventas WHERE numero LIKE '%"+var+"%' OR cliente LIKE '%"+var+"%'ORDER BY id DESC;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ventas ven = new ventas();
                ven.setId(rs.getInt("id"));
                ven.setFecha(rs.getString("fecha"));
                ven.setNumero(rs.getString("numero"));
                ven.setCliente(rs.getString("cliente"));
                ven.setTotal(rs.getString("total"));
                list.add(ven);

            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(ventas ven) {
        String sql = "INSERT INTO ventas (fecha,numero,cliente,total)"
                + " VALUES (?,?,?.?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, ven.getFecha());
            ps.setString(2, ven.getNumero());
            ps.setString(3, ven.getCliente());
            ps.setString(4, ven.getTotal());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(String numero) {
        String sql = "DELETE FROM ventas WHERE numero = ?";
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, numero);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

}
