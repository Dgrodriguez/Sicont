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
	<fieldset><legend class="titulo_modal">Datos Básicos</legend>
		<div class="row">
		    <div class="form-group row col-md-4" >
		        <label for="BenefRegPost_FechaElab"  class="col-md-5"><span style="color:red">*</span> Fecha de Elaboración</label>
		        <div class="col-md-7">
		          <input type="date" class="form-control" autocomplete="off" id="BenefRegPost_FechaElab" name="BenefRegPost_FechaElab" required>
		        </div>
		    </div>

		    <div class="form-group row col-md-4" >
		        <label for="BenefRegPost_Contrato"  class="col-md-4"><span style="color:red">*</span> Convenio/ Contrato</label>
		        <div class="col-md-8">
		          <input type="text" class="form-control" onkeyup="BuscarContratoPostulado();" autocomplete="off" id="BenefRegPost_Contrato" name="BenefRegPost_Contrato" required>
		          <input type="hidden" id="BenefRegPost_IdContrato">
		          <ul id="BenefRegPost_Contrato_List"></ul>
		        </div>
		    </div>

		    <div class="form-group row col-md-4" >
		      <label for="BenefRegPost_TipoIntervencion"  class="col-md-5"><span style="color:red">*</span> Tipo de Intervención</label>
		      <div class="col-md-7">
		        <select class="form-control" id="BenefRegPost_TipoIntervencion" name="BenefRegPost_TipoIntervencion">
		          <option value="Ninguno">Seleccione</option>
		          <?php 
		          $con=conectar();
		          $sql = "SELECT a.Id,a.Nombre FROM beneficiario_cfg_tipo_intervencion a ORDER BY a.Nombre";
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
		<div class="row">
		    <div class="form-group row col-md-4" >
		      <label for="BenefRegPost_Proyecto"  class="col-md-5"><span style="color:red">*</span> Proyecto</label>
		      <div class="col-md-7">
		        <select class="form-control" id="BenefRegPost_Proyecto" name="BenefRegPost_Proyecto">
		        	<option value="Ninguno">Seleccione</option>
		        	<?php 
		        	$con=conectar();
		        	$sql = "SELECT Id,NombreProyecto Nombre FROM beneficiarios_cfg_proyectos WHERE ACTIVO = 1 ORDER BY NombreProyecto";
		        	$query = mysqli_query($con,$sql);
		        	mysqli_close($con);
		        	while($dato=mysqli_fetch_array($query)){
		          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
		        	}
		        	?>
		        </select>
		      </div>
		    </div>
	        <div class="form-group row col-md-4">
		        <label for="BenefRegPost_dpto" class="col-sm-4 col-form-label"><span style="color:red">*</span>Departamento</label>
		        <div class="col-sm-8">
		          <SELECT type="text" class="form-control" onChange="CargarMunicipio('BenefRegPost_dpto','BenefRegPost_mpio')" id="BenefRegPost_dpto" name="BenefRegPost_dpto">
		            <option value="Ninguno">Seleccione</option>
		          </SELECT>
		        </div>
		    </div>
	        <div class="form-group row col-md-4">
		        <label for="BenefRegPost_mpio" class="col-sm-5 col-form-label"><span style="color:red">*</span>Municipio</label>
		        <div class="col-sm-7">
		          <SELECT type="text" class="form-control" id="BenefRegPost_mpio" name="BenefRegPost_mpio">
		            <option value="Ninguno">Seleccione</option>
		          </SELECT>
		        </div>
		    </div>
		</div>
		<div class="row">    
		    <div class="form-group row col-md-4" >
		      <label for="BenefRegPost_TipoVivienda"  class="col-md-5"><span style="color:red">*</span> Tipo de Vivienda</label>
		      <div class="col-md-7">
		        <select class="form-control" id="BenefRegPost_TipoVivienda" name="BenefRegPost_TipoVivienda">
		        	<option value="Ninguno">Seleccione</option>
		        	<?php 
		        	$con=conectar();
		        	$sql = "SELECT a.Id,a.Nombre FROM beneficiario_cfg_tipo_vivienda a ORDER BY a.Nombre";
		        	$query = mysqli_query($con,$sql);
		        	mysqli_close($con);
		        	while($dato=mysqli_fetch_array($query)){
		          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
		        	}
		        	?>
		        </select>
		      </div>
		    </div>
		    <div class="form-group row col-md-4">
		        <label for="BenefRegPost_Direccion" class="col-sm-4 col-form-label"><span style="color:red">*</span>Dirección</label>
		        <div class="col-sm-8" style="padding:0px;">
		        	<div class="col-sm-9">
		            	<input type="text" readonly class="form-control" autocomplete="off" id="BenefRegPost_Direccion" name="BenefRegPost_Direccion" required>
		            </div>
		            <div class="col-sm-3">
		            	<button title="Agregar Dirección" data-toggle="tooltip" data-placement="top" onclick="$('#Btn_BenefRegPost_mdl_Direccion').click()" class="btn_transparente"><i class="fa-solid fa-map-location-dot"></i></button>
              		</div>
		        </div>
		    </div>
		    <div class="form-group row col-md-4" >
		        <label for="BenefRegPost_ID"  class="col-md-5"><span style="color:red">*</span>ID</label>
		        <div class="col-md-7">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_ID" name="BenefRegPost_ID" required>
		        </div>
		    </div>
		</div>
	</fieldset>

	<fieldset><legend class="titulo_modal">Información de Caracterización Social</legend>
		
		<div class="row">
			<div class="form-group row col-md-3" >
		        <label for="BenefRegPost_TipoIdentificacion_Jefe"  class="col-md-5"><span style="color:red">*</span>Tipo Documento de Identidad</label>
		        <div class="col-md-7">
		          <select class="form-control" id="BenefRegPost_TipoIdentificacion_Jefe" name="BenefRegPost_TipoIdentificacion_Jefe">
		        	<option value="Ninguno">Seleccione</option>
		        	<?php 
			        	$con=conectar();
			        	$sql = "SELECT Id, Nombre FROM cfg_tipo_identificacion_documento WHERE ACTIVO = 1 and Id in (1,2) ORDER BY Nombre";
			        	$query = mysqli_query($con,$sql);
			        	mysqli_close($con);
			        	while($dato=mysqli_fetch_array($query)){
			          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
			        	}
		        	?>
		        </select>
		        </div>
		    </div>
		    <div class="form-group row col-md-3" >
		        <label for="BenefRegPost_NumIdenti_Jefe"  class="col-md-5"><span style="color:red">*</span>Número de Identificación</label>
		        <div class="col-md-7">
		          <input type="number" class="form-control" autocomplete="off" onblur="BuscarDatosAfiliado()" id="BenefRegPost_NumIdenti_Jefe" name="BenefRegPost_NumIdenti_Jefe" required>
		        </div>
		    </div>
		    <div class="form-group row col-md-3" >
		        <label for="BenefRegPost_NivelEscolaridad_Jefe"  class="col-md-5"><span style="color:red">*</span>Nivel de Escolaridad</label>
		        <div class="col-md-7">
			        <select class="form-control" id="BenefRegPost_NivelEscolaridad_Jefe" name="BenefRegPost_NivelEscolaridad_Jefe">
			        	<option value="Ninguno">Seleccione</option>
			        	<?php 
			        	$con = conectar();
			        	$sql = "SELECT Id, Nombre FROM cfg_nivel_escolaridad WHERE ACTIVO = 1 ORDER BY Nombre";
			        	$query = mysqli_query($con,$sql);
			        	mysqli_close($con);
			        	while($dato=mysqli_fetch_array($query)){
			          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
			        	}
			        	?>
			        </select>
		        </div>
		    </div>
		    <div class="form-group row col-md-3" >
		        <label for="BenefRegPost_Ocupacion_Jefe"  class="col-md-5"><span style="color:red">*</span>Ocupación</label>
		        <div class="col-md-7">
			        <select class="form-control" id="BenefRegPost_Ocupacion_Jefe" name="BenefRegPost_Ocupacion_Jefe">
			        	<option value="Ninguno">Seleccione</option>
			        	<?php 
			        	$con = conectar();
			        	$sql = "SELECT Id, Nombre FROM cfg_tipo_ocupacion WHERE ACTIVO = 1 ORDER BY Nombre";
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

		<div class="row">
		    <div class="form-group row col-md-3" >
		        <label for="BenefRegPost_NombreJefe"  class="col-md-5"><span style="color:red">*</span>Primer Nombre del Jefe de Hogar</label>
		        <div class="col-md-7">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_PrimerNombreJefe" name="BenefRegPost_NombreJefe" required>
		        </div>
		    </div>
		    <div class="form-group row col-md-3" >
		        <label for="BenefRegPost_SegundoNombreJefe"  class="col-md-5">Segundo Nombre del Jefe de Hogar</label>
		        <div class="col-md-7">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_SegundoNombreJefe" name="BenefRegPost_SegundoNombreJefe" required>
		        </div>
		    </div>
		    <div class="form-group row col-md-3" >
		        <label for="BenefRegPost_PrimerApellidoJefe"  class="col-md-5"><span style="color:red">*</span>Primer Apellido del Jefe de Hogar</label>
		        <div class="col-md-7">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_PrimerApellidoJefe" name="BenefRegPost_PrimerApellidoJefe" required>
		        </div>
		    </div>
		    <div class="form-group row col-md-3" >
		        <label for="BenefRegPost_SegundoApellidoJefe"  class="col-md-5">Segundo Apellido del Jefe de Hogar</label>
		        <div class="col-md-7">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_SegundoApellidoJefe" name="BenefRegPost_SegundoApellidoJefe" required>
		        </div>
		    </div>
		</div>
		
		<div class="row">  
			<div class="form-group row col-md-3" >
		        <label for="BenefRegPost_IngresosMes_Jefe"  class="col-md-5"><span style="color:red">*</span>Ingresos Mes</label>
		        <div class="col-md-7">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_IngresosMes_Jefe" name="BenefRegPost_IngresosMes_Jefe" required>
		        </div>
		    </div>	
			<div class="form-group row col-md-3" >
		        <label for="BenefRegPost_FechaNac_Jefe"  class="col-md-5"><span style="color:red">*</span>Fecha de Nacimiento</label>
		        <div class="col-md-7">
		          <input type="date" class="form-control" autocomplete="off" id="BenefRegPost_FechaNac_Jefe" name="BenefRegPost_FechaNac_Jefe" required>
		        </div>
		    </div>	  	   
		    <div class="form-group row col-md-3" >
		        <label for="BenefRegPost_Telefono_Jefe"  class="col-md-5"><span style="color:red">*</span>Teléfono</label>
		        <div class="col-md-7">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_Telefono_Jefe" name="BenefRegPost_Telefono_Jefe" required>
		        </div>
		    </div>	
		    <div class="form-group row col-md-3" >
		        <label for="BenefRegPost_EnfoqueDiferencial_jefe"  class="col-md-5"><span style="color:red">*</span>Enfoque Diferencial</label>
		        <div class="col-md-7">
			        <select id="BenefRegPost_EnfoqueDiferencial_jefe" name="BenefRegPost_EnfoqueDiferencial_jefe" multiple="multiple" class="form-control">
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
		</div> 
		<div class="row">
			<div class="form-group row col-md-3" >
		        <label for="BenefRegPost_Genero_jefe"  class="col-md-5"><span style="color:red">*</span>Género Jefe de Hogar</label>
		        <div class="col-md-7">
			        <select id="BenefRegPost_Genero_jefe" name="BenefRegPost_Genero_jefe" class="form-control">
			        	<option value="Ninguno">Seleccione</option>
			        	<?php 
			        	$con = conectar();
			        	$sql = "SELECT Id, Nombre FROM cfg_genero WHERE ACTIVO = 1";
			        	$query = mysqli_query($con,$sql);
			        	mysqli_close($con);
			        	while($dato=mysqli_fetch_array($query)){
			          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
			        	}
			        	?>
			        </select>
		        </div>
		    </div>
	
 			<div class="form-group row col-md-3 btn_centrado">
		    	<button class="btn_transparente titulo_modal" onclick="IniciarGrupoFamiliar()" title="Adicionar Miembro a Grupo Familiar" data-toggle="tooltip" data-placement="top"><i class="fa-solid fa-arrows-down-to-people"></i><span style="background-color: #009246;" class="badge badge-success" id="Bdg_Cant_Grp_Familiar">0</span></button>
		    </div>

		</div>
	</fieldset>
