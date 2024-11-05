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
import jakarta.servlet.http.HttpSession;
import modelo.busqueda;
import modelo.compras;
import modelo.detallecompras;
import modelo.historialproductos;
import modelo.inventario;
import modeloDAO.comprasDAO;
import modeloDAO.detalleComprasDAO;
import modeloDAO.historialProductosDAO;
import modeloDAO.inventarioDAO;

public class cCompras extends HttpServlet {

    compras comp = new compras();
    comprasDAO compDAO = new comprasDAO();
    detallecompras dcom = new detallecompras();
    detalleComprasDAO dcomDAO = new detalleComprasDAO();
    historialproductos hpro = new historialproductos();
    historialProductosDAO hproDAO = new historialProductosDAO();
    inventario inv = new inventario();
    inventarioDAO invDAO = new inventarioDAO();
    String numero;
    double xcantidad = 0.00;
    double xstock = 0.00;
    double xnstock = 0.00;
    double xprecio = 0.00;
    double xcosto = 0.00;
    double xganancia = 0.00;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("mostrar")) {
            acceso = "vistas/compras/mostrarCompras.jsp";
        } else if (action.equalsIgnoreCase("Nueva")) {
            acceso = "vistas/compras/nuevaCompra.jsp";
        } else if (action.equalsIgnoreCase("Detalle")) {
            String busquedaTexto = request.getParameter("txtNumeroD");
            busqueda bus = new busqueda();
            bus.setBuscar(busquedaTexto);
            HttpSession session = request.getSession();
            session.setAttribute("buscar", bus);
            acceso = "vistas/compras/detallesCompras.jsp";
        } else if (action.equalsIgnoreCase("AgregarDatos")) {
            String fecha = request.getParameter("txtFecha");
            String numero = request.getParameter("txtNumero");
            String proveedor = request.getParameter("txtProveedor");
            String total = request.getParameter("txtTotal");
            String fechapago = request.getParameter("txtFechaPago");
            String nota = request.getParameter("txtNota");

            ///Guardar tabla compra
            comp.setFecha(fecha);
            comp.setNumero(numero);
            comp.setProveedor(proveedor);
            comp.setTotal(total);
            comp.setFechapago(fechapago);
            comp.setNota(nota);
            compDAO.guardar(comp);

            String tablaDatos = request.getParameter("tablaDatos");

            // Dividir los datos en filas
            String[] filas = tablaDatos.split(";");

            for (String fila : filas) {
                String[] datos = fila.split(",");

                if (datos.length == 8) {
                    String cantidadt = datos[0].trim();
                    String codigot = datos[1].trim();
                    String descripciont = datos[2].trim();
                    String costot = datos[3].trim();
                    String preciot = datos[4].trim();
                    String stockt = datos[5].trim();
                    String cat = datos[6].trim();
                    String pat = datos[7].trim();

                    //Guarda tabla historial productos
                    hpro.setUsuario("Usuario");//este campo es fijo
                    hpro.setCodigo(codigot);
                    hpro.setDescripcion(descripciont);
                    hpro.setCostoanterior(cat);
                    hpro.setPrecioanterior(pat);
                    hpro.setCostonuevo(costot);
                    hpro.setPrecionuevo(preciot);
                    hpro.setFecha(fecha);
                    hpro.setMensaje("Registro de compra");//este campo es fijo
                    hproDAO.guardar(hpro);

                    //Guarda tabla detalle compra
                    dcom.setNumero(numero);//dato fijo
                    dcom.setCodigo(codigot);
                    dcom.setDescripcion(descripciont);
                    dcom.setCosto(costot);
                    dcom.setPrecio(preciot);
                    dcom.setCantidad(cantidadt);
                    dcomDAO.guardar(dcom);

                    //aqui actualizamos la tabla productos
                    xcantidad = Double.parseDouble(cantidadt);
                    xstock = Double.parseDouble(stockt);
                    xnstock = xcantidad + xstock;
                    xprecio = Double.parseDouble(preciot);
                    xcosto = Double.parseDouble(costot);
                    xganancia = xprecio - xcosto;

                    inv.setStock(String.valueOf(xnstock));
                    inv.setCosto(costot);
                    inv.setPrecio(preciot);
                    inv.setGanancia(String.valueOf(xganancia));
                    inv.setFechaModificacion(fecha);
                    inv.setCodigo(codigot);
                    invDAO.actulizarCompra(inv);
                }
            }
            acceso = "vistas/compras/mostrarCompras.jsp";

        } else if (action.equalsIgnoreCase("Eliminar")) {
           
            numero = request.getParameter("numero");     
            compDAO.eliminar(numero);      
            dcomDAO.eliminar(numero);

            request.setAttribute("mensaje", "Datos actualizados exitosamente.");
            acceso = "vistas/compras/mostrarCompras.jsp";
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador de Compras";
    }
}
