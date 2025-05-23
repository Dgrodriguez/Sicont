<?php include('../header.php'); 
 require_once("../Seguridad/conex.php"); ?>
<link rel="stylesheet" type="text/css" href="Pedidos.css">
<script type="text/javascript" src="Pedidos.js"></script>

<br>
<div class="row">
  <div class="form-group row col-md-4">
      <label for="GenOrdenPedido_Dpto" class="col-md-6 titulo_modal"><span style="color:red">*</span> Departamento: </label>
      <div class="col-md-6">
         <select class="form-control" id="GenOrdenPedido_Dpto" onchange="CargarMunicipio()" name="GenOrdenPedido_Dpto">
         	<option value="Ninguno">Todos</option>                  
         	    <?php 
                $con=conectar();
                $sql = "SELECT id,nombre from cfg_departamentos order by nombre";
                $query = mysqli_query($con,$sql);
                mysqli_close($con);
                while($dato=mysqli_fetch_array($query)){
                  echo "<option value='".$dato['id']."'> ".$dato['nombre']."</option>";
                }
              ?>
         </select>
      </div>
  </div>
  <div class="form-group row col-md-4">
      <label for="GenOrdenPedido_Mpio" class="col-md-5 titulo_modal"><span style="color:red">*</span> Municipio: </label>
      <div class="col-md-6">
         <select class="form-control" id="GenOrdenPedido_Mpio" onchange="CargarContrato();" name="GenOrdenPedido_Mpio">
         	<option value="Ninguno">Todos</option>                  
         </select>
      </div>
  </div>
  <div class="form-group row col-md-4">
      <label for="GenOrdenPedido_contrato" class="col-md-7 titulo_modal"><span style="color:red">*</span> Contrato/Convenio: </label>
      <div class="col-md-5">
         <select class="form-control" id="GenOrdenPedido_contrato" onchange="" name="GenOrdenPedido_contrato">
         	<option value="Ninguno">Todos</option>                  
         </select>
      </div>
  </div>
</div>
<div class="row">
  
  <div class="form-group row col-md-3">
    <label for="GenOrdenPedido_Mpio" class="col-md-6 titulo_modal">Fecha de Inicio: </label>
    <div class="col-md-6">
       <input type="date" class="form-control" id="GenOrdenPedido_FechaIni" title="Fecha a partir de la cual se buscaran las Ordenes de Pedido"  data-toggle="tooltip">
    </div>
  </div>
  <div class="form-group row col-md-3">
    <label for="GenOrdenPedido_Mpio" class="col-md-5 titulo_modal">Fecha de Fin: </label>
    <div class="col-md-6">
       <input type="date" class="form-control" id="GenOrdenPedido_FechaIni" title="Fecha a partir de la cual se buscaran las Ordenes de Pedido"  data-toggle="tooltip">
    </div>
  </div>
  <div class="form-group row col-md-3">
      <label for="GenOrdenPedido_Estado" class="col-md-4 titulo_modal"> Estado: </label>
      <div class="col-md-5">
         <select class="form-control" id="GenOrdenPedido_Estado" onchange="" name="GenOrdenPedido_Estado">
          <option value="Ninguno">Todos</option>                  
              <?php 
                $con=conectar();
                $sql = "SELECT a.Id,a.Nombre FROM cfg_estado_orden_pedido a WHERE a.ACTIVO = 1 ORDER BY a.Nombre";
                $query = mysqli_query($con,$sql);
                mysqli_close($con);
                while($dato=mysqli_fetch_array($query)){
                  echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
                }
              ?>
         </select>
      </div>
  </div>

  <div class="form-group row col-md-3">
    <button class="btn btn-success" onclick="FiltrarOrdenesPedidoReportados()">Filtrar <i class="fa-solid fa-magnifying-glass fa-2xs"></i></button>
  </div>


</div>


