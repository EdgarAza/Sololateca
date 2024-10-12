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
import modelo.usuarios;
import modeloDAO.usuariosDAO;
import reportes.reportesUsuarios;


/**
 *
 * @author DANIELS SYSTEMS
 */
public class controlador extends HttpServlet {

    usuariosDAO dao = new usuariosDAO();
    usuarios usu = new usuarios();
    int id;
conexion con = new conexion();
    reportesUsuarios reportes = new reportesUsuarios(con.getConnection());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("mostrar")) {
            acceso = "vistas/mostrar.jsp";
        } else if (action.equalsIgnoreCase("guardar")) {
            acceso = "vistas/guardar.jsp";

        } else if (action.equalsIgnoreCase("Agregar")) {
            String rol = "ADMIN";//request.getParameter("txtRol");
            String dpi = request.getParameter("txtDpi");
            String nombres = request.getParameter("txtNombres");
            String apellidos = request.getParameter("txtApellidos");
            String telefono = request.getParameter("txtTelefono");
            String direccion = request.getParameter("txtDireccion");
            String estado = "ACTIVO";

            usu.setRol(rol);
            usu.setDpi(dpi);
            usu.setNombres(nombres);
            usu.setApellidos(apellidos);
            usu.setTelefono(telefono);
            usu.setDireccion(direccion);
            usu.setEstado(estado);
            dao.guardar(usu);
            acceso = "vistas/mostrar.jsp";

        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idUsu", request.getParameter("id"));
            acceso = "vistas/editar.jsp";

        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtid"));
            String rol = "ADMIN";//request.getParameter("txtRol");
            String dpi = request.getParameter("txtDpi");
            String nombres = request.getParameter("txtNombres");
            String apellidos = request.getParameter("txtApellidos");
            String telefono = request.getParameter("txtTelefono");
            String direccion = request.getParameter("txtDireccion");
            String estado = "ACTIVO";

            usu.setRol(rol);
            usu.setDpi(dpi);
            usu.setNombres(nombres);
            usu.setApellidos(apellidos);
            usu.setTelefono(telefono);
            usu.setDireccion(direccion);
            usu.setEstado(estado);
            usu.setId(id);
            dao.editar(usu);

            acceso = "vistas/mostrar.jsp";
        } else if (action.equalsIgnoreCase("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
            acceso = "vistas/mostrar.jsp";
        } else if (action.equalsIgnoreCase("Usuarios")) {
            reportes.UsuariosCompletos();
             acceso = "vistas/mostrar.jsp";

        } else if (action.equalsIgnoreCase("Activos")) {         
            reportes.UsuariosActivos();
             acceso = "vistas/mostrar.jsp";

        }else if (action.equalsIgnoreCase("Inactivos")) {         
            reportes.UsuariosInactivos();
            acceso = "vistas/mostrar.jsp";

        }
        else if (action.equalsIgnoreCase("Buscar")) {            
            String busqueda = request.getParameter("txtBuscar");
            request.setAttribute("busqueda", busqueda);
            acceso = "vistas/mostrarUsuariosFiltro.jsp";
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
