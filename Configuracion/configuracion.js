function GuardarUsuario() {
	$(".error").removeClass("error");
	toastr.clear();
	var Perfiles = [];
	var Nombre = $("#CrearUsu_Nombre").val();
	var Apellido = $("#CrearUsu_Apellido").val();
	var Usuario = $("#CrearUsu_Usuario").val();
	var Activo = $("#CrearUsu_Estado").val();
	$(".perfiles").each(function() {
	  if ($(this).is(':checked')) {
	  	var valor = $("#"+$(this).attr("id")).attr("Perfil_Value");
	  	Perfiles.push(valor);
	  }
	});
	var Resp = "NO";
	if(!Nombre){
		toastr.error('¡Nombre del Usuario es Requerido!');
		Resp = "SI";
		$("#CrearUsu_Nombre").addClass("error");
	}

	if(!Apellido){
		toastr.error('Apellido del Usuario es Requerido!');
		Resp = "SI";
		$("#CrearUsu_Apellido").addClass("error");
	}

	if(!Usuario){
		toastr.error('Usuario es Requerido!');
		Resp = "SI";
		$("#CrearUsu_Usuario").addClass("error");
	}

	if(Activo=='Ninguno'){
		toastr.error('Activo es Requerido!');
		Resp = "SI";
		$("#CrearUsu_Estado").addClass("error");
	}


	if(!Perfiles.length>0){
		toastr.error('Debe seleccionar al menos un perfil!');
		Resp = "SI";
		$(".form-check label").addClass("error");	
	}

	if(Resp== "SI"){
		return false;
	}else{

		$.ajax({
		    url: "Configuracion.php",
		    method: "POST",
		    data:{opcion:"GuardarUsuario",Nombre:Nombre,Apellido:Apellido,Usuario:Usuario,Perfiles:Perfiles,Activo:Activo},
		    success: function(respuesta) {
		    	if(respuesta.trim()=="OK"){
				      LimpiarFormularioUsuario();
				      swal.fire("¡Hecho!","La operación se realizó con éxito.","success");
				  }else{
				  	swal.fire("Error de Validación",respuesta,"error");
				  }
		    },error: function(jqXHR, estado, error) {
		      console.log("Ha ocurrido un error: " + error);
		    }
		});
	}
}


function GuardarUsuarioActualizar() {
	$(".error").removeClass("error");
	toastr.clear();
	var Perfiles = [];
	var IdUsuario = $("#Id_Usuario").val();

	var Nombre = $("#CrearUsu_Nombre").val();
	var Apellido = $("#CrearUsu_Apellido").val();
	var Usuario = $("#CrearUsu_Usuario").val();
	var Activo = $("#CrearUsu_Estado").val();
	$(".perfiles").each(function() {
	  if ($(this).is(':checked')) {
	  	var valor = $("#"+$(this).attr("id")).attr("Perfil_Value");
	  	Perfiles.push(valor);
	  }
	});
	var Resp = "NO";
	if(!Nombre){
		toastr.error('¡Nombre del Usuario es Requerido!');
		Resp = "SI";
		$("#CrearUsu_Nombre").addClass("error");
	}

	if(!Apellido){
		toastr.error('Apellido del Usuario es Requerido!');
		Resp = "SI";
		$("#CrearUsu_Apellido").addClass("error");
	}

	if(!Usuario){
		toastr.error('Usuario es Requerido!');
		Resp = "SI";
		$("#CrearUsu_Usuario").addClass("error");
	}

	if(Activo=='Ninguno'){
		toastr.error('Activo es Requerido!');
		Resp = "SI";
		$("#CrearUsu_Estado").addClass("error");
	}


	if(!Perfiles.length>0){
		toastr.error('Debe seleccionar al menos un perfil!');
		Resp = "SI";
		$(".form-check label").addClass("error");	
	}

	if(Resp== "SI"){
		return false;
	}else{

		$.ajax({
		    url: "Configuracion.php",
		    method: "POST",
		    data:{opcion:"GuardarUsuarioActualizar",Nombre:Nombre,Apellido:Apellido,Usuario:Usuario,Perfiles:Perfiles,Activo:Activo,IdUsuario:IdUsuario},
		    success: function(respuesta) {
		    	if(respuesta.trim()=="OK"){
				      LimpiarFormularioUsuario();
				      swal.fire("¡Hecho!","La operación se realizó con éxito.","success");
				  }else{
				  	swal.fire("Error de Validación",respuesta,"error");
				  }
		    },error: function(jqXHR, estado, error) {
		      console.log("Ha ocurrido un error: " + error);
		    }
		});
	}
}



