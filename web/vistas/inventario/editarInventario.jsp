<%@page import="modelo.inventario"%>
<%@page import="modeloDAO.inventarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            inventarioDAO dao = new inventarioDAO();
            int id = Integer.parseInt((String) request.getAttribute("idUsu"));
            inventario inv = (inventario) dao.llenarCampos(id);


        %>
        <form action="cInventario"  class="formulario">
            <div class="mb-3">
                <label for="id" class="form-label">Id</label>
                <input type="text" id="id" name="txtid" class="form-control" value="<%=inv.getId()%>" readonly>
            </div>


            <div class="mb-3">
                <label for="dpi" class="form-label">Codigo</label>
                <input type="text" id="Codigo" name="txtCodigo" class="form-control" value="<%=inv.getCodigo()%>">
            </div>

            <div class="mb-3">
                <label for="nombres" class="form-label">Descripcion</label>
                <input type="text" id="Descripcion" name="txtDescripcion" class="form-control" value="<%=inv.getDescripcion()%>">
            </div>

            <div class="mb-3">
                <label for="apellidos" class="form-label">Stock</label>
                <input type="text" id="Stock" name="txtStock" class="form-control" value="<%=inv.getStock()%>">
            </div>

            <div class="mb-3">
                <label for="telefono" class="form-label">Costo</label>
                <input type="text" id="Costo" name="txtCosto" class="form-control" value="<%=inv.getCosto()%>">
            </div>

            <div class="mb-3">
                <label for="direccion" class="form-label">Precio</label>
                <input type="text" id="Precio" name="txtPrecio" class="form-control" value="<%=inv.getPrecio()%>">
            </div>
            <div class="mb-3">
                <label  class="form-label">Proveedor</label>
                <select class="form-select" aria-label="Default select example">
                    <option selected>Proveedor</option>
                    <option value="Proveedor1">Proveedor1</option>
                    <option value="Proveedor2">Proveedor2</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="estado" class="form-label">Minimo</label>
                <input type="text" id="Minimo" name="txtMinimo" class="form-control" value="<%=inv.getMinimo()%>">
            </div>
            <button type="submit" class="btn btn-success" name="accion" value="Actualizar">Actualizar</button>
            <a href="cInventario?accion=mostrar" class="btn btn-secondary">Regresar</a>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
