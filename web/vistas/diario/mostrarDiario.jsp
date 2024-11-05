<%@page import="modelo.busqueda"%>
<%@page import="modelo.diario"%>
<%@page import="modeloDAO.diarioDAO"%>
<%@page import="configuracion.conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas Diarias</title>
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
            <%= mensaje%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
        %>




        <h1>Ventas Diarias</h1>
        <div class="tabla-madre">
            <form action="cDiario" class="row g-3 align-items-center" method="post">
                <div class="col-auto d-flex align-items-center">
                    <input type="text" class="form-control mb-3" placeholder="Fecha" name="txtBusqueda"> 
                </div> 
                <div class="col-auto">
                    <button type="submit" class="btn btn-success mb-3" name="accion" value="Buscar">Buscar</button>
                </div>
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
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>

                    <%
                        Double suma = 0.00;
                        Double venta = 0.00;
                        busqueda bus = (busqueda) session.getAttribute("buscar");
                        String x = (bus != null) ? bus.getBuscar() : "";
                        diarioDAO dao = new diarioDAO();
                        List<diario> list = dao.mostrar(x);
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

                            <td>
                                <button type="button" class="btn btn-danger" 
                                        onclick="showConfirmDelete('<%=dia.getNumero()%>')">
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
            <h3>Total de la venta Q. <%= String.format("%.2f", suma)%></h3>

            <div class="form-reportes">
                <form action="cDiario" >       
                    <input type="submit" class="btn btn-warning" name="accion" value="Ventas">
                </form>
            </div>

        </div>

        <div id="confirmDeleteMessage" class="confirm-delete">
            <h5>Confirmar Eliminación</h5>
            <p>¿Estás seguro de que deseas eliminar este registro?</p>
            <button type="button" class="btn btn-danger" onclick="deleteRecord()">Eliminar</button>
            <button type="button" class="btn btn-secondary" onclick="closeConfirmDelete()">Cancelar</button>
        </div>
        <script>

            let recordIdToDelete = null;

            function showConfirmDelete(id) {
                recordIdToDelete = id;
                document.getElementById('confirmDeleteMessage').style.display = 'block';
            }

            function closeConfirmDelete() {
                document.getElementById('confirmDeleteMessage').style.display = 'none';
            }

            function deleteRecord() {
                if (recordIdToDelete) {
                    // Redirigir al controlador para eliminar
                    const form = document.createElement('form');
                    form.method = 'POST';
                    form.action = 'cDiario';

                    const hiddenField = document.createElement('input');
                    hiddenField.type = 'hidden';
                    hiddenField.name = 'numerox';
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

            // Función para cerrar la alerta automáticamente
            window.onload = function () {
                const alert = document.querySelector('.alert');
                if (alert) {
                    setTimeout(() => {
                        alert.classList.remove('show');
                        alert.classList.add('fade');
                        alert.style.display = 'none';
                    }, 2000); // 500 milisegundos
                }
            };

        </script>>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
