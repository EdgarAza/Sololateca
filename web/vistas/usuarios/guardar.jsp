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

        <form action="controlador" class="formulario">
            <div class="mb-3">
                <select class="form-select" aria-label="Default select example">
                    <option selected>Rol</option>
                    <option value="Administrador">Administrador</option>
                    <option value="Vendedor">Vendedor</option>
                </select>
            </div>

             <div class="mb-3">
                <label  class="form-label">Usuario</label>
                <input type="text" class="form-control"  placeholder="Usuario" name="txtUsuario">
            </div>
            
             <div class="mb-3">
                <label  class="form-label">Clave</label>
                <input type="text" class="form-control"  placeholder="Clave" name="txtClave">
            </div>
            <div class="mb-3">
                <label  class="form-label">DPI</label>
                <input type="text" class="form-control"  placeholder="DPI" name="txtDpi">
            </div>
            
            <div class="mb-3">
                <label  class="form-label">Nombres</label>
                <input type="text" class="form-control"  placeholder="Nombres" name="txtNombres">
            </div>
            <div class="mb-3">
                <label  class="form-label">Apellidos</label>
                <input type="text" class="form-control"  placeholder="Apellidos" name="txtApellidos">
            </div>
            <div class="mb-3">
                <label  class="form-label">Telefono</label>
                <input type="text" class="form-control"  placeholder="Telefono" name="txtTelefono">
            </div>
            <div class="mb-3">
                <label  class="form-label">Direccion</label>
                <input type="text" class="form-control"  placeholder="Direccion" name="txtDireccion">
            </div>
            <input type="submit" class="btn btn-success" name="accion" value="Agregar">
            <a href="controlador?accion=mostrar" class="btn btn-secondary">Regresar</a>
        </form>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
