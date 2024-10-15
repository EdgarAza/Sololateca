<%@page import="modeloDAO.clientesDAO"%>
<%@page import="modelo.clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Cliente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <style>
            .formulario {
                margin-bottom: 2%;
                margin-top: 5%;
                margin-left: 25%;
                margin-right: 25%;
            }
              body {
               
                background-image: url('assets/images/fondo.png'); /* Ajusta la ruta a tu imagen */
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                margin: 0;
                height: 100vh;
                color: #fff; /* Opcional: cambia el color del texto para mejor contraste con la imagen */
            }

        </style>

    </head>
    <body>
        <%
            clientesDAO dao = new clientesDAO();
            int id = Integer.parseInt((String) request.getAttribute("idCli"));
            clientes cli = (clientes) dao.llenarCampos(id);


        %>
        <form action="cClientes"  class="formulario">
            <div class="mb-3">
                <label for="id" class="form-label">Id</label>
                <input type="text" id="id" name="txtid" class="form-control" value="<%=cli.getId()%>" readonly>
            </div
            <div class="mb-3">
                <label for="dpi" class="form-label">Nombre</label>
                <input type="text" id="Nombre" name="txtNombre" class="form-control" value="<%=cli.getNombre()%>">
            </div>

            <div class="mb-3">
                <label for="nombres" class="form-label">Telefono</label>
                <input type="text" id="Telefono" name="txtTelefono" class="form-control" value="<%=cli.getTelefono()%>">
            </div>

            <div class="mb-3">
                <label for="apellidos" class="form-label">Correo</label>
                <input type="text" id="Correo" name="txtCorreo" class="form-control" value="<%=cli.getCorreo()%>">
            </div>

            <div class="mb-3">
                <label for="telefono" class="form-label">Direccion</label>
                <input type="text" id="Direccion" name="txtDireccion" class="form-control" value="<%=cli.getDireccion()%>">
            </div>
            <button type="submit" class="btn btn-success" name="accion" value="Actualizar">Actualizar</button>
            <a href="cClientes?accion=mostrar" class="btn btn-secondary">Regresar</a>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
