/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudCompras;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.compras;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class comprasDAO implements crudCompras {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    compras comp = new compras();

    @Override
    public List mostrar() {
        ArrayList<compras> list = new ArrayList();
        String sql = "SELECT * FROM compras";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                compras comp = new compras();
                comp.setId(rs.getInt("id"));
                comp.setFecha(rs.getString("fecha"));
                comp.setNumero(rs.getString("numero"));
                comp.setProveedor(rs.getString("proveedor"));
                comp.setTotal(rs.getString("total"));
                comp.setFechapago(rs.getString("fechapago"));
                comp.setNota(rs.getString("nota"));
                list.add(comp);
            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(compras comp) {
        String sql = "INSERT INTO compras (fecha,numero,proveedor,total,fechapago,nota) VALUES (?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, comp.getFecha());
            ps.setString(2, comp.getNumero());
            ps.setString(3, comp.getProveedor());
            ps.setString(4, comp.getTotal());
            ps.setString(5, comp.getFechapago());
            ps.setString(6, comp.getNota());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(compras comp) {
        String sql = "UPDATE compras SET fecha = ?, numero=?, proveedor = ?, total = ?, fechapago = ?, nota = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, comp.getFecha());
            ps.setString(2, comp.getNumero());
            ps.setString(3, comp.getProveedor());
            ps.setString(4, comp.getTotal());
            ps.setString(5, comp.getFechapago());
            ps.setString(6, comp.getNota());
            ps.setInt(7, comp.getId());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(String numero) {
        String sql = "DELETE FROM compras WHERE numero = ?";
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
