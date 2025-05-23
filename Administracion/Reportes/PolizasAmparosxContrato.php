<?php include('../../header.php'); ?>
<link rel="stylesheet" type="text/css" href="../Administracion.css">
<script src="../Administracion.js"></script>
<?php require_once("../../Seguridad/conex.php"); ?>

<input type="hidden" Id="IdContrato">

<div class="row">
  <div class="col-md-6">
    <label for="PolizasAmparosContr_ContratoBuscarId" class="col-sm-6 col-form-label titulo_modal"><span style="color:red">*</span>Buscar Nro de Contrato</label>
    <div class="col-sm-6">
      <input type="text" Id="PolizasAmparosContr_ContratoBuscarId" onkeyup="BuscarContratoReporteAdmin()" title="Ingrese el número de contrato/Proceso a buscar" data-toggle="tooltip" data-placement="top" name="PolizasAmparosContr_ContratoBuscarId" class="form-control" autocomplete="off">
      <ul id="PolizasAmparosContr_ContratoBuscarId_List"></ul>
    </div>
  </div>

  <div class="col-sm-4" id="Div_Btn_PolizasAmparosContr_ReporteExcel" style="display:none;">
    <button class="btn btn_transparente titulo_modal" data-toggle="tooltip" data-placement="top" title="Descargar Reporte" onclick="ReporteExcelPolizasAmparosContr()"><i class="fa-regular fa-file-excel"></i></button>
  </div>
</div>

<br>
<div class="row" id="Div_Reporte_PolizasAmparosContr" style="display:none;">
  <div class="col-md-12">
    <table id="Tbl_Reporte_PolizasAmparosContr" class="table table-striped" >
      <thead>
        <tr>
          <th>#</th>
          <th>Contrato Número</th>
          <th>Estado Contrato</th>
          <th>Compañia de Seguros</th>
          <th>Número de Póliza</th>
          <th>Tipo de Póliza</th>
          <th>Amparo</th>
          <th>Fecha Inicio de Amparo</th>
          <th>Fecha Final de Amparo</th>
          <th>Cuantia de Amparo</th>
        </tr>
      </thead>
    </table>
  </div>
</div>


<script type="text/javascript">
    $(document).ready(function(){
        $('#Tbl_Reporte_PolizasAmparosContr').DataTable({
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