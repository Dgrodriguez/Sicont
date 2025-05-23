<?php include('../header.php'); 
  require_once('../Seguridad/conex.php');
?>
<link rel="stylesheet" type="text/css" href="Administracion.css">
<script src="Administracion.js"></script>
</script>
<div id="FormTipoContrato" class="row">
  <div class="col-md-6">
    <label for="AdicionarInfo_ContratoBuscarId" class="col-sm-6 col-form-label titulo_modal"><span style="color:red">*</span>Buscar Nro de Contrato</label>
    <div class="col-sm-6">
      <input type="text" Id="AdicionarInfo_ContratoBuscarId" onkeyup="BuscarContratoAdicionarInfo()" title="Ingrese el número de contrato/Proceso a buscar" data-toggle="tooltip" data-placement="top" name="AdicionarInfo_ContratoBuscarId" class="form-control" autocomplete="off">
      <ul id="AdicionarInfo_ContratoBuscarId_List"></ul>
    </div>
  </div>

  <div class="col-md-6" id="btn_adicionar_adicional" style="display:none;">
    <button disabled="true" class="btn_transparente" onclick="AdicionarInformacionAdicional()" title="Adicionar Información al Contrato" data-toggle="tooltip" data-placement="bottom" ><i class="fa-solid fa-table-list"></i></button>


    <button disabled="true" class="btn_transparente" onclick="AdicionarInformacionPoliza()" title="Adicionar Información de Poliza al contrato" data-toggle="tooltip" data-placement="bottom" ><i class="fa-solid fa-file-circle-plus"></i></button>

    <button disabled="true" class="btn_transparente btn_addfuentes" onclick="AdicionarInformacionAportes()" title="Información Aportes del Contrato" data-toggle="tooltip" data-placement="bottom" ><i class="fa-solid fa-dollar-sign"></i></button>
  </div>
</div>

<input type="hidden" Id="IdContrato">
<input type="hidden" Id="TipoContrato">



<div id="FormContratoDirecto" style="display: none;">

  <div class="row">
    <div class="col-md-6">
      <fieldset class="border p-2" style="width: 100%; margin-top: 20px;">
        <legend class="w-auto titulo_modal">Cliente</legend>
        <div class="form-group row">
          <label for="CrearContratoDirecto_dpto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Departamento</label>
          <div class="col-sm-4">
            <SELECT type="text" class="form-control" onChange="CargarMunicipio('CrearContratoDirecto_dpto','CrearContratoDirecto_mpio')" id="CrearContratoDirecto_dpto" name="CrearContratoDirecto_dpto">
              <option value="Ninguno">Seleccione</option>
            </SELECT>
          </div>
          <label for="CrearContratoDirecto_mpio" class="col-sm-2 col-form-label"><span style="color:red">*</span>Municipio</label>
          <div class="col-sm-4">
            <SELECT type="text" class="form-control" onChange="CargarRetFuente()" id="CrearContratoDirecto_mpio" name="CrearContratoDirecto_mpio">
              <option value="Ninguno">Seleccione</option>
            </SELECT>
          </div>
        </div>
        <div class="form-group row">
          <label for="CrearContratoDirecto_PersonaContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Persona de contacto</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" autocomplete="off" id="CrearContratoDirecto_PersonaContacto" name="CrearContratoDirecto_PersonaContacto">
          </div>
        </div>
        <div class="form-group row">
          <label for="CrearContratoDirecto_NumeroContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Número de contacto</label>
          <div class="col-sm-4">
            <input type="text" class="form-control" onkeypress="SoloNumeros(event)"  autocomplete="off" id="CrearContratoDirecto_NumeroContacto" name="CrearContratoDirecto_NumeroContacto">
          </div>
          <label for="CrearContratoDirecto_CorreoContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Correo de contacto</label>
          <div class="col-sm-4">
            <input type="email" class="form-control" autocomplete="off" id="CrearContratoDirecto_CorreoContacto" name="CrearContratoDirecto_CorreoContacto">
          </div>
        </div>
      </fieldset>
    </div>
    <div class="col-md-4">
      <fieldset class="border p-2" style="width: 100%; margin-top: 20px;">
        <legend class="w-auto titulo_modal">Cargar documentos</legend>
        <div class="form-group row">
          <label for="CrearContrato_TipoDocumentoAdjunto" class="col-sm-4 col-form-label">Tipo de documento</label>
          <div class="col-sm-8">
            <select class="form-control" id="CrearContrato_TipoDocumentoAdjunto" name="CrearContrato_TipoDocumentoAdjunto">
              <option value="Ninguno">Seleccione</option>
            </select>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-md-10">
              <label for="CrearContrato_archivo" class="col-sm-4 col-form-label">Archivo</label>
              <div class="col-sm-8">
                <input type="file" class="form-control-file" id="CrearContrato_archivo" name="CrearContrato_archivo">
              </div>
          </div>

        </div>
        <div class="form-group row">
          <div class="col-sm-2">
            <button type="submit" onclick="CargarArchivo()" class="btn btn-primary">Cargar</button>
          </div>
          <div class="col-md-2">
              <button type="button" class="btn btn-primary" onclick="MostrarArchivosCargados()">
                Ver Archivos Cargados
              </button>
          </div>
        </div>
      </fieldset>
    </div>
</div>
<fieldset>
  <legend class="titulo_modal">Datos Contractuales</legend>
  <div class="row">
    <div class="col-sm-4">
      <label for="CrearContratoDirect_RolJuridico" class="col-sm-4 col-form-label"><span style="color:red">*</span>Rol Juridico</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" autocomplete="off" id="CrearContratoDirect_RolJuridico" name="CrearContratoDirect_RolJuridico">
      </div>
    </div>
    <div class="col-sm-4">
      <label for="CrearContratoDirect_RolLogistico" class="col-sm-4 col-form-label"><span style="color:red">*</span>Rol Logístico</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" autocomplete="off" id="CrearContratoDirect_RolLogistico" name="CrearContratoDirect_RolLogistico">
      </div>
    </div>
    <div class="col-sm-4">
      <label for="CrearContratoDirect_RolTecnico" class="col-sm-4 col-form-label"><span style="color:red">*</span>Rol Técnico</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" autocomplete="off" id="CrearContratoDirect_RolTecnico" name="CrearContratoDirect_RolTecnico">
      </div>
    </div>
  </div>
