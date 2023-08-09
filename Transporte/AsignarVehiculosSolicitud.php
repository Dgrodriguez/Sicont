<?php include('../header.php'); ?>
<script src="Transporte.js"></script>
<link rel="stylesheet" type="text/css" href="Transporte.css"></link>
<?php require_once("../Seguridad/conex.php"); ?>
<div style="margin: 15px;">
<fieldset>
<legend class="titulo_modal">Solicitudes Pendientes</legend>
  <table class="table table-striped" id="Tbl_Servicios_Asignar" name="Tbl_Servicios_Asignar">
    <thead>
      <tr>
        <th>#</th>
        <th>Fecha Salida</th>
        <th>Hora Salida</th>
        <th>Municipio Salida</th>
        <th>Fecha Destino</th>
        <th>Municipio Destino</th>
        <th>Observaciones<br>de Destino</th>
        <th>Tipo Vehiculo</th>
        <th>Cant Pasajeros</th>
        <th>Cant Días</th>
        <th>Pasajeros</th>
        <th>Asignación</th>
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
        <h5 class="modal-title titulo_modal" id="ModalDetallePasajerosLabel">Agregar Pasajero</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <table class="table table-striped" id="tbl_DetallePasajeros">
          <thead>          
            <th>Pasajero</th>
            <th>Teléfono</th>
            <th>Punto Recogida</th>
          </thead><tbody></tbody>
        </table>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>






<button type="button" class="btn btn-primary" id="Btn_ModalAsignarVehiculos" style="display:none;" data-toggle="modal" data-target="#ModalAsignarVehiculos">x</button>
<div class="modal fade" id="ModalAsignarVehiculos" tabindex="-1" role="dialog" aria-labelledby="ModalAsignarVehiculosLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalAsignarVehiculosLabel">Asignar Vehiculo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >

        <input type="hidden" id="IdPeticion">
        <div class="row" style="margin-left:15px;">
          <div class="form-group col-md-6"  style="padding:0px;">
            <label for="AsignarVehiculo">Vehiculo a Asignar:</label>
              <select class="form-control" id="AsignarVehiculo" onchange="MostrarDetallesConsuctor()" name="AsignarVehiculo">
                <option value="Ninguno">Seleccione</option>
                <?php 
                  $con=conectar();
                  $sql = "SELECT Conductor,Placas,Id, Telefono , Tipo FROM Trans_Vehiculo WHERE ACTIVO = '1' ORDER BY Conductor";
                  $query = mysqli_query($con,$sql);
                  mysqli_close($con);
                  while($dato=mysqli_fetch_array($query)){
                    echo "<option NombreConductor='".$dato['Conductor']."' TelefonoConductor='".$dato['Telefono']."' TipoVehiculo='".$dato['Tipo']."' placaVehiculo='".$dato['Placas']."'  value='".$dato['Id']."'> ".$dato['Placas']." - ".$dato['Conductor']."</option>";
                  }
                ?>
              </select>
          </div>
          <div class="col-md-1" style="padding:0px;padding-top: 16px;">
            <button class="btn_transparente" data-toggle="modal" data-target="#ModalSegundoModal"><i class="fa-solid fa-circle-plus"></i></button>
          </div>
        </div>


        <div id="DetalleConductor" style="display:none;">
          <fieldset>
            <legend class="titulo_modal">Datos del Conductor</legend>

              <div class="row">
                <div class="col-md-6"><span class="titulo_modal">Nombre Y Apellido:  </span><span id="NombreConductor"></span></div>
                <div class="col-md-6"><span class="titulo_modal">Teléfono de Contacto:  </span><span id="TelefonoConductor"></span></div>
              </div>

              <div class="row">
                <div class="col-md-6"><span class="titulo_modal">Tipo Vehiculo:  </span><span id="TipoVehiculo"></span></div>
                <div class="col-md-6"><span class="titulo_modal">Placa:  </span><span id="placaVehiculo"></span></div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <button class="btn btn-success" onclick="AplicarVehiculo()">Aplicar Vehiculo</button>
                </div>
              </div>

          </fieldset>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="Btn_CerrarAsignarVehiculo" data-dismiss="modal">Cerrar</button>
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
  CargarPendientes();
  $('[data-toggle="tooltip"]').tooltip();
});


</script>
<?php include('../footer.php'); ?>
