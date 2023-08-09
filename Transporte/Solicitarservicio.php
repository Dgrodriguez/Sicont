<?php include('../header.php'); ?>
<script src="Transporte.js"></script>
<link rel="stylesheet" type="text/css" href="Transporte.css"></link>
<?php require_once("../Seguridad/conex.php"); ?>
<div style="margin: 15px;">
<fieldset>
<legend class="titulo_modal">Datos Solicitante</legend>
  <div class="row">


    <div class="form-group row col-md-4" style="padding:0px;">
      <label for="TranSolicitar_CantDias"  class="col-md-5"><span style="color:red">*</span> Cantidad Dias</label>
      <div class="col-md-6">
        <input type="number" class="form-control form-control-plaintext" readonly autocomplete="off" id="TranSolicitar_CantDias" name="TranSolicitar_CantDias" required>
      </div>
    </div>


    <div class="form-group row col-md-4 offset-md-1" style="padding: 0;">
      <label for="TranSolicitar_CantPasajeros" class="col-md-5"><span style="color: red">*</span> Cantidad Pasajeros</label>
      <div class="col-md-6" style="display: flex; align-items: center;">
        <input type="text" class="form-control  form-control-plaintext" readonly  autocomplete="off" id="TranSolicitar_CantPasajeros" name="TranSolicitar_CantPasajeros" required>
        <button style="margin-left: 5px;" title="Agregar Servidor" data-toggle="tooltip" data-placement="top" onclick="$('#Btn_ModalCargaServidor').click()" class="btn_transparente"><i class="fa-solid fa-person-circle-plus"></i></button>

      </div>
    </div>





  </div>

</fieldset>

<fieldset>
<legend class="titulo_modal">Datos del servicio</legend>

  <div class="row" style="margin-bottom: 10px;">
    <div class="form-group row col-md-4" style="padding:0px;">
      <label for="TranSolicitar_MpioOrigen"  class="col-md-5"><span style="color:red">*</span> Municipio Origen<br>del Servicio</label>
      <div class="col-md-6">
        <select class="form-control" id="TranSolicitar_MpioOrigen" name="TranSolicitar_MpioOrigen">
          <option value="Ninguno">Seleccione</option>
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
      <label for="TranSolicitar_FechaSalida"  class="col-md-5"><span style="color:red">*</span> Fecha de Salida</label>
      <div class="col-md-6">
          <input type="date" class="form-control" autocomplete="off" onchange="calcularDiferenciaFechas()" id="TranSolicitar_FechaSalida" name="TranSolicitar_FechaSalida" required>
      </div>
    </div>

    <div class="form-group row col-md-3" style="padding:0px;">
      <label for="TranSolicitar_HoraSalida"  class="col-md-5"><span style="color:red">*</span> Hora de Salida</label>
      <div class="col-md-6">
          <input type="time" class="form-control" autocomplete="off" id="TranSolicitar_HoraSalida" name="TranSolicitar_HoraSalida" required>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="form-group row col-md-4" style="padding:0px;">
      <label for="TranSolicitar_MpioDestino"  class="col-md-5"><span style="color:red">*</span> Municipio Destino<br>del Servicio</label>
      <div class="col-md-6">
        <select class="form-control" name="TranSolicitar_MpioDestino" id="TranSolicitar_MpioDestino">
          <option value="Ninguno">Seleccione</option>
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


    <div class="form-group row col-md-4" style="padding:0px;">
      <label for="TranSolicitar_DestinoObserv"  class="col-md-5">Otros Destinos</label>
      <div class="col-md-6">
          <input type="text" class="form-control" autocomplete="off" id="TranSolicitar_DestinoObserv" name="TranSolicitar_DestinoObserv" required>
      </div>
    </div>

    <div class="form-group row col-md-4" style="padding:0px;">
      <label for="TranSolicitar_Fechallegada"  class="col-md-5"><span style="color:red">*</span> Fecha de Regreso</label>
      <div class="col-md-6">
          <input type="date" class="form-control" onchange="calcularDiferenciaFechas()" autocomplete="off" id="TranSolicitar_Fechallegada" name="TranSolicitar_Fechallegada" required>
      </div>
    </div>
  </div>


  <div class="row">
    <div class="form-group row col-md-4" style="padding:0px;">
      <label for="TranSolicitar_Proceso"  class="col-md-5"><span style="color:red">*</span> Proceso</label>
      <div class="col-md-6">
        <select class="form-control" name="TranSolicitar_Proceso" id="TranSolicitar_Proceso">
          <option value="Ninguno">Seleccione</option>
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

    <div class="form-group row col-md-4" style="padding:0px;">
      <label for="TranSolicitar_Contrato"  class="col-md-5"><span style="color:red">*</span> Convenio/ Contrato</label>
      <div class="col-md-6">
          <input type="text" class="form-control" autocomplete="off" id="TranSolicitar_Contrato" name="TranSolicitar_Contrato" required>
      </div>
    </div>

    <div class="form-group row col-md-4" style="padding:0px;">
      <label for="TranSolicitar_TipoVehiculo"  class="col-md-5"><span style="color:red">*</span> Tipo Vehiculo</label>
      <div class="col-md-6">
          <select class="form-control" name="TranSolicitar_TipoVehiculo" id="TranSolicitar_TipoVehiculo">
            <option value="Ninguno">Seleccione</option>
            <option value="Automovil">Automovil</option>
            <option value="Buseta">Buseta</option>
            <option value="Camioneta 4x4">Camioneta 4x4</option>
            <option value="Campero">Campero</option>
            <option value="Vans">Vans</option>
          </select>
      </div>
    </div>
  </div>

  <div class="row">
      
    <div class="form-group col-md-6" style="padding:0px;">
      <label for="TranSolicitar_HoraSalida"  class="col-md-4"><span style="color:red">*</span>Objeto de Viaje</label>
      <div class="col-md-8">
         <textarea class="form-control" id="TranSolicitar_ObjetoViaje" name="TranSolicitar_ObjetoViaje"></textarea>
      </div>
    </div>
    <div class="form-group col-md-6" style="padding:0px;">
      <label for="TranSolicitar_ObservGene"  class="col-md-4">Observaciones Generales</label>
      <div class="col-md-8">
         <textarea class="form-control" id="TranSolicitar_ObservGene" name="TranSolicitar_ObservGene"></textarea>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="offset-md-3 col-md-4 ">
        <button class="btn btn-success" onclick="GuardarSolicitudServicio()">Guardar Solicitud</button>
    </div>
  </div>


