<?php include('../../header.php'); ?>
<link rel="stylesheet" type="text/css" href="../Administracion.css">
<script src="../Administracion.js"></script>
<?php require_once("../../Seguridad/conex.php"); ?>


<div class="row" style="margin-top:30px;">
  <div class="col-sm-4">
    <label for="ResumenGestionContFiltros_anio" class="col-sm-6 col-form-label titulo_modal">Año de Contrato</label>
    <div class="col-sm-6">
      <SELECT type="text" class="form-control" id="ResumenGestionContFiltros_anio" name="ResumenGestionContFiltros_anio">
        <option value="Ninguno" selected="true" disabled="true">Todos</option>
          <?php
            $con = conectar();
            $sql = "SELECT DISTINCT(YEAR(FECHA_SOLICITUD)) anio from juridica_contrato WHERE ACTIVO = 1 and FECHA_SOLICITUD is not null order by FECHA_SOLICITUD desc";
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

  <div class="col-sm-4">
    <label for="ResumenGestionContFiltros_Mes" class="col-sm-6 col-form-label titulo_modal">Mes de Contrato</label>
    <div class="col-sm-6">
      <SELECT type="text" class="form-control" id="ResumenGestionContFiltros_Mes" name="ResumenGestionContFiltros_Mes">
        <option value="Ninguno" selected="true" disabled="true">Todos</option>
        <?php
            $con = conectar();
            $sql = "SELECT DISTINCT(month(FECHA_SOLICITUD)) mes from juridica_contrato WHERE ACTIVO = 1 and FECHA_SOLICITUD is not null order by FECHA_SOLICITUD desc";
            $query = mysqli_query($con,$sql);
            if(mysqli_num_rows($query)>0){
              while($dato = mysqli_fetch_assoc($query)){
                echo "<option value=".$dato['mes'].">".$dato['mes']."</option>";
              }
            }
            mysqli_close($con);
          ?>
      </SELECT>
    </div>
  </div>
  <div class="col-sm-4">
    <button class="btn btn-success" onclick="FiltrarResultadosResumenGestionCont()">Filtrar Resultados</button>
    <button id="Btn_ReporteMensualContrato" style="display:none;" class="btn btn_transparente titulo_modal" title="Descargar Reporte en  Excel" data-toggle="tooltip" data-placement="top" onclick="GenerarReporteMensualContrato()"><i class="fa-regular fa-file-excel"></i></button>
  </div>
</div>

<br>
<fieldset><legend class="titulo_modal">Resumen Total</legend>
<div class="row">
  <div class="col-md-12">
    <table class="table table-striped" id="Tbl_ResumenGestionDocumental_Total">
      <thead>
        <tr>
          <th width="10%" >Nombre</th>
          <th width="10%" >Cantidad</th>
        </tr>
      </thead>
    </table>
  </div>
</div>
</fieldset>
<br>
<fieldset><legend class="titulo_modal">Detalle</legend>
<div class="row">
  <div class="col-md-12">
    <table class="table table-striped" id="Tbl_ResumenGestionDocumental">
      <thead>
        <tr>
          <th width="10%" >Tipo de Proceso</th>
          <th width="30%" >Tipo de Contrato</th>
          <th width="10%" >Cantidad de Contratos</th>
          <th width="20%" >Dirección</th>
          <th width="10%" >Cantidad de Contratos</th>
          <th width="10%" >Contratos Desiertos</th>
          <th width="10%" >Contratos Anulados</th>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <th colspan="2">TOTAL</th>
          <th id="Total1"></th>
          <th>TOTAL</th>
          <th id="Total2"></th>
          <th id="Total3"></th>
          <th id="Total4"></th>
        </tr>
      </tfoot>
    </table>
  </div>
</div>
</fieldset>q 
<script type="text/javascript">
    $(document).ready(function(){
        $('#Tbl_ResumenGestionDocumental').DataTable({
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


        $('#Tbl_ResumenGestionDocumental_Total').DataTable({
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

<?php include('../../footer.php'); ?>