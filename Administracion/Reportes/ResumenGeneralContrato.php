<?php include('../../header.php'); ?>
<link rel="stylesheet" type="text/css" href="../Administracion.css">
<script src="../Administracion.js"></script>
<?php require_once("../../Seguridad/conex.php"); ?>


<div class="row" style="margin-top:30px;">
  <div class="col-sm-3">
    <label for="ResumenGenContr_Vigencia" style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Vigencia de Contrato</label>
    <div class="col-sm-8">
      <SELECT type="text" class="form-control" id="ResumenGenContr_Vigencia" name="ResumenGenContr_Vigencia">
        <option value="Ninguno" selected="true" disabled="true">Todas</option>
          <?php
            $con = conectar();
            $sql = "SELECT DISTINCT(YEAR(FECHA_CONTRATO)) anio from vw_reporte_contrato_general ";
            $query = mysqli_query($con,$sql);
            if(mysqli_num_rows($query)>0){
              while($dato = mysqli_fetch_assoc($query)){
                echo "<option value=".$dato['anio'].">".$dato['anio']."</option>";
              }
            }
            mysqli_close($con);
          ?>
      </SELECT>
    </div>
  </div>

  <div class="col-sm-3">
    <label for="ResumenGenContr_Modalidad" style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Modalidad</label>
    <div class="col-sm-8">
      <SELECT type="text" class="form-control" id="ResumenGenContr_Modalidad" name="ResumenGenContr_Modalidad">
        <option value="Ninguno" selected="true" disabled="true">Todos</option>
        <?php
            $con = conectar();
            $sql = "SELECT Id,Nombre from juridica_contrato_tipo_modalidad WHERE ACTIVO = 1 order by Nombre";
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
  <div class="col-sm-3">
    <label for="ResumenGenContr_TipoContrato" style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Tipo de Contrato</label>
    <div class="col-sm-8">
      <SELECT type="text" class="form-control" id="ResumenGenContr_TipoContrato" name="ResumenGenContr_TipoContrato">
        <option value="Ninguno" selected="true" disabled="true">Todos</option>
        <?php
            $con = conectar();
            $sql = "SELECT Id,Nombre from cfg_tipo_contrato WHERE ACTIVO = 1 order by Nombre";
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
  <div class="col-sm-3">
    <label for="ResumenGenContr_Direc"  style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Dirección o Proyecto</label>
    <div class="col-sm-8">
      <SELECT type="text" class="form-control" id="ResumenGenContr_Direc" name="ResumenGenContr_Direc">
        <option value="Ninguno" selected="true" disabled="true">Todos</option>
        <?php
            $con = conectar();
            $sql = "SELECT ID,NOMBRE from cfg_areas_depto WHERE ACTIVO = 1 order by NOMBRE";
            $query = mysqli_query($con,$sql);
            if(mysqli_num_rows($query)>0){
              while($dato = mysqli_fetch_assoc($query)){
                echo "<option value=".$dato['ID'].">".$dato['NOMBRE']."</option>";
              }
            }
            mysqli_close($con);
          ?>
      </SELECT>
    </div>
  </div>
</div>





<div class="row" style="margin-top:30px;">
  <div class="col-sm-3">
    <label for="ResumenGenContr_FechaIniFirmaContrato" style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Fecha de Inicio Firma Contrato</label>
    <div class="col-sm-8">
      <input type="date" class="form-control" Name="ResumenGenContr_FechaIniFirmaContrato" Id="ResumenGenContr_FechaIniFirmaContrato">
    </div>
  </div>

  <div class="col-sm-3">
    <label for="ResumenGenContr_FechaFinFirmaContrato" style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Fecha de Fin Firma Contrato</label>
    <div class="col-sm-8">
      <input type="date" class="form-control" Name="ResumenGenContr_FechaFinFirmaContrato" Id="ResumenGenContr_FechaFinFirmaContrato">
    </div>
  </div>
  <div class="col-sm-3">
    <label for="ResumenGenContr_FechaIniEjecContrato" style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Fecha de Inicio Ejecución</label>
    <div class="col-sm-8">
      <input type="date" class="form-control" Name="ResumenGenContr_FechaIniEjecContrato" Id="ResumenGenContr_FechaIniEjecContrato">
    </div>
  </div>
  <div class="col-sm-3">
    <label for="ResumenGenContr_FechaFinEjecContrato"  style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Fecha de Fin Ejecución</label>
    <div class="col-sm-8">
      <input type="date" class="form-control" Name="ResumenGenContr_FechaFinEjecContrato" Id="ResumenGenContr_FechaFinEjecContrato">
    </div>
  </div>
</div>