<br>
<fieldset style="margin-top:30px;">
  <legend class="titulo_modal">Ordenes de pedido con materiales reportados</legend>
    <div class="row"> <div class="col-md-12">
    <table class="table table-striped" id="tbl_CotizacionesOrdenPedido" >
      <thead>
        <th>#</th>
        <th>Orden de Pedido</th>
        <th>Departamento</th>
        <th>Municipio</th>
        <th>Contrato/Convenio</th>
        <th>Observacion</th>
        <th>Monto</th>
        <th>Estado</th>
        <th>Gestionar</th>
        <th>Descargar</th>
        <th>Eliminar</th>
      </thead><tbody></tbody>
    </table>
    </div></div>
</fieldset>


<!-- Button trigger modal -->
<button type="button" style="display:none" data-toggle="modal" id="btn_modal_AddElement" data-target="#AgregarElemento">
  Launch demo modal
</button>
<!-- Modal -->
<div class="modal fade" id="AgregarElemento" tabindex="-1" role="dialog" aria-labelledby="AgregarElementoLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document" style="width:90%">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="AgregarElementoLabel">Gestionar Elemento Reportado</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <br>
          <table class="table table-striped" id="Tbl_Materiales_OPP">
            <thead>
              <tr>
                <th>#</th>
                <th>Proveedor</th>
                <th>Material</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Motivo</th>
              </tr>
            </thead>
          </table>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-secondary" id="btn_CerrarModal_OrdenPEdido" data-dismiss="modal">Cerrar</button>
        <button class="btn btn-success" id="Btn_AgregarItem" onclick="GuardarSolucionReportarElementosOPP()">Aplicar</button>
        
      </div>
    </div>
  </div>
</div>


<button data-toggle="modal" data-target="#CargarAdjuntos" style="display: none;" id="btn_Modal_CargarAdjuntos">x</button>
<!-- Modal -->
<div class="modal fade" id="CargarAdjuntos" tabindex="-1" role="dialog" aria-labelledby="CargarAdjuntosLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="CargarAdjuntosLabel">Cargar Adjuntos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-10">
            <div class="form-group row">
              <div class="col-md-10">
                  <label for="GenOrdenPedido_archivo" class="col-sm-4 col-form-label">Archivo</label>
                  <div class="col-sm-8">
                    <input type="file" class="form-control-file" id="GenOrdenPedido_archivo" name="GenOrdenPedido_archivo">
                  </div>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-sm-2">
                <button type="submit" onclick="CargarArchivoOrdenPedido()" class="btn btn-primary">Cargar</button>
              </div>
              <div class="col-sm-2">
                <button type="submit" class="btn btn-success" onclick="MostrarArchivosCargadosOrdenPedido()">Mostrar Cargados</button>
                <button type="submit" data-toggle="modal" data-target="#ModalArchivosAdjuntosOP" id="Btn_MostrarCargadosOP" style="display: none;"></button>
              </div>
            </div>
          </div>
        </div>

        <div style="display:none;" id="ProveedorListaPrecio_Errores"></div>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-secondary" id="btn_CerrarModal_OrdenPEdido" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>




<!-- Modal Adjuntos-->
<div class="modal fade" id="ModalArchivosAdjuntosOP" tabindex="-1" role="dialog" aria-labelledby="ModalArchivosAdjuntosOPLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalArchivosAdjuntosOPLabel">Archivos Adjuntos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12">
            <table id="GridArchivosAdjuntosOrdenPendido" name="GridArchivosAdjuntosOrdenPendido" class="table table-striped tabla-alternada-centrada">
              <thead>
                <tr>
                  <th><center>#</center></th>
                  <th><center>Nombre Archivo</center></th>
                  <th><center>Tamaño</center></th>
                  <th><center>Eliminar</center></th>
                </tr>
              </thead><tbody></tbody>
            </table> 
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="CerrarModal" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
<!-- Fin Modal Adjuntos-->





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
        <button type="button" class="btn btn-success" onclick="AplicarDireccionPedido()">Aplicar</button>
        <button type="button" style="display:none"  data-dismiss="modal" id="mdl_cerrar_direccion">cerrar</button>
        <!-- Otros botones o acciones -->
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip();

  $('#tbl_CotizacionesOrdenPedido').DataTable({
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

  $('#Tbl_Materiales_OPP').DataTable({
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


  $('#tbl_CotizacionesMaterialesAgregados').DataTable({
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