<br>
  <div class="row">
    <div class="col-sm-4">
      <label for="CrearContratoDirect_FechaSol" class="col-sm-4 col-form-label"><span style="color:red">*</span>Fecha Solicitud</label>
      <div class="col-sm-8">
        <input type="date" class="form-control" autocomplete="off" id="CrearContratoDirect_FechaSol" name="CrearContratoDirect_FechaSol">
      </div>
    </div>
    <div class="col-sm-4">
      <label for="CrearContratoDirect_TipoContrato" class="col-sm-4 col-form-label"><span style="color:red">*</span>Tipo Contrato</label>
      <div class="col-sm-8">
        <SELECT type="text" class="form-control" id="CrearContratoDirect_TipoContrato" name="CrearContratoDirect_TipoContrato">
          <option value="Ninguno">Seleccione</option>
          <?php
            $con = conectar();
            $sql = "SELECT a.Nombre, a.Id from cfg_tipo_contrato a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
    <div class="col-sm-4">
      <label for="CrearContrato_Modalidad" class="col-sm-4 col-form-label"><span style="color:red">*</span>Modalidad</label>
      <div class="col-sm-8">
        <SELECT type="text" class="form-control" id="CrearContratoDirect_Modalidad" name="CrearContratoDirect_Modalidad">
          <option value="Ninguno">Seleccione</option>
          <?php
            $con = conectar();
            $sql = "SELECT a.Nombre, a.Id from juridica_contrato_tipo_modalidad a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
    <div class="col-sm-4">
      <label for="CrearContratoDirect_TipoPersonaContratar" class="col-sm-4 col-form-label"><span style="color:red">*</span>Tipo de Persona a Contratar</label>
      <div class="col-sm-7" style="padding:0px;">
        <SELECT type="text" class="form-control" onChange="CargarContratistas('CrearContratoDirect_TipoPersonaContratar')" id="CrearContratoDirect_TipoPersonaContratar" name="CrearContratoDirect_TipoPersonaContratar">
          <option value="Ninguno">Seleccione</option>
          <?php
            $con = conectar();
            $sql = "SELECT a.Nombre, a.Id from juridica_contrato_tipo_persona a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
      <div class="col-sm-1 BtnAddPersonas" style="padding:0px;display: none;"><button class="btn btn_transparente"  data-toggle="tooltip" data-placement="top" title="Adicionar Contratistas"  onclick="CargarPersonasContratistas()" ><i class="fa-solid fa-user-plus fa-xs"></i></button></div>
    </div>
    <div class="col-sm-4">
      <label for="CrearContratoDirect_NroActaComite" class="col-sm-4 col-form-label"><span style="color:red">*</span>Nro de Acta de Comité</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" autocomplete="off" id="CrearContratoDirect_NroActaComite" name="CrearContratoDirect_NroActaComite">
      </div>
    </div>
    <div class="col-sm-4">
      <label for="CrearContratoDirect_FechaActaComite" class="col-sm-4 col-form-label"><span style="color:red">*</span>Fecha del Acta de Comité</label>
      <div class="col-sm-8">
        <input type="date" class="form-control" id="CrearContratoDirect_FechaActaComite" title="Fecha de emisión del Acta del Comité"  data-toggle="tooltip">
      </div>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-md-6">
      <label for="CrearContratoDirect_ObjetoContrato" class="col-sm-4 col-form-label"><span style="color:red">*</span>Objeto del Contrato</label>
      <textarea class="form-control col-sm-8" id="CrearContratoDirect_ObjetoContrato" name="CrearContratoDirect_ObjetoContrato"></textarea>
    </div>
    <div class="col-md-6">
      <label for="CrearContratoDirect_SegmentoContrato" class="col-sm-4 col-form-label"><span style="color:red">*</span>Segmento del Contrato</label>
      <textarea class="form-control col-sm-8" id="CrearContratoDirect_SegmentoContrato" name="CrearContratoDirect_SegmentoContrato"></textarea>
    </div>
  </div>

<br>
<div class="row">
<!--   <div class="col-md-3">
    <label for="CrearContratoDirect_TotalAportes" class="col-sm-5 col-form-label"><span style="color:red">*</span>Total de Aportes</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" disabled placeholder="$0.00" autocomplete="off" id="CrearContratoDirect_TotalAportes" name="CrearContratoDirect_TotalAportes">
    </div>

  </div> -->
  <div class="col-md-3">
    <label for="CrearContratoDirect_AportesVivaRecurso" class="col-sm-5 col-form-label"><span style="color:red">*</span>Aporte Viva Recurso</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" onkeyup="CalcularSaldoTotalDirecto()" placeholder="$0.00" autocomplete="off" id="CrearContratoDirect_AportesVivaRecurso" name="CrearContratoDirect_AportesVivaRecurso">
    </div>
  </div>
  <div class="col-md-3">
    <label for="CrearContratoDirect_AportesVivaEspecie" class="col-sm-5 col-form-label"><span style="color:red">*</span>Aporte Viva Especie</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" onkeyup="CalcularSaldoTotalDirecto()" placeholder="$0.00" autocomplete="off" id="CrearContratoDirect_AportesVivaEspecie" name="CrearContratoDirect_AportesVivaEspecie">
    </div>
  </div>
  <div class="col-md-3">
    <label for="CrearContratoDirect_AportesMpioRecurso" onkeyup="CalcularSaldoTotalDirecto()" class="col-sm-5 col-form-label"><span style="color:red">*</span>Aporte Municipio Recurso</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" onkeyup="CalcularSaldoTotalDirecto()" placeholder="$0.00" autocomplete="off" id="CrearContratoDirect_AportesMpioRecurso" name="CrearContratoDirect_AportesMpioRecurso">
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-3">
    <label for="CrearContratoDirect_AportesMpioEspecie" class="col-sm-5 col-form-label"><span style="color:red">*</span>Aporte Municipio Especie</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" onkeyup="CalcularSaldoTotalDirecto()" placeholder="$0.00" autocomplete="off" id="CrearContratoDirect_AportesMpioEspecie" name="CrearContratoDirect_AportesMpioEspecie">
    </div>
  </div>
  <div class="col-md-3">
    <label for="CrearContratoDirectCrearContratoSeleccion_TotalAportesCons" class="col-sm-5 col-form-label"><span style="color:red">*</span>Valor de Otras Fuentes</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" placeholder="$0.00" autocomplete="off" id="CrearContratoDirectCrearContratoSeleccion_TotalAportesCons" name="CrearContratoDirectCrearContratoSeleccion_TotalAportesCons">
    </div>
  </div>
  <div class="col-md-3">
    <label for="CrearContratoDirect_NombreOtrasFuentes" class="col-sm-5 col-form-label"><span style="color:red">*</span>Nombre de Otras Fuentes</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" autocomplete="off" id="CrearContratoDirect_NombreOtrasFuentes" name="CrearContratoDirect_NombreOtrasFuentes">
    </div>
  </div>
  <div class="col-md-3">
    <label for="CrearContratoDirect_DireccionPertenece" class="col-sm-5 col-form-label"><span style="color:red">*</span>Dirección al que Pertenece</label>
    <div class="col-sm-7">
    <SELECT type="text" class="form-control" id="CrearContratoDirect_DireccionPertenece" name="CrearContratoDirect_DireccionPertenece">
      <option value="Ninguno">Seleccione</option>
      <?php
        $con = conectar();
        $sql = "SELECT a.Nombre, a.Id from cfg_areas_depto a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
    <label for="CrearContratoDirect_DisponibilidadPresupuestal" class="col-sm-5 col-form-label"><span style="color:red">*</span>Disponibilidad Presupuestal (CDP)</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" autocomplete="off" id="CrearContratoDirect_DisponibilidadPresupuestal" name="CrearContratoDirect_DisponibilidadPresupuestal">
    </div>
  </div>

  <div class="col-md-3">
    <label for="CrearContratoDirect_FechaDisponibilidad" class="col-sm-5 col-form-label"><span style="color:red">*</span>Fecha Disponibilidad (CDP)</label>
    <div class="col-sm-7">
      <input type="date" class="form-control" autocomplete="off" id="CrearContratoDirect_FechaDisponibilidad" name="CrearContratoDirect_FechaDisponibilidad">
    </div>
  </div>
  <div class="col-md-3">
    <label for="CrearContratoDirect_MontoDisponibilidad" class="col-sm-5 col-form-label"><span style="color:red">*</span>Monto Disponibilidad (CDP) </label>
    <div class="col-sm-7">
      <input type="text" class="form-control"  placeholder="$0.00"  autocomplete="off" id="CrearContratoDirect_MontoDisponibilidad" name="CrearContratoDirect_MontoDisponibilidad">
    </div>
  </div>

  <div class="col-md-3">
    <label for="CrearContratoDirect_ProcesoPertenece" class="col-sm-5 col-form-label"><span style="color:red">*</span>Proceso al que Pertenece</label>
    <div class="col-sm-7">
    <SELECT type="text" class="form-control" id="CrearContratoDirect_ProcesoPertenece" name="CrearContratoDirect_ProcesoPertenece">
      <option value="Ninguno">Seleccione</option>
      <?php
        $con = conectar();
        $sql = "SELECT a.Nombre, a.Id from cfg_areas_proceso a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
<div class="row">
  <div class="col-sm-4"></div>
  <div class="col-sm-3">
    <button class="btn btn-success" onclick="GuardarContratoDirecto()">Guardar Contrato</button>
  </div>
