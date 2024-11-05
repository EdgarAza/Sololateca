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
        <jsp:include page="../extras/nav.jsp" />

        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {
        %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Éxito!</strong> <%= mensaje%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
        %>
        <h1>Compras</h1>
        <div class="tabla-madre">
            <form id="formBusqueda" action="cCompras" method="post"> 
                <div class="row g-3">
                    <div class="col-2 mb-3">
                        <label class="lcolor">Fecha</label>
                        <input type="text" id="txtFecha" class="form-control"  placeholder="Fecha" name="txtFecha">

                    </div>
                    <div class="col-2 mb-3">
                        <label class="lcolor">Numero</label>
                        <input type="text" id="txtNumero" class="form-control"  placeholder="Numero" name="txtNumero">

                    </div>
                    <div class="col-2 mb-3">
                        <label class="lcolor">Proveedor</label>
                        <input type="text" id="txtProveedor" class="form-control"  placeholder="Proveedor" name="txtProveedor">
                    </div>
                </div>

            </form>
            <form action="cCompras" method="post"> 
                <button type="submit" name="accion" class="btn btn-success mb-3" value="Nueva">Nueva Compra</button>
            </form>

            <div class="table-responsive">
                <table class="table table-striped" id="tableCompras">
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

                                <form action="cCompras" method="post" style="display: inline;">
                                    <input type="hidden" name="accion" value="Detalle">
                                    <input type="hidden" name="txtNumeroD" value="<%=com.getNumero()%>">
                                    <button type="submit" class="btn btn-primary" title="Detalle">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                        </svg>
                                    </button>
                                </form>

                          


                                <button type="button" class="btn btn-danger" 
                                        onclick="showConfirmDelete('<%=com.getNumero()%>')">
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
        <div id="confirmDeleteMessage" class="confirm-delete">
            <h5>Confirmar Eliminación</h5>
            <p style="color: black;">¿Estás seguro de que deseas eliminar este registro?</p>
            <button type="button" class="btn btn-danger" onclick="deleteRecord()">Eliminar</button>
            <button type="button" class="btn btn-secondary" onclick="closeConfirmDelete()">Cancelar</button>
        </div>

        <script>
            let recordIdToDelete = null;

            function closeConfirmDelete() {
                document.getElementById('confirmDeleteMessage').style.display = 'none';
            }

            function showConfirmDelete(id) {
                recordIdToDelete = id;
                document.getElementById('confirmDeleteMessage').style.display = 'block';
            }

            function deleteRecord() {
                if (recordIdToDelete) {
                    // Redirigir al controlador para eliminar
                    const form = document.createElement('form');
                    form.method = 'POST';
                    form.action = 'cCompras';

                    const hiddenField = document.createElement('input');
                    hiddenField.type = 'hidden';
                    hiddenField.name = 'numero';
                    hiddenField.value = recordIdToDelete;

                    const actionField = document.createElement('input');
                    actionField.type = 'hidden';
                    actionField.name = 'accion';
                    actionField.value = 'Eliminar';

                    form.appendChild(hiddenField);
                    form.appendChild(actionField);
                    document.body.appendChild(form);
                    form.submit();
                }
            }


            function filterTable() {
                const codigoFilter = document.getElementById('txtFecha').value.toLowerCase();
                const descripcionFilter = document.getElementById('txtNumero').value.toLowerCase();
                const proveedorFilter = document.getElementById('txtProveedor').value.toLowerCase();
                const table = document.querySelector('#tableCompras');
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const cells = rows[i].getElementsByTagName('td');
                    let showRow = true;

                    if (codigoFilter && cells[1].textContent.toLowerCase().indexOf(codigoFilter) === -1) {
                        showRow = false;
                    }
                    if (descripcionFilter && cells[2].textContent.toLowerCase().indexOf(descripcionFilter) === -1) {
                        showRow = false;
                    }
                     if (proveedorFilter && cells[3].textContent.toLowerCase().indexOf(proveedorFilter) === -1) {
                        showRow = false;
                    }


                    rows[i].style.display = showRow ? '' : 'none';
                }
            }
            document.getElementById('txtFecha').addEventListener('keyup', filterTable);
            document.getElementById('txtNumero').addEventListener('keyup', filterTable);
             document.getElementById('txtProveedor').addEventListener('keyup', filterTable);


        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html> 

