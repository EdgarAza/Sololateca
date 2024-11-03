<%-- 
    Document   : categoriasProveedores
    Created on : 31/10/2024, 00:13:55
    Author     : DANIELS SYSTEMS
--%>

<%@page import="modelo.provcategorias"%>
<%@page import="modeloDAO.provcategoriasDAO"%>
<%@page import="modelo.categoria"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.categoriaDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Proveedor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="modal fade" id="agregarCategoriaModal" tabindex="-1" aria-labelledby="agregarCategoriaModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="agregarCategoriaModalLabel">Agregar Categoria</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formCategoria" action="cProvCategorias" method="post">          
                            <label>Nombre Proveedor</label>
                            <input type="text" name="txtProveedor" class="form-control" required>
                            <%
                                categoriaDAO dao2 = new categoriaDAO();
                                List<categoria> list2 = dao2.mostrar();
                            %>

                            <label>Categoria</label>
                            <select class="form-control" name="txtCategoria">
                                <option value="">Seleccione una categoria</option>
                                <%
                                    for (categoria cat : list2) {
                                %>
                                <option value="<%= cat.getCategoria()%>"><%= cat.getCategoria()%></option>
                                <% } %>
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
                                    provcategoriasDAO daox = new provcategoriasDAO();
                                    List<provcategorias> listx = daox.mostrar();
                                    for (provcategorias pro : listx) {
                                %>
                                <tr>
                                    <td><%= pro.getId()%></td>
                                    <td><%= pro.getCategoria()%></td>
                                    <td><%= pro.getProveedor()%></td>
                                    <td>
                                        <button type="button" class="btn btn-danger" onclick="showConfirmDelete(<%= pro.getId()%>)">
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
                        <button type="submit" form="formCategoria" class="btn btn-success" name="accion" value="AgregarCategoria">Agregar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const agregarCategoriaModal = document.getElementById('agregarCategoriaModal');
            agregarCategoriaModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // Botón que activó el modal
                const nombre = button.getAttribute('data-nombre');

                // Rellenar los campos del formulario en el modal
                const modalForm = agregarCategoriaModal.querySelector('form');
                const proveedorInput = modalForm.querySelector('input[name="txtProveedor"]');
                proveedorInput.value = nombre;

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