</div>
</fieldset>
</div>


<div id="FormContratoProceso" style="display: none;">

  <div class="row">
    <div class="col-md-6">
      <fieldset class="border p-2" style="width: 100%; margin-top: 20px;">
        <legend class="w-auto titulo_modal">Cliente</legend>
        <div class="form-group row">
          <label for="CrearContratoSeleccion_dpto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Departamento</label>
          <div class="col-sm-4">
            <SELECT type="text" class="form-control" onChange="CargarMunicipio('CrearContratoSeleccion_dpto','CrearContratoSeleccion_mpio')" id="CrearContratoSeleccion_dpto" name="CrearContratoSeleccion_dpto">
              <option value="Ninguno">Sin Dato</option>
            </SELECT>
          </div>
          <label for="CrearContratoSeleccion_mpio" class="col-sm-2 col-form-label"><span style="color:red">*</span>Municipio</label>
          <div class="col-sm-4">
            <SELECT type="text" class="form-control" id="CrearContratoSeleccion_mpio" name="CrearContratoSeleccion_mpio">
              <option value="Ninguno">Sin Dato</option>
            </SELECT>
          </div>
        </div>
        <div class="form-group row">
          <label for="CrearContratoSeleccion_PersonaContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Persona de contacto</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" readonly autocomplete="off" id="CrearContratoSeleccion_PersonaContacto" name="CrearContratoSeleccion_PersonaContacto">
          </div>
        </div>
        <div class="form-group row">
          <label for="CrearContratoSeleccion_NumeroContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Número de contacto</label>
          <div class="col-sm-4">
            <input type="text" class="form-control" readonly onkeypress="SoloNumeros(event)"  autocomplete="off" id="CrearContratoSeleccion_NumeroContacto" name="CrearContratoSeleccion_NumeroContacto">
          </div>
          <label for="CrearContratoSeleccion_CorreoContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Correo de contacto</label>
          <div class="col-sm-4">
            <input type="email" class="form-control" readonly autocomplete="off" id="CrearContratoSeleccion_CorreoContacto" name="CrearContratoSeleccion_CorreoContacto">
          </div>
        </div>
        <div class="row">
            
            <div class="col-sm-4">
              
              <button class="btn btn-success" style="display: none;" onclick="ActualizarClienteContratoProceso()" id="Btn_Update_ClienteContrato">Actualizar Cliente</button>

            </div>

        </div>
      </fieldset>
    </div>
</div>
<fieldset>
  <legend class="titulo_modal">Datos Contractuales</legend>
  <div class="row">
    <div class="col-sm-3">
      <label for="CrearContratoSeleccion_FechaSol" class="col-sm-4 col-form-label"><span style="color:red">*</span>Fecha Solicitud</label>
      <div class="col-sm-8">
        <input type="date" class="form-control" readonly autocomplete="off" id="CrearContratoSeleccion_FechaSol" name="CrearContratoSeleccion_FechaSol">
      </div>
    </div>
    <div class="col-sm-3">
      <label for="CrearContratoSeleccion_RolJuridico" class="col-sm-4 col-form-label"><span style="color:red">*</span>Rol Juridico</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" readonly autocomplete="off" id="CrearContratoSeleccion_RolJuridico" name="CrearContratoSeleccion_RolJuridico">
      </div>
    </div>
    <div class="col-sm-3">
      <label for="CrearContratoSeleccion_RolLogistico" class="col-sm-4 col-form-label"><span style="color:red">*</span>Rol Logístico</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" readonly autocomplete="off" id="CrearContratoSeleccion_RolLogistico" name="CrearContratoSeleccion_RolLogistico">
      </div>
    </div>
    <div class="col-sm-3">
      <label for="CrearContratoSeleccion_RolTecnico" class="col-sm-4 col-form-label"><span style="color:red">*</span>Rol Técnico</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" readonly autocomplete="off" id="CrearContratoSeleccion_RolTecnico" name="CrearContratoSeleccion_RolTecnico">
      </div>
    </div>

  </div>
  <br>
  <div class="row">
    <div class="col-sm-3">
      <label for="CrearContratoSeleccion_TipoContrato" class="col-sm-4 col-form-label"><span style="color:red">*</span>Tipo Contrato</label>
      <div class="col-sm-8">
        <input type="text" readonly id="CrearContratoSeleccion_TipoContrato" class="form-control">
      </div>
    </div>
    <div class="col-sm-3">
      <label for="CrearContratoSeleccion_Modalidad" class="col-sm-4 col-form-label"><span style="color:red">*</span>Modalidad</label>
      <div class="col-sm-8">
        <input type="text" readonly id="CrearContratoSeleccion_Modalidad" class="form-control">
      </div>
    </div>
    <div class="col-sm-3">
      <label for="CrearContratoSeleccion_FechaActaComite" class="col-sm-4 col-form-label"><span style="color:red">*</span>Fecha del Acta de Comité</label>
      <div class="col-sm-8">
        <input type="date" readonly class="form-control" id="CrearContratoSeleccion_FechaActaComite" title="Fecha de emisión del Acta del Comité"  data-toggle="tooltip">
      </div>
    </div>
    <div class="col-sm-3">
      <label for="CrearContratoSeleccion_NroActaComite" class="col-sm-4 col-form-label"><span style="color:red">*</span>Nro de Acta de Comité</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control" autocomplete="off" id="CrearContratoSeleccion_NroActaComite" name="CrearContratoSeleccion_NroActaComite">
      </div>
    </div>
  </div>
  <br>

  <div class="row">
<!--     <div class="col-md-3">
      <label for="CrearContratoSeleccion_TotalAportesCons" class="col-sm-4 col-form-label"><span style="color:red">*</span>Total de Aportes</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control" disabled placeholder="$0.00" autocomplete="off" id="CrearContratoSeleccion_TotalAportesCons" name="CrearContratoSeleccion_TotalAportesCons">
      </div>
    </div> -->
    <div class="col-md-4">
      <label for="CrearContratoSeleccion_DisponibilidadPresupuestal" class="col-sm-4 col-form-label"><span style="color:red">*</span>Disponibilidad Presupuestal (CDP)</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control" autocomplete="off" id="CrearContratoSeleccion_DisponibilidadPresupuestal" name="CrearContratoSeleccion_DisponibilidadPresupuestal">
      </div>
    </div>
    <div class="col-md-4">
      <label for="CrearContratoSeleccion_FechaDisponibilidad" class="col-sm-4 col-form-label"><span style="color:red">*</span>Fecha Disponibilidad (CDP)</label>
      <div class="col-sm-8">
        <input type="date" readonly class="form-control" autocomplete="off" id="CrearContratoSeleccion_FechaDisponibilidad" name="CrearContratoSeleccion_FechaDisponibilidad">
      </div>
    </div>
    <div class="col-md-4">
      <label for="CrearContratoSeleccion_MontoDisponibilidad" class="col-sm-4 col-form-label"><span style="color:red">*</span>Monto Disponibilidad (CDP) </label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control"  placeholder="$0.00"  autocomplete="off" id="CrearContratoSeleccion_MontoDisponibilidad" name="CrearContratoSeleccion_MontoDisponibilidad">
      </div>
    </div>
  </div>

  <br>


