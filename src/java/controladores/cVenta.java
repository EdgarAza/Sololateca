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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import modelo.diario;
import modelo.inventario;
import modelo.proveedores;
import modelo.ventas;
import modeloDAO.diarioDAO;
import modeloDAO.inventarioDAO;
import modeloDAO.proveedoresDAO;
import modeloDAO.ventasDAO;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cVenta extends HttpServlet {
    
    int id;
    proveedores pro = new proveedores();
    proveedoresDAO proDAO = new proveedoresDAO();
    inventario inv = new inventario();
    inventarioDAO invDAO = new inventarioDAO();
    diario dia = new diario();
    diarioDAO diaDAO = new diarioDAO();
    ventas ven = new ventas();
    ventasDAO venDAO = new ventasDAO();
    double xcantidad = 0.00;
    double xstock = 0.00;
    double xnstock = 0.00;
    double xprecio = 0.00;
    double xcosto = 0.00;
    double xganancia = 0.00;
    DateTimeFormatter Fecha2 = DateTimeFormatter.ofPattern("ddMMhhmmss");
    String numeroVenta = Fecha2.format(LocalDateTime.now());
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
            acceso = "vistas/venta/Venta.jsp";
        } else if (action.equalsIgnoreCase("vender")) {
            String tablaDatos = request.getParameter("tablaDatos");
            String cliente = request.getParameter("txtmNombre2");
            String usuario = "admin";
            String total = request.getParameter("total2");

            // Dividir los datos en filas
            String[] filas = tablaDatos.split(";");
            
            for (String fila : filas) {
                String[] datos = fila.split(",");
                
                if (datos.length == 7) { // Asegúrate de que haya tres elementos
                    String cantidadt = datos[0].trim();
                    String codigot = datos[1].trim();
                    String descripciont = datos[2].trim();
                    String preciot = datos[3].trim();
                    String subtotalt = datos[4].trim();
                    String costot = datos[5].trim();
                    String stockt = datos[6].trim();
                   
                    //aqui actualizamos la tabla productos
                    xcantidad = Double.parseDouble(cantidadt);
                    xstock = Double.parseDouble(stockt);
                    xnstock = xstock - xcantidad;
                    inv.setStock(String.valueOf(xnstock));
                    inv.setCodigo(codigot);
                    invDAO.actulizarStock(inv);

                    ///aqui registramos el diario
                    dia.setFecha(fdia);
                    dia.setNumero(numeroVenta);
                    dia.setCliente(cliente);
                    dia.setVendedor(usuario);
                    dia.setCodigo(codigot);
                    dia.setCantidad(cantidadt);
                    dia.setDescripcion(descripciont);
                    dia.setPrecio(preciot);
                    dia.setCosto(costot);
                    dia.setSubtotal(subtotalt);
                    diaDAO.guardar(dia);

                    ///aqui registramos el indice de venta
                    ven.setFecha(fdia);
                    ven.setNumero(numeroVenta);
                    ven.setCliente(cliente);
                    ven.setTotal(total);
                    venDAO.guardar(ven);
                    
                }
                
            }
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
