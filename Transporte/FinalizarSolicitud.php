<?php include('../header.php'); ?>
<script src="Transporte.js"></script>
<link rel="stylesheet" type="text/css" href="Transporte.css"></link>
<?php require_once("../Seguridad/conex.php"); ?>
<div style="margin: 15px;">
<fieldset>
<legend class="titulo_modal">Solicitudes por Finalizar  <button class="btn btn_transparente titulo_modal" title="Descargar Excel" data-toggle="tooltip" data-placement="bottom" onclick="GenerarReporteFinalizado()"><i class="fa-regular fa-file-excel"></i></button></legend>
  <table class="table table-striped" id="Tbl_Servicios_Asignar" name="Tbl_Servicios_Asignar">
    <thead>
      <tr>
        <th>#</th>
        <th>Fecha Salida</th>
        <th>Hora Salida</th>
        <th>Municipio Salida</th>
        <th>Fecha Destino</th>
        <th>Municipio Destino</th>
        <th>Otros Destinos</th>
        <th>Pernocta</th>
        <th>Tipo Vehiculo</th>
        <th>Cant<br>Pasajeros</th>
        <th>Cant<br>Invitados</th>
        <th>Cant<br>Días</th>
        <th>Usuario Solicitante</th>
        <th>Pasajeros</th>
        <th>Finalizar</th>
      </tr>
    </thead>
    <tbody></tbody>
  </table>
</fieldset>
</div>



<button type="button" class="btn btn-primary" id="Btn_ModalDetallePasajeros" style="display:none;" data-toggle="modal" data-target="#ModalDetallePasajeros">x</button>
<div class="modal fade" id="ModalDetallePasajeros" tabindex="-1" role="dialog" aria-labelledby="ModalDetallePasajerosLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <fieldset><legend id="titulo_modal">Pasajeros VIVA</legend>
          <table class="table table-striped" id="tbl_DetallePasajeros">
            <thead>          
              <th>Pasajero</th>
              <th>Teléfono</th>
              <th>Punto Recogida</th>
            </thead><tbody></tbody>
          </table>
        </fieldset>

      <fieldset><legend id="titulo_modal">Pasajero Invitados</legend>
        <table class="table table-striped" id="tbl_DetalleInvitados">
          <thead>          
            <th>Pasajero</th>
            <th>Teléfono</th>
            <th>Punto Recogida</th>
          </thead><tbody></tbody>
        </table>
      </fieldset>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>






<button type="button" class="btn btn-primary" id="Btn_ModalFinalizarServicio" style="display:none;" data-toggle="modal" data-target="#ModalAsignarVehiculos">x</button>
<div class="modal fade" id="ModalAsignarVehiculos" tabindex="-1" role="dialog" aria-labelledby="ModalAsignarVehiculosLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalAsignarVehiculosLabel">Finalizar Servicio</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >
        <input type="hidden" id="IdPeticion">
        <div class="row">
          <div class="form-group row col-md-6" style="padding:0px;margin-left: 0px;">
            <label for="TranFinalizar_FechaFin"  class="col-md-5"><span style="color:red">*</span> Fecha Fin de Servicio</label>
            <div class="col-md-5">
              <input type="date" class="form-control" autocomplete="off" id="TranFinalizar_FechaFin" name="TranFinalizar_FechaFin" required>
            </div>
          </div>
          <div class="form-group row col-md-6" style="padding:0px;">
            <label for="TranFinalizar_HoraFin"  class="col-md-5"><span style="color:red">*</span> Hora Fin de Servicio</label>
            <div class="col-md-5">
              <input type="Time" class="form-control" autocomplete="off" id="TranFinalizar_HoraFin" name="TranFinalizar_HoraFin" required>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-md-12" style="padding:0px;">
            <label for="TranFinalizar_Observacion"  class="col-md-2">Observación</label>
            <div class="col-md-10">
              <textarea class="form-control" id="TranFinalizar_Observacion" name="TranFinalizar_Observacion"></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="FinalizarServicio()" >Finalizar Servicio</button>
        <button type="button" class="btn btn-secondary" id="Btn_CerrarFinalizarServicio" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="ModalSegundoModal" tabindex="-1" role="dialog" aria-labelledby="ModalSegundoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalSegundoModalLabel">Agregar Vehiculo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row" style="margin-left:15px;">
          <div class="form-group row col-md-6" style="padding:0px;">
            <label for="TranSolicitar_PlacasVehiculo"  class="col-md-5"><span style="color:red">*</span> Placa Vehiculo</label>
            <div class="col-md-6">
               <input type="text" class="form-control" autocomplete="off" id="TranSolicitar_PlacasVehiculo" name="TranSolicitar_PlacasVehiculo" required>
            </div>
          </div>
          <div class="form-group row col-md-6" style="padding:0px;">
            <label for="TranSolicitar_TipoVehiculo"  class="col-md-5"><span style="color:red">*</span> Tipo Vehiculo</label>
            <div class="col-md-6">
                <select class="form-control" name="TranSolicitar_TipoVehiculo" id="TranSolicitar_TipoVehiculo">
                  <option value="Ninguno">Seleccione</option>
                  <option value="Automovil">Automovil</option>
                  <option value="Camioneta 4x4">Camioneta 4x4</option>
                  <option value="Campero">Campero</option>
                </select>
            </div>
          </div>
        </div>
        <div class="row" style="margin-left:15px;">
          <div class="form-group row col-md-6" style="padding:0px;">
            <label for="TranSolicitar_ConductorVehiculo"  class="col-md-5"><span style="color:red">*</span> Conductor</label>
            <div class="col-md-6">
               <input type="text" class="form-control" autocomplete="off" id="TranSolicitar_ConductorVehiculo" name="TranSolicitar_ConductorVehiculo" required>
            </div>
          </div>
          <div class="form-group row col-md-6" style="padding:0px;">
            <label for="TranSolicitar_ConductorTelefono"  class="col-md-5"><span style="color:red">*</span> Telefono Contacto</label>
            <div class="col-md-6">
               <input type="text" class="form-control" autocomplete="off" id="TranSolicitar_ConductorTelefono" name="TranSolicitar_ConductorTelefono" required>
            </div>
          </div>
        </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="CerrarModalNuevoVehiculo" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="GuardarNuevoVehiculo()">Guardar</button>

      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(document).ready(function() {
  CargarFinalizar();
  $('[data-toggle="tooltip"]').tooltip();
});


</script>
<?php include('../footer.php'); ?>
