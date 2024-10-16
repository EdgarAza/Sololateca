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
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .tabla-madre {
                margin-top: 2%;
                margin-left: 3%;
                margin-right: 3%;
            }

            .form-reportes{
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
            h1 {
                text-align: center;        /* Centrar el texto */
                color: white;              /* Color del texto */
                font-size: 3.5em;          /* Tamaño de la letra */
                text-shadow:
                    -2px -2px 0 black,
                    2px -2px 0 black,
                    -2px  2px 0 black,
                    2px  2px 0 black;
            }
            .table-responsive {
                max-height: 300px; /* Ajusta la altura según sea necesario */
                overflow-y: auto; /* Activa el scrollbar vertical */
            }

            .table thead th {
                position: sticky;
                top: 0; /* Fija el encabezado en la parte superior */
                background-color: white; /* Color de fondo para el encabezado */
                z-index: 10; /* Asegura que esté por encima de otras filas */
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
                                <li><a class="dropdown-item" href="cVenta?accion=mostrar">Nueva Venta</a></li>
                                <li><a class="dropdown-item" href="#">Ventas</a></li>
                                <li><a class="dropdown-item" href="#">Diario</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Datos
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a class="dropdown-item" href="cInventario?accion=mostrar">Productos</a></li>
                                <li><a class="dropdown-item" href="cProveedores?accion=mostrar">Proveedores</a></li>
                                <li><a class="dropdown-item" href="cClientes?accion=mostrar">Clientes</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Configuracion
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a class="dropdown-item" href="controlador?accion=mostrar">Usurios</a></li>
                                <li> <a class="dropdown-item" href="cReportes?accion=reportes">Reportes</a></li>
                                <li><a class="dropdown-item" href="cInventario?accion=Backup">Backup</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <h1>Usuarios</h1>
        <div class="tabla-madre">

            <form action="controlador" class="busqueda">                
                <label class="form-label">Busqueda Inteligente</label>
                <input type="text" id="buscar" name="txtBuscar" class="form-control" placeholder="Buscar...">
                <br>
                <input type="submit" class="btn btn-success" name="accion" value="Buscar">

            </form>

            <a href="controlador?accion=guardar" type="button" class="btn btn-success">Agregar nuevo</a>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Rol</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Clave</th>
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
                        usuariosDAO dao = new usuariosDAO();
                        List<usuarios> list = dao.mostrar();
                        Iterator<usuarios> iter = list.iterator();
                        usuarios usu = null;
                        while (iter.hasNext()) {
                            usu = iter.next();
                            System.out.println(usu.getApellidos());
                    %>
                    <tbody>
                        <tr>
                            <td><%=usu.getId()%></td>
                            <td><%=usu.getRol()%></td>
                            <td><%=usu.getUsuario()%></td>
                            <td><%=usu.getClave()%></td>
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
            <div class="form-reportes">
                <form action="controlador" >       
                    <input type="submit" class="btn btn-warning" name="accion" value="Usuarios">
                    <input type="submit" class="btn btn-warning" name="accion" value="Activos">
                    <input type="submit" class="btn btn-warning" name="accion" value="Inactivos">

                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
