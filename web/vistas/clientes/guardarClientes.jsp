<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Cliente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    </head>
    <body>

        <div class="modal fade" id="guardarClientesModal" tabindex="-1" aria-labelledby="guardarClientesModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="guardarClientesModalLabel">Agregar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formGuardar" action="cClientes" method="post">
                            <label>Nombre</label>
                            <input type="text" class="form-control"  placeholder="Nombre" name="txtNombre" required>
                            <label>Telefono</label>
                            <input type="text" class="form-control"  placeholder="Telefono" name="txtTelefono" required>
                            <label>Correo</label>
                            <input type="text" class="form-control"  placeholder="Correo" name="txtCorreo" required>
                            <label>Direccion</label>
                            <input type="text" class="form-control"  placeholder="Direccion" name="txtDireccion" required>
                        </form>
                    </div>
                    <div class="modal-footer">              
                        <button type="submit" form="formGuardar" class="btn btn-success" name="accion" value="Agregar">Guardar</button>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
