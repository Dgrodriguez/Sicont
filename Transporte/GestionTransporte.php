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

      <div class="form-group col-md-3"  style="padding:0px;">
        <label for="AsignarVehiculo" class="col-md-4 titulo_modal">Vehiculo Asignado:</label>
         <div class="col-md-8">
          <select class="form-control" id="AsignarVehiculo" name="AsignarVehiculo">
            <option value="Ninguno">Todos</option>
            <?php 
              $con=conectar();
              $sql = "SELECT Conductor,Placas FROM Trans_Vehiculo WHERE ACTIVO = '1' ORDER BY Conductor";
              $query = mysqli_query($con,$sql);
              mysqli_close($con);
              while($dato=mysqli_fetch_array($query)){
                echo "<option value='".$dato['Placas']."'> ".$dato['Placas']." - ".$dato['Conductor']."</option>";
              }
            ?>
          </select>
        </div>
      </div>


<!-- 
	    <div class="form-group row col-md-3" style="padding:0px;">
	      <label for="TranGestionar_Contrato"  class="col-md-6 titulo_modal"> Contrato / Convenio</label>
	      <div class="col-md-5">
	        <select class="form-control" id="TranGestionar_Contrato" name="TranGestionar_Contrato">
	          <option value="Ninguno">Todos</option>
	        </select>
	      </div>
	    </div> -->



	    <div class="form-group row col-md-3" style="padding:0px;">
	      <label for="TranGestionar_TipoVehiculo" class="col-md-3 titulo_modal"> Tipo Vehiculo</label>
	      <div class="col-md-7">
	          <select class="form-control" name="TranGestionar_TipoVehiculo" id="TranGestionar_TipoVehiculo">
	            <option value="Ninguno">Todos</option>
              <?php 
                $con=conectar();
                $sql = "SELECT Id,Nombre from Trans_tipo_vehiculo order by Nombre";
                $query = mysqli_query($con,$sql);
                mysqli_close($con);
                while($dato=mysqli_fetch_array($query)){
                  echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
                }
              ?> 
	          </select>
	      </div>
	    </div>
	    <div class="form-group row col-md-2" id="Div_TranGestionar_Proceso" style="padding:0px;">
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
          <?php if(isset($_SESSION['Perfiles']) && ( in_array('Transporte Solicitante', $_SESSION['Perfiles']) )){ ?>
          <button class="btn btn-success" onclick="CargarServiciosEnlaces()">Filtrar</button>
        <?php }else{ ?>
	    		<button class="btn btn-success" onclick="CargarServicios()">Filtrar</button>
        <?php } ?>
        
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
          <option value="Terminado">Terminado</option>
          <option value="Cancelado">Cancelado</option>
        </select>
      </div>
    </div>
    <div class="form-group row col-md-3" style="padding:0px;">
        <label for="TranGestionar_TipoContrato" class="col-md-3 titulo_modal"> Tipo Contrato</label>
        <div class="col-md-7">
            <select class="form-control" name="TranGestionar_TipoContrato" id="TranGestionar_TipoContrato">
              <option value="Ninguno">Todos</option>
              <?php 
                $con=conectar();
                $sql = "SELECT a.ID , a.TipoContrato FROM trans_tipo_contrato a where a.anio_contrato = YEAR(now())";
                $query = mysqli_query($con,$sql);
                mysqli_close($con);
                while($dato=mysqli_fetch_array($query)){
                  echo "<option value='".$dato['ID']."'> ".$dato['TipoContrato']."</option>";
                }
              ?> 
            </select>
        </div>
      <button class="btn_transparente" title="Descargar reporte en excel" data-toggle="tooltip" data-placement="top" onclick="GenerarExcelReporteGestion()"><i class="fa-regular fa-file-excel"></i></button>
    </div>
  </div>
