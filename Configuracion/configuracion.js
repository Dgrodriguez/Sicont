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

function BuscarPerfil(){

  var ingresado = $("#VincularMenuPerf_Perfil").val();
  if (ingresado && ingresado.length>2){
    $.ajax({
      url: 'Configuracion.php',
      type: 'POST',
      data:{opcion:"BuscarPerfil",ingresado:ingresado},
      success: function(respuesta){
        var html = '';
        if(respuesta.trim()!='"NO"'){
            var datos = JSON.parse(respuesta);
            if(datos.length>0){
              for (var i = 0; i < datos.length; i++) {
                  html+='<li class="list-group-item" onclick=SeleccionarPerfil(\''+datos[i].ID+'\',\''+datos[i].PERFIL+'\') >'+datos[i].PERFIL+'</li>';
              }
            }
            $("#VincularMenuPerf_Perfil_List").html(html);
        }else{
            $("#VincularMenuPerf_Perfil_List").html('<li class="list-group-item">No hay datos que mostrar</li>');
        }
      }, error: function(){
           window.toastr.warning('Error al cargar las opciones');
      }
    });
  }else{
      $("#VincularMenuPerf_Perfil_List").html("");
  }
}


function BuscarPadreMenu(){

  var ingresado = $("#CrearMenu_IdPadre").val();
  if (ingresado && ingresado.length>2){
    $.ajax({
        url: 'Configuracion.php',
        type: 'POST',
        data:{opcion:"BuscarPadreMenu",ingresado:ingresado},
        success: function(respuesta){
            var html = '';
            if(respuesta.trim()!='"NO"'){
              var datos = JSON.parse(respuesta);
              if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                  html+='<li class="list-group-item" onclick=SeleccionarPadreMenu(\''+datos[i].ID+'\',\''+datos[i].NOMBRE+'\') >'+datos[i].NOMBRE+'</li>';
                }
              }
              $("#CrearMenu_IdPadre_List").html(html);
            }else{
              $("#CrearMenu_IdPadre_List").html('<li class="list-group-item">No hay datos que mostrar</li>');
            }
        },
        error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });
  }else{
    $("#CrearMenu_IdPadre_List").html("");
  }
}


function SeleccionarPadreMenu(ParamID,ParamNombre){

	$("#IdPadre").val(ParamID);
	$("#CrearMenu_IdPadre").val(ParamNombre);
	$("#CrearMenu_IdPadre_List").hide();
	
}

function LimpiarFormularioMenu() {

	$("#CrearMenu_Nombre").val("");
	$("#CrearMenu_Formulario").val("");
	$("#IdPadre").val("");
	$("#CrearMenu_Icono").val("");
	$("#CrearMenu_Orden").val("");
	$("#CrearMenu_IdPadre").val("");
	$("#CrearMenu_IdPadre_List").html("");

}

function LimpiarFormularioPerfil() {
	$("#CrearPerfil_Nombre").val("");
}

function GuardarNuevoMenu(){

var Nombre = $("#CrearMenu_Nombre").val();
var Formulario = $("#CrearMenu_Formulario").val();
var IdPadre = $("#IdPadre").val();
var Icono = $("#CrearMenu_Icono").val();
var Orden = $("#CrearMenu_Orden").val();


	if(!Nombre){
		$("#CrearPerfil_Nombre").addClass("error");
		window.toastr.error("Nombre del Perfil es obligatorio!");
		return false;
	}

	if(!Formulario){Formulario = "";}
	if(!IdPadre){IdPadre = "";}
	if(!Icono){Icono = "";}
	if(!Orden){Orden = "";}



	$.ajax({
	    url: "Configuracion.php",
	    method: "POST",
	    data:{opcion:"GuardarNuevoMenu",Nombre:Nombre,Formulario:Formulario,IdPadre:IdPadre,Icono:Icono,Orden:Orden},
	    success: function(respuesta) {
	    	if(respuesta.trim()=="OK"){
		      LimpiarFormularioMenu();
		      swal.fire("¡Hecho!","Opción agregada con éxito.","success");
		      ListarOpcionesMenu();
			  }else{
			  	swal.fire("Error de Validación",respuesta,"error");
			  	return false;
			  }
	    },error: function(jqXHR, estado, error) {
	      console.log("Ha ocurrido un error: " + error);
	    }
	});
}

function GuardarNuevoPerfil(){
	var Nombre = $("#CrearPerfil_Nombre").val();
	if(!Nombre){
		$("#CrearPerfil_Nombre").addClass("error");
		window.toastr.error("Nombre del Perfil es obligatorio!");
		return false;
	}else{
		$.ajax({
	    url: "Configuracion.php",
	    method: "POST",
	    data:{opcion:"GuardarNuevoPerfil",Nombre:Nombre},
	    success: function(respuesta) {
	    	if(respuesta.trim()=="OK"){
		      LimpiarFormularioPerfil();
		      swal.fire("¡Hecho!","Opción agregada con éxito.","success");
		      ListarPerfil();
			  }else{
			  	swal.fire("Error de Validación",respuesta,"error");
			  	return false;
			  }
	    },error: function(jqXHR, estado, error) {
	      console.log("Ha ocurrido un error: " + error);
	    }
		});
	}
}

