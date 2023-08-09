<?php include('../header.php'); ?>

<link rel="stylesheet" type="text/css" href="Proveedores.css">
<script type="text/javascript" src="Proveedores.js"></script>

<br>

<fieldset>
	<legend class="titulo_modal">Datos Proveedor</legend>
	    <div class="row">
		    <div class="form-group row col-md-4">
		        <label for="Proveedor_Nombre" class="col-md-6"><span style="color:red">*</span> Proveedor </label>
		        <div class="col-md-6">
		            <input type="text" class="form-control" autocomplete="off" id="Proveedor_Nombre" name="Proveedor_Nombre" required>
		        </div>
		    </div>
		    <div class="form-group row col-md-4">
		        <label for="Proveedor_NumeroNit" class="col-md-6"><span style="color:red">*</span> Nit </label>
		        <div class="col-md-6">
		            <input type="text" class="form-control" autocomplete="off" id="Proveedor_NumeroNit" name="Proveedor_NumeroNit" required>
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
	    </div>
	    <div class="row">
		    <div class="form-group row col-md-4">
		        <label for="Proveedor_Nombre" class="col-md-6"><span style="color:red">*</span> Dirección </label>
		        <div class="col-md-6">
		            <input type="text" class="form-control" autocomplete="off" id="Proveedor_Direccion" name="Proveedor_Nombre" required>
		        </div>
		    </div>
		    <div class="form-group row col-md-4">
		        <label for="Proveedor_NumeroNit" class="col-md-6"><span style="color:red">*</span> Telefono </label>
		        <div class="col-md-6">
		            <input type="text" class="form-control" autocomplete="off" id="Proveedor_NumeroTelf" name="Proveedor_NumeroNit" required>
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
	    <div class="row"><div class="col-md-6  offset-md-3"><button class="btn btn-success" onclick="GuardarProveedor()">Guardar</button></div></div>
</fieldset>


<fieldset style="margin-top: 100px;">
	<legend class="titulo_modal">Proveedores Cargados</legend>	

	<table class="table table-striped" id="Tbl_Proveedor_Listado">
		<thead>
			<th>#</th>
			<th>Proveedor</th>
			<th>Nit</th>
			<th>Dirección</th>
			<th>Telefono</th>
			<th>Departamento</th>
			<th>Municipio</th>
		</thead>
	</table>
</fieldset>




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

     	CargarListaProveedores();

  		$('[data-toggle="tooltip"]').tooltip();
        
    });
</script>


<?php include('../footer.php'); ?>