<?php include('../header.php'); ?>
<script src="configuracion.js"></script>
<link rel="stylesheet" type="text/css" href="configuracion.css">
<div class="container">
<br>

      <div class="row">
         <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
            <div class="form-group">
               <label for="nombre">Nombre:</label>
               <input type="text" class="form-control" id="CrearUsu_Nombre" placeholder="Ingresa el nombre">
            </div>
            <div class="form-group">
               <label for="apellido">Apellido:</label>
               <input type="text" class="form-control" id="CrearUsu_Apellido" placeholder="Ingresa el apellido">
            </div>
            <div class="form-group">
               <label for="apellido">Usuario:</label>
               <input type="text" class="form-control" id="CrearUsu_Usuario" placeholder="Ingresa el apellido">
            </div>
            <div class="form-group">
               <label for="CrearUsu_Estado">Activo:</label>
               <select class="form-control" name="CrearUsu_Estado" id="CrearUsu_Estado" style="width:150px;">
                  <option value="Ninguno">Seleccione</option>
                  <option value="1">SI</option>
                  <option value="0">NO</option>
                </select> 
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
      <button onclick="GuardarUsuario()" class="btn btn-success">Crear</button>

</div>

<?php include('../footer.php'); ?>