</fieldset>
</div>


<button type="button" class="btn btn-primary" id="Btn_ModalCargaServidor" style="display:none;" data-toggle="modal" data-target="#ModalCargaServidor">x</button>



<div class="modal fade" id="ModalCargaServidor" tabindex="-1" role="dialog" aria-labelledby="ModalCargaServidorLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalCargaServidorLabel">Agregar Pasajero</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
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

          <div class="col-md-2 row" style="padding:0px;">
            <div class="col-md-5">
              <button title="Agregar Punto de Recogida" data-toggle="tooltip" data-placement="top" onclick="$('#Btn_segundoModal').click()" class="btn_transparente"><i class="fa-solid fa-map-location-dot"></i></button>
              <button type="button" class="btn btn-success" id="Btn_segundoModal" style="display:none;" data-toggle="modal" data-target="#segundoModal"></button>
            </div>
            <div >
              <button type="button" onclick="AgregarPasajeroServicio()" class="btn btn-success">Agregar</button>
            </div>
          </div>
        </div>

        <div class="row">
          <div  class="form-group col-md-12" style="padding: 0;">
            <table id="TranSolicitar_ServidoresPasajeros" class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Nombre</th>
                  <th>Identificación</th>
                  <th>Telefono</th>
                  <th>Dirección de Recogida</th>
                  <th>Proceso</th>
                </tr>
              </thead><tbody></tbody>
            </table>
          </div>
        </div>




      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="segundoModal" tabindex="-1" role="dialog" aria-labelledby="segundoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="segundoModalLabel">Agregar Punto de Recogida</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <!-- Otros botones o acciones -->
      </div>
    </div>
  </div>
</div>





<script type="text/javascript">
$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip();
});


</script>
<?php include('../footer.php'); ?>
