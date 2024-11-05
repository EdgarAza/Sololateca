<%-- 
    Document   : marcasProveedores
    Created on : 31/10/2024, 00:13:43
    Author     : DANIELS SYSTEMS
--%>

<%@page import="modelo.provmarca"%>
<%@page import="modeloDAO.provmarcaDAO"%>
<%@page import="modelo.marca"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.marcaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Proveedor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">   
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/proveedores.css">
    </head>
    <body>
        <div class="modal fade" id="agregarMarcaModal" tabindex="-1" aria-labelledby="agregarMarcaModalLabel" aria-hidden="true">

            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="agregarMarcaModalLabel">Agregar Marca</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formMarca" action="cProvMarca" method="post">          
                            <label>Nombre Proveedor</label>
                            <input type="text" name="txtProveedor" class="form-control" required>
                            <%
                                marcaDAO dao = new marcaDAO();
                                List<marca> list = dao.mostrar();
                            %>

                            <label>Marca</label>
                            <select class="form-control" name="txtMarca">
                                <option value="">Seleccione una marca</option>
                                <%
                                    for (marca mar : list) {
                                %>
                                <option value="<%= mar.getMarca()%>"><%= mar.getMarca()%></option>
                                <% }%>
                            </select>
                        </form>
                        <table class="table table-striped" id="tablaMarcasModal">
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Marca</th>
                                    <th scope="col">Proveedor</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    provmarcaDAO dao2 = new provmarcaDAO();
                                    List<provmarca> list2 = dao2.mostrar();
                                    for (provmarca pro : list2) {
                                %>
                                <tr>
                                    <td><%= pro.getId()%></td>
                                    <td><%= pro.getMarca()%></td>
                                    <td><%= pro.getProveedor()%></td>
                                    <td>
                                        <button type="button" class="btn btn-danger" onclick="showConfirmDelete2(<%= pro.getId()%>)">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                                            </svg>
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" form="formMarca" class="btn btn-success" name="accion" value="AgregarMarca">Agregar</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="confirmDeleteMessage2" class="confirm-delete">
            <h5>Confirmar Eliminación</h5>
            <p>¿Estás seguro de que deseas eliminar este registro?</p>
            <button type="button" class="btn btn-danger" onclick="deleteRecord2()">Eliminar</button>
            <button type="button" class="btn btn-secondary" onclick="closeConfirmDelete2()">Cancelar</button>
        </div>

        <script>
            let recordIdToDelete2 = null;

            function showConfirmDelete2(id) {
                recordIdToDelete2 = id;
                document.getElementById('confirmDeleteMessage2').style.display = 'block';
            }

            function closeConfirmDelete2() {
                document.getElementById('confirmDeleteMessage2').style.display = 'none';
            }

            function deleteRecord2() {
                if (recordIdToDelete2) {
                    // Redirigir al controlador para eliminar
                    const form = document.createElement('form');
                    form.method = 'POST';
                    form.action = 'cProvMarca';

                    const hiddenField = document.createElement('input');
                    hiddenField.type = 'hidden';
                    hiddenField.name = 'id2';
                    hiddenField.value = recordIdToDelete2;

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


            const agregarMarcaModal = document.getElementById('agregarMarcaModal');
            agregarMarcaModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // Botón que activó el modal
                const nombre = button.getAttribute('data-nombre');

                // Rellenar los campos del formulario en el modal
                const modalForm = agregarMarcaModal.querySelector('form');
                const proveedorInput = modalForm.querySelector('input[name="txtProveedor"]');
                proveedorInput.value = nombre;

                // Filtrar la tabla del modal
                filtrarTablaPorProveedor(nombre);
            });

            function filtrarTablaPorProveedor(proveedor) {
                const rows = document.querySelectorAll('#tablaMarcasModal tbody tr'); // Filtrar solo la tabla del modal
                rows.forEach(row => {
                    const proveedorCelda = row.cells[2].textContent; // Asumiendo que el proveedor está en la tercera celda
                    if (proveedorCelda === proveedor || proveedor === "") {
                        row.style.display = ""; // Mostrar fila
                    } else {
                        row.style.display = "none"; // Ocultar fila
                    }
                });
            }

        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>