<?php include('../header.php'); ?>
<script src="configuracion.js"></script>
<link rel="stylesheet" type="text/css" href="configuracion.css">
<div class="container">
<br>
<input type="hidden" id="IdPadre">
      <div class="row">
         <div class="form-group">
            <label for="CrearMenu_Nombre"><span style="color:red">*</span>Nuevo Menú:</label>
            <input type="text" class="form-control" id="CrearMenu_Nombre" name="CrearMenu_Nombre" placeholder="Ingresa el nombre del nuevo menú">
         </div>
         <div class="form-group">
            <label for="CrearMenu_Formulario">Url Formulario:</label>
            <input type="text" class="form-control" id="CrearMenu_Formulario" name="CrearMenu_Formulario" placeholder="Ingresa la Url del Formulario">
         </div>
         <div class="form-group">
            <label for="CrearMenu_IdPadre">Padre:</label>
            <input type="text" class="form-control" onkeyup="BuscarPadreMenu()" id="CrearMenu_IdPadre" name="CrearMenu_IdPadre" placeholder="buscar el padre">
            <ul id="CrearMenu_IdPadre_List"></ul>
         </div>
         <div class="form-group">
            <label for="CrearMenu_Icono">Icono:</label>
            <input type="text" class="form-control" id="CrearMenu_Icono" name="CrearMenu_Icono" placeholder="Ingresa el Icono del menú">
         </div>
         <div class="form-group">
            <label for="CrearMenu_Orden">Orden:</label>
            <input type="number" class="form-control" id="CrearMenu_Orden" name="CrearMenu_Orden" placeholder="Ingresa el Orden del menú">
         </div>
      </div>
      <button onclick="GuardarNuevoMenu()" class="btn btn-success">Crear</button>
      <br>
      <br>
      <div class="row"><div class="col-md-12">
      <table id="Tbl_Listado_Menu"  class="table table-striped">
         <thead>
            <tr>
               <th>#</th>
               <th>Nombre</th>
               <th>Url</th>
               <th>Padre</th>
               <th>Icono</th>
            </tr>
         </thead>
      </table>
      </div></div>

</div>
<script type="text/javascript">
   $(document).ready(function(){
      $('#Tbl_Listado_Menu').DataTable({
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
      CargarListarOpcionesMenu();

   });
</script>      
<?php include('../footer.php'); ?>
