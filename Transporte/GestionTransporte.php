<?php include('../header.php'); ?>
<script src="Transporte.js"></script>
<link rel="stylesheet" type="text/css" href="Transporte.css"></link>
<?php require_once("../Seguridad/conex.php"); ?>

<br>


	<div class="row" style="margin-bottom: 10px;margin-left: 0px!important;">
	    <div class="form-group row col-md-3" style="padding:0px;">
	      <label for="TranGestionar_MpioOrigen"  class="col-md-6 titulo_modal"> Municipio Destino<br>del Servicio</label>
	      <div class="col-md-5">
	        <select class="form-control" id="TranGestionar_MpioOrigen" onchange="FiltrarContratoBusqueda()" name="TranGestionar_MpioOrigen">
	          <option value="Ninguno">Todos</option>
	          <?php 
	          $con=conectar();
	          $sql = "SELECT a.nombre,a.id FROM cfg_municipios a WHERE a.departamento_id = 1 ORDER BY a.nombre";
	          $query = mysqli_query($con,$sql);
	          mysqli_close($con);
	          while($dato=mysqli_fetch_array($query)){
	            echo "<option value='".$dato['id']."'> ".$dato['nombre']."</option>";
	          }
	          ?>
	        </select>
	      </div>
	    </div>
	    <div class="form-group row col-md-3" style="padding:0px;">
	      <label for="TranGestionar_Contrato"  class="col-md-6 titulo_modal"> Contrato / Convenio</label>
	      <div class="col-md-5">
	        <select class="form-control" id="TranGestionar_Contrato" name="TranGestionar_Contrato">
	          <option value="Ninguno">Todos</option>
	        </select>
	      </div>
	    </div>
	    <div class="form-group row col-md-3" style="padding:0px;">
	      <label for="TranGestionar_TipoVehiculo" class="col-md-3 titulo_modal"> Tipo Vehiculo</label>
	      <div class="col-md-7">
	          <select class="form-control" name="TranGestionar_TipoVehiculo" id="TranGestionar_TipoVehiculo">
	            <option value="Ninguno">Todos</option>
	            <option value="Automovil">Automovil</option>
	            <option value="Buseta">Buseta</option>
	            <option value="Camioneta 4x4">Camioneta 4x4</option>
	            <option value="Campero">Campero</option>
	            <option value="Vans">Vans</option>
	          </select>
	      </div>
	    </div>
	    <div class="form-group row col-md-2" style="padding:0px;">
	      <label for="TranGestionar_Proceso"  class="col-md-5 titulo_modal">Proceso</label>
	      <div class="col-md-7">
	        <select class="form-control" name="TranGestionar_Proceso" id="TranGestionar_Proceso">
	          <option value="Ninguno">Todos</option>
	          <?php 
	          $con=conectar();
	          $sql = "SELECT ID,NOMBRE from cfg_areas_depto order by NOMBRE";
	          $query = mysqli_query($con,$sql);
	          mysqli_close($con);
	          while($dato=mysqli_fetch_array($query)){
	            echo "<option value='".$dato['ID']."'> ".$dato['NOMBRE']."</option>";
	          }
	          ?>
	        </select>
	      </div>
	    </div>
	    <div class="form-group col-md-1" style="padding:0px;">
	    	<div class="col-md-1"></div>
	    	<div class="col-md-11">
	    		<button class="btn btn-success" onclick="CargarServicios()">Filtrar</button>
	    	</div>
	    </div>
	</div>
  <br>
  <div class="row">
    <div class="col-md-3" style="padding:0px;">
      <label for="TranGestionar_Proceso"  class="col-md-5 titulo_modal">Fecha Inicio</label>
      <div class="col-md-7">
        <input type="date" Id="TranGestionar_FechaIni" name="TranGestionar_FechaIni" class="form-control">
      </div>
    </div>

    <div class="col-md-3" style="padding:0px;">
      <label for="TranGestionar_FechaFin"  class="col-md-5 titulo_modal">Fecha Fin</label>
      <div class="col-md-7">
        <input type="date" Id="TranGestionar_FechaFin" name="TranGestionar_FechaFin" class="form-control">
      </div>
    </div>
    <div class="col-md-3" style="padding:0px;">
      <label for="TranGestionar_Estado"  class="col-md-5 titulo_modal">Estado</label>
      <div class="col-md-7">
        <select class="form-control" name="TranGestionar_Estado" id="TranGestionar_Estado">
          <option value="Ninguno">Todos</option>
          <option value="Solicitado">Solicitado</option>
          <option value="Autorizado">Autorizado</option>
          <option value="Asignado">Asignado</option>
        </select>
      </div>
    </div>
    <div class="col-md-3" style="padding:0px;">
      <button class="btn_transparente" title="Descargar reporte en excel" data-toggle="tooltip" data-placement="top" onclick="GenerarExcelReporteGestion()"><i class="fa-regular fa-file-excel"></i></button>
    </div>
  </div>
<br>
<table class="table table-striped" id="tbl_servicios_cargados">
	<thead>
		<tr>
			<th>#</th>
			<th>Fecha Salida</th>
			<th>Fecha Regreso</th>
			<th>Municipio Destino</th>
			<th>Tipo Servicio</th>
			<th>Contrato/ Convenio</th>
			<th>Proceso / Área</th>
			<th>Estado</th>
			<th>Tipo Vehiculo</th>
			<th>Días</th>
			<th>Persona</th>
			<th>Acción</th>
		</tr>
	</thead>
</table>


<input type="hidden" id="Id_Servicio">

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
      	<br><br>
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
        <!-- Otros botones o acciones -->
      </div>
    </div>
  </div>
</div>




<script type="text/javascript">
$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip();
  $('#tbl_servicios_cargados').DataTable({
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

  $('[data-toggle="tooltip"]').tooltip();
});


</script>
<?php include('../footer.php'); ?>