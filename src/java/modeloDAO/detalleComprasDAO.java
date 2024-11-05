/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudDetalleCompras;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.compras;
import modelo.detallecompras;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class detalleComprasDAO implements crudDetalleCompras {
    
      conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    detallecompras dcom = new detallecompras();

    @Override
    public List mostrar(String var) {
         ArrayList<detallecompras> list = new ArrayList();
        String sql = "SELECT * FROM detallecompras WHERE numero LIKE '%" + var + "%'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                detallecompras dcom = new detallecompras();
                dcom.setId(rs.getInt("id"));
                dcom.setNumero(rs.getString("numero"));
                dcom.setCodigo(rs.getString("codigo"));
                dcom.setDescripcion(rs.getString("descripcion"));
                dcom.setCosto(rs.getString("costo"));
                dcom.setPrecio(rs.getString("precio"));
                dcom.setCantidad(rs.getString("cantidad"));
                list.add(dcom);
            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(detallecompras dcom) {
         String sql = "INSERT INTO detallecompras (numero,codigo,descripcion,costo,precio,cantidad) VALUES (?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, dcom.getNumero());
            ps.setString(2, dcom.getCodigo());
            ps.setString(3, dcom.getDescripcion());
            ps.setString(4, dcom.getCosto());
            ps.setString(5, dcom.getPrecio());
            ps.setString(6, dcom.getCantidad());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(detallecompras dcom) {
        String sql = "UPDATE detallecompras SET numero = ?, codigo=?, descripcion = ?, costo = ?, precio = ?, cantidad = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, dcom.getNumero());
            ps.setString(2, dcom.getCodigo());
            ps.setString(3, dcom.getDescripcion());
            ps.setString(4, dcom.getCosto());
            ps.setString(5, dcom.getPrecio());
            ps.setString(6, dcom.getCantidad());
            ps.setInt(7, dcom.getId());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(String numero) {
        String sql = "DELETE FROM detallecompras WHERE numero = ?";
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