</fieldset>
		   


<fieldset><legend class="titulo_modal">Información de Transporte y Ubicación</legend>
	<div class="row"> 
	    <div class="form-group row col-md-4" >
	        <label for="BenefRegPost_TipoAcceso"  class="col-md-5"><span style="color:red">*</span>Tipo de Acceso</label>
	        <div class="col-md-7">
		        <select id="BenefRegPost_TipoAcceso" name="BenefRegPost_TipoAcceso" class="form-control">
		        	<option value="Ninguno">Seleccione</option>
		        	<?php 
			        	$con = conectar();
			        	$sql = "SELECT Id, Nombre FROM beneficiario_cfg_tipo_acceso WHERE ACTIVO = 1";
			        	$query = mysqli_query($con,$sql);
			        	mysqli_close($con);
			        	while($dato=mysqli_fetch_array($query)){
			          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
			        	}
		        	?>
		        </select>
	        </div>
	    </div>	
	    <div class="form-group row col-md-4" >
	        <label for="BenefRegPost_Latitud"  class="col-md-5">Latitud</label>
	        <div class="col-md-7">
		        <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_Latitud" name="BenefRegPost_Latitud" required>
	        </div>
	    </div>	
	    <div class="form-group row col-md-4" >
	        <label for="BenefRegPost_Longitud"  class="col-md-5">Longitud</label>
	        <div class="col-md-7">
		        <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_Longitud" name="BenefRegPost_Longitud" required>
	        </div>
	    </div>	
	</div>
