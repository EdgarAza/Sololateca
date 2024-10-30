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
import modelo.proveedores;
import modeloDAO.proveedoresDAO;
import reportes.reportesProveedores;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cProveedores extends HttpServlet {

    int id;
    proveedores pro = new proveedores();
    proveedoresDAO proDAO = new proveedoresDAO();
    conexion con = new conexion();
    reportesProveedores reportes = new reportesProveedores(con.getConnection());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            acceso = "vistas/proveedores/mostrarProveedores.jsp";
        }else if (action.equalsIgnoreCase("Agregar")) {
            String nombre = request.getParameter("txtNombre");
            String razonSocial = request.getParameter("txtRazonSocial");
            String telefono = request.getParameter("txtTelefono");
            String correo = request.getParameter("txtCorreo");
            String direccion = request.getParameter("txtDireccion");
            String infopago = request.getParameter("txtInfoPago");
            String conpago = request.getParameter("txtConPago");

            pro.setNombre(nombre);
            pro.setRazonsocial(razonSocial);
            pro.setTelefono(telefono);
            pro.setCorreo(correo);
            pro.setDireccion(direccion);
            pro.setInfopago(infopago);
            pro.setConpago(conpago);
            pro.setEstado("ACTIVO");
            proDAO.guardar(pro);
            acceso = "vistas/proveedores/mostrarProveedores.jsp";

        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtId"));
            String nombre = request.getParameter("txtNombre");
            String razonSocial = request.getParameter("txtRazonSocial");
            String telefono = request.getParameter("txtTelefono");
            String correo = request.getParameter("txtCorreo");
            String direccion = request.getParameter("txtDireccion");
            String infopago = request.getParameter("txtInfoPago");
            String conpago = request.getParameter("txtConPago");
            String estado = request.getParameter("txtEstado");

            pro.setNombre(nombre);
            pro.setRazonsocial(razonSocial);
            pro.setTelefono(telefono);
            pro.setCorreo(correo);
            pro.setDireccion(direccion);
            pro.setInfopago(infopago);
            pro.setConpago(conpago);
            pro.setEstado(estado);
            pro.setId(id);
            proDAO.editar(pro);

            acceso = "vistas/proveedores/mostrarProveedores.jsp";
        }  else if (action.equalsIgnoreCase("proveedores")) {
            reportes.ProveedoresCompleto();
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