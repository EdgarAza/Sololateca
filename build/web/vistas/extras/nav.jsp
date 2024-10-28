<%-- 
    Document   : nav
    Created on : 27/10/2024, 23:42:35
    Author     : DANIELS SYSTEMS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                                <li><a class="dropdown-item" href="cVentas?accion=mostrar">Ventas</a></li>
                                <li><a class="dropdown-item" href="cDiario?accion=mostrar">Diario</a></li>
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
    </body>
</html>