</fieldset>

<br>

<fieldset><legend class="titulo_modal">Información de Condiciones Normativas</legend>
	<div class="row"> 
	    <div class="form-group row col-md-4" >
	        <label for="BenefRegPost_DisponibilidadAgua"  class="col-md-5"><span style="color:red">*</span>Disponibilidad del Agua</label>
	        <div class="col-md-7">
		        <select id="BenefRegPost_DisponibilidadAgua" name="BenefRegPost_DisponibilidadAgua" class="form-control">
		        	<option value="Ninguno">Seleccione</option>
		        	<?php 
			        	$con = conectar();
			        	$sql = "SELECT Id, Nombre FROM beneficiario_cfg_tipo_disponibilidad_agua WHERE ACTIVO = 1";
			        	$query = mysqli_query($con,$sql);
			        	mysqli_close($con);
			        	while($dato=mysqli_fetch_array($query)){
			          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
			        	}
		        	?>
		        </select>
	        </div>
	    </div>	
	    <div class="form-group row col-md-4" >
	        <label for="BenefRegPost_ServicioEnergia"  class="col-md-5"><span style="color:red">*</span>Servicio de energia</label>
	        <div class="col-md-7">
		        <select id="BenefRegPost_ServicioEnergia" name="BenefRegPost_ServicioEnergia" class="form-control">
		        	<option value="Ninguno">Seleccione</option>
		        	<?php 
			        	$con = conectar();
			        	$sql = "SELECT Id, Nombre FROM beneficiario_cfg_tipo_energia WHERE ACTIVO = 1";
			        	$query = mysqli_query($con,$sql);
			        	mysqli_close($con);
			        	while($dato=mysqli_fetch_array($query)){
			          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
			        	}
		        	?>
		        </select>
	        </div>
	    </div>	

	    <div class="form-group row col-md-4" >
	        <label for="BenefRegPost_ServicioAlcantarillado"  class="col-md-5"><span style="color:red">*</span>Alcantarillado / Saneamiento básico</label>
	        <div class="col-md-7">
		        <select id="BenefRegPost_ServicioAlcantarillado" name="BenefRegPost_ServicioAlcantarillado" class="form-control">
		        	<option value="Ninguno">Seleccione</option>
		        	<?php 
			        	$con = conectar();
			        	$sql = "SELECT Id, Nombre FROM beneficiario_cfg_tipo_alcantarilaldo_saneamiento WHERE ACTIVO = 1";
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
	<div class="row">    
	    <div class="form-group row col-md-3" >
	        <label for="BenefRegPost_ServicioTenencia" class="col-md-5"><span style="color:red">*</span>Tenencia</label>
	        <div class="col-md-7">
		        <select id="BenefRegPost_ServicioTenencia" onchange="TipoTenencia()" name="BenefRegPost_ServicioTenencia" class="form-control">
		        	<option value="Ninguno">Seleccione</option>
		        	<?php 
			        	$con = conectar();
			        	$sql = "SELECT Id, Nombre FROM beneficiario_cfg_tipo_tenencia WHERE ACTIVO = 1";
			        	$query = mysqli_query($con,$sql);
			        	mysqli_close($con);
			        	while($dato=mysqli_fetch_array($query)){
			          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
			        	}
		        	?>
		        </select>
	        </div>
	    </div>	
	    <div class="form-group row col-md-4" id="Div_BenefRegPost_OtraTenencia" style="display:none;">
	        <label for="BenefRegPost_OtraTenencia"  class="col-md-5"><span style="color:red">*</span>¿Cual Otra Tenencia?</label>
	        <div class="col-md-7">
		        <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_OtraTenencia" name="BenefRegPost_OtraTenencia" required>
	        </div>
	    </div>	    
