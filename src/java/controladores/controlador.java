/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import configuracion.conexion;
import configuracion.encriptar;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("mostrar")) {
            acceso = "vistas/usuarios/mostrar.jsp";
        } else if (action.equalsIgnoreCase("Agregar")) {
            String rol = request.getParameter("txtRol");
            String usuario = request.getParameter("txtUsuario");
            String clave = request.getParameter("txtClave");
            String dpi = request.getParameter("txtDpi");
            String nombres = request.getParameter("txtNombres");
            String apellidos = request.getParameter("txtApellidos");
            String telefono = request.getParameter("txtTelefono");
            String direccion = request.getParameter("txtDireccion");
            String estado = "ACTIVO";

            usu.setRol(rol);
            usu.setUsuario(usuario);
            usu.setClave(clave);
            usu.setDpi(dpi);
            usu.setNombres(nombres);
            usu.setApellidos(apellidos);
            usu.setTelefono(telefono);
            usu.setDireccion(direccion);
            usu.setEstado(estado);
            dao.guardar(usu);
            request.setAttribute("mensaje", "Datos guardados exitosamente.");
            acceso = "vistas/usuarios/mostrar.jsp";

        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtId"));
            String rol = request.getParameter("txtRol");
            String usuario = request.getParameter("txtUsuario");
            String clave = request.getParameter("txtClave");
            String dpi = request.getParameter("txtDpi");
            String nombres = request.getParameter("txtNombres");
            String apellidos = request.getParameter("txtApellidos");
            String telefono = request.getParameter("txtTelefono");
            String direccion = request.getParameter("txtDireccion");
            String estado = request.getParameter("txtEstado");

            usu.setRol(rol);
            usu.setUsuario(usuario);
            usu.setClave(clave);
            usu.setDpi(dpi);
            usu.setNombres(nombres);
            usu.setApellidos(apellidos);
            usu.setTelefono(telefono);
            usu.setDireccion(direccion);
            usu.setEstado(estado);
            usu.setId(id);
            dao.editar(usu);
            request.setAttribute("mensaje", "Datos actualizados exitosamente.");
            acceso = "vistas/usuarios/mostrar.jsp";
        } 

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
