/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import configuracion.conexion;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.inventario;
import modeloDAO.inventarioDAO;
import reportes.reportesInventario;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cInventario extends HttpServlet {

    int id;
    inventario inv = new inventario();
    inventarioDAO invDao = new inventarioDAO();
    conexion con = new conexion();
    reportesInventario reportes = new reportesInventario(con.getConnection());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("mostrar")) {
            acceso = "vistas/inventario/mostrarInventario.jsp";
        } else if (action.equalsIgnoreCase("guardar")) {
            acceso = "vistas//inventario/guardarInventario.jsp";

        } else if (action.equalsIgnoreCase("Agregar")) {
            String codigo = request.getParameter("txtCodigo");
            String descripcion = request.getParameter("txtDescripcion");
            String stock = request.getParameter("txtStock");
            String costo = request.getParameter("txtCosto");
            String precio = request.getParameter("txtPrecio");
            String proveedor = "proveedor1 ";//request.getParameter("txtProveedor");
            String minimo = request.getParameter("txtMinimo");

            inv.setCodigo(codigo);
            inv.setDescripcion(descripcion);
            inv.setStock(stock);
            inv.setCosto(costo);
            inv.setPrecio(precio);
            inv.setProveedor(proveedor);
            inv.setMinimo(minimo);
            invDao.guardar(inv);
            acceso = "vistas/inventario/mostrarInventario.jsp";

        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idUsu", request.getParameter("id"));
            acceso = "vistas/inventario/editarInventario.jsp";

        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtid"));
            String codigo = request.getParameter("txtCodigo");
            String descripcion = request.getParameter("txtDescripcion");
            String stock = request.getParameter("txtStock");
            String costo = request.getParameter("txtCosto");
            String precio = request.getParameter("txtPrecio");
            String proveedor = "proveedor1 ";//request.getParameter("txtProveedor");
            String minimo = request.getParameter("txtMinimo");

            inv.setCodigo(codigo);
            inv.setDescripcion(descripcion);
            inv.setStock(stock);
            inv.setCosto(costo);
            inv.setPrecio(precio);
            inv.setProveedor(proveedor);
            inv.setMinimo(minimo);
            inv.setId(id);
            invDao.editar(inv);

            acceso = "vistas/inventario/mostrarInventario.jsp";
        } else if (action.equalsIgnoreCase("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            invDao.eliminar(id);
            acceso = "vistas/inventario/mostrarInventario.jsp";
        } else if (action.equalsIgnoreCase("Inventario")) {
            reportes.InventarioCompleto();
            acceso = "vistas/inventario/mostrarInventario.jsp";

        } else if (action.equalsIgnoreCase("Minimo")) {
            reportes.InventarioMinimo();
            acceso = "vistas/inventario/mostrarInventario.jsp";

        } else if (action.equalsIgnoreCase("Existencia")) {
            reportes.InventarioExistencia();
            acceso = "vistas/inventario/mostrarInventario.jsp";

        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