</fieldset>

<div class="row">
	
	<div class="col-md-4 "></div>
	<div class="col-md-4"> <button class="btn btn-success" onclick="GuardarPostulado()"> Guardar Ficha Caracterización </button> </div>

</div>




<!-- Inicio sección de modales -->


<!--Modal de Grupo Familiar-->
<button type="button" class="btn btn-success" id="Btn_BenefRegPost_mdl_Grp_Familiar" style="display:none;" data-toggle="modal" data-target="#BenefRegPost_mdl_Grp_Familiar"></button>
<div class="modal fade" id="BenefRegPost_mdl_Grp_Familiar" tabindex="-1" role="dialog" aria-labelledby="BenefRegPost_mdl_Grp_FamiliarLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document" style="width: 90%;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="BenefRegPost_mdl_Grp_FamiliarLabel">Agregar Miembro al Grupo Familiar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="margin-left: 12px;">
        
        <div class="row">
		    <div class="form-group col-md-3" style="padding:0px;">
		        <label for="BenefRegPost_NombrePariente"  class="col-md-5"><span style="color:red">*</span>Primer Nombre</label>
		        <div class="col-md-7">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_PrimerNombrePariente" name="BenefRegPost_NombrePariente" required>
		        </div>
		    </div>
		    <div class="form-group col-md-3" style="padding:0px;" >
		        <label for="BenefRegPost_SegundoNombrePariente"  class="col-md-6">Segundo Nombre</label>
		        <div class="col-md-6">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_SegundoNombrePariente" name="BenefRegPost_SegundoNombrePariente" required>
		        </div>
		    </div>
		    <div class="form-group col-md-3" style="padding:0px;" >
		        <label for="BenefRegPost_PrimerApellidoPariente"  class="col-md-6"><span style="color:red">*</span>Primer Apellido</label>
		        <div class="col-md-6" style="padding-left: 0px;">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_PrimerApellidoPariente" name="BenefRegPost_PrimerApellidoPariente" required>
		        </div>
		    </div>
		    <div class="form-group col-md-3" style="padding:0px;" >
		        <label for="BenefRegPost_SegundoApellidoPariente"  class="col-md-6">Segundo Apellido</label>
		        <div class="col-md-6">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_SegundoApellidoPariente" name="BenefRegPost_SegundoApellidoPariente" required>
		        </div>
		    </div>
		</div>



      	<div class="row">
		    <div class="form-group col-md-3" style="padding:0px;" >
		        <label for="BenefRegPost_EnfoqueDiferencial_Pariente" class="col-md-6">Enfoque Diferencial</label>
		        <div class="col-md-6" style="padding:0px;">
			        <select id="BenefRegPost_EnfoqueDiferencial_Pariente" name="BenefRegPost_EnfoqueDiferencial_Pariente" multiple="multiple" class="form-control">
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
		    <div class="form-group col-md-3" style="padding:0px;">
		        <label for="BenefRegPost_Genero_Pariente"  class="col-md-6 btn_centrado"><span style="color:red">*</span>Género</label>
		        <div class="col-md-6">
			        <select id="BenefRegPost_Genero_Pariente" name="BenefRegPost_Genero_Pariente" class="form-control">
			        	<option value="Ninguno">Seleccione</option>
			        	<?php 
			        	$con = conectar();
			        	$sql = "SELECT Id, Nombre FROM cfg_genero WHERE ACTIVO = 1";
			        	$query = mysqli_query($con,$sql);
			        	mysqli_close($con);
			        	while($dato=mysqli_fetch_array($query)){
			          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
			        	}
			        	?>
			        </select>
		        </div>
		    </div>	
		    <div class="form-group col-md-3" >
		        <label for="BenefRegPost_TipoIdentificacion_Pariente" style="padding:0px;" class="col-md-6">Tipo Documento de Identidad</label>
		        <div class="col-md-6" style="padding:0px;">
		          <select class="form-control" id="BenefRegPost_TipoIdentificacion_Pariente" name="BenefRegPost_TipoIdentificacion_Pariente">
		        	<option value="Ninguno">Seleccione</option>
		        	<?php 
		        	$con=conectar();
		        	$sql = "SELECT Id, Nombre FROM cfg_tipo_identificacion_documento WHERE ACTIVO = 1 ORDER BY Nombre";
		        	$query = mysqli_query($con,$sql);
		        	mysqli_close($con);
		        	while($dato=mysqli_fetch_array($query)){
		          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
		        	}
		        	?>
		        </select>
		        </div>
		    </div>
		    <div class="form-group col-md-3" style="padding:0px;" >
		        <label for="BenefRegPost_NumIdenti_Pariente" style="padding:0px;" class="col-md-6">Número de Identificación</label>
		        <div class="col-md-6" >
		          <input type="number" class="form-control" autocomplete="off" id="BenefRegPost_NumIdenti_Pariente" name="BenefRegPost_NumIdenti_Pariente" required>
		        </div>
		    </div>
		</div>
      	<div class="row">
			<div class="form-group col-md-3" style="padding:0px;" >
		        <label for="BenefRegPost_FechaNacimiento_Pariente" style="padding:0px;" class="col-md-6">Fecha de Nacimiento</label>
		        <div class="col-md-6" style="padding:0px;">
		          <input type="date" class="form-control" autocomplete="off" id="BenefRegPost_FechaNacimiento_Pariente" name="BenefRegPost_FechaNacimiento_Pariente" required>
		        </div>
		    </div>

			<div class="form-group col-md-3"  >
		        <label for="BenefRegPost_Parentesco_Pariente" style="padding:0px;" class="col-md-6"><span style="color:red">*</span>Parentesco con el Jefe de Hogar</label>
		        <div class="col-md-6" style="padding:0px;">
		          <select class="form-control" id="BenefRegPost_Parentesco_Pariente" name="BenefRegPost_Parentesco_Pariente">
		        	<option value="Ninguno">Seleccione</option>
		        	<?php 
		        	$con=conectar();
		        	$sql = "SELECT Id, Nombre FROM cfg_parentesco WHERE ACTIVO = 1 ORDER BY Nombre";
		        	$query = mysqli_query($con,$sql);
		        	mysqli_close($con);
		        	while($dato=mysqli_fetch_array($query)){
		          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
		        	}
		        	?>
		        </select>
		        </div>
		    </div>
		    <div class="form-group col-md-3" >
		        <label for="BenefRegPost_NivelEscolaridad_Pariente" style="padding:0px;" class="col-md-6">Nivel de Escolaridad</label>
		        <div class="col-md-6" style="padding:0px;">
			        <select class="form-control" id="BenefRegPost_NivelEscolaridad_Pariente" name="BenefRegPost_NivelEscolaridad_Pariente">
			        	<option value="Ninguno">Seleccione</option>
			        	<?php 
			        	$con = conectar();
			        	$sql = "SELECT Id, Nombre FROM cfg_nivel_escolaridad WHERE ACTIVO = 1 ORDER BY Nombre";
			        	$query = mysqli_query($con,$sql);
			        	mysqli_close($con);
			        	while($dato=mysqli_fetch_array($query)){
			          		echo "<option value='".$dato['Id']."'> ".$dato['Nombre']."</option>";
			        	}
			        	?>
			        </select>
		        </div>
		    </div>
			<div class="form-group col-md-3"  >
		        <label for="BenefRegPost_IngresosMes_Pariente" style="padding:0px;" class="col-md-6">Ingresos Mes</label>
		        <div class="col-md-6" style="padding-right:0px;">
		          <input type="text" class="form-control" autocomplete="off" id="BenefRegPost_IngresosMes_Pariente" name="BenefRegPost_IngresosMes_Pariente" required>
		        </div>
		    </div>	
		</div>
		<div class="row">
			<button class="btn btn-success" onclick="AdicionarFamiliar()">Agregar Familiar</button>		
		</div>
