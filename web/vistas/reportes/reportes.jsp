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

            .form-reportes {
                margin-top: 2%;
                margin-left: 3%;
                margin-right: 3%;
                text-align: center;
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
            h2 {
                text-align: center;        /* Centrar el texto */
                color: white;              /* Color del texto */
                font-size: 2em;          /* Tamaño de la letra */
                text-shadow:
                    -1px -1px 0 black,
                    1px -1px 0 black,
                    -1px  1px 0 black,
                    1px  1px 0 black;
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
                                <li> <a class="dropdown-item" href="cInventario?accion=mostrar">Productos</a></li>
                                <li><a class="dropdown-item" href="#">Proveedores</a></li>
                                <li><a class="dropdown-item" href="#">Clientes</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Configuracion
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a class="dropdown-item" href="controlador?accion=mostrar">Usurios</a></li>
                                <li> <a class="dropdown-item" href="cReportes?accion=reportes">Reportes</a></li>
                                <li><a class="dropdown-item" href="#">Backup</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <h1>Reportes</h1>
        <h2>Reportes Usuarios</h2>
        <div class="form-reportes">
            <form action="cReportes" >       
                <input type="submit" class="btn btn-warning" name="accion" value="Usuarios">
                <input type="submit" class="btn btn-warning" name="accion" value="Activos">
                <input type="submit" class="btn btn-warning" name="accion" value="Inactivos">

            </form>
            <h2>Reportes Inventario</h2>
            <div class="form-reportes">
                <form action="cReportes" >       
                    <input type="submit" class="btn btn-warning" name="accion" value="Inventario">
                    <input type="submit" class="btn btn-warning" name="accion" value="Minimo">
                    <input type="submit" class="btn btn-warning" name="accion" value="Existencia">

                </form>
            </div>
            <h2>Reportes Proveedores</h2>
            <div class="form-reportes">
                <form action="cProveedores" >       
                    <input type="submit" class="btn btn-warning" name="accion" value="proveedores">
                </form>
            </div>
            <h2>Reportes Clientes</h2>
            <div class="form-reportes">
                <form action="cClientes" >       
                    <input type="submit" class="btn btn-warning" name="accion" value="Clientes">

                </form>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
