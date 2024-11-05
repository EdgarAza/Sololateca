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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <style>
            /* Estilo para el icono de logout */
            .navbar .user-info svg {
                cursor: pointer;
                width: 20px;
                height: 20px;
                margin-left: 10px;
            }

            /* Centrar y alinear los elementos de usuario */
            .navbar .user-info {
                margin-left: auto; /* Esto empuja el 'user-info' a la derecha */
                font-size: 16px;
            }

            .colorb{
                color: black;
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

                        <!-- Menú Ventas -->
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

                        <!-- Menú Datos -->
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
                                <li>
                                    <form action="cCompras" method="post" class="d-inline">
                                        <input type="hidden" name="accion" value="mostrar">
                                        <button type="submit" class="dropdown-item">Compras</button>
                                    </form>
                                </li>
                            </ul>
                        </li>

                        <!-- Menú Configuración -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Configuración
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

                <!-- Div de User Info (Ubicado al final de la navbar) -->
                <div class="user-info d-flex align-items-center">
                    <span class="me-3 colorb">Bienvenido, <strong class="colorb">Edgar</strong></span>

                    <!-- Formulario de Logout -->
                    <form action="cLogin" method="post">
                        <button type="submit" name="accion" class="btn btn-danger" value="logout" title="Salir">
                            <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-box-arrow-in-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0z"/>
                            <path fill-rule="evenodd" d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708z"/>
                            </svg>
                        </button>
                    </form>
                </div>

            </div>
        </nav>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
