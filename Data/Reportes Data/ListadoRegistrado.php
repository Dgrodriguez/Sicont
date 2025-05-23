<?php include('../../header.php'); ?>
<script src="../Beneficiarios.js"></script>
<link rel="stylesheet" type="text/css" href="../Beneficiarios.css"></link>
<?php require_once("../../Seguridad/conex.php"); ?>

<!-- Inicio requeridos para el multiselect -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="../../librerias/Multiselect/multiple-select.js"></script> 
<link rel="stylesheet" href="../../librerias/Multiselect/multiple-select.css" />
<!-- Fin requeridos para el multiselect -->

<br>

<div class="row">
	<div class="col-md-3">
		<label for="BenefList_Alcantarillado" class="col-sm-6 col-form-label titulo_modal">Alcantarillado</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_Alcantarillado" name="BenefList_Alcantarillado">
			  <option value="Ninguno">Todos</option>
			  <?php
			    $con = conectar();
			    $sql = "SELECT a.Nombre, a.Id from beneficiario_cfg_tipo_alcantarilaldo_saneamiento a where a.ACTIVO = 1 ORDER BY a.Nombre";
			    $query = mysqli_query($con,$sql);
			    if(mysqli_num_rows($query)>0){
			      while($dato = mysqli_fetch_assoc($query)){
			        echo "<option value=".$dato['Id'].">".$dato['Nombre']."</option>";
			      }
			    }
			    mysqli_close($con);
			  ?>
			</SELECT> 
		</div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_Escolaridad" class="col-sm-6 col-form-label titulo_modal">Escolaridad</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_Escolaridad" name="BenefList_Escolaridad">
			  <option value="Ninguno">Todos</option>
			  <?php
			    $con = conectar();
			    $sql = "SELECT a.Nombre, a.Id from cfg_nivel_escolaridad a where a.ACTIVO = 1 ORDER BY a.Nombre";
			    $query = mysqli_query($con,$sql);
			    if(mysqli_num_rows($query)>0){
			      while($dato = mysqli_fetch_assoc($query)){
			        echo "<option value=".$dato['Id'].">".$dato['Nombre']."</option>";
			      }
			    }
			    mysqli_close($con);
			  ?>
			</SELECT> 
		</div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_Departamento" class="col-sm-6 col-form-label titulo_modal">Departamento</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" onChange="CargarMunicipio2('BenefList_Departamento','BenefList_Municipio')" id="BenefList_Departamento" name="BenefList_Departamento">
				<option value="Ninguno">Todos</option>
				<?php
				    $con = conectar();
				    $sql = "SELECT a.nombre, a.id from cfg_departamentos a ORDER BY a.nombre";
				    $query = mysqli_query($con,$sql);
				    if(mysqli_num_rows($query)>0){
				      while($dato = mysqli_fetch_assoc($query)){
				        echo "<option value=".$dato['id'].">".$dato['nombre']."</option>";
				      }
				    }
				    mysqli_close($con);
				  ?>
			</SELECT> 
		</div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_Municipio" class="col-sm-6 col-form-label titulo_modal">Municipio</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_Municipio" name="BenefList_Municipio">
				<option value="Ninguno">Todos</option>
			</SELECT> 
		</div>
	</div>		
