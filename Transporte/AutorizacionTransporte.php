<?php include('../header.php'); ?>
<script src="Transporte.js"></script>
<link rel="stylesheet" type="text/css" href="Transporte.css"></link>
<?php require_once("../Seguridad/conex.php"); ?>
<div style="margin: 15px;">
<fieldset>
<legend class="titulo_modal">Autorizar Solicitudes <button class="btn btn_transparente titulo_modal" title="Descargar Excel" data-toggle="tooltip" data-placement="bottom" onclick="GenerarReporteXautorizar()"><i class="fa-regular fa-file-excel"></i></button></legend>
  <table class="table table-striped" id="Tbl_Servicios_Asignadas" name="Tbl_Servicios_Asignadas">
    <thead>
      <tr>
        <th>#</th>
        <th>Fecha Salida</th>
        <th>Fecha Regreso</th>
        <th>Hora Salida</th>
        <th>Municipio Salida</th>
        <th>Municipio Destino</th>
        <th>Otros<br>Destino</th>
        <th>Pernocta</th>
        <th>Tipo Vehiculo</th>
        <th>Cant Pasajeros</th>
        <th>Cant Invitados</th>
        <th>Cant Días</th>
        <th>Usuario Solicitante</th>
        <th>Pasajeros</th>
        <th>Autorizar</th>
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
            <th>Eliminar Pasajero</th>
          </thead><tbody></tbody>
        </table>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#segundoModal">Agregar Pasajero</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>




<button type="button" class="btn btn-primary" id="Btn_ModalAlertaUnificacion" style="display:none;" data-toggle="modal" data-target="#ModalAlertaUnificacion">x</button>
<div class="modal fade" id="ModalAlertaUnificacion" tabindex="-1" role="dialog" aria-labelledby="ModalAlertaUnificacionLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalAlertaUnificacionLabel">Alerta de Posibilidad de Servicios a Unificar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="margin-left:15px;">

        <fieldset style="Display:none;" id="fld_Servicios_Iguales"><legend class="titulo_modal">Servicios Iguales</legend>
          <table id="Tbl_Servicios_Iguales" class="table table-striped" >
            <thead>
              <tr>
                <th>Marcar</th>
                <th>Fecha Salida</th>
                <th>Fecha Regreso</th>
                <th>Municipio Salida</th>
                <th>Municipio de Regreso</th>
                <th>Tipo de Vehiculo</th>
                <th>Pernocta</th>
                <th>Cant Pasajeros</th>
                <th>Cant Invitados</th>
                <th>Usuario Solicitante</th>
              </tr>
            </thead>
          </table>   
        </fieldset>    
        <br>

        <fieldset style="Display:none;" id="fld_Servicios_Parciales"><legend class="titulo_modal">Servicios Parcialmente Iguales</legend>
          <table id="Tbl_Servicios_Parciales" class="table table-striped" >
            <thead>
              <tr>
                <th>Marcar</th>
                <th>Fecha Salida</th>
                <th>Fecha Regreso</th>
                <th>Municipio Salida</th>
                <th>Municipio de Regreso</th>
                <th>Tipo de Vehiculo</th>
                <th>Pernocta</th>
                <th>Cant Pasajeros</th>
                <th>Cant Invitados</th>
                <th>Usuario Solicitante</th>
              </tr>
            </thead>
          </table>   
        </fieldset>
      </div>
      <div class="modal-footer">
        <button class="btn btn-success" onclick="AplicarUnificacion()">Aplicar Unificaciones</button>
        <button type="button" id="Btn_CerrarAlertaModal" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>








