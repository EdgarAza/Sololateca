<%-- 
    Document   : guardar
    Created on : 18/09/2024, 22:02:47
    Author     : DANIELS SYSTEMS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>

        <div class="modal fade" id="guardarModal" tabindex="-1" aria-labelledby="guardarModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="guardarModalLabel">Agregar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formGuardar" action="controlador" method="post">
                            <select class="form-select" name="txtRol">
                                <option value="Administrador">Administrador</option>
                                <option value="Vendedor">Vendedor</option>
                            </select>
                            <label  class="form-label">Usuario</label>
                            <input type="text" class="form-control"  placeholder="Usuario" name="txtUsuario">
                            <label  class="form-label">Clave</label>
                            <input type="text" class="form-control"  placeholder="Clave" name="txtClave">
                            <label  class="form-label">DPI</label>
                            <input type="text" class="form-control"  placeholder="DPI" name="txtDpi">
                            <label  class="form-label">Nombres</label>
                            <input type="text" class="form-control"  placeholder="Nombres" name="txtNombres">
                            <label  class="form-label">Apellidos</label>
                            <input type="text" class="form-control"  placeholder="Apellidos" name="txtApellidos">
                            <label  class="form-label">Telefono</label>
                            <input type="text" class="form-control"  placeholder="Telefono" name="txtTelefono">
                            <label  class="form-label">Direccion</label>
                            <input type="text" class="form-control"  placeholder="Direccion" name="txtDireccion">
                        </form>
                    </div>
                    <div class="modal-footer">              
                        <button type="submit" form="formGuardar" class="btn btn-success" name="accion" value="Agregar">Guardar</button>

                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
