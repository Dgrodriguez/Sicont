<?php include('../header.php'); 
 require_once("../Seguridad/conex.php"); ?>
<link rel="stylesheet" type="text/css" href="Pedidos.css">
<script type="text/javascript" src="Pedidos.js"></script>

<br>
<div class="row">
  <div class="form-group row col-md-3">
      <label for="GenOrdenPedido_Dpto" class="col-md-7 titulo_modal"><span style="color:red">*</span> Departamento: </label>
      <div class="col-md-5">
         <select class="form-control" id="GenOrdenPedido_Dpto" onchange="CargarMunicipio()" name="GenOrdenPedido_Dpto">
         	<option value="Ninguno">Seleccione</option>                  
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
  <div class="form-group row col-md-3">
      <label for="GenOrdenPedido_Mpio" class="col-md-6 titulo_modal"><span style="color:red">*</span> Municipio: </label>
      <div class="col-md-6">
         <select class="form-control" id="GenOrdenPedido_Mpio" onchange="CargarContrato();" name="GenOrdenPedido_Mpio">
         	<option value="Ninguno">Seleccione</option>                  
         </select>
      </div>
  </div>
  <div class="form-group row col-md-3">
      <label for="GenOrdenPedido_contrato" class="col-md-8 titulo_modal"><span style="color:red">*</span> Contrato/Convenio: </label>
      <div class="col-md-4" style="padding:0px;">
         <select class="form-control" id="GenOrdenPedido_contrato" onchange="CargarSaldoContratos()" name="GenOrdenPedido_contrato">
         	<option value="Ninguno">Seleccione</option>                  
         </select>
      </div>
  </div>
  <div class="form-group row col-md-3">
    <label for="OPP_Num_Cotizacion" class="col-md-5 titulo_modal"><span style="color:red">*</span> Orden de Pedido: </label>
    <div class="col-md-6">
      <input type="text" onkeyup="BuscarOrdenPedido()" autocomplete="off" name="OPP_Num_Cotizacion" Id="OPP_Num_Cotizacion" class="form-control">
        <ul class="list-group list-group-flush ul-overlay" style="display:none;" id="OPP_Num_Cotizacion_ListaCotizacion"></ul>
    </div>
    <div class="btn_div_Add"> 
      <button onclick="AgregarOrdenPedido()" title="Adicionar Orden de Pedido" data-toggle="tooltip" data-placement="bottom" class="btn_transparente"><i class="fa-regular fa-square-plus fa-2xs"></i></button>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-2"><label class="titulo_modal" for="OPP_Observaciones">Observaciones:</label></div>
  <div class="col-md-6"><textarea class="form-control" name="OPP_Observaciones" id="OPP_Observaciones"></textarea></div>
  <div class="col-md-4" id="div_saldos_contrato" style="display:none;">
    <fieldset class="total">
      <legend>Total 1</legend>
      <div class="description"><i class="fa-regular fa-circle-question" style="color: #009540;" data-placement="bottom" data-toggle="tooltip" title="Saldo que ha sido comprometido en ordenes de pedido pero que aun NO ha sido vinculado a una factura pagada"></i> Saldo Comprometido:</div>
      <div class="amount Comprometido">Monto: $3.560.000</div>
    </fieldset>
    <fieldset class="total">
      <legend>Total 1</legend>
      <div class="description"><i class="fa-regular fa-circle-question" style="color: #009540;" data-toggle="tooltip" title="Saldo que ha sido vinculado a una factura ya pagada (dinero gastado)"></i> Saldo Facturado:</div>
      <div class="amount facturado">Monto: $560.000</div>
    </fieldset>
    <fieldset class="total">
      <legend>Total 1</legend>
      <div class="description"><i class="fa-regular fa-circle-question" style="color: #009540;" data-toggle="tooltip" title="Saldo disponible calculado a partir del contrato inicial y las adiciones, luego de restar lo gastado"></i> Saldo Disponible:</div>
      <div class="amount Disponible">Monto: $28.310.000</div>
    </fieldset>
    <fieldset class="total">
      <legend>Total 1</legend>
      <div class="description"><i class="fa-regular fa-circle-question" style="color: #009540;" data-toggle="tooltip" title="saldo estimado de la orden actual"></i> Saldo Factura Actual:</div>
      <div class="amount FacturaActual">$0</div>
    </fieldset>
    <fieldset class="total">
      <legend>Total 1</legend>
      <div class="description"><i class="fa-regular fa-circle-question" style="color: #009540;" data-toggle="tooltip" title="saldo estimado de las ordenes de credito"></i> Saldo Notas de Credito:</div>
      <div class="amount NotasCredito">$0</div>
    </fieldset>
  </div>