<div class="row" style="margin-top:30px;">
  <div class="col-sm-3">
    <label for="ResumenGenContr_AreaProyecto" style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Área o Proyecto</label>
    <div class="col-sm-8">
      <SELECT type="text" class="form-control" id="ResumenGenContr_AreaProyecto" name="ResumenGenContr_AreaProyecto">
        <option value="Ninguno" selected="true" disabled="true">Todas</option>
          <?php
            $con = conectar();
            $sql = "SELECT Id,Nombre from cfg_areas_proceso WHERE ACTIVO = 1 order by Nombre";
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

  <div class="col-sm-3">
    <label for="ResumenGenContr_Supervisor" style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Supervisor</label>
    <div class="col-sm-8">
      <SELECT type="text" class="form-control" id="ResumenGenContr_Supervisor" name="ResumenGenContr_Supervisor">
        <option value="Ninguno" selected="true" disabled="true">Todos</option>
          <?php
            $con = conectar();
            $sql = "SELECT DISTINCT(a.Nombre) Supervisor from juridica_contrato_supervisor a ORDER BY a.Nombre";
            $query = mysqli_query($con,$sql);
            if(mysqli_num_rows($query)>0){
              while($dato = mysqli_fetch_assoc($query)){
                echo "<option value=".$dato['Supervisor'].">".$dato['Supervisor']."</option>";
              }
            }
            mysqli_close($con);
          ?>
      </SELECT>
    </div>
  </div>
  <div class="col-sm-3">
    <label for="ResumenGenContr_EstadoContrato" style="padding: 0px;" class="col-sm-4 col-form-label titulo_modal">Estado Contrato</label>
    <div class="col-sm-8">
      <SELECT type="text" class="form-control" id="ResumenGenContr_EstadoContrato" name="ResumenGenContr_EstadoContrato">
        <option value="Ninguno" selected="true" disabled="true">Todos</option>
        <?php
            $con = conectar();
            $sql = "SELECT Id,Nombre from juridica_contrato_tipo_estado WHERE ACTIVO = 1 order by Nombre";
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
  <div class="col-sm-3">
    <button class="btn btn-success" onclick="FiltrarResultadosGeneralContraros()">Filtrar</button>
    <button class="btn btn_transparente" title="Descargar excel de lo filtrado" data-toggle="tooltip" data-placement="top" onclick="GenerarResultadosGeneralContraros()"> <i class="fa-regular fa-file-excel"></i> </button>
  </div>
</div>

<br>
<div class="row" style="overflow-x: auto;display: none;" id="DivResumenGenContr_Reporte_Total">
  <div class="col-md-12">
    <table class="table table-striped table-bordered" id="Tbl_ResumenGenContr_Reporte_Total">
      <thead>
        <tr>
          <th> # </th>
          <th style="min-width: 102px;"> NÚMERO DE CONTRATO </th>
          <th style="min-width: 102px;"> ROL JURÍDICO </th>
          <th style="min-width: 102px;"> ROL LOGÍSTICO </th>
          <th style="min-width: 102px;"> ROL TÉCNICO </th>
          <th style="min-width: 102px;"> TIPO DE CONTRATO </th>
          <th style="min-width: 102px;"> MODALIDAD </th>
          <th style="min-width: 102px;"> CONTRATISTA </th>
          <th style="min-width: 102px;"> IDENTIFICACIÓN  </th>
          <th> DV </th>
          <th style="min-width: 102px;"> OBJETO </th>
          <th style="min-width: 102px;"> TOTAL DE APORTES </th>
          <th style="min-width: 102px;"> APORTES VIVA RECURSO </th>
          <th style="min-width: 102px;"> APORTES VIVA ESPECIE </th>
          <th style="min-width: 102px;"> APORTES MUNICIPIO RECURSO </th>
          <th style="min-width: 102px;"> APORTES MUNICIPIO ESPECIE </th>
          <th style="min-width: 102px;"> VALOR OTRAS FUENTES </th>
          <th style="min-width: 102px;"> NOMBRE(S) OTRAS FUENTES </th>
          <th style="min-width: 102px;"> SEGMENTO </th>
          <th> PLAZO </th>
          <th style="min-width: 102px;"> DIRECCIÓN O JEFATURA </th>
          <th style="min-width: 102px;"> AREA O PROYECTO </th>
          <th style="min-width: 102px;"> ORDENADOR DEL GASTO </th>
          <th style="min-width: 102px;"> SUPERVISOR </th>
          <th style="min-width: 102px;"> FECHA DEL CONTRATO </th>
          <th style="min-width: 102px;"> FECHA DE INICIO </th>
          <th style="min-width: 102px;"> FECHA DE TERMINACIÓN </th>
          <th style="min-width: 102px;"> ESTADO </th>
          <th style="min-width: 102px;"> PUBLICADOS EN SECOP </th>
          <th style="min-width: 102px;"> LINK EN SECOP </th>
          <th style="min-width: 102px;"> PUBLICADOS EN GESTIÓN TRANSPARENTE </th>
        </tr>
      </thead>
    </table>
  </div>
</div>

<script type="text/javascript">
  $(document).ready(function(){
    $('#Tbl_ResumenGenContr_Reporte_Total').DataTable({
      "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
      },
      "pageLength": 50,
      "lengthChange": false,
      "orderable": false,
      "searching": false,
      "dom": '<"datatable-header"l>rtip',
      "drawCallback": function(settings) {
        $('div.dataTables_length').hide();
      }
    });

    $('[data-toggle="tooltip"]').tooltip();
  });
</script>

<?php include('../../footer.php'); ?>