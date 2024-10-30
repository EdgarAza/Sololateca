<%@page import="java.util.Iterator"%>
<%@page import="modelo.proveedores"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.proveedoresDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedores</title>
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <jsp:include page="../extras/nav.jsp" />
        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {
        %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Éxito!</strong> <%= mensaje%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
        %>
        <h1>Proveedores</h1>
        <div class="tabla-madre">
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#guardarProveedoresModal">Agregar</button>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Razon Social</th>
                            <th scope="col">Telefono</th>
                            <th scope="col">Correo</th>
                            <th scope="col">Estado</th>   
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            proveedoresDAO dao = new proveedoresDAO();
                            List<proveedores> list = dao.mostrar();
                            for (proveedores pro : list) {
                        %>
                        <tr>
                            <td><%= pro.getId()%></td>
                            <td><%= pro.getNombre()%></td>
                            <td><%= pro.getRazonsocial()%></td>
                            <td><%= pro.getTelefono()%></td>
                            <td><%= pro.getCorreo()%></td>
                            <td>
                                <span class="<%= pro.getEstado().equalsIgnoreCase("INACTIVO") ? "text-white bg-danger" : "text-white bg-success"%> p-2 rounded">
                                    <%= pro.getEstado()%>
                                </span>
                            </td>
                            <td>
                                <button type="button" class="btn btn-warning" 
                                        data-bs-toggle="modal" data-bs-target="#editarModal" 
                                        data-id="<%=pro.getId()%>" 
                                        data-nombre="<%=pro.getNombre()%>" 
                                        data-razonSocial="<%=pro.getRazonsocial()%>"
                                        data-telefono="<%=pro.getTelefono()%>" 
                                        data-correo="<%=pro.getCorreo()%>"
                                        data-direccion="<%=pro.getDireccion()%>" 
                                        data-infopago="<%=pro.getInfopago()%>"
                                        data-conpago="<%=pro.getConpago()%>" 
                                        data-estado="<%=pro.getEstado()%>"
                                        >Editar</button>

                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <form action="cProveedores" >       
                <input type="submit" class="btn btn-warning" name="accion" value="proveedores">
            </form>
        </div>






        <jsp:include page="guardarProveedores.jsp" />
        <jsp:include page="editarProveedores.jsp" />



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <script>

            // Función para cerrar la alerta automáticamente
            window.onload = function () {
                const alert = document.querySelector('.alert');
                if (alert) {
                    setTimeout(() => {
                        alert.classList.remove('show');
                        alert.classList.add('fade');
                        alert.style.display = 'none';
                    }, 2000); // 500 milisegundos
                }
            };
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>