<br>
<?php if(isset($_SESSION['Perfiles']) && ( in_array('Transporte Solicitante', $_SESSION['Perfiles']) )){ ?>

<div id="Div_servicios_cargados_enlaces"> 
  <table class="table table-striped" id="tbl_servicios_cargados_enlaces">
    <thead>
      <tr>
        <th>#</th>
        <th>Fecha Salida</th>
        <th>Fecha Regreso</th>
        <th>Municipio Destino</th>
        <th>Pernocta</th>
        <th>Proceso / Área</th>
        <th>Estado</th>
        <th>Tipo Vehiculo</th>
        <th>Conductor</th>
        <th>Telefono Conductor</th>
        <th>Placa</th>
        <th>Pasajeros</th>
        <th>Anular Viaje</th>
      </tr>
    </thead>
  </table>
</div>

<?php }else{ ?>

<div id="Div_servicios_cargados"> 
  <table class="table table-striped" id="tbl_servicios_cargados">
    <thead>
      <tr>
        <th>#</th>
        <th>Fecha Salida</th>
        <th>Fecha Regreso</th>
        <th>Municipio Destino</th>
        <th>Pernocta</th>
        <th>Tipo Servicio</th>
        <th>Contrato/ Convenio</th>
        <th>Proceso / Área</th>
        <th>Estado</th>
        <th>Tipo Vehiculo</th>
        <th>Días</th>
        <th>Usuario Solicitante</th>
        <th>Personas</th>
        <th>Editar</th>
        <th>Anular Viaje</th>
      </tr>
    </thead>
  </table>
</div>


<?php } ?>

<input type="hidden" id="Id_Servicio">





<button type="button" class="btn btn-primary" id="Btn_ModalDetalleCancelacionServicio" style="display:none;" data-toggle="modal" data-target="#ModaletalleCancelacionServicio_Enlaces">x</button>
<div class="modal fade" id="ModaletalleCancelacionServicio_Enlaces" tabindex="-1" role="dialog" aria-labelledby="ModalDetalleCancelacionServicioLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalDetalleCancelacionServicioLabel">Confirmar Eliminación</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <div class="row">
          <div class="col-md-4" style="padding:0px;"> 
            <div class="form-group" >
              <label for="TranGestionar_MotivoCancelar" class="col-md-5 titulo_modal"><span style="color:red">*</span>  Motivo de Cancelación</label>
              <div class="col-md-7">
                  <select class="form-control" onchange="FiltrarObligatorio()" name="TranGestionar_MotivoCancelar" id="TranGestionar_MotivoCancelar">
                    <option value="Ninguno">Seleccione</option>
                    <?php 
                      $con=conectar();
                      $sql = "SELECT Id,Nombre from trans_tipo_cancelacion order by Nombre";
                      $query = mysqli_query($con,$sql);
                      mysqli_close($con);
                      while($dato=mysqli_fetch_array($query)){
                        echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
                      }
                    ?> 
                  </select>
              </div>
            </div>
          </div>
          <div class="col-md-8">
            <div class="form-group" style="padding:0px;">
              <label for="TranGestionar_ObservacionCancelar" class="col-md-3 titulo_modal"><span style="color:red;display: none;" id="ObligatorioTranGestionar_ObservacionCancelar">*</span>  Observación de Cancelación</label>
              <div class="col-md-9">
                  <textarea class="form-control" id="TranGestionar_ObservacionCancelar" name="TranGestionar_ObservacionCancelar"></textarea>
              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="ConfirmarEliminarServicioEnlace()">Confirmar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="Btn_CerrarModalEliminar">Cerrar</button>
      </div>
    </div>
  </div>
</div>




<button type="button" class="btn btn-primary" id="Btn_ModalDetallePasajeros_Enlaces" style="display:none;" data-toggle="modal" data-target="#ModalDetallePasajeros_Enlaces">x</button>
<div class="modal fade" id="ModalDetallePasajeros_Enlaces" tabindex="-1" role="dialog" aria-labelledby="ModalDetallePasajerosLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalDetallePasajeros_EnlacesLabel">Revisar Pasajero</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <fieldset><legend class="titulo_modal">Pasajeros VIVA</legend>
          <table class="table table-striped" id="tbl_DetallePasajeros_Enlaces">
            <thead>          
              <th>Pasajero</th>
              <th>Teléfono</th>
              <th>Punto Recogida</th>
            </thead><tbody></tbody>
          </table>
        </fieldset>

      <fieldset><legend class="titulo_modal">Pasajero Invitados</legend>
        <table class="table table-striped" id="tbl_DetalleInvitados_Enlaces">
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






