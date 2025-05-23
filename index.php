<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>SICONT</title>
		<link rel="shortcut icon" type="image/png" href="img/favicon_viva.png"/>

      <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <!-- jQuery -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <!-- Bootstrap JS -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <!-- Font Awesome -->
      <link href="./librerias/fontawesome/css/all.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
		  <!-- SweetAlert2 -->
	  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	  <!-- Toastr -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

   <style>
		body {
			background-color: #f8f9fa;
			background-image: url('img/fondo_login.jpg'); /* Reemplaza 'tu_imagen.jpg' con la URL de tu imagen de fondo */
		    background-size: cover; /* Ajusta el tamaño de la imagen para cubrir todo el cuerpo */
		    background-repeat: no-repeat; /* Evita que la imagen se repita */
		    background-attachment: fixed; /* Fija la imagen para que no se desplace con el contenido */
		    background-position: center; /* Centra la imagen en el cuerpo */
		}

	.container-fluid {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
	}

	.card {
		border-radius: 15px;
		box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.2);
		background-color: #ffffff;
		padding: 20px;
		max-width: 500px;
	}

	h3 {
		text-align: center;
		font-weight: bold;
		font-size: 32px;
		color: #343a40;
	}

	form {
		margin-top: 30px;
	}

	label {
		font-weight: bold;
		color: #343a40;
	}

	.btn-login {
		background-color: #007bff;
		color: #fff;
		border-color: #007bff;
		padding: 10px 20px;
		font-size: 18px;
		font-weight: bold;
		border-radius: 10px;
		margin-top: 20px;
		width: 100%;
		transition: all .3s ease-in-out;
	}

	.btn-login:hover {
		background-color: #0069d9;
		border-color: #0062cc;
	}

	@media only screen and (max-width: 576px) {
		.card {
			margin-top: 20%;
		}

		h3 {
			font-size: 24px;
		}
	}
	</style>
	<script type="text/javascript">
		
		function loguearse() {

			var usuario = $("#usuario").val();
			var clave = $("#password").val();

		  $.ajax({
		    url: "Seguridad/seguridad.php",
		    method: "POST",
		    dataType: 'text',
		    data:{usuario:usuario,clave:clave},
		    success: function(respuesta) {
			     if(respuesta.trim()==="SI"){
			     		toastr.success('¡Logueo Exitoso!','Exito!');
			     		var random = Math.floor(Math.random() * 1000);
			     		window.location.href = "administracion.php?Id="+random;
			     }else if(respuesta.trim()=="Restaurar"){

			     	Swal.fire({
						  icon: 'warning',
						  title: 'Cambio de Clave Requerido!',
						  text: 'A continuación será redirigido a un formulario para actualizar su contraseña!',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: 'OK',
						}).then((result) => {
						  if (result.isConfirmed) {
								document.cookie = "usuario=" + usuario;
								window.location.href="Seguridad/CambioClave.php";					   
						  }
						});
			     }else{
			     		 toastr.error('¡Verifique sus credenciales!','Error!');
			     }
		    },
		    error: function(jqXHR, estado, error) {
		      console.log("Ha ocurrido un error: " + error);
		    }
		  });
		}
	</script>
</head>
<body>
	<div class="container-fluid">
		<div class="card shadow-lg">
			<div class="card-header">
				<h3 class="mb-0">Iniciar sesión</h3>
			</div>
			<div class="card-body">
				<form class="form" role="form" autocomplete="off">
					<div class="form-group">
						<label for="email">Usuario</label>
						<input type="text" autocomplete="off" class="form-control form-control-lg rounded-0" id="usuario" required="true">
					</div>
					<div class="form-group">
						<label for="password">Contraseña</label>
						<input type="password" class="form-control form-control-lg rounded-0" id="password" required="true" autocomplete="off">
					</div>
					<button type="button" onclick="loguearse()" class="btn btn-primary btn-lg float-right">Ingresar</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
