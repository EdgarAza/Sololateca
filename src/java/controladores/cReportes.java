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
import reportes.reportesInventario;
import reportes.reportesUsuarios;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cReportes extends HttpServlet {

    String acceso = "";
    conexion con = new conexion();
    reportesInventario reportesI = new reportesInventario(con.getConnection());
    reportesUsuarios reportesU = new reportesUsuarios(con.getConnection());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("reportes")) {
            acceso = "vistas/reportes/reportes.jsp";

        } else if (action.equalsIgnoreCase("Inventario")) {
            reportesI.InventarioCompleto();

        } else if (action.equalsIgnoreCase("Minimo")) {
            reportesI.InventarioMinimo();

        } else if (action.equalsIgnoreCase("Existencia")) {
            reportesI.InventarioExistencia();

        } else if (action.equalsIgnoreCase("Activos")) {
            reportesU.UsuariosActivos();

        } else if (action.equalsIgnoreCase("Inactivos")) {
            reportesU.UsuariosInactivos();

        } else if (action.equalsIgnoreCase("Usuarios")) {
            reportesU.UsuariosInactivos();

        }
        acceso = "vistas/reportes/reportes.jsp";
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