function CargarListarOpcionesMenu(){

	$.ajax({
    url: "Configuracion.php",
    method: "POST",
    data:{opcion:"ListarOpcionesMenu"},
    success: function(respuesta) {
    	var dato = JSON.parse(respuesta);
    	var tabla = $('#Tbl_Listado_Menu').DataTable();
      tabla.clear().draw();
    	if(dato.length>0){
    		for (var i = 0; i < dato.length; i++) {
    			 tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+dato[i].ID+'</center>',
              '<center>'+dato[i].NOMBRE+'</center>',
              '<center>'+dato[i].URL+'</center>',
              '<center>'+dato[i].ICONO+'</center>',
              '<center>'+dato[i].ORDEN+'</center>'
            ]).draw();
    		}
    	}
    },error: function(jqXHR, estado, error) {
      console.log("Ha ocurrido un error: " + error);
    }
	});
}

function GuardarVinculacionMenuPerfil(){

	var Perfil = $("#IdPerfil").val();
	if(!Perfil){
		window.toastr.error("Se debe seleccionar un perfil!");
		$("#IdPerfil").addClass();
		return false;
	}

	var idsMenuMarcados = [];

 $("input[type='checkbox']").each(function () {
      if ($(this).is(":checked")) {
          // Si el checkbox está marcado, obtén su id_menu y agrégalo al array
          var idMenu = $(this).attr("id_menu");
          idsMenuMarcados.push(idMenu);
      }
  });

	if(idsMenuMarcados.length<1){
		window.toastr.error("Se debe seleccionar al menos una opcion de la lista!");
		return false;
	}


	if(idsMenuMarcados.length>0 && Perfil){
		$.ajax({
	    url: "Configuracion.php",
	    method: "POST",
	    data:{opcion:"GuardarVinculacionMenuPerfil",idsMenuMarcados:idsMenuMarcados,Perfil:Perfil},
	    success: function(respuesta) {

	    	if(respuesta.trim()=="OK"){
	    		window.Swal.fire("Exito!","Vinculacicón exitosa!","success");
	    		LimpiarVinculacionPerfilMenu();
	    	}
	    	
	    },error: function(jqXHR, estado, error) {
	      console.log("Ha ocurrido un error: " + error);
	    }
		});
	}
}


function SeleccionarPerfil(ParamID,ParamNombre){

	$("#IdPerfil").val(ParamID);
	$("#VincularMenuPerf_Perfil").val(ParamNombre);
	$("#VincularMenuPerf_Perfil_List").html("");
}



function LimpiarVinculacionPerfilMenu() {
	$("#IdPerfil").val("");
	$("#VincularMenuPerf_Perfil").val("");
	$("#VincularMenuPerf_Perfil_List").html("");
	$('input[type="checkbox"]').prop('checked', false);

}

function ListarOpcionesMenu(){
	$.ajax({
    url: "Configuracion.php",
    method: "POST",
    data:{opcion:"ListarOpcionesMenu"},
    success: function(respuesta) {
    	var dato = JSON.parse(respuesta);
    	var tabla = $('#Tbl_Listado_pefil').DataTable();
      tabla.clear().draw();
    	if(dato.length>0){
    		for (var i = 0; i < dato.length; i++) {
  			  tabla.row.add([
            '<center>'+parseInt(i+1)+'</center>',
            '<center><input type="checkbox" id="chk_Menu_'+dato[i].ID+'" Id_Menu="'+dato[i].ID+'" title="'+dato[i].NOMBRE+'" data-toggle="tooltip" data-placement="top" ></center>',
            '<center>'+dato[i].NOMBRE+'</center>'
          ]).draw();
    		} 
    		$('[data-toggle="tooltip"]').tooltip();
    	}
    },error: function(jqXHR, estado, error) {
      console.log("Ha ocurrido un error: " + error);
    }
	});
}


function ListarPerfil(){
	$.ajax({
    url: "Configuracion.php",
    method: "POST",
    data:{opcion:"ListarPerfil"},
    success: function(respuesta) {
    	var dato = JSON.parse(respuesta);
    	var tabla = $('#Tbl_Listado_Perfil').DataTable();
      tabla.clear().draw();
    	if(dato.length>0){
    		for (var i = 0; i < dato.length; i++) {
  			  tabla.row.add([
            '<center>'+parseInt(i+1)+'</center>',
            '<center>'+dato[i].PERFIL+'</center>'
          ]).draw();
    		}
    	}
    },error: function(jqXHR, estado, error) {
      console.log("Ha ocurrido un error: " + error);
    }
	});
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