<button type="button" class="btn btn-primary" id="Btn_ModalDetallePasajeros" style="display:none;" data-toggle="modal" data-target="#ModalDetallePasajeros">x</button>
<div class="modal fade" id="ModalDetallePasajeros" tabindex="-1" role="dialog" aria-labelledby="ModalDetallePasajerosLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalDetallePasajerosLabel">Editar Servicio</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<br>
        <fieldset><legend class="titulo_modal">Editar Destino del viaje</legend>

          <div class="row" style="padding-left:10px;">

            <div class="form-group col-md-4" id="Div_TranSolicitar_AsignarVehiculo" style="padding:0px;display: none;">
              <label for="TranSolicitar_AsignarVehiculo" class="col-md-4 titulo_modal">Vehiculo Asignado:</label>
               <div class="col-md-8">
                <select class="form-control" id="TranSolicitar_AsignarVehiculo" name="TranSolicitar_AsignarVehiculo">
                  <option value="Ninguno">Seleccione</option>
                  <?php 
                    $con=conectar();
                    $sql = "SELECT Conductor,Placas,a.Id, Telefono ,b.Id Tipo FROM Trans_Vehiculo a inner join trans_tipo_vehiculo b on a.Tipo = b.Id WHERE a.ACTIVO = '1' ORDER BY Conductor";
                    $query = mysqli_query($con,$sql);
                    mysqli_close($con);
                    while($dato=mysqli_fetch_array($query)){
                      echo "<option NombreConductor='".$dato['Conductor']."' TelefonoConductor='".$dato['Telefono']."' TipoVehiculo='".$dato['Tipo']."' placaVehiculo='".$dato['Placas']."'  value='".$dato['Placas']."'> ".$dato['Placas']." - ".$dato['Conductor']."</option>";
                    }
                  ?>
                </select>
              </div>
            </div>



            <div class="form-group col-md-4" id="Div_TranSolicitar_TipoVehiculo" style="padding:0px;display: none;">
              <label for="TranSolicitar_TipoVehiculo" class="col-md-4 titulo_modal">Tipo Vehiculo Solicitado:</label>
               <div class="col-md-8">
                <select class="form-control" id="TranSolicitar_TipoVehiculo" name="TranSolicitar_TipoVehiculo">
                  <option value="Ninguno">Seleccione</option>
                  <?php 
                    $con=conectar();
                    $sql = "SELECT a.Nombre,a.Id FROM trans_tipo_vehiculo a WHERE a.ACTIVO = '1' ORDER BY a.Nombre";
                    $query = mysqli_query($con,$sql);
                    mysqli_close($con);
                    while($dato=mysqli_fetch_array($query)){
                      echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
                    }
                  ?>
                </select>
              </div>
            </div>




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
            <div class="col-md-1"> <button class="btn btn-success" onclick="AplicarCambiosServicio()"> Aplicar Cambios </button></div>

          </div>

        </fieldset>
        <br>
        <fieldset><legend class="titulo_modal">Editar Pasajeros</legend>
          <table class="table table-striped" id="tbl_DetallePasajeros">
            <thead>          
              <th>Pasajero</th>
              <th>Teléfono</th>
              <th>Punto Recogida</th>
              <th>Eliminar Pasajero</th>
            </thead><tbody></tbody>
          </table>
          <br>
          <div class="row">
            <div class="col-md-4 "><button type="button" class="btn btn-success" data-toggle="modal" data-target="#segundoModal">Agregar Pasajeros</button></div>
          </div>
          
        </fieldset>
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


<input type="hidden" id="TranGestionar_UsuarioActivo" value="<?php echo $_SESSION['Usuario']; ?>">

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

  $('#tbl_servicios_cargados_enlaces').DataTable({
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


  $('#tbl_DetalleInvitados_Enlaces').DataTable({
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



    $('#tbl_DetallePasajeros_Enlaces').DataTable({
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


  <?php  if(isset($_SESSION['Perfiles']) && ( in_array('Transporte Solicitante', $_SESSION['Perfiles']) )){ ?>
    FiltrarOpcionesSolicitante();
  <?php  }  ?>

});


</script>
<?php include('../footer.php'); ?>