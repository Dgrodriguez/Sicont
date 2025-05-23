<?php include('../header.php'); ?>
<script src="configuracion.js"></script>
<link rel="stylesheet" type="text/css" href="configuracion.css">
<br>
   <div class="row">
      <div class="form-group">
         <div class="col-md-6">
            <label for="CrearPerfil_Nombre"><span style="color:red">*</span>Nuevo Perfil:</label>
            <input type="text" class="form-control" id="CrearPerfil_Nombre" name="CrearPerfil_Nombre" placeholder="Ingresa el nombre del nuevo Perfil">
         </div>
      </div>
   </div>
   <br>

   <button onclick="GuardarNuevoPerfil()" class="btn btn-success">Crear Perfil</button>
   <br>
   <br>
   <div class="row"><div class="col-md-2"></div><div class="col-md-6">
   <table id="Tbl_Listado_Perfil"  class="table table-striped">
      <thead>
         <tr>
            <th>#</th>
            <th>Perfil</th>
         </tr>
      </thead>
   </table>
   </div></div>
<script type="text/javascript">
   $(document).ready(function(){
      $('#Tbl_Listado_Perfil').DataTable({
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
      ListarPerfil();
   });
</script>      
<?php include('../footer.php'); ?>
