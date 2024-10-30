/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudClientes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.clientes;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class clientesDAO implements crudClientes {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    clientes cli = new clientes();

    @Override
    public List mostrar(String var) {
        ArrayList<clientes> list = new ArrayList();

        String sql = "SELECT * FROM clientes WHERE nombre LIKE '%" + var + "%' && estado='ACTIVO'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clientes cli = new clientes();
                cli.setId(rs.getInt("id"));
                cli.setNombre(rs.getString("nombre"));
                cli.setTelefono(rs.getString("telefono"));
                cli.setCorreo(rs.getString("correo"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setFechaCreacion(rs.getString("fechacreacion"));
                cli.setEstado(rs.getString("estado"));
                list.add(cli);

            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(clientes cli) {
        String sql = "INSERT INTO clientes (nombre,telefono,correo,direccion,fechacreacion,estado) VALUES (?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getNombre());
            ps.setString(2, cli.getTelefono());
            ps.setString(3, cli.getCorreo());
            ps.setString(4, cli.getDireccion());
            ps.setString(5, cli.getFechaCreacion());
            ps.setString(6, cli.getEstado());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(clientes cli) {
        String sql = "UPDATE clientes SET nombre = ?, telefono = ?, correo = ?, direccion = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getNombre());
            ps.setString(2, cli.getTelefono());
            ps.setString(3, cli.getCorreo());
            ps.setString(4, cli.getDireccion());
            ps.setInt(5, cli.getId());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean desactivar(clientes cli) {
        String sql = "UPDATE clientes SET estado = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getEstado());
            ps.setInt(2, cli.getId());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

}
