<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Producto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    </head>
    <body>

        <div class="modal fade" id="guardarInventarioModal" tabindex="-1" aria-labelledby="guardarInventarioModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="guardarInventarioModalLabel">Agregar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formGuardar" action="cInventario" method="post">

                            <label>Codigo</label>
                            <input type="text" class="form-control"  placeholder="Codigo" name="txtCodigo">
                            <label>Descripcion</label>
                            <input type="text" class="form-control"  placeholder="Descripcion" name="txtDescripcion">
                            <label>Costo</label>
                            <input type="text" class="form-control"  placeholder="Costo" name="txtCosto">
                            <label>Precio</label>
                            <input type="text" class="form-control"  placeholder="Precio" name="txtPrecio">
                            <label>Stock</label>
                            <input type="text" class="form-control"  placeholder="Stock" name="txtStock">
                            <label>Minimo</label>
                            <input type="text" class="form-control"  placeholder="Minimo" name="txtMinimo">
                            <label>Marca</label>
                            <input type="text" class="form-control"  placeholder="Marca" name="txtMarca">
                            <label>Categoria</label>
                            <input type="text" class="form-control"  placeholder="Categoria" name="txtCategoria">
                        </form>
                    </div>
                    <div class="modal-footer">              
                        <button type="submit" form="formGuardar" class="btn btn-success" name="accion" value="Agregar">Guardar</button>

                    </div>
                </div>
            </div>
        </div>


        <div id="confirmDeleteMessage" class="confirm-delete">
            <h5>Confirmar Eliminación</h5>
            <p>¿Estás seguro de que deseas eliminar este registro?</p>
            <button type="button" class="btn btn-danger" onclick="deleteRecord()">Eliminar</button>
            <button type="button" class="btn btn-secondary" onclick="closeConfirmDelete()">Cancelar</button>
        </div>
        <script src="../assets/js/script/js" ></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
