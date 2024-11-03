/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import configuracion.backup;
import configuracion.conexion;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.swing.JOptionPane;
import modelo.busqueda;
import modelo.inventario;
import modeloDAO.inventarioDAO;
import reportes.reportesInventario;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cInventario extends HttpServlet {

    int id;
    inventario inv = new inventario();
    inventarioDAO invDao = new inventarioDAO();
    conexion con = new conexion();
    reportesInventario reportes = new reportesInventario(con.getConnection());
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
            acceso = "vistas/inventario/mostrarInventario.jsp";
        } else if (action.equalsIgnoreCase("Agregar")) {
            String codigo = request.getParameter("txtCodigo");
            String unidad = request.getParameter("txtUnidad");
            String descripcion = request.getParameter("txtDescripcion");
            String stock = request.getParameter("txtStock");
            String costo = request.getParameter("txtCosto");
            String precio = request.getParameter("txtPrecio");
            double cos = Double.parseDouble(costo);
            double pres = Double.parseDouble(precio);
            double res = pres - cos;
            String ganancia = String.valueOf(res);
            String minimo = request.getParameter("txtMinimo");
            String marca = request.getParameter("txtMarca");
            String categoria = request.getParameter("txtCategoria");
            String fechaCreacion = fdia;
            String fechaModificacion = fdia;

            inv.setCodigo(codigo);
            inv.setUnidadmedida(unidad);
            inv.setDescripcion(descripcion);
            inv.setStock(stock);
            inv.setCosto(costo);
            inv.setPrecio(precio);
            inv.setGanancia(ganancia);
            inv.setMinimo(minimo);
            inv.setMarca(marca);
            inv.setCategoria(categoria);
            inv.setFechaCreacion(fechaCreacion);
            inv.setFechaModificacion(fechaModificacion);
            invDao.guardar(inv);
            acceso = "vistas/inventario/mostrarInventario.jsp";

        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtId"));
            String codigo = request.getParameter("txtCodigo");
            String unidad = request.getParameter("txtUnidad");
            String descripcion = request.getParameter("txtDescripcion");
            String stock = request.getParameter("txtStock");
            String costo = request.getParameter("txtCosto");
            String precio = request.getParameter("txtPrecio");
            double cos = Double.parseDouble(costo);
            double pres = Double.parseDouble(precio);
            double res = pres - cos;
            String ganancia = String.valueOf(res);
            String minimo = request.getParameter("txtMinimo");
            String marca = request.getParameter("txtMarca");
            String categoria = request.getParameter("txtCategoria");

            inv.setCodigo(codigo);
            inv.setUnidadmedida(unidad);
            inv.setDescripcion(descripcion);
            inv.setStock(stock);
            inv.setCosto(costo);
            inv.setPrecio(precio);
            inv.setGanancia(ganancia);
            inv.setMinimo(minimo);
            inv.setMarca(marca);
            inv.setCategoria(categoria);
            inv.setFechaModificacion(fdia);
            inv.setId(id);
            invDao.editar(inv);

            acceso = "vistas/inventario/mostrarInventario.jsp";
        } else if (action.equalsIgnoreCase("Eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            invDao.eliminar(id);
            acceso = "vistas/inventario/mostrarInventario.jsp";
        } else if (action.equalsIgnoreCase("Inventario")) {
            reportes.InventarioCompleto();
            acceso = "vistas/inventario/mostrarInventario.jsp";

        } else if (action.equalsIgnoreCase("Minimo")) {
            reportes.InventarioMinimo();
            acceso = "vistas/inventario/mostrarInventario.jsp";

        } else if (action.equalsIgnoreCase("Existencia")) {
            reportes.InventarioExistencia();
            acceso = "vistas/inventario/mostrarInventario.jsp";

        } else if (action.equalsIgnoreCase("Backup")) {
            backup p = new backup();
            p.ejecutar();
            acceso = "vistas/inventario/mostrarInventario.jsp";

        } else if (action.equalsIgnoreCase("Buscar")) {
            String busquedaTexto = request.getParameter("txtBusqueda");
            busqueda bus = new busqueda();
            bus.setBuscar(busquedaTexto);

            HttpSession session = request.getSession();
            session.setAttribute("buscar", bus); // Usa la misma clave "buscar"

        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
