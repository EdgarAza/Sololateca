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
        
        
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("mostrar")) {
            acceso = "vistas/proveedores/mostrarProveedores.jsp";
        } else if (action.equalsIgnoreCase("guardar")) {
            acceso = "vistas/proveedores/guardarProveedores.jsp";

        } else if (action.equalsIgnoreCase("Agregar")) {
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

        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idPro", request.getParameter("id"));
            acceso = "vistas/proveedores/editarProveedores.jsp";

        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtid"));
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
            pro.setId(id);
            proDAO.editar(pro);

             acceso = "vistas/proveedores/mostrarProveedores.jsp";
        } else if (action.equalsIgnoreCase("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            proDAO.eliminar(id);
            acceso = "vistas/proveedores/mostrarProveedores.jsp";
        }else if (action.equalsIgnoreCase("proveedores")) {
            reportes.ProveedoresCompleto();
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