</div>
<br>
<div class="row">
	<div class="col-md-3">
		<label for="BenefList_DispAgua" class="col-sm-6 col-form-label titulo_modal">Disponibilidad del Agua</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_DispAgua" name="BenefList_DispAgua">
			  <option value="Ninguno">Todos</option>
			  <?php
			    $con = conectar();
			    $sql = "SELECT a.Nombre, a.Id from beneficiario_cfg_tipo_disponibilidad_agua a where a.ACTIVO = 1 ORDER BY a.Nombre";
			    $query = mysqli_query($con,$sql);
			    if(mysqli_num_rows($query)>0){
			      while($dato = mysqli_fetch_assoc($query)){
			        echo "<option value=".$dato['Id'].">".$dato['Nombre']."</option>";
			      }
			    }
			    mysqli_close($con);
			  ?>
			</SELECT> 
		</div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_Genero" class="col-sm-6 col-form-label titulo_modal">Genero</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_Genero" name="BenefList_Genero">
			  <option value="Ninguno">Todos</option>
			  <?php
			    $con = conectar();
			    $sql = "SELECT a.Nombre, a.Id from cfg_genero a where a.ACTIVO = 1 ORDER BY a.Nombre";
			    $query = mysqli_query($con,$sql);
			    if(mysqli_num_rows($query)>0){
			      while($dato = mysqli_fetch_assoc($query)){
			        echo "<option value=".$dato['Id'].">".$dato['Nombre']."</option>";
			      }
			    }
			    mysqli_close($con);
			  ?>
			</SELECT> 
		</div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_Proyecto" class="col-sm-6 col-form-label titulo_modal">Proyecto</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_Proyecto" name="BenefList_Proyecto">
				<option value="Ninguno">Todos</option>
				<?php
				    $con = conectar();
				    $sql = "SELECT a.NombreProyecto, a.Id from beneficiarios_cfg_proyectos a where a.ACTIVO = 1 ORDER BY a.NombreProyecto";
				    $query = mysqli_query($con,$sql);
				    if(mysqli_num_rows($query)>0){
				      while($dato = mysqli_fetch_assoc($query)){
				        echo "<option value=".$dato['Id'].">".$dato['NombreProyecto']."</option>";
				      }
				    }
				    mysqli_close($con);
				  ?>
			</SELECT> 
		</div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_TipoAcceso" class="col-sm-6 col-form-label titulo_modal">Tipo Acceso</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_TipoAcceso" name="BenefList_TipoAcceso">
				<option value="Ninguno">Todos</option>
				<?php
				    $con = conectar();
				    $sql = "SELECT a.Nombre, a.Id from beneficiario_cfg_tipo_acceso a where a.ACTIVO = 1 ORDER BY a.Nombre";
				    $query = mysqli_query($con,$sql);
				    if(mysqli_num_rows($query)>0){
				      while($dato = mysqli_fetch_assoc($query)){
				        echo "<option value=".$dato['Id'].">".$dato['Nombre']."</option>";
				      }
				    }
				    mysqli_close($con);
				?>				
			</SELECT> 
		</div>
	</div>		
</div>
<br>
<div class="row">
	<div class="col-md-3">
		<label for="BenefList_TipoEnergia" class="col-sm-6 col-form-label titulo_modal">Tipo Energia</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_TipoEnergia" name="BenefList_TipoEnergia">
				<option value="Ninguno">Todos</option>
				<?php
				    $con = conectar();
				    $sql = "SELECT a.Nombre, a.Id from beneficiario_cfg_tipo_energia a where a.ACTIVO = 1 ORDER BY a.Nombre";
				    $query = mysqli_query($con,$sql);
				    if(mysqli_num_rows($query)>0){
				      while($dato = mysqli_fetch_assoc($query)){
				        echo "<option value=".$dato['Id'].">".$dato['Nombre']."</option>";
				      }
				    }
				    mysqli_close($con);
				  ?>
			</SELECT> 
		</div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_TipoVivienda" class="col-sm-6 col-form-label titulo_modal">Tipo de Vivienda</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_TipoVivienda" name="BenefList_TipoVivienda">
			  <option value="Ninguno">Todos</option>
			  <?php
			    $con = conectar();
			    $sql = "SELECT a.Nombre, a.Id from beneficiario_cfg_tipo_vivienda a where a.ACTIVO = 1 ORDER BY a.Nombre";
			    $query = mysqli_query($con,$sql);
			    if(mysqli_num_rows($query)>0){
			      while($dato = mysqli_fetch_assoc($query)){
			        echo "<option value=".$dato['Id'].">".$dato['Nombre']."</option>";
			      }
			    }
			    mysqli_close($con);
			  ?>
			</SELECT> 
		</div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_TipoIntervencion" class="col-sm-6 col-form-label titulo_modal">Tipo de Intervención</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_TipoIntervencion" name="BenefList_TipoIntervencion">
			  <option value="Ninguno">Todos</option>
			  <?php
			    $con = conectar();
			    $sql = "SELECT a.Nombre, a.Id from beneficiario_cfg_tipo_intervencion a where a.ACTIVO = 1 ORDER BY a.Nombre";
			    $query = mysqli_query($con,$sql);
			    if(mysqli_num_rows($query)>0){
			      while($dato = mysqli_fetch_assoc($query)){
			        echo "<option value=".$dato['Id'].">".$dato['Nombre']."</option>";
			      }
			    }
			    mysqli_close($con);
			  ?>
			</SELECT> 
		</div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_TipoTenencia" class="col-sm-6 col-form-label titulo_modal">Tipo Tenencia</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_TipoTenencia" name="BenefList_TipoTenencia">
				<option value="Ninguno">Todos</option>
				<?php
				    $con = conectar();
				    $sql = "SELECT a.Nombre, a.Id from beneficiario_cfg_tipo_tenencia a where a.ACTIVO = 1 ORDER BY a.Nombre";
				    $query = mysqli_query($con,$sql);
				    if(mysqli_num_rows($query)>0){
				      while($dato = mysqli_fetch_assoc($query)){
				        echo "<option value=".$dato['Id'].">".$dato['Nombre']."</option>";
				      }
				    }
				    mysqli_close($con);
				?>				
			</SELECT> 
		</div>
	</div>		
