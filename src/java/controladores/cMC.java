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
import modelo.categoria;
import modelo.marca;
import modeloDAO.categoriaDAO;
import modeloDAO.marcaDAO;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cMC extends HttpServlet {

    int idmar;
    int idcat;
    marca mar = new marca();
    marcaDAO marDao = new marcaDAO();
    categoria cat = new categoria();
    categoriaDAO catDao = new categoriaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("mostrar")) {
            acceso = "vistas/marca-categoria/mostrarMC.jsp";
        } else if (action.equalsIgnoreCase("AgregarMarca")) {
            String marca = request.getParameter("txtMarca");
            mar.setMarca(marca);
            marDao.guardar(mar);
            request.setAttribute("mensaje", "Datos guardados exitosamente.");
            acceso = "vistas/marca-categoria/mostrarMC.jsp";

        } else if (action.equalsIgnoreCase("ActualizarMarca")) {
            idmar = Integer.parseInt(request.getParameter("txtIdMarca"));
            String marca = request.getParameter("txtMarca");
            mar.setMarca(marca);
            mar.setId(idmar);
            marDao.editar(mar);
            request.setAttribute("mensaje", "Datos actualizados exitosamente.");
            acceso = "vistas/marca-categoria/mostrarMC.jsp";
        } else if (action.equalsIgnoreCase("EliminarMarca")) {
            idmar = Integer.parseInt(request.getParameter("idMarca"));
            marDao.eliminar(idmar);
            request.setAttribute("mensaje", "Datos eliminados exitosamente.");
            acceso = "vistas/marca-categoria/mostrarMC.jsp";
        } else if (action.equalsIgnoreCase("AgregarCategoria")) {
            String categoria = request.getParameter("txtCategoria");
            cat.setCategoria(categoria);
            catDao.guardar(cat);
            request.setAttribute("mensaje", "Datos guardados exitosamente.");
            acceso = "vistas/marca-categoria/mostrarMC.jsp";

        } else if (action.equalsIgnoreCase("ActualizarCategoria")) {
            idcat = Integer.parseInt(request.getParameter("txtIdCategoria"));
            String categoria = request.getParameter("txtCategoria");

            cat.setCategoria(categoria);
            cat.setId(idcat);
            catDao.editar(cat);
            request.setAttribute("mensaje", "Datos actualizados exitosamente.");
            acceso = "vistas/marca-categoria/mostrarMC.jsp";
        } else if (action.equalsIgnoreCase("EliminarCategoria")) {
            idcat = Integer.parseInt(request.getParameter("idCategoria"));
            catDao.eliminar(idcat);
            request.setAttribute("mensaje", "Datos eliminados exitosamente.");
            acceso = "vistas/marca-categoria/mostrarMC.jsp";
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