function LimpiarFormularioUsuario(){

	$("#CrearUsu_Nombre").val("");
	$("#CrearUsu_Apellido").val("");
	$("#CrearUsu_Usuario").val("");
	$("#CrearUsu_Estado").val("Ninguno");
	$('.perfiles[type="checkbox"]').prop('checked', false);
	GridUsuariosCargados();
}

function LimpiarFormularioActualizarUsuario(){

	$("#CrearUsu_Nombre").val("");
	$("#CrearUsu_Apellido").val("");
	$("#CrearUsu_Usuario").val("");
	$("#CrearUsu_Estado").val("Ninguno");
	$('.perfiles[type="checkbox"]').prop('checked', false);
	$("#DivRestaurar").hide(100);
	GridUsuariosCargados();
}

function GridUsuariosCargados() {
	$.ajax({
	    url: "Configuracion.php",
	    method: "POST",
	    data:{opcion:"GridUsuariosCargados"},
	    success: function(respuesta) {
	    	var datos = JSON.parse(respuesta);
	    	var tabla = $('#GridUsuariosCargados').DataTable();
	    	tabla.clear().draw();
	    	if(datos.length>0){
	    		for (var i = 0; i < datos.length; i++) {
		    		tabla.row.add([
					  '<center>'+datos[i].ID+'</center>',
					  '<center>'+datos[i].USUARIO+'</center>',
					  '<center>'+datos[i].NOMBRES+'</center>',
					  '<center>'+datos[i].APELLIDOS+'</center>',
					  '<center>'+datos[i].ACTIVO+'</center>',
					  '<center><button class="button-icon-only" style="color:#00AAB9" onclick="CargarEditarUsuario(\''+datos[i].ID+'\')"><i class="bi bi-pencil-square"></i></button></center>'
					]).draw();
	    		}
	    	}
	    },error: function(jqXHR, estado, error) {
	      console.log("Ha ocurrido un error: " + error);
	    }
	});
}


function CargarEditarUsuario(IdUsuario) {
	$.ajax({
	    url: "Configuracion.php",
	    method: "POST",
	    data:{opcion:"CargarEditarUsuario",IdUsuario:IdUsuario},
	    success: function(respuesta) {
	    	var datos = JSON.parse(respuesta);
	    	if(datos.length>0){
	    		$("#DivRestaurar").show(100);

	    		$("#CrearUsu_Nombre").val(datos[0].NOMBRES);
	    		$("#Id_Usuario").val(datos[0].ID);
	    		$("#CrearUsu_Usuario").val(datos[0].USUARIO);
	    		$("#CrearUsu_Apellido").val(datos[0].APELLIDOS);
	    		$("#CrearUsu_Apellido").val(datos[0].APELLIDOS);
	    		$("#CrearUsu_Estado").val(datos[0].Id_Estado);
	    		$(".perfiles").removeAttr('checked');
	    		if( datos[0].Perfiles.length>0){
		    		for (var i = 0; i < datos[0].Perfiles.length; i++) {
		    			$("#perfil_"+datos[0].Perfiles[i].ID_PERFIL).prop('checked', true);
		    		}
	    		}
	    	}
	    },error: function(jqXHR, estado, error) {
	      console.log("Ha ocurrido un error: " + error);
	    }
	});
}


function RestaurarClave(){
var IdUsuario = $("#Id_Usuario").val();
Swal.fire({
  title: '¿Esta Seguro de Restaurar la Clave?',
  text: "La clave actual se perderá y deberá asignar una nueva clave!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'SI',
  cancelButtonText: "Cancelar"
}).then((result) => {
  if (result.isConfirmed) {
	$.ajax({
	    url: "Configuracion.php",
	    method: "POST",
	    data:{opcion:"RestaurarClave",IdUsuario:IdUsuario},
	    success: function(respuesta) {
	    	swal.fire("Exito!","El cambio se realizó satisfactoriamente!","success").then((result) => {
	    		LimpiarFormularioActualizarUsuario();
	    	});
	    },error: function(jqXHR, estado, error) {
	      console.log("Ha ocurrido un error: " + error);
	    }
	});
  }
});
}