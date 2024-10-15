<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Proveedor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <style>
            .formulario {
                margin-bottom: 2%;
                margin-top: 5%;
                margin-left: 25%;
                margin-right: 25%;
                
                  body {
               
                background-image: url('assets/images/fondo.png'); /* Ajusta la ruta a tu imagen */
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                margin: 0;
                height: 100vh;
                color: #fff; /* Opcional: cambia el color del texto para mejor contraste con la imagen */
            }
            }

        </style>


    </head>
    <body>

        <form action="cProveedores" class="formulario">

            <div class="mb-3">
                <label  class="form-label">Codigo</label>
                <input type="text" class="form-control"  placeholder="Codigo" name="txtCodigo">
            </div>
            <div class="mb-3">
                <label  class="form-label">Nombre</label>
                <input type="text" class="form-control"  placeholder="Nombre" name="txtNombre">
            </div>
            <div class="mb-3">
                <label  class="form-label">Comercial</label>
                <input type="text" class="form-control"  placeholder="Comercial" name="txtComercial">
            </div>
            <div class="mb-3">
                <label  class="form-label">Direccion</label>
                <input type="text" class="form-control"  placeholder="Direccion" name="txtDireccion">
            </div>
            <div class="mb-3">
                <label  class="form-label">Correo</label>
                <input type="text" class="form-control"  placeholder="Correo" name="txtCorreo">
            </div>
            <div class="mb-3">
                <label  class="form-label">Telefono</label>
                <input type="text" class="form-control"  placeholder="Telefono" name="txtTelefono">
            </div>
             <div class="mb-3">
                <label  class="form-label">Nota</label>
                <input type="text" class="form-control"  placeholder="Nota" name="txtNota">
            </div>

        
            <input type="submit" class="btn btn-success" name="accion" value="Agregar">
            <a href="cProveedores?accion=mostrar" class="btn btn-secondary">Regresar</a>
        </form>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
