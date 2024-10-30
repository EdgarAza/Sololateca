<%-- 
    Document   : editarMarca
    Created on : 30/10/2024, 14:35:33
    Author     : DANIELS SYSTEMS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Marca</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
       
    </head>
    <body>
        <div class="modal fade" id="editarMarcaModal" tabindex="-1" aria-labelledby="editarMarcaModalLabel" aria-hidden="true">

            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarMarcaModalLabel">Editar Marca</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formEditarMarca" action="cMC" method="post">
                            <input type="hidden" name="txtIdMarca" value="">
                            <label>Marca</label>
                            <input type="text" name="txtMarca" class="form-control" required>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" form="formEditarMarca" class="btn btn-warning" name="accion" value="ActualizarMarca">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const editarMarcaModal = document.getElementById('editarMarcaModal');
            editarMarcaModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // Botón que activó el modal
                const id = button.getAttribute('data-idmarca');
                const marca = button.getAttribute('data-marca');

                // Rellenar los campos del formulario en el modal
                const modalForm = editarMarcaModal.querySelector('form');
                modalForm.querySelector('input[name="txtIdMarca"]').value = id;
                modalForm.querySelector('input[name="txtMarca"]').value = marca;
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
