<%@page import="configuracion.conexion"%>
<%@page import="modelo.inventario"%>
<%@page import="modeloDAO.inventarioDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venta</title>
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .tabla-madre, .tabla-venta {
                margin-top: 2%;
                margin-left: 3%;
                margin-right: 3%;
            }

            .fa-trash {
                color: red;
            }

            .fa-pencil {
                color: coral;
            }

            body {
                background-image: url('assets/images/fondo.png');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                margin: 0;
                height: 100vh;
                color: #fff;
            }

            .table-responsive {
                max-height: 120px;
                overflow-y: auto;
            }

            .table-responsive2 {
                max-height: 180px;
                overflow-y: auto;
            }

            .table thead th {
                position: sticky;
                top: 0;
                background-color: white;
                z-index: 10;
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
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Ventas</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="cVenta?accion=mostrar">Nueva Venta</a></li>
                                <li><a class="dropdown-item" href="cVentas?accion=mostrar">Ventas</a></li>
                                <li><a class="dropdown-item" href="cDiario?accion=mostrar">Diario</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Datos</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="cInventario?accion=mostrar">Productos</a></li>
                                <li><a class="dropdown-item" href="cProveedores?accion=mostrar">Proveedores</a></li>
                                <li><a class="dropdown-item" href="cClientes?accion=mostrar">Clientes</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Configuracion</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="controlador?accion=mostrar">Usuarios</a></li>
                                <li><a class="dropdown-item" href="cReportes?accion=reportes">Reportes</a></li>
                                <li><a class="dropdown-item" href="cInventario?accion=Backup">Backup</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="tabla-madre">
            <form onkeypress="return handleKeyPress(event)">
                <div class="row g-3">
                    <div class="col-sm-2 mb-3">
                        <label class="form-label">Código</label>
                        <input type="text" class="form-control" placeholder="Código" name="txtCodigo">
                    </div>
                    <div class="col-lg-5 mb-3">
                        <label class="form-label">Descripción</label>
                        <input type="text" class="form-control" placeholder="Descripción" name="txtDescripcion">
                    </div>
                    <div class="col-sm mb-3">
                        <label class="form-label">Cantidad</label>
                        <input type="number" class="form-control" placeholder="Cantidad" name="txtCantidad">
                    </div>
                    <div class="col-sm mb-3">
                        <label class="form-label">Precio</label>
                        <input type="number" class="form-control" placeholder="Precio" name="txtPrecio">
                    </div>
                </div>
            </form>
            <h2 id="resultado">Ver</h2>
            <div class="table-responsive">
                <table class="table table-striped" id="tablaVentasInventario">
                    <thead>
                        <tr>
                            <th scope="col">Código</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Proveedor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            inventarioDAO dao = new inventarioDAO();
                            List<inventario> list = dao.mostrar();
                            Iterator<inventario> iter = list.iterator();
                            inventario inv = null;
                            while (iter.hasNext()) {
                                inv = iter.next();
                        %>
                        <tr onclick="fillForm('<%=inv.getCodigo()%>', '<%=inv.getDescripcion()%>', <%=inv.getStock()%>, <%=inv.getPrecio()%>)">
                            <td><%=inv.getCodigo()%></td>
                            <td><%=inv.getDescripcion()%></td>
                            <td><%=inv.getStock()%></td>
                            <td><%=inv.getPrecio()%></td>
                            <td><%=inv.getProveedor()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="tabla-venta">
            <div class="table-responsive2">
                <table class="table table-striped" id="tablaVentasVenta">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Código</th>
                            <th scope="col">Cant</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Las filas se agregarán aquí -->
                    </tbody>
                </table>
                <div class="mt-3">
                    <strong id="totalAcumulado">Total: Q0.00</strong>
                  
                    
                </div>
            </div>
        </div>
        <script>
            let rowCount = 0; // Para mantener un conteo correlativo
            let totalAcumulado = 0; // Total acumulado de los subtotales

            function fillForm(codigo, descripcion, stock, precio) {
                document.getElementsByName('txtCodigo')[0].value = codigo;
                document.getElementsByName('txtDescripcion')[0].value = descripcion;
                document.getElementsByName('txtPrecio')[0].value = precio;
                document.getElementsByName('txtCantidad')[0].focus();
            }

            function handleKeyPress(event) {
                if (event.key === 'Enter') {
                    event.preventDefault(); // Evitar el comportamiento por defecto del formulario

                    // Obtener valores de los campos
                    const codigo = document.getElementsByName('txtCodigo')[0].value;
                    const descripcion = document.getElementsByName('txtDescripcion')[0].value;
                    const cantidad = parseFloat(document.getElementsByName('txtCantidad')[0].value);
                    const precio = parseFloat(document.getElementsByName('txtPrecio')[0].value);

                    // Validar que los campos no estén vacíos
                    if (codigo && descripcion && !isNaN(cantidad) && !isNaN(precio)) {
                        const subtotal = cantidad * precio;

                        // Agregar o actualizar la fila en la tabla de ventas
                        const tablaVentas = document.getElementById('tablaVentasVenta').getElementsByTagName('tbody')[0];
                        let filaExistente = Array.from(tablaVentas.rows).find(row => row.cells[1].innerText === codigo);

                        if (filaExistente) {
                            // Si la fila ya existe, actualizar cantidad y subtotal
                            const cantidadExistente = parseFloat(filaExistente.cells[2].innerText) + cantidad;
                            const nuevoSubtotal = cantidadExistente * precio;

                            filaExistente.cells[2].innerText = cantidadExistente;
                            filaExistente.cells[5].innerText = nuevoSubtotal.toFixed(2); // Actualiza subtotal
                        } else {
                            // Agregar una nueva fila
                            const nuevaFila = tablaVentas.insertRow();
                            nuevaFila.insertCell(0).innerText = ++rowCount; // Correlativo
                            nuevaFila.insertCell(1).innerText = codigo;
                            nuevaFila.insertCell(2).innerText = cantidad;
                            nuevaFila.insertCell(3).innerText = descripcion;
                            nuevaFila.insertCell(4).innerText = precio;
                            nuevaFila.insertCell(5).innerText = subtotal.toFixed(2); // Formato a dos decimales
                        }

                        // Actualizar total acumulado
                        totalAcumulado += subtotal;
                        console.log(totalAcumulado);
                        document.getElementById('totalAcumulado').innerText = 'Total: Q${totalAcumulado.toFixed(2)}';

                        // Limpiar campos
                        document.getElementsByName('txtCodigo')[0].value = '';
                        document.getElementsByName('txtDescripcion')[0].value = '';
                        document.getElementsByName('txtCantidad')[0].value = '';
                        document.getElementsByName('txtPrecio')[0].value = '';
                    } else {
                        alert("Por favor, completa todos los campos.");
                    }
                }
            }

        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
