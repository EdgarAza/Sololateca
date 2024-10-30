<%@page import="modeloDAO.clientesDAO"%>
<%@page import="modelo.clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Cliente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

       

    </head>
    <body>
        <!-- editar.jsp -->
        <div class="modal fade" id="editarClientesModal" tabindex="-1" aria-labelledby="editarClientesModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarClientesModalLabel">Editar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formEditar" action="cClientes" method="post">
                            <input type="hidden" name="txtId" value="">
                            <label>Nombre</label>
                            <input type="text" name="txtNombre" class="form-control" required>
                            <label>Telefono</label>
                            <input type="text" name="txtTelefono" class="form-control" required>
                            <label>Correo</label>
                            <input type="text" name="txtCorreo" class="form-control" required>
                            <label>Direccion</label>
                            <input type="text" name="txtDireccion" class="form-control" required> 
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" form="formEditar" class="btn btn-warning" name="accion" value="Actualizar">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const editarClientesModal = document.getElementById('editarClientesModal');
            editarClientesModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // Botón que activó el modal
                const id = button.getAttribute('data-id');
                const nombre = button.getAttribute('data-nombre');
                const telefono = button.getAttribute('data-telefono');
                const correo = button.getAttribute('data-correo');
                const direccion = button.getAttribute('data-direccion');

                // Rellenar los campos del formulario en el modal
                const modalForm = editarClientesModal.querySelector('form');
                modalForm.querySelector('input[name="txtId"]').value = id;
                modalForm.querySelector('input[name="txtNombre"]').value = nombre;
                modalForm.querySelector('input[name="txtTelefono"]').value = telefono;
                 modalForm.querySelector('input[name="txtCorreo"]').value = correo;
                modalForm.querySelector('input[name="txtDireccion"]').value = direccion;
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
