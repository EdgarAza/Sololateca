<%@page import="modeloDAO.BusquedaUsuarioDAO"%>
<%@page import="interfaces.BusquedaUsuarios"%>
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
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .tabla-madre {
                margin-top: 2%;
                margin-left: 3%;
                margin-right: 3%;
            }

            .busqueda{
                margin-top: 2%;
                margin-right: 70%;
                margin-bottom: 3%;
            }

            .fa-trash{
                color: red;
            }

            .fa-pencil{
                color:coral;
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
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">LA SOLOLATECA</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Ventas
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Nueva Venta</a></li>
                                <li><a class="dropdown-item" href="#">Ventas</a></li>
                                <li><a class="dropdown-item" href="#">Diario</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Datos
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Productos</a></li>
                                <li><a class="dropdown-item" href="#">Proveedores</a></li>
                                <li><a class="dropdown-item" href="#">Clientes</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Configuracion
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Usuarios</a></li>
                                <li><a class="dropdown-item" href="#">Reportes</a></li>
                                <li><a class="dropdown-item" href="#">Backup</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="tabla-madre">

            <form>
                <div class="busqueda">
                    <label class="form-label">Busqueda Inteligente</label>
                    <input type="text" id="buscar" name="txtBuscar" class="form-control" placeholder="Buscar...">
                    <br>
                    <button type="button" class="btn btn-success">Buscar</button>            </div>
            </form>

            <a href="controlador?accion=guardar" type="button" class="btn btn-success">Agregar nuevo</a>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Rol</th>
                        <th scope="col">Dpi</th>
                        <th scope="col">Nombres</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>

                <%
                    BusquedaUsuarioDAO dao = new BusquedaUsuarioDAO();
                     String busqueda = (String) request.getAttribute("busqueda");
                    List<usuarios> list = dao.mostrar(busqueda);
                    Iterator<usuarios> iter = list.iterator();
                    usuarios usu = null;
                    while (iter.hasNext()) {
                        usu = iter.next();
                      
                %>
                <tbody>
                    <tr>
                        <td><%=usu.getId()%></td>
                        <td><%=usu.getRol()%></td>
                        <td><%=usu.getDpi()%></td>
                        <td><%=usu.getNombres()%></td>
                        <td><%=usu.getApellidos()%></td>
                        <td><%=usu.getTelefono()%></td>
                        <td><%=usu.getDireccion()%></td>
                        <td><%=usu.getEstado()%></td>
                        <td>
                            <a href="controlador?accion=editar&id=<%=usu.getId()%>" class="fa-solid fa-pencil"></a>
                            <a href="controlador?accion=eliminar&id=<%=usu.getId()%>"class="fa-solid fa-trash"></a>
                        </td>

                    </tr>
                    <%}%>
                </tbody>

            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
