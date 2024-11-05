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
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import modelo.busqueda;
import modelo.clientes;
import modeloDAO.clientesDAO;
import reportes.reportesClientes;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cClientes extends HttpServlet {

    int id;
    clientes cli = new clientes();
    clientesDAO cliDAO = new clientesDAO();
    conexion con = new conexion();
    busqueda bus = new busqueda();
    reportesClientes reportes = new reportesClientes(con.getConnection());
    DateTimeFormatter Fecha = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    String fdia = Fecha.format(LocalDateTime.now());

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
            acceso = "vistas/clientes/mostrarClientes.jsp";
        } else if (action.equalsIgnoreCase("Agregar")) {
            String nombre = request.getParameter("txtNombre");
            String telefono = request.getParameter("txtTelefono");
            String correo = request.getParameter("txtCorreo");
            String direccion = request.getParameter("txtDireccion");

            cli.setNombre(nombre);
            cli.setTelefono(telefono);
            cli.setCorreo(correo);
            cli.setDireccion(direccion);
            cli.setFechaCreacion(fdia);
            cli.setEstado("ACTIVO");
            cliDAO.guardar(cli);
            request.setAttribute("mensaje", "Datos guardados exitosamente.");
            acceso = "vistas/clientes/mostrarClientes.jsp";

        } else if (action.equalsIgnoreCase("AgregarV")) {
            String nombre = request.getParameter("txtNombre");
            String telefono = request.getParameter("txtTelefono");
            String correo = request.getParameter("txtCorreo");
            String direccion = request.getParameter("txtDireccion");

            cli.setNombre(nombre);
            cli.setTelefono(telefono);
            cli.setCorreo(correo);
            cli.setDireccion(direccion);
            cli.setFechaCreacion(fdia);
            cli.setEstado("ACTIVO");
            cliDAO.guardar(cli);
            request.setAttribute("mensaje", "Datos guardados exitosamente.");
            acceso = "vistas/venta/Venta.jsp";

        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtId"));
            String nombre = request.getParameter("txtNombre");
            String telefono = request.getParameter("txtTelefono");
            String correo = request.getParameter("txtCorreo");
            String direccion = request.getParameter("txtDireccion");
            String estado = request.getParameter("txtEstado");
            cli.setNombre(nombre);
            cli.setTelefono(telefono);
            cli.setCorreo(correo);
            cli.setDireccion(direccion);
            cli.setEstado(estado);
            cli.setId(id);
            cliDAO.editar(cli);
            request.setAttribute("mensaje", "Datos actualizados exitosamente.");
            acceso = "vistas/clientes/mostrarClientes.jsp";
        } else if (action.equalsIgnoreCase("Buscar")) {
            String busquedaTexto = request.getParameter("txtBusqueda");

            busqueda bus = new busqueda();
            bus.setBuscar(busquedaTexto);

            HttpSession session = request.getSession();
            session.setAttribute("buscar", bus); // Usa la misma clave "buscar"

            acceso = "vistas/clientes/mostrarClientes.jsp";

        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
