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
    public List mostrar(String var) {
        ArrayList<diario> list = new ArrayList();

        String sql = "SELECT * FROM diario WHERE fecha LIKE '%" + var + "%'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                diario dia = new diario();
                dia.setId(rs.getInt("id"));
                dia.setNumero(rs.getString("numero"));
                dia.setFecha(rs.getString("fecha"));
                dia.setCliente(rs.getString("cliente"));
                dia.setVendedor(rs.getString("vendedor"));
                dia.setCodigo(rs.getString("codigo"));
                dia.setCantidad(rs.getString("cantidad"));
                dia.setDescripcion(rs.getString("descripcion"));
                dia.setPrecio(rs.getString("precio"));
                dia.setCosto(rs.getString("costo"));
                dia.setSubtotal(rs.getString("subtotal"));

                list.add(dia);

            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(diario dia) {
        String sql = "INSERT INTO diario (fecha,numero,cliente,vendedor,codigo,cantidad,descripcion,precio,costo,subtotal)"
                + " VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, dia.getFecha());
            ps.setString(2, dia.getNumero());
            ps.setString(3, dia.getCliente());
            ps.setString(4, dia.getVendedor());
            ps.setString(5, dia.getCodigo());
            ps.setString(6, dia.getCantidad());
            ps.setString(7, dia.getDescripcion());
            ps.setString(8, dia.getPrecio());
            ps.setString(9, dia.getCosto());
            ps.setString(10, dia.getSubtotal());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(String numero) {
        String sql = "DELETE FROM diario WHERE numero = ?";
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

    @Override
    public List mostrarDetalle(String var) {
        ArrayList<diario> list = new ArrayList();
        String sql = "SELECT * FROM diario WHERE numero LIKE '%" + var + "%'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                diario dia = new diario();
                dia.setId(rs.getInt("id"));
                dia.setNumero(rs.getString("numero"));
                dia.setFecha(rs.getString("fecha"));
                dia.setCliente(rs.getString("cliente"));
                dia.setVendedor(rs.getString("vendedor"));
                dia.setCodigo(rs.getString("codigo"));
                dia.setCantidad(rs.getString("cantidad"));
                dia.setDescripcion(rs.getString("descripcion"));
                dia.setPrecio(rs.getString("precio"));
                dia.setCosto(rs.getString("costo"));
                dia.setSubtotal(rs.getString("subtotal"));

                list.add(dia);

            }
        } catch (Exception e) {

        }

        return list;
    }
}