<!--   <div class="row">
    <div class="col-md-3">
      <label for="CrearContratoSeleccion_AportesMpioEspecie" class="col-sm-4 col-form-label"><span style="color:red">*</span>Aporte Municipio Especie</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control" onkeyup="CalcularSaldoTotalSeleccion()" placeholder="$0.00" autocomplete="off" id="CrearContratoSeleccion_AportesMpioEspecie" name="CrearContratoSeleccion_AportesMpioEspecie">
      </div>
    </div>
    <div class="col-md-3">
      <label for="CrearContratoSeleccion_AportesVivaRecurso" class="col-sm-4 col-form-label"><span style="color:red">*</span>Aporte Viva Recurso</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control" onkeyup="CalcularSaldoTotalSeleccion()" placeholder="$0.00" autocomplete="off" id="CrearContratoSeleccion_AportesVivaRecurso" name="CrearContratoSeleccion_AportesVivaRecurso">
      </div>
    </div>
    <div class="col-md-3">
      <label for="CrearContratoSeleccion_AportesVivaEspecie" class="col-sm-4 col-form-label"><span style="color:red">*</span>Aporte Viva Especie</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control" onkeyup="CalcularSaldoTotalSeleccion()" placeholder="$0.00" autocomplete="off" id="CrearContratoSeleccion_AportesVivaEspecie" name="CrearContratoSeleccion_AportesVivaEspecie">
      </div>
    </div>
    <div class="col-md-3">
      <label for="CrearContratoSeleccion_AportesMpioRecurso" onkeyup="CalcularSaldoTotalSeleccion()" class="col-sm-4 col-form-label"><span style="color:red">*</span>Aporte Municipio Recurso</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control" onkeyup="CalcularSaldoTotalSeleccion()" placeholder="$0.00" autocomplete="off" id="CrearContratoSeleccion_AportesMpioRecurso" name="CrearContratoSeleccion_AportesMpioRecurso">
      </div>
    </div>
  </div>
  <br> -->

  <div class="row">
<!--     <div class="col-md-3">
      <label for="CrearContratoSeleccion_ValorOtrasFuentes" class="col-sm-4 col-form-label"><span style="color:red">*</span>Valor de Otras Fuentes</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control" onkeyup="CalcularSaldoTotalSeleccion()" placeholder="$0.00" autocomplete="off" id="CrearContratoSeleccion_ValorOtrasFuentes" name="CrearContratoSeleccion_ValorOtrasFuentes">
      </div>
    </div>
    <div class="col-md-3">
      <label for="CrearContratoSeleccion_NombreOtrasFuentes" class="col-sm-4 col-form-label"><span style="color:red">*</span>Nombre de Otras Fuentes</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control" autocomplete="off" id="CrearContratoSeleccion_NombreOtrasFuentes" name="CrearContratoSeleccion_NombreOtrasFuentes">
      </div>
    </div> -->
    <div class="col-md-3">
      <label for="CrearContratoSeleccion_DireccionPertenece" class="col-sm-4 col-form-label"><span style="color:red">*</span>Dirección al que Pertenece</label>
      <div class="col-sm-8">
      <SELECT type="text" readonly class="form-control" id="CrearContratoSeleccion_DireccionPertenece" name="CrearContratoSeleccion_DireccionPertenece">
        <option value="Ninguno">Seleccione</option>
        <?php
          $con = conectar();
          $sql = "SELECT a.Nombre, a.Id from cfg_areas_depto a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
      <label for="CrearContratoSeleccion_ProcesoPertenece" class="col-sm-4 col-form-label"><span style="color:red">*</span>Proceso al que Pertenece</label>
      <div class="col-sm-8">
      <SELECT type="text" readonly class="form-control" id="CrearContratoSeleccion_ProcesoPertenece" name="CrearContratoSeleccion_ProcesoPertenece">
        <option value="Ninguno">Seleccione</option>
        <?php
          $con = conectar();
          $sql = "SELECT a.Nombre, a.Id from cfg_areas_proceso a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
      <label for="CrearContratoSeleccion_SegmentoContrato" class="col-sm-4 col-form-label"><span style="color:red">*</span>Segmento del Contrato</label>
      <div class="col-sm-8">
        <SELECT type="text" readonly class="form-control" id="CrearContratoSeleccion_SegmentoContrato" name="CrearContratoSeleccion_SegmentoContrato">
          <option value="Ninguno">Seleccione</option>
          <?php
            $con = conectar();
            $sql = "SELECT a.Nombre, a.Id from juridica_contrato_tipo_segmento a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
      <label for="CrearContratoSeleccion_ESTADO_CONTRATO" class="col-sm-4 col-form-label"><span style="color:red">*</span>Estado del Ccontrato</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control" autocomplete="off" id="CrearContratoSeleccion_ESTADO_CONTRATO" name="CrearContratoSeleccion_ESTADO_CONTRATO">
      </div>
    </div>

  </div>
  <br>

  <div class="row">
    <div class="col-md-12">
      <label for="CrearContratoSeleccion_ObjetoContrato" class="col-sm-4 col-form-label"><span style="color:red">*</span>Objeto del Contrato</label>
      <textarea class="form-control col-sm-8" readonly id="CrearContratoSeleccion_ObjetoContrato" name="CrearContratoSeleccion_ObjetoContrato"></textarea>
    </div>

  </div>

</fieldset>











  
</div>
<div id="FormContratoBVM" style="display: none;">
<div class="row">
  <div class="col-md-6">
    <fieldset class="border p-2" style="width: 100%; margin-top: 20px;">
      <legend class="w-auto titulo_modal">Cliente</legend>
      <div class="form-group row">
        <label for="CrearContrato_dpto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Departamento</label>
        <div class="col-sm-4">
          <SELECT type="text" class="form-control" onChange="CargarMunicipio('CrearContrato_dpto','CrearContrato_mpio')" id="CrearContrato_dpto" name="CrearContrato_dpto">
            <option value="Ninguno">Seleccione</option>
          </SELECT>
        </div>
        <label for="municipio" class="col-sm-2 col-form-label"><span style="color:red">*</span>Municipio</label>
        <div class="col-sm-4">
          <SELECT type="text" class="form-control" onChange="CargarRetFuente()" id="CrearContrato_mpio" name="CrearContrato_mpio">
            <option value="Ninguno">Seleccione</option>
          </SELECT>
        </div>
      </div>
      <div class="form-group row">
        <label for="CrearContrato_PersonaContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Persona de contacto</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" autocomplete="off" id="CrearContrato_PersonaContacto" name="CrearContrato_PersonaContacto">
        </div>
      </div>
      <div class="form-group row">
        <label for="CrearContrato_NumeroContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Número de contacto</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" autocomplete="off" id="CrearContrato_NumeroContacto" name="CrearContrato_NumeroContacto">
        </div>
        <label for="CrearContrato_CorreoContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Correo de contacto</label>
        <div class="col-sm-4">
          <input type="email" class="form-control" autocomplete="off" id="CrearContrato_CorreoContacto" name="CrearContrato_CorreoContacto">
        </div>
      </div>
    </fieldset>
  </div>
  <div class="col-md-4">
    <fieldset class="border p-2" style="width: 100%; margin-top: 20px;">
      <legend class="w-auto titulo_modal">Cargar documentos</legend>
      <div class="form-group row">
        <label for="CrearContrato_TipoDocumentoAdjunto" class="col-sm-4 col-form-label">Tipo de documento</label>
        <div class="col-sm-8">
          <select class="form-control" id="CrearContrato_TipoDocumentoAdjunto" name="CrearContrato_TipoDocumentoAdjunto">
            <option value="Ninguno">Seleccione</option>
          </select>
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
          <button type="submit" onclick="CargarArchivo()" class="btn btn-primary">Cargar</button>
        </div>
        <div class="col-md-2">
            <button type="button" class="btn btn-primary" onclick="MostrarArchivosCargados()">
              Ver Archivos Cargados
            </button>
        </div>
      </div>
    </fieldset>


  </div>
</div>


