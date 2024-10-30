<%@page import="modelo.busqueda"%>
<%@page import="modelo.clientes"%>
<%@page import="modeloDAO.clientesDAO"%>
<%@page import="configuracion.conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Clientes</title>
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
    <h1>Clientes</h1>

    <div class="tabla-madre">
        <form action="cClientes" class="row g-3 align-items-center" method="post">
            <div class="col-auto d-flex align-items-center">
                <input type="text" class="form-control mb-3" placeholder="Busqueda" name="txtBusqueda"> 
            </div> 
            <div class="col-auto">
                <button type="submit" class="btn btn-success mb-3" name="accion" value="Buscar">Buscar</button>
            </div>
        </form>

        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#guardarClientesModal">Agregar</button>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">Fecha de Creacion</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        busqueda bus = (busqueda) session.getAttribute("buscar");
                        String x = (bus != null) ? bus.getBuscar() : "";
                        clientesDAO dao = new clientesDAO();
                        List<clientes> list = dao.mostrar(x);
                        for (clientes cli : list) {
                    %>
                    <tr>
                        <td><%=cli.getId()%></td>
                        <td><%=cli.getNombre()%></td>
                        <td><%=cli.getTelefono()%></td>
                        <td><%=cli.getCorreo()%></td>
                        <td><%=cli.getDireccion()%></td>
                        <td><%=cli.getFechaCreacion()%></td>
                        <td>
                            <button type="button" class="btn btn-warning" 
                                    data-bs-toggle="modal" data-bs-target="#editarClientesModal" 
                                    data-id="<%=cli.getId()%>" 
                                    data-nombre="<%=cli.getNombre()%>" 
                                    data-telefono="<%=cli.getTelefono()%>"
                                    data-correo="<%=cli.getCorreo()%>"
                                    data-direccion="<%=cli.getDireccion()%>">Editar</button>

                            <button type="button" class="btn btn-danger" 
                                    onclick="showConfirmDelete(<%=cli.getId()%>)">Borrar</button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="form-reportes">
            <form action="cClientes">       
                <input type="submit" class="btn btn-warning" name="accion" value="Clientes">
            </form>
        </div>

    </div>

    <jsp:include page="guardarClientes.jsp" />
    <jsp:include page="editarClientes.jsp" />

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
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'cClientes';

                const hiddenField = document.createElement('input');
                hiddenField.type = 'hidden';
                hiddenField.name = 'id';  // Asegúrate de que coincida con el nombre en el controlador
                hiddenField.value = recordIdToDelete;

                const actionField = document.createElement('input');
                actionField.type = 'hidden';
                actionField.name = 'accion';
                actionField.value = 'Desactivar';

                form.appendChild(hiddenField);
                form.appendChild(actionField);
                document.body.appendChild(form);
                form.submit();
            }
        }

        window.onload = function () {
            const alert = document.querySelector('.alert');
            if (alert) {
                setTimeout(() => {
                    alert.classList.remove('show');
                    alert.classList.add('fade');
                    alert.style.display = 'none';
                }, 2000);
            }
        };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
