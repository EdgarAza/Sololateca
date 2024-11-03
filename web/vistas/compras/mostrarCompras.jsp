<%-- 
    Document   : mostrarCompras
    Created on : 3/11/2024, 06:23:03
    Author     : DANIELS SYSTEMS
--%>

<%@page import="modelo.compras"%>
<%@page import="modeloDAO.comprasDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">

    </head>
    <body>
        <h1>Compras</h1>
        <div class="tabla-madre">
            <form id="formBusqueda" action="cCompras" method="post"> 
                <div class="row g-3">
                    <div class="col-2 mb-3">
                        <label>Fecha</label>
                        <input type="text" class="form-control"  placeholder="Fecha" name="txtFecha">

                    </div>
                    <div class="col-2 mb-3">
                        <label>Numero</label>
                        <input type="text" class="form-control"  placeholder="Numero" name="txtNumero">

                    </div>
                    <div class="col-2 mb-3">
                        <label>Proveedor</label>
                        <input type="text" class="form-control"  placeholder="Proveedor" name="txtProveedor">
                    </div>
                </div>

            </form>
            <form action="cCompras" method="post"> 
                <button type="submit" name="accion" class="btn btn-success mb-3" value="Nueva">Nueva Compra</button>
            </form>

            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Numero</th>
                            <th scope="col">Proveedor</th>
                            <th scope="col">Total</th>
                            <th scope="col">Fecha Pago</th>
                            <th scope="col">Nota</th>         
                            <th scope="col">ACCIONES</th> 
                        </tr>
                    </thead>

                    <%
                        comprasDAO dao = new comprasDAO();
                        List<compras> list = dao.mostrar();
                        Iterator<compras> iter = list.iterator();
                        compras com = null;
                        while (iter.hasNext()) {
                            com = iter.next();

                    %>
                    <tbody>
                        <tr>
                            <td><%=com.getId()%></td>
                            <td><%=com.getFecha()%></td>
                            <td><%=com.getNumero()%></td>
                            <td><%=com.getProveedor()%></td>
                            <td><%=com.getTotal()%></td>
                            <td><%=com.getFechapago()%></td>
                            <td><%=com.getNota()%></td>
                            <td>


                                <button type="submit" form="formBusqueda" name="accion" class="btn btn-primary" value="Detalle">Detalle</button>


                                <button type="button" class="btn btn-danger" 
                                        onclick="showConfirmDelete(<%=com.getId()%>)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                                    </svg>
                                </button>
                            </td>

                        </tr>
                        <%}%>
                    </tbody>

                </table>
            </div>


                    <form action="cInventario" method="post"> 
                <button type="submit" name="accion" class="btn btn-warning mb-3" value="Inventario">Inventario</button>
                <button type="submit" name="accion" class="btn btn-warning mb-3" value="Minimo">Minimo</button>
                <button type="submit" name="accion" class="btn btn-warning mb-3" value="Existencia">Existencia</button>
            </form>

        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html> 

