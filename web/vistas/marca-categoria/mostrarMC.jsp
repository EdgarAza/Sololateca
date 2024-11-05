<%-- 
    Document   : mostrarMP
    Created on : 30/10/2024, 14:34:47
    Author     : DANIELS SYSTEMS
--%>

<%@page import="modelo.categoria"%>
<%@page import="modeloDAO.categoriaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.marca"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.marcaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marca - Categorias</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/mc.css">


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
        <h1>MARCAS - CATEGORIAS</h1>
        <div class="tablas-container">
            <div class="tabla-marca">
                <button type="button" class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#guardarMarcasModal">Agregar</button>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                marcaDAO dao = new marcaDAO();
                                List<marca> list = dao.mostrar();
                                Iterator<marca> iter = list.iterator();
                                marca mar = null;
                                while (iter.hasNext()) {
                                    mar = iter.next();
                            %>
                            <tr>
                                <td><%=mar.getId()%></td>
                                <td><%=mar.getMarca()%></td>
                                <td>
                                    <button type="button" class="btn btn-warning" 
                                            data-bs-toggle="modal" data-bs-target="#editarMarcaModal" 
                                            data-idmarca="<%=mar.getId()%>" 
                                            data-marca="<%=mar.getMarca()%>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
                                        <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001"/>
                                        </svg>
                                    </button>
                                    <button type="button" class="btn btn-danger" 
                                            onclick="showConfirmDelete(<%=mar.getId()%>, 'marca')">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="tabla-categoria">
                <button type="button" class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#guardarCategoriaModal">Agregar</button>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Categoria</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                categoriaDAO dao2 = new categoriaDAO();
                                List<categoria> list2 = dao2.mostrar();
                                Iterator<categoria> iter2 = list2.iterator();
                                categoria cat = null;
                                while (iter2.hasNext()) {
                                    cat = iter2.next();
                            %>
                            <tr>
                                <td><%=cat.getId()%></td>
                                <td><%=cat.getCategoria()%></td>
                                <td>
                                    <button type="button" class="btn btn-warning" 
                                            data-bs-toggle="modal" data-bs-target="#editarCategoriaModal" 
                                            data-idCategoria="<%=cat.getId()%>" 
                                            data-categoria="<%=cat.getCategoria()%>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
                                        <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001"/>
                                        </svg>
                                    </button>
                                    <button type="button" class="btn btn-danger" 
                                            onclick="showConfirmDelete(<%=cat.getId()%>, 'categoria')">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>



        <jsp:include page="guardarMarca.jsp" />
        <jsp:include page="editarMarca.jsp" />
        <jsp:include page="guardarCategoria.jsp" />
        <jsp:include page="editarCategoria.jsp" />

        <!-- Mensaje de Confirmación de Eliminación -->
        <div id="confirmDeleteMessage" class="confirm-delete">
            <h5>Confirmar Eliminación</h5>
            <p>¿Está seguro de que deseas eliminar este registro?</p>
            <button type="button" class="btn btn-danger" onclick="deleteRecord()">Eliminar</button>
            <button type="button" class="btn btn-secondary" onclick="closeConfirmDelete()">Cancelar</button>
        </div>

        <script>
            let recordIdToDelete = null;
            let recordTypeToDelete = null;

            function showConfirmDelete(id, type) {
                recordIdToDelete = id;
                recordTypeToDelete = type;
                document.getElementById('confirmDeleteMessage').style.display = 'block';
            }

            function closeConfirmDelete() {
                document.getElementById('confirmDeleteMessage').style.display = 'none';
            }
            function deleteRecord() {
                if (recordTypeToDelete === 'categoria') {
                    const form = document.createElement('form');
                    form.method = 'POST';
                    form.action = 'cMC';

                    const hiddenField = document.createElement('input');
                    hiddenField.type = 'hidden';
                    hiddenField.name = 'idCategoria';
                    hiddenField.value = recordIdToDelete;

                    const actionField = document.createElement('input');
                    actionField.type = 'hidden';
                    actionField.name = 'accion';
                    actionField.value = 'EliminarCategoria';

                    form.appendChild(hiddenField);
                    form.appendChild(actionField);
                    document.body.appendChild(form);
                    form.submit();
                } else if (recordTypeToDelete === 'marca') {
                    const form = document.createElement('form');
                    form.method = 'POST';
                    form.action = 'cMC';

                    const hiddenField = document.createElement('input');
                    hiddenField.type = 'hidden';
                    hiddenField.name = 'idMarca';
                    hiddenField.value = recordIdToDelete;

                    const actionField = document.createElement('input');
                    actionField.type = 'hidden';
                    actionField.name = 'accion';
                    actionField.value = 'EliminarMarca';

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
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>