</div>
<br>
<div class="row">
  <div class="col-md-2"></div>
  <div class="col-md-1 btn_div_Generar" style="display:none;"> <button class="btn_transparente" title="Generar PDF de Resumen" data-toggle="tooltip" ><i class="fa-regular fa-file-pdf"></i></button><button class="btn_transparente" onclick="GenerarExcelOrdenPedidoResumen()" title="Generar Excel de Resumen" data-toggle="tooltip" ><i class="fa-regular fa-file-excel"></i></button> </div>
  <div class="col-md-3 btn_div_Add"> <button id="Btn_Guardar_OrdenPedido" class="btn btn-success" onclick="GuardarFactura()">Guardar Factura</button> </div>
  <div class="col-md-3 btn_div_Add"> <button id="Btn_Guardar_OrdenPedido" class="btn btn-success" onclick="AdicionarNotaCredito()">Adicionar Nota Credito</button> </div>
</div>


<br>
<fieldset style="margin-top:30px;">
  <legend class="titulo_modal">Ordenes de Pedido por el Contrato/Convenio</legend>
    <div class="row"> <div class="col-md-12">
    <table class="table table-striped" id="tbl_CotizacionesOrdenPedido" >
      <thead>
        <th>#</th>
        <th>Ordenes de Pedido</th>
        <th>Contrato/Convenio</th>
        <th>Fecha Creación Orden</th>
        <th>Monto Orden</th>
        <th>Detalle Orden</th>
        <th>Eliminar</th>
      </thead><tbody></tbody>
    </table>
    </div></div>
</fieldset>


<!-- Button trigger modal -->
<button type="button" style="display:none" data-toggle="modal" id="btn_modal_AddNotaCredito" data-target="#AgregarNotaCredito">
  Launch demo modal
</button>
<!-- Modal -->
<div class="modal fade" id="AgregarNotaCredito" tabindex="-1" role="dialog" aria-labelledby="AgregarNotaCreditoLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="width:90%">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="AgregarNotaCreditoLabel">Agregar Nota de Crédito</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

          <div class="row">
            <div class="col-md-3">
              <label for="GenOrdenPedidoNC_Material" class="col-md-6 titulo_modal"><span style="color:red">*</span> Material: </label>
              <div class="col-md-6">
                 <select class="form-control" onchange="CargarPrecioMaterialNC()" id="GenOrdenPedidoNC_Material" name="GenOrdenPedidoNC_Material">
                  <option value="Ninguno">Seleccione</option>                  
                 </select>
              </div>
            </div>
            <div class="col-md-3">
              <label for="GenOrdenPedidoNC_Cantidad" class="col-md-6 titulo_modal"><span style="color:red">*</span> Cantidad: </label>
              <div class="col-md-6">
                <input type="text" autocomplete="off" name="GenOrdenPedidoNC_Cantidad" Id="GenOrdenPedidoNC_Cantidad" class="form-control">
              </div>
            </div>
            <div class="col-md-3">
              <label for="GenOrdenPedidoNC_Precio" class="col-md-6 titulo_modal"><span style="color:red">*</span> Precio: </label>
              <div class="col-md-6">
                <input type="text" autocomplete="off" name="GenOrdenPedidoNC_Precio" Id="GenOrdenPedidoNC_Precio" class="form-control">
              </div>
            </div>
            <div class="col-md-3">
              <label for="GenOrdenPedidoNC_NroOrdenCredito" class="col-md-6 titulo_modal"><span style="color:red">*</span> Nro Nota de Credito: </label>
              <div class="col-md-6">
                <input type="text"  name="GenOrdenPedidoNC_NroOrdenCredito" Id="GenOrdenPedidoNC_NroOrdenCredito" class="form-control">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-3">
              <button class="btn btn-success" onclick="AdicionarElementoNotaCredito()">Adicionar</button>
            </div>
          </div>
          <br>
          <div class="row">
            <div class="col-md-12">
              <table id="Tbl_NotaCreditoFactura" class="table table-striped" >
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Nro de Orden de Credito</th>
                    <th>Material</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-secondary" id="btn_CerrarModal_OrdenPEdido" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


<!-- Button trigger modal -->
<button type="button" style="display:none" data-toggle="modal" id="btn_modal_AddElement" data-target="#AgregarElemento">
  Launch demo modal
</button>
<!-- Modal -->
<div class="modal fade" id="AgregarElemento" tabindex="-1" role="dialog" aria-labelledby="AgregarElementoLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="width:90%">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="AgregarElementoLabel">Detalle Orden de Pedido <span id="NumOppTitulo"></span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <table id="tbl_DetalleOrdenPedido" class="table table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th>Proveedor</th>
            <th>Material</th>
            <th>Cantidad Inicial</th>
            <th>Precio</th>
            <th>SubTotal</th>
            <th>Cantidad Reportada</th>
            <th>Motivo Reportado</th>
            <th>Saldo Reportado</th>
            <th>Saldo Final</th>
          </tr>
        </thead>
      </table>

      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-secondary" id="btn_CerrarModal_OrdenPEdido" data-dismiss="modal">Cerrar</button>
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

  $('#tbl_DetalleOrdenPedido').DataTable({
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

  $('#Tbl_NotaCreditoFactura').DataTable({
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