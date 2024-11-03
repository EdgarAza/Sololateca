<%-- 
    Document   : verProveedores
    Created on : 31/10/2024, 00:13:23
    Author     : DANIELS SYSTEMS
--%>

<%@page import="modelo.busqueda"%>
<%@page import="modelo.provmarca"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.provmarcaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Proveedor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">   
    </head>
    <body>
        <div class="modal fade" id="verModal" tabindex="-1" aria-labelledby="verModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="verModalLabel">Editar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formVer" action="cProveedores" method="post">
                            <input type="hidden" name="txtId" value="">
                            <label>Nombre</label>
                            <input type="text" name="txtNombre" class="form-control" disabled>
                            <label>Razon Social</label>
                            <input type="text" name="txtRazonSocial" class="form-control" disabled>
                            <label>Telefono</label>
                            <input type="text" name="txtTelefono" class="form-control" disabled>
                            <label>Correo</label>
                            <input type="text" name="txtCorreo" class="form-control" disabled>   
                            <label>Direccion</label>
                            <input type="text" name="txtDireccion" class="form-control" disabled>
                            <label>Informacion de pago</label>
                            <input type="text" name="txtInfoPago" class="form-control" disabled>
                            <label>Condiciones de pago</label>
                            <input type="text" name="txtConPago" class="form-control" disabled> 
                            <label>Estado</label>
                            <select class="form-select "  name='txtEstado' disabled>
                                <option value="ACTIVO">ACTIVO</option>
                                <option value="INACTIVO">INACTVO</option>
                            </select>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const verModal = document.getElementById('verModal');
            verModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // Botón que activó el modal
                const id = button.getAttribute('data-id');
                const nombre = button.getAttribute('data-nombre');
                const razonSocial = button.getAttribute('data-razonSocial');
                const telefono = button.getAttribute('data-telefono');
                const correo = button.getAttribute('data-correo');
                const direccion = button.getAttribute('data-direccion');
                const infopago = button.getAttribute('data-infopago');
                const conpago = button.getAttribute('data-conpago');
                const estado = button.getAttribute('data-estado');

                // Rellenar los campos del formulario en el modal
                const modalForm = verModal.querySelector('form');
                modalForm.querySelector('input[name="txtId"]').value = id;
                modalForm.querySelector('input[name="txtNombre"]').value = nombre;
                modalForm.querySelector('input[name="txtRazonSocial"]').value = razonSocial;
                modalForm.querySelector('input[name="txtTelefono"]').value = telefono;
                modalForm.querySelector('input[name="txtCorreo"]').value = correo;
                modalForm.querySelector('input[name="txtDireccion"]').value = direccion;
                modalForm.querySelector('input[name="txtInfoPago"]').value = infopago;
                modalForm.querySelector('input[name="txtConPago"]').value = conpago;
                modalForm.querySelector('select[name="txtEstado"]').value = estado;


            });

        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>