</div>
<br>
<div class="row">
	<div class="col-md-3">
		<label for="BenefList_TipoOcupacion" class="col-sm-6 col-form-label titulo_modal">Tipo de Ocupación</label>
		<div class="col-sm-6" style="padding:0px;">
			<SELECT type="text" class="form-control" id="BenefList_TipoOcupacion" name="BenefList_TipoOcupacion">
			  <option value="Ninguno">Todos</option>
			  <?php
			    $con = conectar();
			    $sql = "SELECT a.Nombre, a.Id from cfg_tipo_ocupacion a where a.ACTIVO = 1 ORDER BY a.Nombre";
			    $query = mysqli_query($con,$sql);
			    if(mysqli_num_rows($query)>0){
			      while($dato = mysqli_fetch_assoc($query)){
			        echo "<option value=".$dato['Id'].">".$dato['Nombre']."</option>";
			      }
			    }
			    mysqli_close($con);
			  ?>
			</SELECT> 
		</div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_EnfoqueDiferencial"  class="col-md-6 titulo_modal">Enfoque Diferencial</label>
        <div class="col-md-6" style="padding:0px;">
	        <select id="BenefList_EnfoqueDiferencial" name="BenefList_EnfoqueDiferencial" multiple="multiple" class="form-control">
	        	<?php 
	        	$con = conectar();
	        	$sql = "SELECT Id, Nombre FROM beneficiario_cfg_tipo_enfoque_diferencial WHERE ACTIVO = 1";
	        	$query = mysqli_query($con,$sql);
	        	mysqli_close($con);
	        	while($dato=mysqli_fetch_array($query)){
	          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
	        	}
	        	?>
	        </select>
        </div>
	</div>
	<div class="col-md-3">
		<label for="BenefList_Convenio"  class="col-md-6 titulo_modal">Convenio</label>
        <div class="col-md-6" style="padding:0px;">
	        <select id="BenefList_Convenio" name="BenefList_Convenio" class="form-control">
	        	<option value="Ninguno">Todos</option>
	        	<?php 
		        	$con = conectar();
		        	$sql = "SELECT DISTINCT(Convenio) Convenio FROM beneficiario_datos_postulados WHERE ACTIVO = 1 order by Convenio";
		        	$query = mysqli_query($con,$sql);
		        	mysqli_close($con);
		        	while($dato=mysqli_fetch_array($query)){
		          		echo "<option value='".$dato['Convenio']."'> ".$dato['Convenio']."</option>";
		        	}
	        	?>
	        </select>
        </div>
	</div>	
	<div class="col-md-3">
		<label for="BenefList_Contenido"  class="col-md-6 titulo_modal">Mostrar</label>
        <div class="col-md-6" style="padding:0px;">
        	<select id="BenefList_Contenido" name="BenefList_Contenido" class="form-control">
		        <option value="Ninguno">Todos</option>
		        <option value="Postulados">Solo Postulados</option>
		        <option value="Beneficiarios">Solo Beneficiarios</option>
		     </select>    
        </div>
	</div>
</div>
<div class="row">	
	<div class="col-md-4"></div>
	<div class="col-md-3">
		<button class="btn btn-success" title="Buscar Resultados" onclick="FiltrarListadosBeneficiarios()" data-toggle="tooltip" data-placement="top">Filtrar</button>
		<button class="btn btn_transparente" style="display:none;" id="Btn_DescargarListadoExcel" title="Descargar Excel de Resultados" onclick="DescargarListadoPrevioBeneficiarios()" data-toggle="tooltip" data-placement="top"><i class="fa-regular fa-file-excel"></i></button>
	</div>		
