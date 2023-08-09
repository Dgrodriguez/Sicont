<?php include('../header.php'); ?>
<script src="configuracion.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#GridUsuariosCargados').DataTable({
      "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
      },
      "pageLength": 50,
      "lengthChange": false
    });

    GridUsuariosCargados();
  });
</script>
<link rel="stylesheet" type="text/css" href="configuracion.css">
<div class="container">
<br>
<input type="hidden" id="Id_Usuario">
      <div class="row">
         <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
            <div class="form-group">
               <label for="CrearUsu_Nombre">Nombre:</label>
               <input type="text" class="form-control" name="CrearUsu_Nombre" id="CrearUsu_Nombre" placeholder="Ingresa el nombre">
            </div>
            <div class="form-group">
               <label for="CrearUsu_Apellido">Apellido:</label>
               <input type="text" class="form-control" name="CrearUsu_Apellido" id="CrearUsu_Apellido" placeholder="Ingresa el apellido">
            </div>
            <div class="form-group">
               <label for="CrearUsu_Usuario">Usuario:</label>
               <input type="text" readonly="true" disabled="true" class="form-control" name="CrearUsu_Usuario" id="CrearUsu_Usuario" placeholder="Ingresa el apellido">
            </div>
            <div class="form-group">
               <label for="CrearUsu_Estado">Activo:</label>
               <select class="form-control" name="CrearUsu_Estado" id="CrearUsu_Estado" style="width:150px;">
                  <option value="Ninguno">Seleccione</option>
                  <option value="1">SI</option>
                  <option value="0">NO</option>
                </select> 
            </div>

            <div class="form-group row" id="DivRestaurar" style="display:none">
              <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4">
               <button onclick="RestaurarClave()"  class="btn btn-warning">Restaurar contraseña</button></div>
               <div class="offset-sm-1 offset-md-1 offset-lg-1 offset-xl-1 col-sm-4 col-md-4 col-lg-4 col-xl-4"><button onclick="GuardarUsuarioActualizar()" class="btn btn-success">Actualizar</button></div>

            </div>
         </div>
         <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">

            <div class="container mt-4" style="max-width: 300px;">
              <fieldset style="max-height: 300px; max-width: 300px; overflow-y: auto;">
                <legend>Lista de perfiles</legend>
                <?php
                require_once("../Seguridad/conex.php");
                $conn = conectar();
                $sql = "SELECT ID, PERFIL FROM USUARIOS_CFG_PERFILES WHERE ACTIVO = '1' ORDER BY PERFIL ASC";
                $result = mysqli_query($conn, $sql);
                if ($result->num_rows > 0) {
                  while($row = mysqli_fetch_assoc($result)) {
                    echo '<div class="form-check">';
                    echo '<input class="form-check-input perfiles" Perfil_Value="' . $row["ID"] . '" type="checkbox" name="perfiles[]" value="' . $row["ID"] . '" id="perfil_' . $row["ID"] . '"> ';
                    echo '<label class="form-check-label" for="perfil_' . $row["ID"] . '">' . $row["PERFIL"] . '</label>';
                    echo '</div>';
                  }
                } else {
                  echo "No se encontraron perfiles.";
                }
                mysqli_close($conn);
                ?>
              </fieldset>
            </div>

         </div>
      </div>
</div>

<table id="GridUsuariosCargados" class="table-striped tabla-alternada-centrada">
  <thead>
    <tr>
      <th><center>ID</center></th>
      <th><center>Nombre</center></th>
      <th><center>Apellido</center></th>
      <th><center>Usuario</center></th>
      <th><center>Estado</center></th>
      <th><center>Acciones</center></th>
    </tr>
  </thead>
</table>
<?php include('../footer.php'); ?>
