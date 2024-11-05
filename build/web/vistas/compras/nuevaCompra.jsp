<%-- 
    Document   : mostrarCompras
    Created on : 31/10/2024, 13:28:32
    Author     : DANIELS SYSTEMS
--%>
<%@page import="modeloDAO.inventarioDAO"%>
<%@page import="modeloDAO.proveedoresDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.proveedores" %>
<%@ page import="modelo.inventario" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Compra</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/nuevaCompra.css">

    </head>
    <body>
        <div class="tabla-madre">
            <h1>Compras</h1>
            <form id="formGuardarCompra" action="cCompras" method="post">
                <div class="row g-3">
                    <div class="col-2 mb-3">
                        <%
                            DateTimeFormatter fecha = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                            String fdia = fecha.format(LocalDateTime.now());
                        %>
                        <input type="text" class="form-control" placeholder="Fecha" name="txtFecha" value="<%=fdia%>">
                    </div>
                    <div class="col-3 mb-3">
                        <input type="text" class="form-control" placeholder="No. de Recibo" name="txtNumero">
                    </div>
                    <div class="col-4 mb-3">
                        <%
                            proveedoresDAO dao = new proveedoresDAO();
                            List<proveedores> list = dao.mostrarActivos();
                        %>
                        <select class="form-control" name="txtProveedor">
                            <option value="">Seleccione un proveedor</option>
                            <%
                                for (proveedores prov : list) {
                            %>
                            <option value="<%= prov.getNombre()%>"><%= prov.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="row g-3">
                    <div class="col-3 mb-3">
                        <input type="text" class="form-control" placeholder="Total" name="txtTotal">
                    </div>
                    <div class="col-3 mb-3">
                        <input type="text" class="form-control" placeholder="Fecha de Pago" name="txtFechaPago">
                    </div>
                    <div class="col-5 mb-3">
                        <input type="text" class="form-control" placeholder="Nota" name="txtNota">
                    </div>
                </div>
                <div class="row g-3">  
                    <div class="col-1 mb-3">
                        <button type="submit" form="formGuardarCompra" class="btn btn-primary" name="accion" value="AgregarDatos">Registrar</button>           
                    </div> 
                    <div class="col-1 mb-3">
                        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#AgregarModal">Agregar</button>
                    </div> 

                </div>
                <div class="table-responsive">
                    <table class="table table-striped" id="tablaCompra">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Codigo</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Costo</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Stock</th>
                                <th scope="col">CA</th>
                                <th scope="col">PA</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Las filas se agregarán aquí -->
                        </tbody>
                        <input type="hidden" name="tablaDatos" id="tablaDatos">
                    </table>
                </div>
            </form>
        </div>





        <div class="modal fade" id="AgregarModal" tabindex="-1" aria-labelledby="AgregarModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="AgregarModalLabel">Datos del Producto</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row g-3">
                            <div class="col-2 mb-3">
                                <label>Cantidad</label>
                                <input type="text" id="txtmCantidad" class="form-control" placeholder="Cantidad" name="txtmCantidad">
                            </div>
                            <div class="col-3 mb-3">
                                <label>Codigo</label>
                                <input type="text" id="txtmCodigo" class="form-control" placeholder="Codigo" name="txtmCodigo">
                            </div>
                            <div class="col-6 mb-3">
                                <label>Descripcion</label>
                                <input type="text" id="txtmDescripcion" class="form-control" placeholder="Descripcion" name="txtmDescripcion">
                            </div>
                        </div>
                        <div class="row g-3">
                            <div class="col-2 mb-3">
                                <label>Stock</label>
                                <input type="text" class="form-control" placeholder="Stock" name="txtmStock">
                            </div>
                            <div class="col-2 mb-3">
                                <label>Precio</label>
                                <input type="text" class="form-control" placeholder="Precio" name="txtmPrecio">
                            </div>
                            <div class="col-2 mb-3">
                                <label>Costo</label>
                                <input type="text" class="form-control" placeholder="Costo" name="txtmCosto">
                            </div>
                            <div class="col-2 mb-3">

                                <input type="hidden" class="form-control" placeholder="CostoA" name="txtmCostoA">
                            </div>
                            <div class="col-2 mb-3">

                                <input type="hidden" class="form-control" placeholder="PrecioA" name="txtmPrecioA">
                            </div>
                        </div>
                        <div>
                            <button class="btn btn-success" onclick="addRow()">Agregar</button>
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Codigo</th>
                                    <th scope="col">Descripcion</th>
                                    <th scope="col">Stock</th>
                                    <th scope="col">Costo</th>
                                    <th scope="col">Precio</th>     
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    inventarioDAO dao2 = new inventarioDAO();
                                    List<inventario> list2 = dao2.mostrar();
                                    for (inventario inv : list2) {
                                %>
                                <tr onclick="fillModalFields('<%=inv.getCodigo()%>', '<%=inv.getDescripcion()%>', '<%=inv.getStock()%>', '<%=inv.getCosto()%>', '<%=inv.getPrecio()%>', '<%=inv.getCosto()%>', '<%=inv.getPrecio()%>')">
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
                </div>
            </div>
        </div>
        <!-- fin del modal -->     

        <script>
            function fillModalFields(codigo, descripcion, stock, costo, precio, costoa, precioa) {
                document.querySelector('input[name="txtmCodigo"]').value = codigo;
                document.querySelector('input[name="txtmDescripcion"]').value = descripcion;
                document.querySelector('input[name="txtmStock"]').value = stock;
                document.querySelector('input[name="txtmCosto"]').value = costo;
                document.querySelector('input[name="txtmPrecio"]').value = precio;
                document.querySelector('input[name="txtmCostoA"]').value = costoa;
                document.querySelector('input[name="txtmPrecioA"]').value = precioa;
            }

            let currentIndex = 1;

            function addRow() {
                const codigo = document.querySelector('input[name="txtmCodigo"]').value;
                const descripcion = document.querySelector('input[name="txtmDescripcion"]').value;
                const cantidad = document.querySelector('input[name="txtmCantidad"]').value;
                const costo = document.querySelector('input[name="txtmCosto"]').value;
                const precio = document.querySelector('input[name="txtmPrecio"]').value;
                const stock = document.querySelector('input[name="txtmStock"]').value;
                const costoa = document.querySelector('input[name="txtmCostoA"]').value;
                const precioa = document.querySelector('input[name="txtmPrecioA"]').value;

                const tableBody = document.querySelector('#tablaCompra tbody');
                const newRow = tableBody.insertRow();
                newRow.insertCell(0).textContent = currentIndex++;
                newRow.insertCell(1).textContent = cantidad;
                newRow.insertCell(2).textContent = codigo;
                newRow.insertCell(3).textContent = descripcion;
                newRow.insertCell(4).textContent = costo;
                newRow.insertCell(5).textContent = precio;
                newRow.insertCell(6).textContent = stock;
                newRow.insertCell(7).textContent = costoa;
                newRow.insertCell(8).textContent = precioa;

                // Crear el botón de eliminar
                const deleteCell = newRow.insertCell(9);
                const deleteButton = document.createElement('button');
                deleteButton.textContent = 'Eliminar';
                deleteButton.className = 'btn btn-danger btn-sm';
                deleteButton.onclick = () => eliminarfila(newRow); // Asignar la función de eliminación
                deleteCell.appendChild(deleteButton);

                cargarDatos();

                document.querySelector('input[name="txtmCodigo"]').value = '';
                document.querySelector('input[name="txtmDescripcion"]').value = '';
                document.querySelector('input[name="txtmStock"]').value = '';
                document.querySelector('input[name="txtmCosto"]').value = '';
                document.querySelector('input[name="txtmPrecio"]').value = '';
                document.querySelector('input[name="txtmCantidad"]').value = '';
                document.querySelector('input[name="txtmCostoA"]').value = '';
                document.querySelector('input[name="txtmPrecioA"]').value = '';

                const modal = bootstrap.Modal.getInstance(document.getElementById('AgregarModal'));
                modal.hide();
            }

            function eliminarfila(row) {
                const tableBody = document.querySelector('#tablaCompra tbody');
                tableBody.deleteRow(row.rowIndex - 1); // Eliminar la fila
                currentIndex--; // Disminuir el índice actual

                // Actualizar el campo oculto con los datos de la tabla
                cargarDatos();
            }

            function cargarDatos() {
                const rows = document.querySelectorAll('#tablaCompra tbody tr');
                let datos = '';

                rows.forEach((row, index) => {
                    const cells = row.querySelectorAll('td');
                    datos += cells[1].textContent + ',' + cells[2].textContent + ',' + cells[3].textContent + ',' + cells[4].textContent
                            + ',' + cells[5].textContent + ',' + cells[6].textContent + ',' + cells[7].textContent + ',' + cells[8].textContent;
                    if (index < rows.length - 1) {
                        datos += ';'; // Separador de filas
                    }
                });
                document.getElementById('tablaDatos').value = datos;
            }

            function filterTable() {
                const codigoFilter = document.getElementById('txtmCodigo').value.toLowerCase();
                const descripcionFilter = document.getElementById('txtmDescripcion').value.toLowerCase();
                const table = document.querySelector('#AgregarModal table');
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const cells = rows[i].getElementsByTagName('td');
                    let showRow = true;

                    if (codigoFilter && cells[0].textContent.toLowerCase().indexOf(codigoFilter) === -1) {
                        showRow = false;
                    }
                    if (descripcionFilter && cells[1].textContent.toLowerCase().indexOf(descripcionFilter) === -1) {
                        showRow = false;
                    }

                    rows[i].style.display = showRow ? '' : 'none';
                }
            }
            document.getElementById('txtmCodigo').addEventListener('keyup', filterTable);
            document.getElementById('txtmDescripcion').addEventListener('keyup', filterTable);
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html> 
