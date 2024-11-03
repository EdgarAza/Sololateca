/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.busqueda;
import modelo.provcategorias;
import modeloDAO.provcategoriasDAO;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cProvCategorias extends HttpServlet {

    int id;
    provcategorias proc = new provcategorias();
    provcategoriasDAO procDAO = new provcategoriasDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("AgregarCategoria")) {
            String categoria = request.getParameter("txtCategoria");
            String proveedor = request.getParameter("txtProveedor");

            proc.setCategoria(categoria);
            proc.setProveedor(proveedor);
            procDAO.guardar(proc);
            request.setAttribute("mensaje", "Datos guardados exitosamente.");
            acceso = "vistas/proveedores/mostrarProveedores.jsp";

        } else if (action.equalsIgnoreCase("Buscar")) {
            String busquedaTexto = request.getParameter("txtProveedor");

            busqueda bus = new busqueda();
            bus.setBuscar(busquedaTexto);

            HttpSession session = request.getSession();
            session.setAttribute("buscar", bus); // Usa la misma clave "buscar"

            acceso = "vistas/proveedores/mostrarProveedores.jsp";

        } else if (action.equalsIgnoreCase("Eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            procDAO.eliminar(id);
          acceso = "vistas/proveedores/mostrarProveedores.jsp";
        } 
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
