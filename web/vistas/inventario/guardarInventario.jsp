<%@page import="modeloDAO.unidadDAO"%>
<%@page import="modelo.unidad"%>
<%@page import="modelo.categoria"%>
<%@page import="modeloDAO.categoriaDAO"%>
<%@page import="modelo.marca"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.marcaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
       

    </head>
    <body>

        <div class="modal fade" id="guardarInventarioModal" tabindex="-1" aria-labelledby="guardarInventarioModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="guardarInventarioModalLabel">Agregar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formGuardar" action="cInventario" method="post">

                            <label>Codigo</label>
                            <input type="text" class="form-control"  placeholder="Codigo" name="txtCodigo">
                            <%
                                unidadDAO dao3 = new unidadDAO();
                                List<unidad> list3 = dao3.mostrar();
                            %>

                            <label>Unida de medida</label>
                            <select class="form-control" name="txtUnidad">
                                <option value="">Seleccione una medida</option>
                                <%
                                    for (unidad un : list3) {
                                %> 
                                <option value="<%= un.getUnidadmedida()%>"><%= un.getUnidadmedida()%></option>
                                <% }%>
                            </select>
                            <label>Descripcion</label>
                            <input type="text" class="form-control"  placeholder="Descripcion" name="txtDescripcion">
                            <label>Costo</label>
                            <input type="text" class="form-control"  placeholder="Costo" name="txtCosto">
                            <label>Precio</label>
                            <input type="text" class="form-control"  placeholder="Precio" name="txtPrecio">
                            <label>Stock</label>
                            <input type="text" class="form-control"  placeholder="Stock" name="txtStock">
                            <label>Minimo</label>
                            <input type="text" class="form-control"  placeholder="Minimo" name="txtMinimo">
                            <%
                                marcaDAO dao = new marcaDAO();
                                List<marca> list = dao.mostrar();
                            %>

                            <label>Marca</label>
                            <select class="form-control" name="txtMarca">
                                <option value="">Seleccione una marca</option>
                                <%
                                    for (marca mar : list) {
                                %>
                                <option value="<%= mar.getMarca()%>"><%= mar.getMarca()%></option>
                                <% }%>
                            </select>
                            <%
                                categoriaDAO dao2 = new categoriaDAO();
                                List<categoria> list2 = dao2.mostrar();
                            %>

                            <label>Categoria</label>
                            <select class="form-control" name="txtCategoria">
                                <option value="">Seleccione una categoria</option>
                                <%
                                    for (categoria cat : list2) {
                                %>
                                <option value="<%= cat.getCategoria()%>"><%= cat.getCategoria()%></option>
                                <% }%>
                            </select>
                        </form>
                    </div>
                    <div class="modal-footer">              
                        <button type="submit" form="formGuardar" class="btn btn-success" name="accion" value="Agregar">Guardar</button>

                    </div>
                </div>
            </div>
        </div>


        <div id="confirmDeleteMessage" class="confirm-delete">
            <h5>Confirmar Eliminación</h5>
            <p>¿Estás seguro de que deseas eliminar este registro?</p>
            <button type="button" class="btn btn-danger" onclick="deleteRecord()">Eliminar</button>
            <button type="button" class="btn btn-secondary" onclick="closeConfirmDelete()">Cancelar</button>
        </div>
     
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
