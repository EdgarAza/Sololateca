/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import configuracion.backup;
import configuracion.conexion;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.diario;
import modeloDAO.diarioDAO;
import reportes.reportesDiario;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cDiario extends HttpServlet {

    int id;
    diario dia = new diario();
    diarioDAO diaDao = new diarioDAO();
    conexion con = new conexion();
    reportesDiario reportes = new reportesDiario(con.getConnection());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("mostrar")) {
            acceso = "vistas/diario/mostrarDiario.jsp";
        } else if (action.equalsIgnoreCase("Agregar")) {

            String cliente = request.getParameter("txtCliente");
            String vendedor = request.getParameter("txtVendedor");
            String codigo = request.getParameter("txtCodigo");
            String cantidad = request.getParameter("txtCantidad");
            String descripcion = request.getParameter("txtDescripcion");
            String precio = request.getParameter("txtPrecio");
            String subtotal = request.getParameter("txtSubtotal");

            dia.setCliente(cliente);
            dia.setVendedor(vendedor);
            dia.setCodigo(codigo);
            dia.setCantidad(cantidad);
            dia.setDescripcion(descripcion);
            dia.setPrecio(precio);
            dia.setSubtotal(subtotal);
            diaDao.guardar(dia);
            acceso = "vistas/diario/mostrarDiario.jsp";

        } else if (action.equalsIgnoreCase("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            diaDao.eliminar(id);
             acceso = "vistas/diario/mostrarDiario.jsp";
        }else if (action.equalsIgnoreCase("Ventas")) {
            reportes.ClientesCompleto();
            acceso = "vistas/diario/mostrarDiario.jsp";

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
