<?php include('../header.php'); ?>
<script src="configuracion.js"></script>
<link rel="stylesheet" type="text/css" href="configuracion.css">
<div class="container">
<br>
<input type="hidden" id="IdPerfil">
      <div class="row">
         <div class="form-group">
            <label for="VincularMenuPerf_Perfil">Perfil:</label>
            <input type="text" class="form-control" onkeyup="BuscarPerfil()" autocomplete="off" id="VincularMenuPerf_Perfil" name="VincularMenuPerf_Perfil" placeholder="Buscar el Usuario">
            <ul id="VincularMenuPerf_Perfil_List"></ul>
         </div>
      </div>
      <button onclick="GuardarVinculacionMenuPerfil()" class="btn btn-success">Guardar</button>
      <br>
      <br>
      <div class="row"><div class="col-md-12">
      <table id="Tbl_Listado_pefil"  class="table table-striped">
         <thead>
            <tr>
               <th style="width:10%">#</th>
               <th style="width:10%">Seleccione</th>
               <th>Perfil</th>
            </tr>
         </thead>
      </table>
      </div></div>

</div>
<script type="text/javascript">
   $(document).ready(function(){
      $('#Tbl_Listado_pefil').DataTable({
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
      ListarOpcionesMenu();

   });
</script>      
<?php include('../footer.php'); ?>
