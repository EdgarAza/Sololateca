<%-- 
    Document   : verInventario
    Created on : 28/10/2024, 16:45:37
    Author     : DANIELS SYSTEMS
--%>

<%@page import="modeloDAO.unidadDAO"%>
<%@page import="modelo.unidad"%>
<%@page import="modelo.inventario"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.inventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        

    </head>
    <body>

        <!-- editar.jsp -->
        <div class="modal fade" id="verInventarioModal" tabindex="-1" aria-labelledby="verInventarioModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="verInventarioModalLabel">Datos del Producto</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formVer" action="cInventario" method="post">

                            <input type="hidden" name="txtId" value=""  disabled>
                            <label>Codigo</label>
                            <input type="text" name="txtCodigo" class="form-control" disabled>
                            <%
                                unidadDAO dao3 = new unidadDAO();
                                List<unidad> list3 = dao3.mostrar();
                            %>

                            <label>Unida de medida</label>
                            <select class="form-control" name="txtUnidad" disabled>
                                <option value="">Seleccione una medida</option>
                                <%
                                    for (unidad un : list3) {
                                %> 
                                <option value="<%= un.getUnidadmedida()%>"><%= un.getUnidadmedida()%></option>
                                <% }%>
                            </select>
                            <label>Descripcion</label>
                            <input type="text" name="txtDescripcion" class="form-control" disabled>
                            <label>Stock</label>
                            <input type="text" name="txtStock" class="form-control" disabled>
                            <label>Costo</label>
                            <input type="text" name="txtCosto" class="form-control" disabled>
                            <label>Precio</label>
                            <input type="text" name="txtPrecio" class="form-control" disabled> 
                            <label>Ganancia</label>
                            <input type="text" name="txtGanancia" class="form-control" disabled>
                            <label>Minimo</label>
                            <input type="text" name="txtMinimo" class="form-control" disabled> 
                            <label>Marca</label>
                            <input type="text" name="txtMarca" class="form-control" disabled>
                            <label>Categoria</label>
                            <input type="text" name="txtCategoria" class="form-control" disabled>
                            <label>Fecha Creacion</label>
                            <input type="text" name="txtFechaCreacion" class="form-control" disabled>
                            <label>Fecha Modificacion</label>
                            <input type="text" name="txtFechaModificacion" class="form-control" disabled>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <script>
            const verInventarioModal = document.getElementById('verInventarioModal');
            verInventarioModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // Botón que activó el modal
                const id = button.getAttribute('data-id');
                const codigo = button.getAttribute('data-codigo');
                const unidad = button.getAttribute('data-unidad');
                const descripcion = button.getAttribute('data-descripcion');
                const stock = button.getAttribute('data-stock');
                const costo = button.getAttribute('data-costo');
                const precio = button.getAttribute('data-precio');
                const ganacia = button.getAttribute('data-ganancia');
                const minimo = button.getAttribute('data-minimo');
                const marca = button.getAttribute('data-marca');
                const categoria = button.getAttribute('data-categoria');
                const fechaCreacion = button.getAttribute('data-fechaCreacion');
                const fechaModificacion = button.getAttribute('data-fechaModificacion');
                // Rellenar los campos del formulario en el modal
                const modalForm = verInventarioModal.querySelector('form');
                modalForm.querySelector('input[name="txtId"]').value = id;
                modalForm.querySelector('input[name="txtCodigo"]').value = codigo;
                modalForm.querySelector('select[name="txtUnidad"]').value = unidad;
                modalForm.querySelector('input[name="txtDescripcion"]').value = descripcion;
                modalForm.querySelector('input[name="txtStock"]').value = stock;
                modalForm.querySelector('input[name="txtCosto"]').value = costo;
                modalForm.querySelector('input[name="txtPrecio"]').value = precio;
                modalForm.querySelector('input[name="txtGanancia"]').value = ganacia;
                modalForm.querySelector('input[name="txtMinimo"]').value = minimo;
                modalForm.querySelector('input[name="txtMarca"]').value = marca;
                modalForm.querySelector('input[name="txtCategoria"]').value = categoria;
                modalForm.querySelector('input[name="txtFechaCreacion"]').value = fechaCreacion;
                modalForm.querySelector('input[name="txtFechaModificacion"]').value = fechaModificacion;
            });
        </script>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>