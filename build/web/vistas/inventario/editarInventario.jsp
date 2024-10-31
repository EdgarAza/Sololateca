<%@page import="modelo.marca"%>
<%@page import="modeloDAO.marcaDAO"%>
<%@page import="modelo.categoria"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.categoriaDAO"%>
<%@page import="modelo.inventario"%>
<%@page import="modeloDAO.inventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Producto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    </head>
    <!-- editar.jsp -->
    <div class="modal fade" id="editarInventarioModal" tabindex="-1" aria-labelledby="editarInventarioModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editarInventarioModalLabel">Editar Datos</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formEditar" action="cInventario" method="post">
                       
                        <input type="hidden" name="txtId" value=""  >
                        <label>Codigo</label>
                        <input type="text" name="txtCodigo" class="form-control" required>
                        <label>Descripcion</label>
                        <input type="text" name="txtDescripcion" class="form-control" required>
                        <label>Stock</label>
                        <input type="text" name="txtStock" class="form-control" required>
                        <label>Costo</label>
                        <input type="text" name="txtCosto" class="form-control" required>
                        <label>Precio</label>
                        <input type="text" name="txtPrecio" class="form-control" required> 
                        <label>Minimo</label>
                        <input type="text" name="txtMinimo" class="form-control" required> 
                       <%
                                marcaDAO dao = new marcaDAO();
                                List<marca> list = dao.mostrar();
                            %>

                            <label>Marca</label>
                            <select class="form-control" name="txtMarca" required>
                                <option value="">Seleccione una marca</option>
                                <%
                                    for (marca mar : list) {
                                %>
                                <option value="<%= mar.getMarca()%>"><%= mar.getMarca()%></option>
                                <% }%>
                            </select>
                        <%
                                categoriaDAO dao2 = new categoriaDAO();
                                List<categoria> list2 = dao2.mostrar();
                            %>

                            <label>Categoria</label>
                            <select class="form-control" name="txtCategoria" required>
                                <option value="">Seleccione una categoria</option>
                                <%
                                    for (categoria cat : list2) {
                                %>
                                <option value="<%= cat.getCategoria()%>"><%= cat.getCategoria()%></option>
                                <% }%>
                            </select>
                       

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" form="formEditar" class="btn btn-warning" name="accion" value="Actualizar">Actualizar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        const editarInventarioModal = document.getElementById('editarInventarioModal');
        editarInventarioModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget; // Botón que activó el modal
            const id = button.getAttribute('data-id');
            const codigo = button.getAttribute('data-codigo');
            const descripcion = button.getAttribute('data-descripcion');
            const stock = button.getAttribute('data-stock');
            const costo = button.getAttribute('data-costo');
            const precio = button.getAttribute('data-precio');
            const minimo = button.getAttribute('data-minimo');
            const marca = button.getAttribute('data-marca');
            const categoria = button.getAttribute('data-categoria');
            // Rellenar los campos del formulario en el modal
            const modalForm = editarInventarioModal.querySelector('form');
            modalForm.querySelector('input[name="txtId"]').value = id;
            modalForm.querySelector('input[name="txtCodigo"]').value = codigo;
            modalForm.querySelector('input[name="txtDescripcion"]').value = descripcion;
            modalForm.querySelector('input[name="txtStock"]').value = stock;
            modalForm.querySelector('input[name="txtCosto"]').value = costo;
            modalForm.querySelector('input[name="txtPrecio"]').value = precio;
            modalForm.querySelector('input[name="txtMinimo"]').value = minimo;
            modalForm.querySelector('select[name="txtMarca"]').value = marca;
            modalForm.querySelector('select[name="txtCategoria"]').value = categoria;
        });
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