<fieldset>
  <legend class="titulo_modal">Datos Contractuales</legend>
  <div class="row">
    <div class="col-md-6">
      <div class="form-group row">
        <label for="CrearContrato_nombreContratante" class="col-md-3"><span style="color:red">*</span>Contratante</label>
        <div class="col-md-6">
            <input type="text" class="form-control" autocomplete="off" id="CrearContrato_nombreContratante" name="CrearContrato_nombreContratante" required>
        </div>
      </div>
      <div class="row">
          <div class="form-group row col-md-6">
            <label for="CrearContrato_NumContratoViva" class="col-md-4"><span style="color:red">*</span>Número de Contrato VIVA</label>
            <div class="col-md-8">
                <input type="text" class="form-control" autocomplete="off" id="CrearContrato_NumContratoViva" name="CrearContrato_NumContratoViva" required>
            </div>
          </div>
          <div class="form-group row col-md-6">
            <label for="CrearContrato_NumContratoContratante"  class="col-md-4">Número de Contrato Contratante</label>
            <div class="col-md-8">
                <input type="text" class="form-control" autocomplete="off" id="CrearContrato_NumContratoContratante" name="CrearContrato_NumContratoContratante" required>
            </div>
          </div>
      </div>
    </div>
    <div class="col-md-6">
        <div class="row">
            <div class="form-group row col-md-10">
                <label for="CrearContrato_Monto" class="col-md-4" style="padding: 0px;"><span style="color:red">*</span>Monto Contrato</label>
                <div class="col-md-8">
                    <input type="text" class="form-control Monto" autocomplete="off" id="CrearContrato_Monto" name="CrearContrato_Monto" placeholder="$0.00" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group row col-md-6">
              <label for="CrearContrato_TP_Honorarios" class="col-md-4" style="padding: 0px;"><span style="color:red">*</span>Tipo de pago<br>Honorarios</label>
              <div class="col-md-8">
                  <select  class="form-control"  id="CrearContrato_TP_Honorarios" name="CrearContrato_TP_Honorarios" required>
                    <option value="Ninguno">Seleccione</option>
                    <option value="unico">Pago Única</option>
                    <option value="fraccionado">Pago Fraccionado</option>
                    <option value="vinculado">Pago Vinculado</option>
                  </select>
              </div>
            </div>
            <div class="form-group row col-md-6">
                <label for="CrearContrato_retencion" class="col-md-4" style="padding: 0px;"><span style="color:red">*</span>Porcentaje de Retención</label>
                <div class="col-md-8">
                  <input type="text" class="form-control Monto" autocomplete="off" id="CrearContrato_retencion" name="CrearContrato_retencion" placeholder="10.00" required>
                </div>
            </div>  
        </div>
        <div class="row">
            <div class="form-group row col-md-6">
                <label for="CrearContrato_fechaIni" class="col-md-4" style="padding: 0px;"><span style="color:red">*</span>Fecha de Inicio</label>
                <div class="col-md-8">
                    <input type="date" class="form-control" autocomplete="off" id="CrearContrato_fechaIni" name="CrearContrato_fechaIni" required>
                </div>
            </div>
            <div class="form-group row col-md-6">
                <label for="CrearContrato_fechaFin" class="col-md-4" style="padding: 0px;"><span style="color:red">*</span>Fecha de Fin</label>
                <div class="col-md-8">
                    <input type="date" class="form-control" autocomplete="off" id="CrearContrato_fechaFin" name="CrearContrato_fechaFin" required>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
      <div class="form-group">
        <label for="CrearContrato_objetoContrato"><span style="color:red">*</span>Objeto del Contrato</label>
        <textarea autocomplete="off" class="form-control" id="CrearContrato_objetoContrato" name="CrearContrato_objetoContrato" rows="3" required></textarea>
      </div>
    </div>
  </div>
</fieldset>
<center> <button class="btn btn-success" onclick="GuardarContrato()">Guardar Contrato</button> </center>
</div>


<button style="display:none;" data-toggle="modal" data-target="#ModalArchivosCargados" id="But_Modal_ArchCarg">x</button>

<!-- Inicio Modal Archivos Cargados-->
<div class="modal fade" id="ModalArchivosCargados" tabindex="-1" role="dialog" aria-labelledby="ModalArchivosCargadosLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalArchivosCargadosLabel">Archivos Cargados</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table id="GridContratoArchivosCargados" class="table-striped tabla-alternada-centrada">
          <thead>
            <tr>
              <th><center>#</center></th>
              <th><center>Nombre Archivo</center></th>
              <th><center>Tipo de Archivo</center></th>
              <th><center>Tamaño</center></th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
<!-- Fin Modal Archivos Cargados-->

<button data-toggle="modal" data-target="#CargarContratistas" style="display: none;" id="btn_Modal_CargarContratistas">x</button>
<!-- Modal -->
<div class="modal fade modal-stack" id="CargarContratistas" tabindex="-1" role="dialog" aria-labelledby="CargarAdjuntosLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="CargarAdjuntosLabel">Cargar Contratistas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-sm-4">
            <label for="CrearContratoDirect_NombreContratista" style="padding:0px;" class="col-sm-6 col-form-label"><span style="color:red">*</span>Nombre y Apellido/ Razón Social</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" class="form-control" autocomplete="off" id="CrearContratoDirect_NombreContratista" name="CrearContratoDirect_NombreContratista">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CrearContratoDirect_Identificacion" style="padding:0px;" class="col-sm-5 col-form-label"><span style="color:red">*</span>Identificación</label>
            <div class="col-sm-7" style="padding:0px;">
              <input type="text" class="form-control" onkeypress="SoloNumeros(event)" autocomplete="off" id="CrearContratoDirect_Identificacion" name="CrearContratoDirect_Identificacion">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CrearContratoDirect_DigitoVerificacion" style="padding:0px;" class="col-sm-4 col-form-label">Dígito de Verificación</label>
            <div class="col-sm-8" style="padding:0px;">
              <input type="text" class="form-control" onkeypress="SoloNumeros(event)" autocomplete="off" id="CrearContratoDirect_DigitoVerificacion" name="CrearContratoDirect_DigitoVerificacion">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-4">
          </div>
          <div class="col-sm-4">
            <button class="btn btn-success" id="btn_AdicionarContratistaContratoDirecto" onclick="AdicionarContratistaContratoDirecto2('CrearContratoAdicionar_TipoPersonaContratar')">Adicionar</button>
          </div>
        </div>
        <br>


        <table id="Tbl_CargarContratistas" class="table table-striped">
          <thead>
            <tr>
              <th>#</th>
              <th>Nombre y Apellido/Razón Social</th>
              <th>Identificación</th>
              <th>Dígito de Verificación</th>
              <th>Eliminar</th>
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



<button data-toggle="modal" data-target="#VerAmparosPolizas" style="display: none;" id="btn_Modal_VerAmparosPolizas">x</button>
<!-- Modal -->
<div class="modal fade modal-stack" id="VerAmparosPolizas" tabindex="-1" role="dialog" aria-labelledby="VerAmparosPolizasLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="VerAmparosPolizasLabel">Amparos por Pólizas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <table id="Tbl_VerAmparosPoliza" class="table table-striped">
          <thead>
            <tr>
              <th>#</th>
              <th>Tipo de Amparo</th>
              <th>Fecha Inicio</th>
              <th>Fecha Fin</th>
              <th>Cuantia</th>
              <th>Eliminar</th>
            </tr>
          </thead>
        </table>

      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-secondary" id="btn_CerrarModal_CargarSupervisores" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>





