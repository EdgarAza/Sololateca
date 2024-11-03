/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudInventario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.inventario;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class inventarioDAO implements crudInventario {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    inventario inv = new inventario();

    @Override
    public List mostrar() {
        ArrayList<inventario> list = new ArrayList();

        String sql = "SELECT * FROM productos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                inventario inv = new inventario();
                inv.setId(rs.getInt("id"));
                inv.setCodigo(rs.getString("codigo"));
                inv.setUnidadmedida(rs.getString("unidadmedida"));
                inv.setDescripcion(rs.getString("descripcion"));
                inv.setStock(rs.getString("stock"));
                inv.setCosto(rs.getString("costo"));
                inv.setPrecio(rs.getString("precio"));
                inv.setGanancia(rs.getString("ganancia"));
                inv.setMinimo(rs.getString("minimo"));
                inv.setMarca(rs.getString("marca"));
                inv.setCategoria(rs.getString("categoria"));
                inv.setFechaCreacion(rs.getString("fechacreacion"));
                inv.setFechaModificacion(rs.getString("fechamodificacion"));
                list.add(inv);
            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(inventario inv) {

        String sql = "INSERT INTO productos (codigo,unidadmedida,descripcion,stock,costo,precio, ganancia, minimo,marca,categoria,"
                + "fechacreacion, fechamodificacion) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, inv.getCodigo());
            ps.setString(2, inv.getUnidadmedida());
            ps.setString(3, inv.getDescripcion());
            ps.setString(4, inv.getStock());
            ps.setString(5, inv.getCosto());
            ps.setString(6, inv.getPrecio());
            ps.setString(7, inv.getGanancia());
            ps.setString(8, inv.getMinimo());
            ps.setString(9, inv.getMarca());
            ps.setString(10, inv.getCategoria());
            ps.setString(11, inv.getFechaCreacion());
            ps.setString(12, inv.getFechaModificacion());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(inventario inv) {
        String sql = "UPDATE productos SET codigo = ?, unidadmedida=?, descripcion = ?, stock = ?, costo = ?, precio = ?, "
                + "ganancia = ?, minimo = ?,marca= ?,categoria= ?,fechamodificacion= ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, inv.getCodigo());
            ps.setString(2, inv.getUnidadmedida());
            ps.setString(3, inv.getDescripcion());
            ps.setString(4, inv.getStock());
            ps.setString(5, inv.getCosto());
            ps.setString(6, inv.getPrecio());
            ps.setString(7, inv.getGanancia());
            ps.setString(8, inv.getMinimo());
            ps.setString(9, inv.getMarca());
            ps.setString(10, inv.getCategoria());
            ps.setString(11, inv.getFechaModificacion());
            ps.setInt(12, inv.getId());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM productos WHERE id = ?";
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

    public boolean actulizarCompra(inventario inv) {
        String sql = "UPDATE productos SET stock = ?, costo = ?, precio = ?,ganancia = ?,fechamodificacion= ? WHERE codigo = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, inv.getStock());
            ps.setString(2, inv.getCosto());
            ps.setString(3, inv.getPrecio());
            ps.setString(4, inv.getGanancia());
            ps.setString(5, inv.getFechaModificacion());
            ps.setString(6, inv.getCodigo());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }
}
