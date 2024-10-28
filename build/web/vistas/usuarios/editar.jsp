<%-- 
    Document   : editar
    Created on : 18/09/2024, 22:03:00
    Author     : DANIELS SYSTEMS
--%>

<%@page import="configuracion.encriptar"%>
<%@page import="modelo.usuarios"%>
<%@page import="modeloDAO.usuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        

    </head>
    <body>
        <div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarModalLabel">Editar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formEditar" action="controlador" method="post">
                            
                            <input type="hidden" class="form-control" name="txtId"  >
                            <label>Rol</label>
                            <select class="form-select "  name='txtRol'>
                                <option value="Administrador">Administrador</option>
                                <option value="Vendedor">Vendedor</option>
                            </select>
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="txtUsuario" required>
                            <label>Clave</label>
                            <input type="text" class="form-control" name="txtClave" required>
                            <label>DPI</label>
                            <input type="text" class="form-control" name="txtDpi" required>
                            <label>Nombres</label>
                            <input type="text" class="form-control" name="txtNombres">
                            <label>Apellidos</label>
                            <input type="text" class="form-control" name="txtApellidos" required>
                            <label>Telefono</label>
                            <input type="text" class="form-control" name="txtTelefono">
                            <label>Direccion</label>
                            <input type="text" class="form-control" name="txtDireccion" required>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" form="formEditar" class="btn btn-warning" name="accion" value="Actualizar">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const editarModal = document.getElementById('editarModal');
            editarModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // Botón que activó el modal
                const id = button.getAttribute('data-id');
                const rol = button.getAttribute('data-rol');
                const usuario = button.getAttribute('data-usuario');
                const clave = button.getAttribute('data-clave');
                const dpi = button.getAttribute('data-dpi');
                const nombres = button.getAttribute('data-nombres');
                const apellidos = button.getAttribute('data-apellidos');
                const telefono = button.getAttribute('data-telefono');
                const direccion = button.getAttribute('data-direccion');
                console.log(id, rol, usuario, clave, dpi, nombres, apellidos, telefono, direccion);

                // Rellenar los campos del formulario en el modal
                const modalForm = editarModal.querySelector('form');
                modalForm.querySelector('input[name="txtId"]').value = id;
                modalForm.querySelector('select[name="txtRol"]').value = rol; // Cambiado para usar select
                modalForm.querySelector('input[name="txtUsuario"]').value = usuario;
                modalForm.querySelector('input[name="txtClave"]').value = clave;
                modalForm.querySelector('input[name="txtDpi"]').value = dpi;
                modalForm.querySelector('input[name="txtNombres"]').value = nombres;
                modalForm.querySelector('input[name="txtApellidos"]').value = apellidos;
                modalForm.querySelector('input[name="txtTelefono"]').value = telefono;
                modalForm.querySelector('input[name="txtDireccion"]').value = direccion;
            });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
