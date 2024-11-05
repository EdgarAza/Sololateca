<%-- 
    Document   : mostrar
    Created on : 18/09/2024, 22:02:54
    Author     : DANIELS SYSTEMS
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.usuarios"%>
<%@page import="modeloDAO.usuariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>

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
            <%= mensaje%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
        %>
        <h1>Usuarios</h1>
        <div class="tabla-madre">

            <button type="button" class="btn btn-success  mb-3" data-bs-toggle="modal" data-bs-target="#guardarModal">Agregar</button>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Rol</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Clave</th>
                            <th scope="col">Nombres</th>
                            <th scope="col">Apellidos</th>  
                            <th scope="col">Estado</th>   
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>

                    <%
                        usuariosDAO dao = new usuariosDAO();
                        List<usuarios> list = dao.mostrar();
                        Iterator<usuarios> iter = list.iterator();
                        usuarios usu = null;
                        while (iter.hasNext()) {
                            usu = iter.next();
                    %>
                    <tbody>
                        <tr>
                            <td><%=usu.getId()%></td>
                            <td><%=usu.getRol()%></td>
                            <td><%=usu.getUsuario()%></td>
                            <td><%=usu.getClave()%></td>
                            <td><%=usu.getNombres()%></td>
                            <td><%=usu.getApellidos()%></td>
                            <td>
                                 <span class="<%= usu.getEstado().equalsIgnoreCase("INACTIVO") ? "text-white bg-danger" : "text-white bg-success"%> p-2 rounded">
                                    <%= usu.getEstado()%>
                                </span>
                            </td>

                            <td>
                                <button type="button" class="btn btn-primary" 
                                        data-bs-toggle="modal" data-bs-target="#verModal" 
                                        data-id="<%=usu.getId()%>" 
                                        data-rol="<%=usu.getRol()%>" 
                                        data-usuario="<%=usu.getUsuario()%>"
                                        data-clave="<%=usu.getClave()%>"
                                        data-dpi="<%=usu.getDpi()%>"
                                        data-nombres="<%=usu.getNombres()%>"
                                        data-apellidos="<%=usu.getApellidos()%>"
                                        data-telefono="<%=usu.getTelefono()%>"
                                        data-direccion="<%=usu.getDireccion()%>"
                                        data-estado="<%=usu.getEstado()%>"
                                        >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                    </svg>
                                </button>

                                <button type="button" class="btn btn-warning" 
                                        data-bs-toggle="modal" data-bs-target="#editarModal" 
                                        data-id="<%=usu.getId()%>" 
                                        data-rol="<%=usu.getRol()%>" 
                                        data-usuario="<%=usu.getUsuario()%>"
                                        data-clave="<%=usu.getClave()%>"
                                        data-dpi="<%=usu.getDpi()%>"
                                        data-nombres="<%=usu.getNombres()%>"
                                        data-apellidos="<%=usu.getApellidos()%>"
                                        data-telefono="<%=usu.getTelefono()%>"
                                        data-direccion="<%=usu.getDireccion()%>"
                                        data-estado="<%=usu.getEstado()%>"
                                        >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
                                    <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001"/>
                                    </svg>
                                </button>


                            </td>

                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>



            <div class="form-reportes">
                <form action="controlador" method="post" >       
                    <button type="submit" name="accion" value="Usuarios" class="btn btn-warning">Usuarios</button>
                    <button type="submit" name="accion" value="Activos" class="btn btn-warning">Activos</button>
                    <button type="submit" name="accion" value="Inactivos" class="btn btn-warning">Inactivos</button>
                </form>
            </div>
        </div>


        <jsp:include page="ver.jsp" />
        <jsp:include page="guardar.jsp" />
        <jsp:include page="editar.jsp" />

       
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
