/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudDiario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.diario;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class diarioDAO implements crudDiario {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    diario dia = new diario();

    @Override
    public List mostrar() {
        ArrayList<diario> list = new ArrayList();

        String sql = "SELECT * FROM diario";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                diario dia = new diario();
                dia.setId(rs.getInt("id"));
                dia.setCliente(rs.getString("cliente"));
                dia.setVendedor(rs.getString("vendedor"));
                dia.setCodigo(rs.getString("codigo"));
                dia.setCantidad(rs.getString("cantidad"));
                dia.setDescripcion(rs.getString("descripcion"));
                dia.setPrecio(rs.getString("precio"));
                dia.setSubtotal(rs.getString("subtotal"));

                list.add(dia);

            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(diario dia) {
        String sql = "INSERT INTO diario (cliente,vendedor,codigo,cantidad,descripcion,precio,subtotal)"
                + " VALUES (?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, dia.getCliente());
            ps.setString(2, dia.getVendedor());
            ps.setString(3, dia.getCodigo());
            ps.setString(4, dia.getCantidad());
            ps.setString(5, dia.getDescripcion());
            ps.setString(6, dia.getPrecio());
            ps.setString(7, dia.getSubtotal());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM diario WHERE id = ?";
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
