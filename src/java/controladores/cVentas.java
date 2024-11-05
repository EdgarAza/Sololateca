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
import modelo.ventas;
import modeloDAO.diarioDAO;
import modeloDAO.ventasDAO;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cVentas extends HttpServlet {

    int id;
    ventas ven = new ventas();
    ventasDAO venDao = new ventasDAO();
    diarioDAO diaDao = new diarioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("mostrar")) {
            acceso = "vistas/ventas/mostrarVentas.jsp";
        } else if (action.equalsIgnoreCase("Agregar")) {

            String fecha = request.getParameter("txtFecha");
            String cliente = request.getParameter("txtCliente");
            String total = request.getParameter("txtTotal");

            ven.setFecha(fecha);
            ven.setCliente(cliente);
            ven.setTotal(total);
            venDao.guardar(ven);
            acceso = "vistas/ventas/mostrarVentas.jsp";

        } else if (action.equalsIgnoreCase("Detalle")) {
            String numero = request.getParameter("txtNumeroD");
            busqueda bus = new busqueda();
            bus.setBuscar(numero);
            HttpSession session = request.getSession();
            session.setAttribute("buscar", bus);
            acceso = "vistas/ventas/mostrarDetalles.jsp";

        } else if (action.equalsIgnoreCase("Buscar")) {
            String busqueda = request.getParameter("txtBusqueda");
            busqueda bus = new busqueda();
            bus.setBuscar(busqueda);
            HttpSession session = request.getSession();
            session.setAttribute("buscar", bus);
            acceso = "vistas/ventas/mostrarVentas.jsp";

        } else if (action.equalsIgnoreCase("Eliminar")) {
            String numerox = request.getParameter("numerox");
            venDao.eliminar(numerox);
            diaDao.eliminar(numerox);
            request.setAttribute("mensaje", "Datos eliminados exitosamente.");
         acceso = "vistas/ventas/mostrarVentas.jsp";
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
