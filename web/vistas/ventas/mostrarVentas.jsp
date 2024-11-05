<%@page import="modelo.busqueda"%>
<%@page import="modelo.ventas"%>
<%@page import="modeloDAO.ventasDAO"%>
<%@page import="configuracion.conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas</title>
        <link rel="stylesheet" href="assets/css/style.css">
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

        <h1>Indice de Ventas</h1>
        <div class="tabla-madre">
            <form action="cVentas" class="row g-3 align-items-center" method="post">
                <div class="col-auto d-flex align-items-center">
                    <input type="text" class="form-control mb-3" placeholder="Busqueda" name="txtBusqueda"> 
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
                            <th scope="col">Total</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>

                    <%
                        busqueda bus = (busqueda) session.getAttribute("buscar");
                        String x = (bus != null) ? bus.getBuscar() : "";
                        ventasDAO dao = new ventasDAO();
                        List<ventas> list = dao.mostrar(x);
                        for (ventas ven : list) {

                    %>
                    <tbody>
                        <tr>
                            <td><%=ven.getId()%></td>
                            <td><%=ven.getFecha()%></td>
                            <td><%=ven.getNumero()%></td>
                            <td><%=ven.getCliente()%></td>
                            <td><%=ven.getTotal()%></td>
                            <td>

                                <form action="cVentas" method="post" style="display: inline;">
                                    <input type="hidden" name="accion" value="Reimpresion">
                                    <input type="hidden" name="txtNumeroR" value="<%=ven.getNumero()%>">
                                    <button type="submit" class="btn btn-success" title="Reimpresion">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-receipt" viewBox="0 0 16 16">
                                        <path d="M1.92.506a.5.5 0 0 1 .434.14L3 1.293l.646-.647a.5.5 0 0 1 .708 0L5 1.293l.646-.647a.5.5 0 0 1 .708 0L7 1.293l.646-.647a.5.5 0 0 1 .708 0L9 1.293l.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .801.13l.5 1A.5.5 0 0 1 15 2v12a.5.5 0 0 1-.053.224l-.5 1a.5.5 0 0 1-.8.13L13 14.707l-.646.647a.5.5 0 0 1-.708 0L11 14.707l-.646.647a.5.5 0 0 1-.708 0L9 14.707l-.646.647a.5.5 0 0 1-.708 0L7 14.707l-.646.647a.5.5 0 0 1-.708 0L5 14.707l-.646.647a.5.5 0 0 1-.708 0L3 14.707l-.646.647a.5.5 0 0 1-.801-.13l-.5-1A.5.5 0 0 1 1 14V2a.5.5 0 0 1 .053-.224l.5-1a.5.5 0 0 1 .367-.27m.217 1.338L2 2.118v11.764l.137.274.51-.51a.5.5 0 0 1 .707 0l.646.647.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.509.509.137-.274V2.118l-.137-.274-.51.51a.5.5 0 0 1-.707 0L12 1.707l-.646.647a.5.5 0 0 1-.708 0L10 1.707l-.646.647a.5.5 0 0 1-.708 0L8 1.707l-.646.647a.5.5 0 0 1-.708 0L6 1.707l-.646.647a.5.5 0 0 1-.708 0L4 1.707l-.646.647a.5.5 0 0 1-.708 0z"/>
                                        <path d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5m8-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5"/>
                                        </svg>
                                    </button>
                                </form>

                                <form action="cVentas" method="post" style="display: inline;">
                                    <input type="hidden" name="accion" value="Detalle">
                                    <input type="hidden" name="txtNumeroD" value="<%=ven.getNumero()%>">
                                    <button type="submit" class="btn btn-primary" title="Detalle">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                        </svg>
                                    </button>
                                </form>


                                <button type="button" class="btn btn-danger" 
                                        onclick="showConfirmDelete('<%=ven.getNumero()%>')">
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
                    form.action = 'cVentas';

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
