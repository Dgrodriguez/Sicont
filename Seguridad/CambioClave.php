<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cambio de Clave</title>
	  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	    <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		  <!-- SweetAlert2 -->
	  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	  <!-- Toastr -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script type="text/javascript">
		
		function ActualizarClave() {
		    var password = $('#password').val();
		    var passwordConfirm = $('#password-confirm').val();
		    if (password.length < 6 || !/\d/.test(password) || !/[a-zA-Z]/.test(password)) {
		      Swal.fire({
		        icon: 'warning',
		        title: 'Error',
		        text: 'La contraseña debe tener al menos 6 caracteres y contener números y letras.',
		        confirmButtonText: 'OK'
		      });
		      return;
		    }
		    if (password != passwordConfirm) {
		      toastr.error('Las contraseñas no coinciden!');
		      return;
		    }else{
		    	var usuario = document.cookie.replace(/(?:(?:^|.*;\s*)usuario\s*\=\s*([^;]*).*$)|^.*$/, "$1");
			    // Si las contraseñas son válidas, puedes enviar el formulario
			    $.ajax({
				    url: "../Configuracion/Configuracion.php",
				    method: "POST",
					data:{opcion:"CambiarClave",password:password,usuario:usuario },

				    success: function(respuesta) {
				    	if(respuesta.trim()=="OK"){
				    		window.location.href="../index.php";	
				    	}
				    },error: function(jqXHR, estado, error) {
				      console.log("Ha ocurrido un error: " + error);
				    }
				});
			}
		}

		function validarPassword(input) {
		  const password = input.value.trim();
		  const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
		  if (!regex.test(password)) {
		    toastr.error('La contraseña debe contener al menos 6 caracteres y contener al menos una letra y un número.');
		    input.value = '';
		    input.focus();
		  }
		}

	</script>
</head>
<body style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh;">
	<h2 style="text-align: center;">Ahora debe ingresar su nueva contraseña.</h2>
	<div style="width: 400px;">
		<div class="form-group">
		    <label for="password">Contraseña</label>
		    <input type="password" onblur="validarPassword(this)" style="width: 100%;" class="form-control" id="password" name="password">
		</div>
		<div class="form-group">
		    <label for="password-confirm">Confirmar Contraseña</label>
		    <input type="password" onblur="validarPassword(this)" style="width: 100%;" class="form-control" id="password-confirm" name="password-confirm">
		</div>
		<button onclick="ActualizarClave()" class="btn btn-primary" style="width: 100%;">Enviar</button>
	</div>
</body>
</html>