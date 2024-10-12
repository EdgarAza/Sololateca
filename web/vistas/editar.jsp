<%-- 
    Document   : editar
    Created on : 18/09/2024, 22:03:00
    Author     : DANIELS SYSTEMS
--%>

<%@page import="modelo.usuarios"%>
<%@page import="modeloDAO.usuariosDAO"%>
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
          <%
            usuariosDAO dao = new usuariosDAO();
            int id =  Integer.parseInt((String)request.getAttribute("idUsu"));
            usuarios usu = (usuarios)dao.llenarCampos(id);
            

            %>
        <form action="controlador"  class="formulario">
            <div class="mb-3">
                <label for="id" class="form-label">Id</label>
                <input type="text" id="id" name="txtid" class="form-control" value="<%=usu.getId()%>" readonly>
            </div>

            <div class="mb-3">
                <label for="rol" class="form-label">Rol</label>
                <select class="form-select" id="rol" name="txtRol" aria-label="Rol">
                    <option value="Administrador" </option>
                    <option value="Vendedor"</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="dpi" class="form-label">DPI</label>
                <input type="text" id="dpi" name="txtDpi" class="form-control" value="<%=usu.getDpi()%>">
            </div>

            <div class="mb-3">
                <label for="nombres" class="form-label">Nombres</label>
                <input type="text" id="nombres" name="txtNombres" class="form-control" value="<%=usu.getNombres()%>">
            </div>

            <div class="mb-3">
                <label for="apellidos" class="form-label">Apellidos</label>
                <input type="text" id="apellidos" name="txtApellidos" class="form-control" value="<%=usu.getApellidos()%>">
            </div>

            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono</label>
                <input type="text" id="telefono" name="txtTelefono" class="form-control" value="<%=usu.getTelefono()%>">
            </div>

            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección</label>
                <input type="text" id="direccion" name="txtDireccion" class="form-control" value="<%=usu.getDireccion()%>">
            </div>

            <div class="mb-3">
                <label for="estado" class="form-label">Estado</label>
                <input type="text" id="estado" name="txtEstado" class="form-control" value="<%=usu.getEstado()%>">
            </div>

            <button type="submit" class="btn btn-success" name="accion" value="Actualizar">Actualizar</button>
            <a href="controlador?accion=mostrar" class="btn btn-secondary">Regresar</a>
        </form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
