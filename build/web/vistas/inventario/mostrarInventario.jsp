<%@page import="configuracion.conexion"%>
<%@page import="modelo.inventario"%>
<%@page import="modeloDAO.inventarioDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
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

        <h1>Inventario</h1>
        <div class="tabla-madre">
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#guardarInventarioModal">Agregar</button>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Codigo</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Costo</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Ganancia</th>                      
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>

                    <%
                        inventarioDAO dao = new inventarioDAO();
                        List<inventario> list = dao.mostrar();
                        Iterator<inventario> iter = list.iterator();
                        inventario inv = null;
                        while (iter.hasNext()) {
                            inv = iter.next();

                    %>
                    <tbody>
                        <tr>
                            <td><%=inv.getId()%></td>
                            <td><%=inv.getCodigo()%></td>
                            <td><%=inv.getDescripcion()%></td>
                            <td><%=inv.getStock()%></td>
                            <td><%=inv.getCosto()%></td>
                            <td><%=inv.getPrecio()%></td>
                            <td><%=inv.getGanancia()%></td>
                            <td>
                                <button type="button" class="btn btn-primary" 
                                        data-bs-toggle="modal" data-bs-target="#verInventarioModal" 
                                        data-id="<%=inv.getId()%>" 
                                        data-codigo="<%=inv.getCodigo()%>" 
                                        data-descripcion="<%=inv.getDescripcion()%>"
                                        data-stock="<%=inv.getStock()%>"
                                        data-costo="<%=inv.getCosto()%>"
                                        data-precio="<%=inv.getPrecio()%>"
                                        data-ganancia="<%=inv.getGanancia()%>"
                                        data-minimo="<%=inv.getMinimo()%>"
                                        data-marca="<%=inv.getMarca()%>"
                                        data-categoria="<%=inv.getCategoria()%>"
                                        data-fechaCreacion="<%=inv.getFechaCreacion()%>"
                                        data-fechaModificacion="<%=inv.getFechaModificacion()%>"
                                        >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                    </svg>
                                </button>

                                <button type="button" class="btn btn-warning" 
                                        data-bs-toggle="modal" data-bs-target="#editarInventarioModal" 
                                        data-id="<%=inv.getId()%>" 
                                        data-codigo="<%=inv.getCodigo()%>" 
                                        data-descripcion="<%=inv.getDescripcion()%>"
                                        data-stock="<%=inv.getStock()%>"
                                        data-costo="<%=inv.getCosto()%>"
                                        data-precio="<%=inv.getPrecio()%>"
                                        data-minimo="<%=inv.getMinimo()%>"
                                        data-marca="<%=inv.getMarca()%>"
                                        data-categoria="<%=inv.getCategoria()%>"
                                        >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
                                    <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001"/>
                                    </svg>
                                </button>

                                <button type="button" class="btn btn-danger" 
                                        onclick="showConfirmDelete(<%=inv.getId()%>)">
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
                <button type="submit" name="accion" class="btn btn-warning" value="Inventario">Inventario</button>
                <button type="submit" name="accion" class="btn btn-warning" value="Minimo">Minimo</button>
                <button type="submit" name="accion" class="btn btn-warning" value="Existencia">Existencia</button>
            </form>
            
        </div>
        <jsp:include page="verInventario.jsp" />
        <jsp:include page="guardarInventario.jsp" />
        <jsp:include page="editarInventario.jsp" />
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
                    form.action = 'cInventario';

                    const hiddenField = document.createElement('input');
                    hiddenField.type = 'hidden';
                    hiddenField.name = 'id';
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