<button data-toggle="modal" data-target="#CargarSupervisores" style="display: none;" id="btn_Modal_CargarSupervisores">x</button>
<!-- Modal -->
<div class="modal fade modal-stack" id="CargarSupervisores" tabindex="-1" role="dialog" aria-labelledby="CargarSupervisoresLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="CargarSupervisoresLabel">Cargar Supervisores</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-sm-4">
            <label for="CargarSupervisores_NombreContratista" style="padding:0px;" class="col-sm-6 col-form-label"><span style="color:red">*</span>Nombre y Apellido</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" class="form-control" autocomplete="off" id="CargarSupervisores_NombreContratista" name="CargarSupervisores_NombreContratista">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CargarSupervisores_Identificacion" style="padding:0px;" class="col-sm-5 col-form-label"><span style="color:red">*</span>Identificación</label>
            <div class="col-sm-7" style="padding:0px;">
              <input type="text" class="form-control" onkeypress="SoloNumeros(event)" autocomplete="off" id="CargarSupervisores_Identificacion" name="CargarSupervisores_Identificacion">
            </div>
          </div>
          <div class="col-sm-4">
            <button class="btn btn-success" id="btn_AdicionarContratistaCargarSupervisores" onclick="AdicionarSupervisorContrato()">Adicionar</button>
          </div>
        </div>
        <br>

        <table id="Tbl_CargarSupervisores" class="table table-striped">
          <thead>
            <tr>
              <th>#</th>
              <th>Nombre y Apellido</th>
              <th>Identificación</th>
              <th>Eliminar</th>
            </tr>
          </thead>
        </table>

      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-secondary" id="btn_CerrarModal_CargarSupervisores" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


<!-- fuentes de financiancion, se usa solo en caso de proceso de selcción -->

<button data-toggle="modal" data-target="#CargarFuentesFinanciacion" style="display: none;" id="btn_Modal_CargarFuentesFinanciacion">x</button>
<!-- Modal -->
<div class="modal fade modal-stack" id="CargarFuentesFinanciacion" tabindex="-1" role="dialog" aria-labelledby="CargarFuentesFinanciacionLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="CargarFuentesFinanciacionLabel">Adicionar Fuentes de Financiación</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">

          <div class="col-sm-4">
            <label for="CargarFuentesFinanciacion_TotalAportes" style="padding:0px;" class="col-sm-6 col-form-label"><span style="color:red">*</span>Total de Aportes</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" class="form-control"  placeholder="$0.00" disabled autocomplete="off" id="CargarFuentesFinanciacion_TotalAportes" name="CargarFuentesFinanciacion_TotalAportes">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CargarFuentesFinanciacion_AportesVivaEspecie" style="padding:0px;" class="col-sm-6 col-form-label">Aportes Viva en Especie</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" onkeyup="CalcularSaldoTotalSeleccion2()"  placeholder="$0.00" class="form-control" autocomplete="off" id="CargarFuentesFinanciacion_AportesVivaEspecie" name="CargarFuentesFinanciacion_AportesVivaEspecie">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CargarFuentesFinanciacion_AportesVivaRecursos" style="padding:0px;" class="col-sm-6 col-form-label">Aportes Viva en Recursos</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" onkeyup="CalcularSaldoTotalSeleccion2()"  placeholder="$0.00" class="form-control" autocomplete="off" id="CargarFuentesFinanciacion_AportesVivaRecursos" name="CargarFuentesFinanciacion_AportesVivaRecursos">
            </div>
          </div>          

        </div>
        <br>
        <div class="row">
          <div class="col-sm-4">
            <label for="CargarFuentesFinanciacion_AportesMpioEspecie" style="padding:0px;" class="col-sm-6 col-form-label">Aportes Municipio en Especie</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" onkeyup="CalcularSaldoTotalSeleccion2()"  placeholder="$0.00" class="form-control" autocomplete="off" id="CargarFuentesFinanciacion_AportesMpioEspecie" name="CargarFuentesFinanciacion_AportesMpioEspecie">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CargarFuentesFinanciacion_AportesMpioRecursos" style="padding:0px;" class="col-sm-6 col-form-label"><span style="color:red">*</span>Aportes Municipio en Recursos</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" onkeyup="CalcularSaldoTotalSeleccion2()"  placeholder="$0.00" class="form-control"  autocomplete="off" id="CargarFuentesFinanciacion_AportesMpioRecursos" name="CargarFuentesFinanciacion_AportesMpioRecursos">
            </div>
          </div>
        </div>

        <br>
        <fieldset><legend class="titulo_modal">Otros Aportes</legend>

          <div class="row">
            <div class="col-md-4">
              <label for="AddInfoContratoProceso_ValorOtrasFuentes" class="col-sm-6 col-form-label"><span style="color:red">*</span>Valor de Otras Fuentes</label>
              <div class="col-sm-6" style="padding:0px;">
                <input type="text" class="form-control"  placeholder="$0.00" autocomplete="off" id="AddInfoContratoProceso_ValorOtrasFuentes" name="AddInfoContratoProceso_ValorOtrasFuentes">
              </div>
            </div>
            <div class="col-md-4">
              <label for="AddInfoContratoProceso_NombreOtrasFuentes" class="col-sm-6 col-form-label"><span style="color:red">*</span>Nombre de Otras Fuentes</label>
              <div class="col-sm-6" style="padding:0px;">
                <input type="text" class="form-control" autocomplete="off" id="AddInfoContratoProceso_NombreOtrasFuentes" name="AddInfoContratoProceso_NombreOtrasFuentes">
              </div>
            </div>
            <div class="col-sm-4">
               <button class="btn btn-success" id="btn_AdicionarOtrasFuentes" onclick="AdicionarValorOtraFuenta2()">Adicionar Otras Fuentes</button>
            </div>
        </div>
        <br>
        <div class="row">
          <div class="col-md-4">
          </div>
          <div class="col-md-4">
            <button class="btn btn-success" id="btn_ActualizarDatosFinancierolProceso" onclick="ActualziarDatosFinancierosProcesoSeleccion()">Actualizar Datos Financieros</button>
          </div>
        </div>
        <br>
        <div class="row"><div class="col-md-12">
          
          <table id="Tbl_ValorOtrasFuenta" class="table table-striped" style="width:100% !important">
            <thead>
              <tr>
                <td>#</td>
                <td>Nombre de Otra Fuente</td>
                <td>Valor de Otra Fuente</td>
                <td>Eliminar</td>
              </tr>
            </thead>
          </table>

        </div></div>
       
        </fieldset>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-secondary" id="btn_CerrarModal_CargarSupervisores" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>




