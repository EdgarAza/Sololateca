

<%@page import="modelo.inventario"%>
<%@page import="modeloDAO.inventarioDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

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

            <form action="controlador" class="busqueda">                
                <label class="form-label">Busqueda Inteligente</label>
                <input type="text" id="buscar" name="txtBuscar" class="form-control" placeholder="Buscar...">
                <br>
                <input type="submit" class="btn btn-success" name="accion" value="Buscar">

            </form>

            <a href="cInventario?accion=guardar" type="button" class="btn btn-success">Agregar nuevo</a>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Codigo</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Stock</th>
                        <th scope="col">Costo</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Provedoor</th>
                        <th scope="col">Minimo</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>

                <%
                    inventarioDAO dao = new inventarioDAO();
                    List<inventario> list = dao.mostrar();
                    Iterator<inventario> iter = list.iterator();
                    inventario inv = null;
                    while (iter.hasNext()) {
                        inv = iter.next();

                %>
                <tbody>
                    <tr>
                        <td><%=inv.getId()%></td>
                        <td><%=inv.getCodigo()%></td>
                        <td><%=inv.getDescripcion()%></td>
                        <td><%=inv.getStock()%></td>
                        <td><%=inv.getCosto()%></td>
                        <td><%=inv.getPrecio()%></td>
                        <td><%=inv.getProveedor()%></td>
                        <td><%=inv.getMinimo()%></td>

                        <td>
                            <a href="cInventario?accion=editar&id=<%=inv.getId()%>" class="fa-solid fa-pencil"></a>
                            <a href="cInventario?accion=eliminar&id=<%=inv.getId()%>"class="fa-solid fa-trash"></a>
                        </td>

                    </tr>
                    <%}%>
                </tbody>

            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
