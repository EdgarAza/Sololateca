<%-- 
    Document   : detallesCompras
    Created on : 3/11/2024, 14:15:03
    Author     : DANIELS SYSTEMS
--%>

<%@page import="modelo.busqueda"%>
<%@page import="modelo.detallecompras"%>
<%@page import="modeloDAO.detalleComprasDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <h1>Detalle de Compra</h1>
        <div class="tabla-madre">
            <form action="cCompras" method="post"> 
                <button type="submit" name="accion" class="btn btn-primary mb-3" value="mostrar">Regresar</button>
            </form>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Numero</th>
                            <th scope="col">Codigo</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Costo</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Cantidad</th>         

                        </tr>
                    </thead>

                    <%
                       

                            busqueda bus = (busqueda) session.getAttribute("buscar");
                            String x = (bus != null) ? bus.getBuscar() : "";
                            detalleComprasDAO dao = new detalleComprasDAO();
                            List<detallecompras> list = dao.mostrar(x);
                            for (detallecompras dcom : list) {
                    %>
                    <tbody>
                        <tr>
                            <td><%=dcom.getId()%></td>
                            <td><%=dcom.getNumero()%></td>
                            <td><%=dcom.getCodigo()%></td>
                            <td><%=dcom.getDescripcion()%></td>
                            <td><%=dcom.getCosto()%></td>
                            <td><%=dcom.getPrecio()%></td>
                            <td><%=dcom.getCantidad()%></td>


                        </tr>
                        <%}%>
                    </tbody>

                </table>
            </div>




        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
