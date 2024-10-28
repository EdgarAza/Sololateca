<%-- 
    Document   : ver
    Created on : 28/10/2024, 01:53:47
    Author     : DANIELS SYSTEMS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


    </head>
    <body>
        <div class="modal fade" id="verModal" tabindex="-1" aria-labelledby="verModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="verModalLabel">Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formVer" action="controlador" method="post">
                            <label>Id</label>
                            <input type="text" class="form-control" name="txtId" disabled>
                            <label>Rol</label>
                            <select class="form-select" name="txtRol" disabled>
                                <option value="Administrador">Administrador</option>
                                <option value="Vendedor">Vendedor</option>
                            </select>
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="txtUsuario" disabled>
                            <label>Clave</label>
                            <input type="text" class="form-control" name="txtClave" disabled>
                            <label>DPI</label>
                            <input type="text" class="form-control" name="txtDpi" disabled>
                            <label>Nombres</label>
                            <input type="text" class="form-control" name="txtNombres" disabled>
                            <label>Apellidos</label>
                            <input type="text" class="form-control" name="txtApellidos" disabled>
                            <label>Telefono</label>
                            <input type="text" class="form-control" name="txtTelefono" disabled>
                            <label>Direccion</label>
                            <input type="text" class="form-control" name="txtDireccion" disabled>
                        </form>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>

        <script>
            const verModal = document.getElementById('verModal');
            verModal.addEventListener('show.bs.modal', function (event) {
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

                // Rellenar los campos del formulario en el modal
                const modalForm = verModal.querySelector('form');
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