<!-- Large modal -->
<button type="button"  class="btn btn-primary" data-toggle="modal" id="Btn_Modal_AdicionarPoliza" style="display:none;" data-target=".ModalAdicionarPolizaCont">x</button>
<div class="modal fade ModalAdicionarPolizaCont" style="z-index:1041 !important" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-extra-wide">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <fieldset >
          <legend class="titulo_modal">Adicionar Pólizas al Contrato <button title="Ampliar" data-toggle="tooltip" data-placement="top" onclick="MostrarSeccionPoliza('1')" class="btn_transparente"> <i class="fa-solid fa-circle-plus"></i> </button></legend>
          <div id="AddPoliza" style="display: none;">
        
            <div class="row">
              <div class="col-sm-4" style="padding:0px;">
                <label for="CrearContratoPoliza_TipoPoliza" class="col-sm-6 col-form-label"><span style="color:red">*</span>Tipo de Póliza</label>
                <div class="col-sm-5" style="padding:0px;">
                  <SELECT type="text" class="form-control" id="CrearContratoPoliza_TipoPoliza" name="CrearContratoPoliza_TipoPoliza">
                    <option value="Ninguno">Seleccione</option>
                    <?php
                      $con = conectar();
                      $sql = "SELECT a.Nombre, a.Id from juridica_contrato_tipo_poliza a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
              <div class="col-sm-4" style="padding:0px;">
                <label for="CrearContratoPoliza_CompañiaPoliza" class="col-sm-6 col-form-label"><span style="color:red">*</span>Compañia de la Póliza</label>
                <div class="col-sm-5" style="padding:0px;">
                  <input type="text" class="form-control" autocomplete="off" id="CrearContratoPoliza_CompañiaPoliza" name="CrearContratoPoliza_CompañiaPoliza">
                </div>
              </div> 
              <div class="col-sm-4" style="padding:0px;">
                <label for="CrearContratoPoliza_NumPoliza" class="col-sm-6 col-form-label"><span style="color:red">*</span>Número de la Póliza</label>
                <div class="col-sm-5" style="padding:0px;">
                  <input type="text" class="form-control" autocomplete="off" id="CrearContratoPoliza_NumPoliza" name="CrearContratoPoliza_NumPoliza">
                </div>
              </div> 
            </div> 

            <br>

            <fieldset>
              <legend class="titulo_modal">Amparos Poliza</legend>
          
              <div class="row">
                <div class="col-sm-3" style="padding:0px;">
                  <label for="CrearContratoPoliza_TipoAmparo" class="col-sm-6 col-form-label"><span style="color:red">*</span>Amparo de Póliza</label>
                  <div class="col-sm-5" style="padding:0px;">
                    <SELECT type="text" class="form-control" id="CrearContratoPoliza_TipoAmparo" name="CrearContratoPoliza_TipoAmparo">
                      <option value="Ninguno">Seleccione</option>
                      <?php
                        $con = conectar();
                        $sql = "SELECT a.Nombre, a.Id from juridica_contrato_amparos a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
                <div class="col-sm-3" style="padding:0px;">
                  <label for="CrearContratoPoliza_FechaIniAmparo" class="col-sm-6 col-form-label"><span style="color:red">*</span>Fecha Inicio del Amparo</label>
                  <div class="col-sm-5" style="padding:0px;">
                    <input type="date" class="form-control" autocomplete="off" id="CrearContratoPoliza_FechaIniAmparo" name="CrearContratoPoliza_FechaIniAmparo">
                  </div>
                </div> 
                <div class="col-sm-3" style="padding:0px;">
                  <label for="CrearContratoPoliza_FechaFinAmparo" class="col-sm-6 col-form-label"><span style="color:red">*</span>Fecha FIn del Amparo</label>
                  <div class="col-sm-5" style="padding:0px;">
                    <input type="date" class="form-control" autocomplete="off" id="CrearContratoPoliza_FechaFinAmparo" name="CrearContratoPoliza_FechaFinAmparo">
                  </div>
                </div> 
                <div class="col-sm-3" style="padding:0px;">
                  <label for="CrearContratoPoliza_CuantiaAmparo" class="col-sm-6 col-form-label"><span style="color:red">*</span>Cuantía del Amparo</label>
                  <div class="col-sm-5" style="padding:0px;">
                    <input type="text" class="form-control" autocomplete="off" id="CrearContratoPoliza_CuantiaAmparo" name="CrearContratoPoliza_CuantiaAmparo">
                  </div>
                </div> 
              </div> 
              <br>
              <div class="row"><div class="col-sm-2"></div><div class="col-sm-3" style="padding:0px;"> <button class="btn btn-success" onclick="AdicionarAmparoPoliza()">Adicionar Amparo</button> </div> </div>
              <br>
              <div class="row">
                <div class="col-sm-12">
                  <table class="table table-striped" id="Tbl_Amparos_Poliza">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Amparo</th>
                        <th>Fecha Inicio</th>
                        <th>Fecha Fin</th>
                        <th>Días</th>
                        <th>Cuantia</th>
                        <th>Eliminar</th>
                      </tr>
                    </thead>
                  </table>
                </div>
              </div>
           </fieldset>

          <div class="row"> 
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-success" onclick="GuardarPolizaContrato()" >Guardar Póliza</button>
            </div>
          </div>
        </div>
        </fieldset>
       <br><br>

        <fieldset>
          <legend class="titulo_modal">Pólizas Cargadas <button title="Ampliar" data-toggle="tooltip" data-placement="top" onclick="MostrarSeccionPoliza('2')" class="btn_transparente"> <i class="fa-solid fa-circle-plus"></i> </button></legend>

          <div id="MostrarPoliza" style="display:none;">
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped" id="Tbl_Lista_Poliza">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Tipo Poliza</th>
                      <th>Compañia</th>
                      <th>Número de Póliza</th>
                      <th>Ver Amparos</th>
                      <th>Eliminar</th>
                    </tr>
                  </thead>
                </table>
              </div>
            </div>
          </div>
        </fieldset>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>





<!-- Large modal -->
<button type="button"  class="btn btn-primary" data-toggle="modal" id="Btn_Modal_AdicionarInfo" style="display:none;" data-target=".ModalAdicionarInfoCont">x</button>
<div class="modal fade ModalAdicionarInfoCont" style="z-index:1041 !important" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalAdicionarInfoCont">Adicionar Información al Contrato</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-sm-4" style="padding:0px;">
            <label for="CrearContratoAdicionar_TipoPersonaContratar" class="col-sm-6 col-form-label"><span style="color:red">*</span>Tipo de Persona a Contratar</label>
            <div class="col-sm-5" style="padding:0px;">
              <SELECT type="text" class="form-control" onChange="CargarContratistas('CrearContratoAdicionar_TipoPersonaContratar')" id="CrearContratoAdicionar_TipoPersonaContratar" name="CrearContratoAdicionar_TipoPersonaContratar">
                <option value="Ninguno" selected="true" >Seleccione</option>
                <?php
                  $con = conectar();
                  $sql = "SELECT a.Nombre, a.Id from juridica_contrato_tipo_persona a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
            <div class="col-sm-1 BtnAddPersonas" style="padding:0px;display: none;"><button class="btn btn_transparente"  data-toggle="tooltip" data-placement="top" title="Adicionar Contratistas"  onclick="CargarPersonasContratistas()" ><i class="fa-solid fa-user-plus fa-xs"></i></button></div>
          </div> 
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_FechaInicio" class="col-sm-6 col-form-label">Fecha de Acta de Inicio</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="date" class="form-control" autocomplete="off" id="CrearContratoAdicionar_FechaInicio" name="CrearContratoAdicionar_FechaInicio">
            </div>
          </div>          
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_FechaFin" class="col-sm-6 col-form-label">Fecha de Fin</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="date" class="form-control" autocomplete="off" id="CrearContratoAdicionar_FechaFin" name="CrearContratoAdicionar_FechaFin">
            </div>
          </div>
        </div>
        <br>
        <div class="row">
          
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_FechaContrato" class="col-sm-6 col-form-label"><span style="color:red">*</span>Fecha del Contrato</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="date" class="form-control" autocomplete="off" id="CrearContratoAdicionar_FechaContrato" name="CrearContratoAdicionar_FechaContrato">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_CompromisoPresupuestal" style="padding:0px;" class="col-sm-6 col-form-label">Compromiso Presupuestal (RP)</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" class="form-control" autocomplete="off" id="CrearContratoAdicionar_CompromisoPresupuestal" name="CrearContratoAdicionar_CompromisoPresupuestal">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_FechaCompromisoPresupuestal" style="padding:0px;" class="col-sm-6 col-form-label">Fecha del Compromiso Presupuestal (RP)</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="date" class="form-control" autocomplete="off" id="CrearContratoAdicionar_FechaCompromisoPresupuestal" name="CrearContratoAdicionar_FechaCompromisoPresupuestal">
            </div>
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_MontoCompromisoPresupuestal" style="padding:0px;" class="col-sm-6 col-form-label">Monto del Compromiso Presupuestal (RP)</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" class="form-control" autocomplete="off" onblur="ValidarMontosCdpRp()" id="CrearContratoAdicionar_MontoCompromisoPresupuestal" name="CrearContratoAdicionar_MontoCompromisoPresupuestal">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_OrdenadorGasto" style="padding:0px;" class="col-sm-6 col-form-label">Ordenador del Gasto</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" class="form-control" autocomplete="off" id="CrearContratoAdicionar_OrdenadorGasto" name="CrearContratoAdicionar_OrdenadorGasto">
            </div>
          </div>
          <div class="col-sm-4" style="padding:0px;">
            <label for="CrearContratoAdicionar_TipoGasto" class="col-sm-6 col-form-label">Tipo de Gasto</label>
            <div class="col-sm-5" style="padding:0px;">
              <SELECT type="text" class="form-control" id="CrearContratoAdicionar_TipoGasto" name="CrearContratoAdicionar_TipoGasto">
                <option value="Ninguno" disabled="true" selected="true">Seleccione</option>
                <?php
                  $con = conectar();
                  $sql = "SELECT a.Nombre, a.Id from juridica_contrato_tipo_gasto a where a.ACTIVO = 1 ORDER BY a.Nombre";
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
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_FechaPubSecop" style="padding:0px;" class="col-sm-6 col-form-label">Fecha de Publicación Secop</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="date" class="form-control" autocomplete="off" id="CrearContratoAdicionar_FechaPubSecop" name="CrearContratoAdicionar_FechaPubSecop">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_linkPubSecop" style="padding:0px;" class="col-sm-6 col-form-label">Link de Publicación Secop</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" class="form-control" autocomplete="off" id="CrearContratoAdicionar_linkPubSecop" name="CrearContratoAdicionar_linkPubSecop">
            </div>
          </div>
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_FechaPubGestTransp" style="padding:0px;" class="col-sm-6 col-form-label">Fecha de Publicación Gestión Transparente</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="date" class="form-control" autocomplete="off" id="CrearContratoAdicionar_FechaPubGestTransp" name="CrearContratoAdicionar_FechaPubGestTransp">
            </div>
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-sm-4">
            <label for="CrearContratoAdicionar_FechaTransCad" style="padding:0px;" class="col-sm-6 col-form-label">Fecha de Transferencia al CAD</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="date" class="form-control" autocomplete="off" id="CrearContratoAdicionar_FechaTransCad" name="CrearContratoAdicionar_FechaTransCad">
            </div>
          </div>
          <div class="col-sm-4">
            <button class="btn btn-primary" onclick='$("#btn_Modal_CargarSupervisores").click()'>Adicionar Supervisor</button>
          </div>
        </div>
      </div>  
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="btn_actualizar" onclick="ActualizarContrato()" >ACTUALIZAR DATOS</button>
        <button type="button" class="btn btn-danger" id="btn_desertar" style="display: none;" onclick="DesertarContrato()" >TERMINACIÓN ANTICIPADA</button>
        <button type="button" class="btn btn-danger" id="btn_anular" onclick="AnularContrato()" >ANULAR</button>
        <button type="button" class="btn btn-success" id="btn_Celebrar" onclick="GuardarInfoAdicionalContrato()" >CELEBRAR</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