</div>	
<br>
<div id="Div_tbl_Listado_Resultados" style="display:none;overflow-x: auto;">
	<table class="table table-striped" id="tbl_Listado_Resultados">
		<thead>
			<tr>
				<th>#</th>
				<th style="width: 50px !important;">Id Formulario</th>
				<th style="width: 50px !important;">Fecha Elaboración</th>
				<th style="width: 50px !important;">Convenio</th>
				<th style="width: 50px !important;">Departamento</th>
				<th style="width: 50px !important;">Municipio</th>
				<th style="width: 50px !important;">Tipo de Vivienda</th>
				<th style="width: 50px !important;">Proyecto</th>
				<th style="width: 50px !important;">Tipo de Integración</th>
				<th style="width: 50px !important;">Primer Apellido</th>
				<th style="width: 50px !important;">Segundo Apellido</th>
				<th style="width: 50px !important;">Primer Nombre</th>
				<th style="width: 50px !important;">Segundo Nombre</th>
				<th style="width: 50px !important;">Tipo Identificación</th>
				<th style="width: 50px !important;">Identificación</th>
				<th style="width: 50px !important;">Fecha de Nacimiento</th>
				<th style="width: 50px !important;">Ocupación</th>
				<th style="width: 50px !important;">Ingresos Promedio</th>
				<th style="width: 50px !important;">Teléfono</th>
				<th style="width: 50px !important;">Genero</th>
				<th style="width: 50px !important;">Tipo de Acceso</th>
				<th style="width: 50px !important;">Latitud</th>
				<th style="width: 50px !important;">Longitud</th>
				<th style="width: 50px !important;">Disponibilidad del Agua</th>
				<th style="width: 50px !important;">Tipo Energia</th>
				<th style="width: 50px !important;">Tipo Alcantarillado</th>
				<th style="width: 50px !important;">Tipo Tenencia</th>
				<th style="width: 50px !important;">Otra Tenencia</th>
				<th style="width: 50px !important;">Enfoque Diferencial</th>
				<th style="width: 50px !important;">Grupo Familiar</th>
			</tr>
		</thead>
	</table>
</div>




<!-- Inicio sección de modales -->


<!--Modal de Grupo Familiar-->
<button type="button" class="btn btn-success" id="Btn_BenefRegPost_mdl_Grp_Familiar" style="display:none;" data-toggle="modal" data-target="#BenefRegPost_mdl_Grp_Familiar"></button>
<div class="modal fade" id="BenefRegPost_mdl_Grp_Familiar" tabindex="-1" role="dialog" aria-labelledby="BenefRegPost_mdl_Grp_FamiliarLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document" style="width: 90%;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="BenefRegPost_mdl_Grp_FamiliarLabel">Grupo Familiar de <span id="TitularGrupoFamiliar"></span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="margin-left: 12px;">

		<table class="table table-striped" id="tbl_Listado_GrupoFamiliar">
			<thead>
				<tr>
					<th>#</th>
					<th>Primer Apellido</th>
					<th>Segundo Apellido</th>
					<th>Primer Nombre</th>
					<th>Segundo Nombre</th>
					<th>Tipo de Identificación</th>
					<th>Identificación</th>
					<th>Fecha de Nacimiento</th>
					<th>Género</th>
					<th>Parentesco</th>
					<th>Escolaridad</th>
					<th>Ingresos Mensuales</th>
					<th>Enfoque Diferencial</th>
				</tr>
			</thead>
		</table>      	
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <!-- Otros botones o acciones -->
      </div>
    </div>
  </div>
</div>



<!-- Fin de Sección de Modales -->


<script type="text/javascript">
$(document).ready(function() {
  	$('[data-toggle="tooltip"]').tooltip();
  	$('#BenefList_EnfoqueDiferencial').multipleSelect({
    	width: '100%', placeholder: 'Todas las opciones'
	});

    $('#tbl_Listado_Resultados').DataTable({
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
    $('#tbl_Listado_GrupoFamiliar').DataTable({
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
<?php include('../../footer.php'); ?>
