<?php include('../header.php'); ?>
<script src="Beneficiarios.js"></script>
<link rel="stylesheet" type="text/css" href="Beneficiarios.css"></link>

<!-- inicio requeridos para el multiselect -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="../librerias/Multiselect/multiple-select.js"></script> 
<link rel="stylesheet" href="../librerias/Multiselect/multiple-select.css" />
<!-- fin requeridos para el multiselect -->
<?php require_once("../Seguridad/conex.php"); ?>
<br>	

<div class="row">
    <div class="form-group row col-md-4" >
        <label for="BenefRegBenf_CedulaBeneficiario" class="col-md-6 titulo_modal"><span style="color:red">*</span> Cédula del Postulado </label>
        <div class="col-md-6">
          <input type="number" class="form-control" onkeyup="BuscarCedulaPostulado();" autocomplete="off" id="BenefRegBenf_CedulaBeneficiario" name="BenefRegBenf_CedulaBeneficiario" required>
          <input type="hidden" id="BenefRegBenf_IdPostulado">
          <ul id="BenefRegBenf_Contrato_List"></ul>
        </div>
    </div>
    <div class="form-group row col-md-4" >
    	<button class="btn btn_transparente" onclick="AbrirCargaTemporal()" title="Cargar listado temporal para continuar editando" data-toggle="tooltip" data-placement="top"><i class="fa-solid fa-download"></i></button>
    </div>
</div>	    


<fieldset><legend class="titulo_modal">Datos del Desembolso</legend>

	<div class="row">
		<div class="form-group  col-md-4" >
	        <label for="BenefRegBenf_FechaDesem" class="col-md-5 titulo_modal"><span style="color:red">*</span> Fecha de Desembolso</label>
	        <div class="col-md-7">
	          <input type="date" class="form-control" autocomplete="off" id="BenefRegBenf_FechaDesem" name="BenefRegBenf_FechaDesem" required>
	        </div>
	    </div>
		<div class="form-group  col-md-4" >
	        <label for="BenefRegBenf_MontoTodos" class="col-md-5 titulo_modal"><span style="color:red">*</span> Monto para Todos</label>
	        <div class="col-md-7">
	          <input type="text" class="form-control" autocomplete="off" id="BenefRegBenf_MontoTodos" name="BenefRegBenf_MontoTodos" required>
	        </div>
	    </div>
			<div class="form-group  col-md-4" >
	        <button class="btn btn-primary" onclick="AplicarMontoTodos()">Aplicar Monto a Todos</button>
	    </div>

	</div>
	<div class="row">
		<div class="form-group  col-md-4" >
        <button class="btn btn-success" onclick="GuardarPostuladoDefinitivo()">Guardado Definitivo</button>
    </div>
    <div class="form-group  col-md-4" >
        <button class="btn btn-primary" id="Btn_GuardarParcial" onclick="GuardarPostuladoTemporal()">Guardado Parcial</button>
        <button class="btn btn-primary" style="display:none;" id="Btn_ActualizarParcial" onclick="ActualizarPostuladoTemporal()">Actualizar Parcial</button>
    </div>
    <div class="col-sm-4" id="Div_Btn_PolizasAmparosContr_ReporteExcel" >
	    <button class="btn btn_transparente titulo_modal" data-toggle="tooltip" data-placement="top" title="Descargar Reporte" onclick="DescargarListadoPrevioBeneficiarios()"><i class="fa-regular fa-file-excel"></i></button>
	  </div>
	</div>

</fieldset>


<br>
<div class="row" id="div_tbl_Postulados_Beneficiarios" style="display:none;">
	
	<div class="col-md-10">
		<table class="table table-striped" id="tbl_Postulados_Beneficiarios">
			<thead>
				<tr>
					<th style="width: 10%;">#</th>
					<th style="width: 20%;">Identificación</th>
					<th style="width: 30%;">Nombre Completo</th>
					<th style="width: 30%;">Convenio</th>
					<th style="width: 30%;">Proyecto</th>
					<th style="width: 20%;">Monto</th>
					<th style="width: 20%;">Eliminar</th>
				</tr>
			</thead>
		</table>
	</div>

</div>

<!-- Inicio sección de modales -->


<!--Modal de Carga de lista temporal -->
<button type="button" class="btn btn-success" id="Btn_BenefRegBenef_Modal_ListaTemporal" style="display:none;" data-toggle="modal" data-target="#BenefRegBenef_Modal_ListaTemporal"></button>
<div class="modal fade" id="BenefRegBenef_Modal_ListaTemporal" tabindex="-1" role="dialog" aria-labelledby="BenefRegPost_mdl_Grp_FamiliarLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document" style="width: 90%;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="BenefRegBenef_Modal_ListaTemporalLabel">Cargue de Listas Temporales</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="margin-left: 12px;">
     
      	<div class="row">
      		<div class="form-group row col-md-6" >
		        <label for="BenefRegBenf_ReferenciaLista" class="col-md-6"><span style="color:red">*</span> Nombre/Referencia de lista </label>
		        <div class="col-md-6">
		          <input type="text" class="form-control" onkeyup="BuscarListadoTemporal()" autocomplete="off" id="BenefRegBenf_ReferenciaLista" name="BenefRegBenf_ReferenciaLista" required>
		          <input type="hidden" id="BenefRegBenf_IdReferencia">
		          <ul id="BenefRegBenf_Referencias_List"></ul>
		        </div>
		    </div>
      	</div>


      	<div class="row">
      		<input type="hidden" Id="IdListado">
      		<div class="form-group col-md-3" >
		        <label for="BenefRegBenf_FechaListado" style="padding:0px;" class="col-md-4">Fecha de Listado </label>
		        <div class="col-md-8">
		          <input type="text" style="padding: 0px;" readonly class="form-control" autocomplete="off" id="BenefRegBenf_FechaListado" name="BenefRegBenf_FechaListado" required>
		        </div>
		    </div>
      		<div class="form-group col-md-3" >
		        <label for="BenefRegBenf_CreadoPor" class="col-md-4" style="padding:0px;">Creado por </label>
		        <div class="col-md-8">
		          <input type="text" style="padding: 0px;" readonly class="form-control" autocomplete="off" id="BenefRegBenf_CreadoPor" name="BenefRegBenf_CreadoPor" required>
		        </div>
		    </div>
      		<div class="form-group col-md-4" >
		        <label for="BenefRegBenf_NombreListado" style="padding:0px;" class="col-md-4">Nombre Listado </label>
		        <div class="col-md-8">
		          <input type="text" style="padding: 0px;" readonly class="form-control" autocomplete="off" id="BenefRegBenf_NombreListado" name="BenefRegBenf_NombreListado" required>
		        </div>
		    </div>
      		<div class="form-group col-md-2" >
		        <label for="BenefRegBenf_Cantidad" style="padding:0px;" class="col-md-6">Cantidad de Beneficiarios</label>
		        <div class="col-md-6">
		          <input type="text" style="padding: 0px;" readonly class="form-control" autocomplete="off" id="BenefRegBenf_Cantidad" name="BenefRegBenf_Cantidad" required>
		        </div>
		    </div>		    
      	</div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="BenefRegBenf_CerrarModalTemp" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="ConfirmarSeleccion()">Confirmar Carga</button>
      </div>
    </div>
  </div>
</div>



<!-- Fin de Sección de Modales -->


<script type="text/javascript">
$(document).ready(function() {
	maquillarNumero( document.getElementById('BenefRegBenf_MontoTodos'));
	$('#tbl_Postulados_Beneficiarios').DataTable({
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
