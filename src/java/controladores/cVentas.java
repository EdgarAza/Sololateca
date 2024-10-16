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
import modelo.ventas;
import modeloDAO.ventasDAO;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cVentas extends HttpServlet {

     int id;
    ventas ven = new ventas();
    ventasDAO venDao = new ventasDAO();
   
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

        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
