<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <style>
            .formulario {
                margin-bottom: 2%;
                margin-top: 5%;
                margin-left: 25%;
                margin-right: 25%;
            }

        </style>


    </head>
    <body>

        <form action="cInventario" class="formulario">

            <div class="mb-3">
                <label  class="form-label">Codigo</label>
                <input type="text" class="form-control"  placeholder="Codigo" name="txtCodigo">
            </div>
            <div class="mb-3">
                <label  class="form-label">Descripcion</label>
                <input type="text" class="form-control"  placeholder="Descripcion" name="txtDescripcion">
            </div>
            <div class="mb-3">
                <label  class="form-label">Stock</label>
                <input type="text" class="form-control"  placeholder="Stock" name="txtStock">
            </div>
            <div class="mb-3">
                <label  class="form-label">Costo</label>
                <input type="text" class="form-control"  placeholder="Costo" name="txtCosto">
            </div>
            <div class="mb-3">
                <label  class="form-label">Precio</label>
                <input type="text" class="form-control"  placeholder="Precio" name="txtPrecio">
            </div>
            <div class="mb-3">
                <label  class="form-label">Minimo</label>
                <input type="number" class="form-control"  placeholder="Minimo" name="txtMinimo">
            </div>

            <div class="mb-3">
                <label  class="form-label">Proveedor</label>
                <select class="form-select" aria-label="Default select example">
                    <option selected>Proveedor</option>
                    <option value="Proveedor1">Proveedor1</option>
                    <option value="Proveedor2">Proveedor2</option>
                </select>
            </div>

            <input type="submit" class="btn btn-success" name="accion" value="Agregar">
            <a href="cInventario?accion=mostrar" class="btn btn-secondary">Regresar</a>
        </form>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
