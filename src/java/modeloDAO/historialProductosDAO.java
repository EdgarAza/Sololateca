/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import configuracion.conexion;
import interfaces.crudHistorialProductos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.historialproductos;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class historialProductosDAO implements crudHistorialProductos {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    historialproductos hpro = new historialproductos();

    @Override
    public List mostrar() {
        ArrayList<historialproductos> list = new ArrayList();
        String sql = "SELECT * FROM historialproductos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                historialproductos hpro = new historialproductos();
                hpro.setId(rs.getInt("id"));
                hpro.setUsuario(rs.getString("usuario"));
                hpro.setCodigo(rs.getString("codigo"));
                hpro.setDescripcion(rs.getString("descripcion"));
                hpro.setCostoanterior(rs.getString("costoanterior"));
                hpro.setPrecioanterior(rs.getString("precioanterior"));
                hpro.setCostonuevo(rs.getString("costonuevo"));
                hpro.setPrecionuevo(rs.getString("precionuevo"));
                hpro.setFecha(rs.getString("fecha"));
                hpro.setMensaje(rs.getString("mensaje"));
                list.add(hpro);
            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(historialproductos hpro) {
        String sql = "INSERT INTO historialproductos (usuario,codigo,descripcion,costoanterior,precioanterior,costonuevo,precionuevo,fecha,mensaje) "
                + "VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, hpro.getUsuario());
            ps.setString(2, hpro.getCodigo());
            ps.setString(3, hpro.getDescripcion());
            ps.setString(4, hpro.getCostoanterior());
            ps.setString(5, hpro.getPrecioanterior());
            ps.setString(6, hpro.getCostonuevo());
            ps.setString(7, hpro.getPrecionuevo());
            ps.setString(8, hpro.getFecha());
            ps.setString(9, hpro.getMensaje());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

}
