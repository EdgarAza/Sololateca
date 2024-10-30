<%-- 
    Document   : guardarProveedor
    Created on : 30/10/2024, 14:35:24
    Author     : DANIELS SYSTEMS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Categoria</title>
        
    </head>
    <body>
       <div class="modal fade" id="guardarCategoriaModal" tabindex="-1" aria-labelledby="guardarCategoriaModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="guardarCategoriaModalLabel">Agregar Categoria</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formGuardarCategoria" action="cMC" method="post">
                            <label>Categoria</label>
                            <input type="text" placeholder="Nombre" name="txtCategoria" class="form-control" required>  
                        </form>
                    </div>
                    <div class="modal-footer">              
                        <button type="submit" form="formGuardarCategoria" class="btn btn-success" name="accion" value="AgregarCategoria">Guardar</button>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