<br>
<br>
		<div class="row"><div class="col-md-12">
			
			<table class="table table-striped" id="tbl_BenefRegPost_GrupoFamiliar">
				<thead>
					<tr>
						<th width="5%">#</th>
						<th width="15%">Nombre Completo</th>
						<th width="10%">Enfoque Diferencial</th>
						<th width="10%">Fecha Nacimiento</th>
						<th width="10%">Tipo Doumento</th>
						<th width="10%">Identificación</th>
						<th width="10%">Parentesco</th>
						<th width="10%">Escolaridad</th>
						<th width="10%">Ingresos</th>
						<th width="10%">Eliminar</th>
					</tr>
				</thead>
			</table>
		</div></div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <!-- Otros botones o acciones -->
      </div>
    </div>
  </div>
</div>




<!--Modal de Dirección-->
<button type="button" class="btn btn-success" id="Btn_BenefRegPost_mdl_Direccion" style="display:none;" data-toggle="modal" data-target="#BenefRegPost_mdl_Direccion"></button>
<div class="modal fade" id="BenefRegPost_mdl_Direccion" tabindex="-1" role="dialog" aria-labelledby="BenefRegPost_mdl_DireccionLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="BenefRegPost_mdl_DireccionLabel">Agregar Dirección</h5>
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
          <div class="form-group col-md-2">
            <label for="Corregimiento">Corregimiento:</label>
              <input type="text" name="Corregimiento" id="Corregimiento" onkeyup="ConcatenarDireccion(this)" class="form-control">
          </div>
          <div class="form-group col-md-4">
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



<!-- Fin de Sección de Modales -->


<script type="text/javascript">
$(document).ready(function() {
    maquillarNumero(document.getElementById("BenefRegPost_IngresosMes_Jefe"));
    maquillarNumero(document.getElementById("BenefRegPost_IngresosMes_Pariente"));
	CargarDeptos("BenefRegPost_dpto");
  	$('[data-toggle="tooltip"]').tooltip();

	$('#BenefRegPost_EnfoqueDiferencial_jefe').multipleSelect({
    	width: '100%', placeholder: 'Seleccione opciones'
	});

	$('#BenefRegPost_EnfoqueDiferencial_Pariente').multipleSelect({
    	width: '100%', placeholder: 'Seleccione opciones'
	});
    $('#tbl_BenefRegPost_GrupoFamiliar').DataTable({
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
