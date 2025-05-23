<?php include('../../header.php'); ?>
<link rel="stylesheet" type="text/css" href="../Transporte.css">
<script src="../Transporte.js"></script>
<?php require_once("../../Seguridad/conex.php"); ?>

<div class="row"  style="margin-top:30px;">
	
	<div class="col-md-4">
	  <label for="TranInforServ_MesReporte"  class="col-md-5 titulo_modal"><span style="color:red">*</span> Mes del Informe</label>
      <div class="col-md-6">
          <select class="form-control" id="TranInforServ_MesReporte" name="TranInforServ_MesReporte">
          	  <option value="Ninguno">Seleccione</option>
          	  <option value="01">Enero</option>
			  <option value="02">Febrero</option>
			  <option value="03">Marzo</option>
			  <option value="04">Abril</option>
			  <option value="05">Mayo</option>
			  <option value="06">Junio</option>
			  <option value="07">Julio</option>
			  <option value="08">Agosto</option>
			  <option value="09">Septiembre</option>
			  <option value="10">Octubre</option>
			  <option value="11">Noviembre</option>
			  <option value="12">Diciembre</option>
          </select>
      </div>
	</div>

	<div class="col-md-4">
	  <label for="TranInforServ_AnioReporte"  class="col-md-5 titulo_modal"><span style="color:red">*</span> Año del Informe</label>
      <div class="col-md-6">
          <select class="form-control" id="TranInforServ_AnioReporte" name="TranInforServ_AnioReporte">
		      <option value="Ninguno">Seleccione</option>
		      <?php 
			      $con = conectar();
			      $sql = "SELECT DISTINCT YEAR(FechaSalida) AS Anio FROM trans_servicios ORDER BY Anio DESC";
			      $query = mysqli_query($con, $sql);
			      mysqli_close($con);
			      while ($dato = mysqli_fetch_array($query)) {
			        echo "<option value='" . $dato['Anio'] . "'>" . $dato['Anio'] . "</option>";
			      }
		      ?>
		    </select>  
        </div>
	</div>
	<div class="col-md-4">
		<button class="btn btn-success" onclick="CargarInformeServicio()">Buscar</button>
	</div>
</div>

<?php include('../../footer.php'); ?>