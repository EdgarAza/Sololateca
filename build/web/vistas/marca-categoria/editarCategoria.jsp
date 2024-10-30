<%-- 
    Document   : editarCategoria
    Created on : 30/10/2024, 14:35:49
    Author     : DANIELS SYSTEMS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Categoria</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
       
    </head>
    <body>
        <div class="modal fade" id="editarCategoriaModal" tabindex="-1" aria-labelledby="editarCategoriaModalLabel" aria-hidden="true">

            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarCategoriaModalLabel">Editar Categoria</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formEditarCategoria" action="cMC" method="post">
                            <input type="hidden" name="txtIdCategoria" value="">
                            <label>Categoria</label>
                            <input type="text" name="txtCategoria" class="form-control" required>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" form="formEditarCategoria" class="btn btn-warning" name="accion" value="ActualizarCategoria">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const editarCategoriaModal = document.getElementById('editarCategoriaModal');
            editarCategoriaModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // Botón que activó el modal
                const idcategoria = button.getAttribute('data-idcategoria');
                const categoria = button.getAttribute('data-categoria');

                // Rellenar los campos del formulario en el modal
                const modalForm = editarCategoriaModal.querySelector('form');
                modalForm.querySelector('input[name="txtIdCategoria"]').value = idcategoria;
                modalForm.querySelector('input[name="txtCategoria"]').value = categoria;
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
