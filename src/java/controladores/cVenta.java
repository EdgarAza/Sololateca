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
import modelo.proveedores;
import modeloDAO.proveedoresDAO;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cVenta extends HttpServlet {

    int id;
    proveedores pro = new proveedores();
    proveedoresDAO proDAO = new proveedoresDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("mostrar")) {
            acceso = "vistas/venta/Venta.jsp";
        } else if (action.equalsIgnoreCase("vender")) {
            String codigo = request.getParameter("txtCodigo");
            String nombre = request.getParameter("txtNombre");
            String comercial = request.getParameter("txtComercial");
            String direccion = request.getParameter("txtDireccion");
            String correo = request.getParameter("txtCorreo");
            String telefono = request.getParameter("txtTelefono");
            String nota = request.getParameter("txtNota");

            pro.setCodigo(codigo);
            pro.setNombre(nombre);
            pro.setComercial(comercial);
            pro.setDireccion(direccion);
            pro.setCorreo(correo);
            pro.setTelefono(telefono);
            pro.setNota(nota);
            proDAO.guardar(pro);
            acceso = "vistas/proveedores/mostrarProveedores.jsp";

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
