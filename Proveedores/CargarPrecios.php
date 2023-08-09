<?php include('../header.php'); ?>

<link rel="stylesheet" type="text/css" href="Proveedores.css">
<script type="text/javascript" src="Proveedores.js"></script>

<br>

<fieldset>
	<legend class="titulo_modal">Agregar Precio</legend>
	    <div class="row">
		    <div class="form-group row col-md-4">
		        <label for="ProveedorListaPrecio_Proveedor" class="col-md-6"><span style="color:red">*</span> Proveedor </label>
		        <div class="col-md-6">
		            <input type="text" class="form-control" onkeyup="BuscarProveedore()" autocomplete="off" id="ProveedorListaPrecio_Proveedor" name="ProveedorListaPrecio_Proveedor" required>
		            <ul class="list-group list-group-flush ul-overlay" style="display:none;" id="ProveedorListaPrecio_ListaProveedores"></ul>
		        </div>
		    </div>
		    <div class="form-group row col-md-4">
		        <label for="CrearContrato_dpto" class="col-md-3"><span style="color:red">*</span>Departamento</label>
		        <div class="col-md-6">
		             <SELECT type="text" class="form-control" onChange="CargarMunicipio()" id="CrearContrato_dpto" name="CrearContrato_dpto">
		            	<option value="Ninguno">Seleccione</option>
		          	</SELECT>
		        </div>
		    </div> 
		    <div class="form-group row col-md-4">
		        <label for="CrearContrato_mpio" class="col-md-3"><span style="color:red">*</span>Municipio</label>
		        <div class="col-md-6">
		            <SELECT type="text" class="form-control" id="CrearContrato_mpio" name="CrearContrato_mpio">
			            <option value="Ninguno">Seleccione</option>
			          </SELECT>
		        </div>
		    </div> 

	    </div>
	    <div class="row">
	    	<div class="form-group row col-md-3">
		        <label for="ProveedorListaPrecio_Elemento" class="col-md-6"><span style="color:red">*</span> Elemento a Agregar </label>
		        <div class="col-md-6">
		            <input type="text" class="form-control" onkeyup="convertirAMayusculas.call(this)" autocomplete="off" id="ProveedorListaPrecio_Elemento" name="ProveedorListaPrecio_Elemento" required>
		        </div>
		    </div>
		    <div class="form-group row col-md-3">
		        <label for="ProveedorListaPrecio_Und" class="col-md-5"><span style="color:red">*</span> Unidad </label>
		        <div class="col-md-6">
		            <input type="text" class="form-control" autocomplete="off" id="ProveedorListaPrecio_Und" name="ProveedorListaPrecio_Und" required>
		        </div>
		    </div>
		    <div class="form-group row col-md-3">
		        <label for="ProveedorListaPrecio_Precio" class="col-md-5"><span style="color:red">*</span> Precio </label>
		        <div class="col-md-6">
		            <input type="text" class="form-control" autocomplete="off" id="ProveedorListaPrecio_Precio" name="ProveedorListaPrecio_Precio" required>
		        </div>
		    </div>

		    <div class="form-group row col-md-3">
		        <label for="ProveedorListaPrecio_fechaAct" class="col-md-5"><span style="color:red">*</span>Fecha de Actualización</label>
		        <div class="col-md-7">
		          <input type="date" class="form-control" title="Fecha a partir de la cual estará disponible el nuevo precio" autocomplete="off" id="ProveedorListaPrecio_fechaAct" data-toggle="tooltip" name="ProveedorListaPrecio_fechaAct" required>
		        </div>
		    </div> 
	    </div>

	    <div class="row">
	    	<div class="col-md-3">  </div>
	    	<div class="col-md-2"><button class="btn btn-success" onclick="GuardarPrecioElemento()">Guardar</button></div>
	    	<div class="col-md-2"> <button class="btn btn-success" data-toggle="modal" data-target="#ModalCargaMasiva" id="But_Modal_ArchCarg" >Carga Masiva</button> </div>
	   </div>
