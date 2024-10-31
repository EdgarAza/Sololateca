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
                                <li>
                                    <form action="cVenta" method="post" class="d-inline">
                                        <input type="hidden" name="accion" value="mostrar">
                                        <button type="submit" class="dropdown-item">Nueva Venta</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="cVentas" method="post" class="d-inline">
                                        <input type="hidden" name="accion" value="mostrar">
                                        <button type="submit" class="dropdown-item">Ventas</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="cDiario" method="post" class="d-inline">
                                        <input type="hidden" name="accion" value="mostrar">
                                        <button type="submit" class="dropdown-item">Diario</button>
                                    </form>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Datos
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <form action="cInventario" method="post" class="d-inline">
                                        <input type="hidden" name="accion" value="mostrar">
                                        <button type="submit" class="dropdown-item">Productos</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="cProveedores" method="post" class="d-inline">
                                        <input type="hidden" name="accion" value="mostrar">
                                        <button type="submit" class="dropdown-item">Proveedores</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="cClientes" method="post" class="d-inline">
                                        <input type="hidden" name="accion" value="mostrar">
                                        <button type="submit" class="dropdown-item">Clientes</button>
                                    </form>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Configuracion
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <form action="controlador" method="post" class="d-inline">
                                        <input type="hidden" name="accion" value="mostrar">
                                        <button type="submit" class="dropdown-item">Usuarios</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="cReportes" method="post" class="d-inline">
                                        <input type="hidden" name="accion" value="reportes">
                                        <button type="submit" class="dropdown-item">Reportes</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="cInventario" method="post" class="d-inline">
                                        <input type="hidden" name="accion" value="Backup">
                                        <button type="submit" class="dropdown-item">Backup</button>
                                    </form>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

    </body>
</html>
