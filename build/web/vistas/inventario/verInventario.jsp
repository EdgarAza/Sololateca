<%-- 
    Document   : verInventario
    Created on : 28/10/2024, 16:45:37
    Author     : DANIELS SYSTEMS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <form id="formEditar" action="cInventario" method="post">

                            <input type="hidden" name="txtId" value=""  disabled>
                            <label>Codigo</label>
                            <input type="text" name="txtCodigo" class="form-control" disabled>
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
                    <div class="modal-footer">
                        <button type="submit" form="formEditar" class="btn btn-warning" name="accion" value="Actualizar">Actualizar</button>
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
    </body>
</html>
