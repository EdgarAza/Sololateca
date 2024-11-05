<%-- 
    Document   : venta
    Created on : 3/11/2024, 16:54:43
    Author     : DANIELS SYSTEMS
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.inventario"%>
<%@page import="modeloDAO.inventarioDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venta</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/venta.css">

    </head>
    <body>
        <jsp:include page="../extras/nav.jsp" />
        <div class="tabla-madre">
            <form id="formdatosVenta" action="cVenta" method="post">
                <div class="row g-3">
                    <div class="col-2 mb-2">
                        <input type="text" class="form-control" id="txtmCodigo" placeholder="Codigo" name="txtmCodigo">
                    </div>
                    <div class="col-4 mb-2">
                        <input type="text" class="form-control" id="txtmDescripcion" placeholder="Descripcion" name="txtmDescripcion">
                    </div>
                    <div class="col-2 mb-2">
                        <input type="text" class="form-control" id="txtmCantidad" placeholder="Cantidad" name="txtmCantidad">
                    </div>
                    <div class="col-2 mb-2">
                        <input type="text" class="form-control" placeholder="Precio" name="txtmPrecio">
                    </div>
                    <div class="col-1 mb-2">
                        <input type="hidden" class="form-control" placeholder="Costo" name="txtmCosto">
                    </div>
                    <div class="col-1 mb-2">
                        <input type="hidden" class="form-control" placeholder="Stock" name="txtmStock">
                    </div>
                </div>
                <div class="row g-3">
                    <div class="col-1 mb-2">
                        <button type="button" class="btn btn-success" onclick="addRow()">Agregar</button>
                    </div>
                    <div class="col-1 mb-2">
                        <button type="submit" form= "formDatosTabla" class="btn btn-primary" name="accion" value="vender">Vender</button>
                    </div>
                </div>
            </form>

            <div class="table-responsivex">
                <table class="table table-striped" id="tablaInventario">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Codigo</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Costo</th>
                            <th scope="col">Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            inventarioDAO dao = new inventarioDAO();
                            List<inventario> list = dao.mostrar();
                            for (inventario inv : list) {
                        %>
                        <tr onclick="fillModalFields('<%=inv.getCodigo()%>', '<%=inv.getDescripcion()%>',<%=inv.getPrecio()%>,<%=inv.getCosto()%>,<%=inv.getStock()%>)">
                            <td><%=inv.getId()%></td>
                            <td><%=inv.getCodigo()%></td>
                            <td><%=inv.getDescripcion()%></td>
                            <td><%=inv.getStock()%></td>
                            <td><%=inv.getCosto()%></td>
                            <td><%=inv.getPrecio()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>

            <form id="formDatosTabla" action="cVenta" method="post">
                <input type="hidden" name="tablaDatos" id="tablaDatos">
                <div class="table-responsivex2">
                    <table class="table table-striped" id="tablaVenta">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Codigo</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Subtotal</th>
                                <th scope="col" >Costo</th><!-- ocultar esta columna -->
                                <th scope="col">Stock</th><!-- ocultar esta columna -->
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>



                <div class="row g-3">
                    <div class="col-4 mb-2">
                        <input type="text" class="form-control" placeholder="Nombre" name="txtNombre2">
                    </div>
                    <div class="col-2 mb-2">
                        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#guardarClientesModal">Nuevo Cliente</button>
                    </div>
                    <div class="col-4 mb-2">                    
                    </div>
                    <div class="col-2 mb-2">                    
                        <h3 id="total2" name="txtTotal2" class="oculto">0.00</h3>
                        <h3 id="total">Q. 0.00</h3>
                    </div>

                </div>
            </form>
        </div>

        <jsp:include page="Clientes.jsp" />
        <script>
            ///funcion agregar con click
            ////3----------------
            function fillModalFields(codigo, descripcion, precio, costo, stock) {
                document.querySelector('input[name="txtmCodigo"]').value = codigo;
                document.querySelector('input[name="txtmDescripcion"]').value = descripcion;
                document.querySelector('input[name="txtmPrecio"]').value = precio;
                document.querySelector('input[name="txtmCosto"]').value = costo;
                document.querySelector('input[name="txtmStock"]').value = stock;
                // Dar foco al campo txtmCosto
                document.querySelector('input[name="txtmCantidad"]').focus();
            }


            ///3----------------

            ///fuuncion para filtra por codigo o descripcion
            ///2------------
            function filterTable() {
                const codigoFilter = document.getElementById('txtmCodigo').value.toLowerCase();
                const descripcionFilter = document.getElementById('txtmDescripcion').value.toLowerCase();
                const table = document.querySelector('#tablaInventario');
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const cells = rows[i].getElementsByTagName('td');
                    let showRow = true;

                    if (codigoFilter && cells[1].textContent.toLowerCase().indexOf(codigoFilter) === -1) {
                        showRow = false;
                    }
                    if (descripcionFilter && cells[2].textContent.toLowerCase().indexOf(descripcionFilter) === -1) {
                        showRow = false;
                    }

                    rows[i].style.display = showRow ? '' : 'none';
                }
            }
            document.getElementById('txtmCodigo').addEventListener('keyup', filterTable);
            document.getElementById('txtmDescripcion').addEventListener('keyup', filterTable);
            ///2------------

            ////Funcion enter agregar
            ////4
            document.querySelector('input[name="txtmCantidad"]').addEventListener('keyup', function (event) {
                if (event.key === 'Enter') {
                    event.preventDefault(); // Evitar el envío del formulario
                    addRow(); // Ejecutar la función addRow
                }
            });
            ////4

            ////1---------
            ///Funciones agregar tabla, boton eliminar, y carga de datos
            let currentIndex = 1;
            let total = 0;
            function addRow() {
                const cantidad = parseInt(document.querySelector('input[name="txtmCantidad"]').value) || 0;
                const codigo = document.querySelector('input[name="txtmCodigo"]').value;
                const descripcion = document.querySelector('input[name="txtmDescripcion"]').value;
                const precio = parseFloat(document.querySelector('input[name="txtmPrecio"]').value) || 0;
                const costo = document.querySelector('input[name="txtmCosto"]').value;
                const stock = document.querySelector('input[name="txtmStock"]').value;
                const subtotal = cantidad * precio;
                const tableBody = document.querySelector('#tablaVenta tbody');
                let rowExists = false;

                // Verificar si el código ya existe en la tabla
                const rows = tableBody.querySelectorAll('tr');
                rows.forEach(row => {
                    const cells = row.querySelectorAll('td');
                    if (cells[2].textContent === codigo) {
                        const existingQuantity = parseInt(cells[1].textContent);
                        const newQuantity = existingQuantity + cantidad;
                        const newSubtotal = newQuantity * precio;
                        // Actualizar la fila existente
                        cells[1].textContent = newQuantity;
                        cells[5].textContent = newSubtotal.toFixed(2); // Actualizar subtotal
                        total += (newSubtotal - (existingQuantity * precio)); // Sumar la diferencia
                        updateTotalDisplay();
                        rowExists = true;
                    }
                });

                // Si no existe, agregar una nueva fila
                if (!rowExists) {
                    const newRow = tableBody.insertRow();
                    newRow.insertCell(0).textContent = currentIndex++; // #
                    newRow.insertCell(1).textContent = cantidad; // Cantidad
                    newRow.insertCell(2).textContent = codigo; // Codigo
                    newRow.insertCell(3).textContent = descripcion; // Descripcion
                    newRow.insertCell(4).textContent = precio.toFixed(2); // Precio
                    newRow.insertCell(5).textContent = subtotal.toFixed(2); // Subtotal
                    newRow.insertCell(6).textContent = costo; // Costo
                    newRow.insertCell(7).textContent = stock; // Stock

                    // Crear el botón de eliminar
                    const deleteCell = newRow.insertCell(8); // Cambiar a 8
                    const deleteButton = document.createElement('button');
                    deleteButton.textContent = 'Eliminar';
                    deleteButton.className = 'btn btn-danger btn-sm';
                    deleteButton.type = 'button';
                    deleteButton.onclick = () => deleteRow(newRow);
                    deleteCell.appendChild(deleteButton);

                    total += subtotal;
                    updateTotalDisplay();
                }

                updateHiddenField();
                // Limpiar los campos de entrada
                document.querySelector('input[name="txtmCantidad"]').value = '';
                document.querySelector('input[name="txtmCodigo"]').value = '';
                document.querySelector('input[name="txtmDescripcion"]').value = '';
                document.querySelector('input[name="txtmPrecio"]').value = '';
                document.querySelector('input[name="txtmCosto"]').value = '';
                document.querySelector('input[name="txtmStock"]').value = '';
            }

            function deleteRow(row) {
                const tableBody = document.querySelector('#tablaVenta tbody');
                const cells = row.querySelectorAll('td');
                const subtotal = parseFloat(cells[5].textContent);
                total -= subtotal; // Restar el subtotal total

                // Eliminar la fila
                tableBody.deleteRow(row.rowIndex - 1);
                currentIndex--; // Disminuir el índice actual

                // Actualizar el total en la interfaz
                updateTotalDisplay();
                // Actualizar el campo oculto con los datos de la tabla
                updateHiddenField();
            }
            function updateTotalDisplay() {
                document.getElementById('total').textContent = 'Q. ' + total.toFixed(2);
                document.getElementById('total2').textContent = total.toFixed(2);
            }

            function updateHiddenField() {
                const rows = document.querySelectorAll('#tablaVenta tbody tr');
                let datos = '';
                rows.forEach((row, index) => {
                    const cells = row.querySelectorAll('td');
                    datos += cells[1].textContent + ',' + cells[2].textContent + ',' + cells[3].textContent + ',' + cells[4].textContent + ',' + cells[5].textContent + ',' + cells[6].textContent + ',' + cells[7].textContent;
                    if (index < rows.length - 1) {
                        datos += ';'; // Separador de filas
                    }
                });
                document.getElementById('tablaDatos').value = datos;
            }
////1---------

        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
