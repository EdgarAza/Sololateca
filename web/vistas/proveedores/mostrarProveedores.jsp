<%@page import="modelo.busqueda"%>
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
            <button type="button" class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#guardarProveedoresModal">Agregar</button>
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
                            <th scope="col">Marcas</th>   
                            <th scope="col">Categorias</th>   
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
                                <button type="button" class="btn btn-secondary" 
                                        data-bs-toggle="modal" data-bs-target="#agregarMarcaModal" 
                                        data-nombre="<%=pro.getNombre()%>" 
                                        >Marcas</button>

                            </td>
                            <td>
                                <button type="button" class="btn btn-secondary" 
                                        data-bs-toggle="modal" data-bs-target="#agregarCategoriaModal" 
                                        data-nombre="<%=pro.getNombre()%>" 
                                        >Categorias</button>

                            </td>
                            <td>
                                <button type="button" class="btn btn-primary" 
                                        data-bs-toggle="modal" data-bs-target="#verModal" 
                                        data-id="<%=pro.getId()%>" 
                                        data-nombre="<%=pro.getNombre()%>" 
                                        data-razonSocial="<%=pro.getRazonsocial()%>"
                                        data-telefono="<%=pro.getTelefono()%>" 
                                        data-correo="<%=pro.getCorreo()%>"
                                        data-direccion="<%=pro.getDireccion()%>" 
                                        data-infopago="<%=pro.getInfopago()%>"
                                        data-conpago="<%=pro.getConpago()%>" 
                                        data-estado="<%=pro.getEstado()%>"
                                        >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                                    </svg>
                                </button>


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
                                        >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
                                    <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001"/>
                                    </svg>
                                </button>

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

        <jsp:include page="categoriasProveedores.jsp" />
        <jsp:include page="marcasProveedores.jsp" />
        <jsp:include page="editarProveedores.jsp" />
        <jsp:include page="verProveedores.jsp" />
        <jsp:include page="guardarProveedores.jsp" />




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