<button data-toggle="modal" data-target="#DatosDesertarContrato" style="display: none;" id="btn_Modal_DatosDesertarContrato">x</button>
<!-- Modal -->
<div class="modal fade modal-stack" id="DatosDesertarContrato" tabindex="-1" role="dialog" aria-labelledby="DatosDesertarContratoLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="DatosAnularContratoLabel">Desertar Contrato</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-sm-6">
            <label for="CargarDatosDesertar_MotivoAnular" style="padding:0px;" class="col-sm-6 col-form-label"><span style="color:red">*</span>Motivo de Deserción</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" class="form-control" autocomplete="off" id="CargarDatosDesertar_MotivoAnular" name="CargarDatosDesertar_MotivoAnular">
            </div>
          </div>
          <div class="col-sm-6">
            <label for="CargarDatosDesertar_FechaAnular" style="padding:0px;" class="col-sm-5 col-form-label"><span style="color:red">*</span>Fecha de la Deserción</label>
            <div class="col-sm-7" style="padding:0px;">
              <input type="date" class="form-control" autocomplete="off" id="CargarDatosDesertar_FechaAnular" name="CargarDatosDesertar_FechaAnular">
            </div>
          </div>


      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-danger" onclick="Confirmardesertar()" data-dismiss="modal">Confirmar Desertar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>



<button data-toggle="modal" data-target="#DatosAnularContrato" style="display: none;" id="btn_Modal_DatosAnularContrato">x</button>
<!-- Modal -->
<div class="modal fade modal-stack" id="DatosAnularContrato" tabindex="-1" role="dialog" aria-labelledby="DatosAnularContratoLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="DatosAnularContratoLabel">Anular Contrato</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-sm-6">
            <label for="CargarDatosAnular_MotivoAnular" style="padding:0px;" class="col-sm-6 col-form-label"><span style="color:red">*</span>Motivo de anulación</label>
            <div class="col-sm-6" style="padding:0px;">
              <input type="text" class="form-control" autocomplete="off" id="CargarDatosAnular_MotivoAnular" name="CargarDatosAnular_MotivoAnular">
            </div>
          </div>
          <div class="col-sm-6">
            <label for="CargarDatosAnular_FechaAnular" style="padding:0px;" class="col-sm-5 col-form-label"><span style="color:red">*</span>Fecha de la anulación</label>
            <div class="col-sm-7" style="padding:0px;">
              <input type="date" class="form-control" autocomplete="off" id="CargarDatosAnular_FechaAnular" name="CargarDatosAnular_FechaAnular">
            </div>
          </div>


      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-danger" onclick="ConfirmarAnular()" data-dismiss="modal">Confirmar Anular</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
      maquillarNumero(document.getElementById("CrearContrato_Monto"));
      maquillarNumero(document.getElementById("CrearContratoDirect_TotalAportes"));
      maquillarNumero(document.getElementById("CrearContratoDirect_AportesVivaRecurso"));
      maquillarNumero(document.getElementById("CrearContratoDirect_AportesVivaEspecie"));
      maquillarNumero(document.getElementById("CrearContratoDirect_AportesMpioRecurso"));
      maquillarNumero(document.getElementById("CrearContratoDirect_AportesMpioEspecie"));
      maquillarNumero(document.getElementById("CrearContratoDirect_ValorOtrasFuentes"));
      maquillarNumero(document.getElementById("CrearContratoDirect_MontoDisponibilidad"));
      maquillarNumero(document.getElementById("CrearContratoSeleccion_TotalAportes"));
      maquillarNumero(document.getElementById("CrearContratoSeleccion_MontoDisponibilidad"));
      maquillarNumero(document.getElementById("CrearContratoSeleccion_AportesMpioEspecie"));
      maquillarNumero(document.getElementById("CrearContratoSeleccion_AportesVivaRecurso"));
      maquillarNumero(document.getElementById("CrearContratoSeleccion_AportesVivaEspecie"));
      maquillarNumero(document.getElementById("CrearContratoSeleccion_AportesMpioRecurso"));
      maquillarNumero(document.getElementById("CrearContratoSeleccion_ValorOtrasFuentes"));
      maquillarNumero(document.getElementById("CrearContratoAdicionar_MontoCompromisoPresupuestal"));
      maquillarNumero(document.getElementById("CrearContratoPoliza_CuantiaAmparo"));
      maquillarNumero(document.getElementById("AddInfoContratoProceso_ValorOtrasFuentes"));
   

      maquillarNumero(document.getElementById("CargarFuentesFinanciacion_AportesVivaEspecie"));
      maquillarNumero(document.getElementById("CargarFuentesFinanciacion_AportesVivaRecursos"));
      maquillarNumero(document.getElementById("CargarFuentesFinanciacion_AportesMpioRecursos"));
      maquillarNumero(document.getElementById("CargarFuentesFinanciacion_AportesMpioEspecie"));
      maquillarNumero(document.getElementById("CargarFuentesFinanciacion_TotalAportes"));

      CargarTipoAdjuntoContrato();
      $('#Tbl_ValorOtrasFuenta').DataTable({
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
       $('#Tbl_Lista_Poliza').DataTable({
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
      $('#Tbl_CargarContratistas').DataTable({
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
      $('#GridContratoArchivosCargados').DataTable({
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
      $('#Tbl_CargarSupervisores').DataTable({
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
      $('#Tbl_Amparos_Poliza').DataTable({
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


      $('#Tbl_VerAmparosPoliza').DataTable({
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