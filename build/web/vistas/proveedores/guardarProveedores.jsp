<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Proveedor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">   
    </head>
    <body>

        <div class="modal fade" id="guardarProveedoresModal" tabindex="-1" aria-labelledby="guardarProveedoresModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="guardarProveedoresModalLabel">Agregar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formGuardar" action="cProveedores" method="post">
                            <label>Nombre</label>
                            <input type="text" placeholder="Nombre" name="txtNombre" class="form-control" required>
                            <label>Razon Social</label>
                            <input type="text" placeholder="Razon Social" name="txtRazonSocial" class="form-control" required>
                            <label>Telefono</label>
                            <input type="text" placeholder="Telefono" name="txtTelefono" class="form-control" required>
                            <label>Correo</label>
                            <input type="text" placeholder="Correo" name="txtCorreo" class="form-control" required>   
                            <label>Direccion</label>
                            <input type="text" placeholder="Direccion" name="txtDireccion" class="form-control" required>
                            <label>Informacion de pago</label>
                            <input type="text" placeholder="Informacion de pago" name="txtInfoPago" class="form-control" required>
                            <label>Condiciones de pago</label>
                            <input type="text" placeholder="Condiciones de pago" name="txtConPago" class="form-control" required> 
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