</fieldset>



<fieldset style="margin-top: 100px;display:none" id="ListadoPrecio">
	<legend class="titulo_modal">Precios Cargados</legend>	
	<table class="table table-striped" id="Tbl_Proveedor_ListadoPrecios">
		<thead>
			<th>#</th>
			<th>Elemento</th>
			<th>Und</th>
			<th>Fecha de Actualización</th>
			<th>Precio</th>
			<th>Municipio</th>
		</thead>
	</table>
</fieldset>






<!-- <button style="display:none;" data-toggle="modal" data-target="#ModalCargaMasiva" id="But_Modal_ArchCarg">x</button> -->

<!-- Inicio Modal Archivos Cargados-->
<div class="modal fade" id="ModalCargaMasiva" tabindex="-1" role="dialog" aria-labelledby="ModalCargaMasivaLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalCargaMasivaLabel">Carga Masiva</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">

			    <div class="form-group row col-md-6">
			        <label for="ProveedorListaPrecio_ProveedorCM" class="col-md-6"><span style="color:red">*</span> Proveedor </label>
			        <div class="col-md-6">
			            <input type="text" class="form-control" onkeyup="BuscarProveedoreCM()" autocomplete="off" id="ProveedorListaPrecio_ProveedorCM" name="ProveedorListaPrecio_ProveedorCM" required>
			            <ul class="list-group list-group-flush ul-overlay" style="display:none;" id="ProveedorListaPrecio_ListaProveedoresCM"></ul>
			        </div>
			    </div>

			    <div class="form-group row col-md-6">
		        <label for="ProveedorListaPrecio_fechaActCM" class="col-md-5"><span style="color:red">*</span>Fecha de Actualización</label>
		        <div class="col-md-7">
		          <input type="date" class="form-control" title="Fecha a partir de la cual estará disponible el nuevo precio" autocomplete="off" id="ProveedorListaPrecio_fechaActCM" data-toggle="tooltip" name="ProveedorListaPrecio_fechaActCM" required>
		        </div>
		    	</div> 


      	</div>

      	<div class="row">
      		<div class="col-md-10">
			    <fieldset class="border p-2" style="width: 100%; margin-top: 20px;">
			      <legend class="w-auto titulo_modal">Cargar documentos</legend>
			      <div class="form-group row">
		      		<div class="col-md-2">
		      			<button class="btn_transparente" onclick="GenerarPlantilla()" data-toggle="tooltip" title="Generar Plantilla para carga masiva"><i class="fas fa-file-excel"></i></button>
		      		</div>
			      </div>
			      <div class="form-group row">
			        <div class="col-md-10">
			            <label for="archivo" class="col-sm-4 col-form-label">Archivo</label>
			            <div class="col-sm-8">
			              <input type="file" class="form-control-file" id="CrearContrato_archivo" name="CrearContrato_archivo">
			            </div>
			        </div>

			      </div>
			      <div class="form-group row">
			        <div class="col-sm-2">
			          <button type="submit" onclick="CargarArchivoCM()" id="btn_Cargar_excel" class="btn btn-primary">Cargar</button>
			        </div>
			      </div>
			    </fieldset>
			    </div>
			  </div>


			  <div style="display:none;" id="ProveedorListaPrecio_Errores"></div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" id="CerrarModal" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-success" onclick="SubirCargaMasiva()">Guardar</button>
      </div>
    </div>
  </div>
</div>
<!-- Fin Modal Archivos Cargados-->




<script type="text/javascript">
    $(document).ready(function(){     
         CargarDeptos("CrearContrato_dpto");
        $('#Tbl_Proveedor_Listado').DataTable({
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
       maquillarNumero(document.getElementById("ProveedorListaPrecio_Precio"));
  		$('[data-toggle="tooltip"]').tooltip();
        

			$('#Tbl_Proveedor_ListadoPrecios').DataTable({
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