<button type="button" class="btn btn-primary" id="Btn_ModalAutorizarDetalle" style="display:none;" data-toggle="modal" data-target="#ModalAutorizarDetalle">x</button>
<div class="modal " id="ModalAutorizarDetalle" tabindex="-1" role="dialog" aria-labelledby="ModalAutorizarDetalleLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalAutorizarDetalleLabel">Autorizar Servicio</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="margin-left:15px;">       
        <div class="row">
        	<input type="hidden" id="Id_Servicio">
       	  <div class="form-group row col-md-4" style="padding:0px;">
            <label for="TranAutorizar_TipoContrato"  class="col-md-5"><span style="color:red">*</span> Tipo de Contrato</label>
            <div class="col-md-6">
               <select class="form-control" id="TranAutorizar_TipoContrato" onchange="SeleccionarContrato()" name="TranAutorizar_TipoContrato">
                <option value="Ninguno">Seleccione</option>
                <?php 
                  $con=conectar();
                  $sql = "SELECT a.ID,a.TipoContrato,a.Costo,a.observacion FROM trans_tipo_contrato a WHERE a.anio_contrato =  ( SELECT MAX(anio_contrato) FROM trans_tipo_contrato ) ";
                  $query = mysqli_query($con,$sql);
                  mysqli_close($con);
                  while($dato=mysqli_fetch_array($query)){
                    echo "<option Costo='".$dato['Costo']."' observacion='".$dato['observacion']."' value='".$dato['ID']."'> ".$dato['TipoContrato']."</option>";
                  }
                ?>
              </select>
            </div>
          </div>
          <div class="col-md-8">
            <div class="col-md-2"> <span class="badge badge-pill badge-success" title="Cantidad de servicios que coinciden con la fecha de salida del servicio para el contrato de tipo Fijo" data-toggle="tooltip" data-placement="bottom" id="bd_Fijo"></span> </div>

            <div class="col-md-2"> <span class="badge badge-pill badge-success" title="Cantidad de servicios que coinciden con la fecha de salida del servicio para el contrato de tipo Adicional" data-toggle="tooltip" data-placement="bottom" id="bd_Adicional"></span> </div>

            <div class="col-md-2"> <span class="badge badge-pill badge-success" title="Cantidad de servicios que coinciden con la fecha de salida del servicio para el contrato de tipo Por Horas Dentro del AMVA" data-toggle="tooltip" data-placement="bottom" id="bd_xHorasDentro"></span> </div>

            <div class="col-md-2"> <span class="badge badge-pill badge-success" title="Cantidad de servicios que coinciden con la fecha de salida del servicio para el contrato de tipo Por Horas Fuera del AMVA" data-toggle="tooltip" data-placement="bottom" id="bd_xHorasFuera"></span> </div>

            <div class="col-md-2"> <span class="badge badge-pill badge-success" title="Cantidad de servicios que coinciden con la fecha de salida del servicio para el contrato de tipo Saliendo del Urabá" data-toggle="tooltip" data-placement="bottom" id="bd_SaliendoUraba"></span> </div>

          </div>
       </div>
       <div class="row">
       		<div class="col-md-6">
       			<button class="btn btn-success" onclick="AutorizarServicio()" >Autorizar</button>
       		</div>
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="btn_AplicarAutorizarVehiculo" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="segundoModal" tabindex="-1" role="dialog" aria-labelledby="segundoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="segundoModalLabel">Agregar Pasajero</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <br>

      <input type="hidden" id="id_servicio_Actual">
      <div class="row" style="margin-left: 0px!important;">
        <div class="form-group col-md-3 " style="padding:0px;">
          <label for="TranSolicitar_Servidor"  class="col-md-4" style="padding:0px;"><span style="color:red">*</span> Pasajero</label>
          <div class="col-md-8">
              <input type="text" class="form-control" autocomplete="off" id="TranSolicitar_Servidor" name="TranSolicitar_Servidor" required>
          </div>
        </div>

        <div class="form-group col-md-4 " style="padding:0px;">
          <label for="TranSolicitar_ServidorIdentificacion"  class="col-md-5" style="padding:0px;"><span style="color:red">*</span> Identificación</label>
          <div class="col-md-7">
              <input type="number" class="form-control" autocomplete="off" id="TranSolicitar_ServidorIdentificacion" name="TranSolicitar_ServidorIdentificacion" required>
          </div>
        </div>

        <div class="form-group col-md-3" style="padding:0px;">
          <label for="TranSolicitar_Tlf"  class="col-md-4" style="padding:0px;"><span style="color:red">*</span> Telefono</label>
          <div class="col-md-8">
              <input type="number" class="form-control" autocomplete="off" id="TranSolicitar_Tlf" name="TranSolicitar_Tlf" required>
          </div>
        </div>
      </div>

      <div class="modal-body">
        <div class="row">
          <div class="form-group col-md-2">
            <label for="tipo_via">Tipo de Vía:</label>
            <select class="form-control" id="tipo_via" onchange="ConcatenarDireccion(this)" name="tipo_via">
              <option value="Ninguno">Seleccione</option>
              <?php 
                $con=conectar();
                $sql = "SELECT Nombre,Abreviatura from cfg_tipo_via order by Nombre";
                $query = mysqli_query($con,$sql);
                mysqli_close($con);
                while($dato=mysqli_fetch_array($query)){
                  echo "<option value='".$dato['Abreviatura']."'> ".$dato['Nombre']."</option>";
                }
              ?>
            </select>
          </div>
          <div class="form-group col-md-2">
            <label for="tipo_via">Número:</label>
              <input type="number" name="Numero1" id="Numero1" onkeyup="ConcatenarDireccion(this)" class="form-control">
          </div>

          <div class="form-group col-md-2">
            <label for="Letra">Letra:</label>
            <select class="form-control" onchange="ConcatenarDireccion(this)" id="Letra" name="Letra">
              <option value="Ninguno">Seleccione</option>
              <option value=" ">N/A</option>
              <option value="A">A</option>
              <option value="B">B</option>
              <option value="C">C</option>
              <option value="D">D</option>
              <option value="E">E</option>
              <option value="F">F</option>
              <option value="G">G</option>
              <option value="H">H</option>
              <option value="I">I</option>
              <option value="J">J</option>
              <option value="K">K</option>
              <option value="L">L</option>
              <option value="M">M</option>
              <option value="N">N</option>
              <option value="O">O</option>
              <option value="P">P</option>
              <option value="Q">Q</option>
              <option value="R">R</option>
              <option value="S">S</option>
              <option value="T">T</option>
              <option value="U">U</option>
              <option value="V">V</option>
              <option value="W">W</option>
              <option value="X">X</option>
              <option value="Y">Y</option>
              <option value="Z">Z</option>
            </select>
          </div>

          <div class="form-group col-md-2">
            <label for="Bis_1">Bis:</label>
            <select class="form-control" onchange="ConcatenarDireccion(this)" id="Bis_1" name="Bis_1">
              <option value="Ninguno">Seleccione</option>
              <option value=" ">N/A</option>
              <?php 
              $con=conectar();
              $sql = "SELECT Nombre,Abreviatura from cfg_tipo_via order by Nombre";
              $query = mysqli_query($con,$sql);
              mysqli_close($con);
              while($dato=mysqli_fetch_array($query)){
                echo "<option value='".$dato['Abreviatura']."'> ".$dato['Nombre']."</option>";
              }
              ?>
            </select>
          </div>

          <div class="form-group col-md-2">
            <label for="Numero2">Número:</label>
              <input type="number" name="Numero2" id="Numero2" onkeyup="ConcatenarDireccion(this)" class="form-control">
          </div>

          <div class="form-group col-md-2">
            <label for="Letra2">Letra:</label>
            <select class="form-control" id="Letra2" onchange="ConcatenarDireccion(this)" name="Letra2">
              <option value="Ninguno">Seleccione</option>
              <option value=" ">N/A</option>
              <option value="A">A</option>
              <option value="B">B</option>
              <option value="C">C</option>
              <option value="D">D</option>
              <option value="E">E</option>
              <option value="F">F</option>
              <option value="G">G</option>
              <option value="H">H</option>
              <option value="I">I</option>
              <option value="J">J</option>
              <option value="K">K</option>
              <option value="L">L</option>
              <option value="M">M</option>
              <option value="N">N</option>
              <option value="O">O</option>
              <option value="P">P</option>
              <option value="Q">Q</option>
              <option value="R">R</option>
              <option value="S">S</option>
              <option value="T">T</option>
              <option value="U">U</option>
              <option value="V">V</option>
              <option value="W">W</option>
              <option value="X">X</option>
              <option value="Y">Y</option>
              <option value="Z">Z</option>
            </select>
          </div>

        </div>
        <div class="row">
          <div class="form-group col-md-2">
            <label for="Cardinalidad">Zona:</label>
            <select class="form-control" id="Cardinalidad" onchange="ConcatenarDireccion(this)" name="Cardinalidad">
              <option value="Ninguno">Seleccione</option>
              <?php 
              $con=conectar();
              $sql = "SELECT Nombre from cfg_tipo_zona";
              $query = mysqli_query($con,$sql);
              mysqli_close($con);
              while($dato=mysqli_fetch_array($query)){
                echo "<option value='".$dato['Nombre']."'> ".$dato['Nombre']."</option>";
              }
              ?>
            </select>
          </div>


          <div class="form-group col-md-2">
            <label for="vivienda">Tipo Vivienda:</label>
            <select class="form-control" id="vivienda" onchange="ConcatenarDireccion(this)" name="vivienda">
              <option value="Ninguno">Seleccione</option>
              <?php 
              $con=conectar();
              $sql = "SELECT Nombre,Abreviatura from cfg_tipo_vivienda";
              $query = mysqli_query($con,$sql);
              mysqli_close($con);
              while($dato=mysqli_fetch_array($query)){
                echo "<option value='".$dato['Abreviatura']."'> ".$dato['Nombre']."</option>";
              }
              ?>
            </select>
          </div>
          <div class="form-group col-md-2">
            <label for="Numero3">Número:</label>
              <input type="number" name="Numero3" id="Numero3" onkeyup="ConcatenarDireccion(this)" class="form-control">
          </div>
          <div class="form-group col-md-6">
            <label for="Otro">Otro:</label>
              <input type="text" autocomplete="off" onkeyup="ConcatenarDireccion(this)" placeholder="Barrio, Edificio, Etc" name="Otro" id="Otro" class="form-control">
          </div>
        </div>

        <div class="row">
          <div class="col-md-12 titulo_modal" id="DireccionResultante"></div>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" onclick="AdicionarPasajeroTransporte()" class="btn btn-success">Agregar</button>
        <button type="button" class="btn btn-secondary" id="CerrarModalAddPass" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>






<script>
	$(document).ready(function() {
	  CargarAsignados();
	  $('[data-toggle="tooltip"]').tooltip();
   
    $('#Tbl_Servicios_Iguales').DataTable({
      "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
      },"pageLength": 50,
      "lengthChange": false,
      "searching": false,
      "dom": '<"datatable-header"l>rtip',
      "drawCallback": function(settings) {
        $('div.dataTables_length').hide();
      }
    });

    $('#Tbl_Servicios_Parciales').DataTable({
      "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
      },
      "pageLength": 50,
      "lengthChange": false,
      "searching": false,
      "dom": '<"datatable-header"l>rtip',
      "drawCallback": function(settings) {
        $('div.dataTables_length').hide();
      }
    });

	});
</script>

<?php include('../footer.php'); ?>