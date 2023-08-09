<?php include('../header.php'); ?>
<script src="Transporte.js"></script>
<link rel="stylesheet" type="text/css" href="Transporte.css"></link>
<?php require_once("../Seguridad/conex.php"); ?>
<div style="margin: 15px;">
<fieldset>
<legend class="titulo_modal">Autorizar Solicitudes</legend>
  <table class="table table-striped" id="Tbl_Servicios_Asignadas" name="Tbl_Servicios_Asignadas">
    <thead>
      <tr>
        <th>#</th>
        <th>Fecha Salida</th>
        <th>Hora Salida</th>
        <th>Municipio Salida</th>
        <th>Fecha Destino</th>
        <th>Municipio Destino</th>
        <th>Otros<br>Destino</th>
        <th>Tipo Vehiculo</th>
        <th>Cant Pasajeros</th>
        <th>Cant Días</th>
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








<button type="button" class="btn btn-primary" id="Btn_ModalAutorizarDetalle" style="display:none;" data-toggle="modal" data-target="#ModalAutorizarDetalle">x</button>
<div class="modal fade" id="ModalAutorizarDetalle" tabindex="-1" role="dialog" aria-labelledby="ModalAutorizarDetalleLabel" aria-hidden="true">
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

       	  <div class="form-group row col-md-4" style="padding:0px;">
            <label for="TranAutorizar_CostoVehiculo"  class="col-md-5"> Costo Contrato</label>
            <div class="col-md-7">
               <input type="text" class="form-control" readonly autocomplete="off" id="TranAutorizar_CostoVehiculo" name="TranAutorizar_CostoVehiculo" required>
            </div>
          </div>

       	  <div class="form-group row col-md-4" style="padding:0px;">
            <label for="TranAutorizar_ObserContrato"  class="col-md-6" style="margin-left: 15px;"> Observaciones Contrato</label>
            <div class="col-md-5">
               <textarea type="text" rows="5" class="form-control" readonly autocomplete="off" id="TranAutorizar_ObserContrato" name="TranAutorizar_ObserContrato"></textarea>
            </div>
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
        <!-- Otros botones o acciones -->
      </div>
    </div>
  </div>
</div>






<script>
	$(document).ready(function() {
	  CargarAsignados();
	  $('[data-toggle="tooltip"]').tooltip();
	});
</script>

<?php include('../footer.php'); ?>