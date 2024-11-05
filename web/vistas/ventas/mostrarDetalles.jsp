<%-- 
    Document   : mostrarDetalles
    Created on : 5/11/2024, 00:59:03
    Author     : DANIELS SYSTEMS
--%>

<%@page import="modelo.diario"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.diarioDAO"%>
<%@page import="modelo.busqueda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle Venta</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <<h1>Detalle de Venta</h1>
        <div class="tabla-madre">
            <form action="cVentas" method="post"> 
                <button type="submit" name="accion" class="btn btn-primary mb-3" value="mostrar">Regresar</button>
            </form>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Numero</th>
                            <th scope="col">Cliente</th>
                            <th scope="col">Vendedor</th>
                            <th scope="col">Codigo</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Subtotal</th>

                        </tr>
                    </thead>

                    <%
                        Double suma = 0.00;
                        Double venta = 0.00;
                        busqueda bus = (busqueda) session.getAttribute("buscar");
                        String x = (bus != null) ? bus.getBuscar() : "";
                        diarioDAO dao = new diarioDAO();
                        List<diario> list = dao.mostrarDetalle(x);
                        for (diario dia : list) {
                            venta = Double.parseDouble(dia.getPrecio());
                            suma = suma + venta;
                    %>
                    <tbody>
                        <tr>
                            <td><%=dia.getId()%></td>
                            <td><%=dia.getFecha()%></td>
                            <td><%=dia.getNumero()%></td>
                            <td><%=dia.getCliente()%></td>
                            <td><%=dia.getVendedor()%></td>
                            <td><%=dia.getCodigo()%></td>
                            <td><%=dia.getCantidad()%></td>
                            <td><%=dia.getDescripcion()%></td>
                            <td><%=dia.getPrecio()%></td>
                            <td><%=dia.getSubtotal()%></td>



                        </tr>
                        <%}%>
                    </tbody>

                </table>
            </div>
            <h3>Total de la venta Q. <%= String.format("%.2f", suma)%></h3>



        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>