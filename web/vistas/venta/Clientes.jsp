
<%@page import="modelo.clientes"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.clientesDAO"%>
<%@page import="modelo.busqueda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>

        <div class="modal fade" id="guardarClientesModal" tabindex="-1" aria-labelledby="guardarClientesModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="guardarClientesModalLabel">Nuevo Cliente</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formClientes" action="cClientes" method="post">
                            <div class="row g-3">
                                <div class="col-7 mb-3">
                                    <label>Nombre</label>
                                    <input type="text" class="form-control"  id="txtNombre" placeholder="Nombre" name="txtNombre" required>
                                </div>
                                <div class="col-5 mb-3">
                                    <label>Telefono</label>
                                    <input type="text" class="form-control"  placeholder="Telefono" name="txtTelefono" required>
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col-6 mb-3">
                                    <label>Correo</label>
                                    <input type="text" class="form-control"  placeholder="Correo" name="txtCorreo" >
                                </div>
                                <div class="col-6 mb-3">
                                    <label>Direccion</label>
                                    <input type="text" class="form-control"  placeholder="Direccion" name="txtDireccion" >
                                </div>
                            </div>
                        </form>

                        <div class="tabla-madre">
                            <div class="table-responsive">
                                <table class="table table-striped" id="tableClientes">
                                    <thead>
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Telefono</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            clientesDAO dao2 = new clientesDAO();
                                            List<clientes> list2 = dao2.mostrarVenta("");
                                            for (clientes cli : list2) {
                                        %>
                                        <tr onclick="fillModalFields2('<%=cli.getNombre()%>')">
                                            <td><%=cli.getNombre()%></td>
                                            <td><%=cli.getTelefono()%></td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <button type="button" class="btn btn-primary" onclick="sendData()">Agregar</button>
                            <button type="submit" form="formClientes" class="btn btn-success" name="accion" value="AgregarV">Guardar</button>        
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function fillModalFields2(nombre) {
                document.querySelector('input[name="txtNombre"]').value = nombre;
            }

            function sendData() {
                // Obtener el valor de txtNombre
                const nombre = document.querySelector('input[name="txtNombre"]').value;

                // Asignar el valor a txtNombre2
                document.querySelector('input[name="txtNombre2"]').value = nombre;

                // Prevenir el comportamiento por defecto y cerrar el modal correctamente

            }


            function filterTable2() {
                const nombreFilter = document.getElementById('txtNombre').value.toLowerCase();
                const table = document.querySelector('#tableClientes');
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    const cells = rows[i].getElementsByTagName('td');
                    let showRow = true;

                    if (nombreFilter && cells[0].textContent.toLowerCase().indexOf(nombreFilter) === -1) {
                        showRow = false;
                    }


                    rows[i].style.display = showRow ? '' : 'none';
                }
            }
            document.getElementById('txtNombre').addEventListener('keyup', filterTable2);

            ///2------------
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>

