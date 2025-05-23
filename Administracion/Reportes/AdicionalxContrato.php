<?php include('../../header.php'); ?>
<link rel="stylesheet" type="text/css" href="../Administracion.css">
<script src="../Administracion.js"></script>
<?php require_once("../../Seguridad/conex.php"); ?>


<div class="row" style="margin-top:30px;">
  <div class="col-sm-4">
    <label for="InfoAdicxContrFiltros_anio" class="col-sm-6 col-form-label titulo_modal">Año de Contrato</label>
    <div class="col-sm-6">
      <SELECT type="text" class="form-control" id="InfoAdicxContrFiltros_anio" name="InfoAdicxContrFiltros_anio">
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
    <label for="InfoAdicxContrFiltros_Mes" class="col-sm-6 col-form-label titulo_modal">Mes de Contrato</label>
    <div class="col-sm-6">
      <SELECT type="text" class="form-control" id="InfoAdicxContrFiltros_Mes" name="InfoAdicxContrFiltros_Mes">
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
    <button class="btn btn-success" onclick="FiltrarResultadosInfoAdicxContr()">Filtrar Resultados</button>
    <button id="Btn_ReporteInfoAdicxContr" style="display:none;" class="btn btn_transparente titulo_modal" title="Descargar Reporte en  Excel" data-toggle="tooltip" data-placement="top" onclick="GenerarReporteInfoAdicxContr()"><i class="fa-regular fa-file-excel"></i></button>
  </div>
</div>

<br>
<div class="row">
  <div class="col-md-12">
    <table class="table table-striped" id="Tbl_ResumenGestionCont">
      <thead>
        <tr>
          <th width="1%" rowspan="2">#</th>
          <th width="10%" rowspan="2">Número de Contrato</th>
          <th width="10%" rowspan="2">Fecha de Solicitud</th>
          <th width="10%" rowspan="2">Fecha Inicio</th>
          <th width="10%" rowspan="2">Fecha Fin</th>
          <th width="29%" colspan="3">Compromiso Presupuestal</th>
          <th width="10%" rowspan="2">Fecha Gest. Transp.</th>
          <th width="10%" rowspan="2">Fecha Trans. CAD</th>
          <th width="20%" colspan="2">Publicación en Secop</th>
        </tr>
        <tr>
          <th>Número</th>
          <th>Fecha</th>
          <th>Monto</th>
          <th>Fecha</th>
          <th>Link</th>
        </tr>
      </thead>
    </table>
  </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
      $('#Tbl_ResumenGestionCont').DataTable({
        "language": {
          "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        "pageLength": 50,
        "lengthChange": false,
        "searching": false,
        "dom": '<"datatable-header"l>rtip',
        "drawCallback": function(settings) {
          $('div.dataTables_length').hide();
        },
        "columnDefs": [
          {
            "targets": 11, // El índice de la columna "Link" (ten en cuenta que DataTables comienza a contar desde 0)
            "width": "15%", // Ancho máximo del 30%
            "sWidth": "50px" // Ancho inicial (ajusta según tus necesidades)
          }
        ]
      });

      $('[data-toggle="tooltip"]').tooltip();
    });

</script>

<?php include('../../footer.php'); ?>