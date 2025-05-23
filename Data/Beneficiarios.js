var GrupoFamiliar = [];
var Postulados = [];
var ResultadoBusquedaPostulados = [];
var ResultadoBusquedaListados = [];
function BuscarContratoPostulado() {

	$("#BenefRegPost_IdContrato").val("");
	var ingresado = $("#BenefRegPost_Contrato").val();
	if (ingresado && ingresado.length>2){
		$.ajax({
		  url: 'Beneficiarios.php',
		  type: 'POST',
		  data:{opcion:"BuscarContratoPostulado",ingresado:ingresado},
		  success: function(respuesta){
		    var html = '';
		    if(respuesta.trim()!="NO"){
		        var datos = JSON.parse(respuesta);
		        if(datos.length>0){
		        	for (var i = 0; i < datos.length; i++) {
		          		html+='<li class="list-group-item" onclick=SeleccionarContrato(\''+datos[i].ID+'\',\''+datos[i].Contrato+'\') >'+datos[i].Contrato+'</li>';
		        	}
		        }
		        html+='<li class="list-group-item" onclick=SeleccionarContrato(\'0\',\'N/A\') >N/A</li>';
		        $("#BenefRegPost_Contrato_List").html(html);
		    }else{
		        $("#BenefRegPost_Contrato_List").html('<li class="list-group-item">No hay datos que mostrar</li>');
		    }
		  },error: function(){
		    window.toastr.warning('Error al cargar las opciones');
		  }
		});
	}else{
	  $("#BenefRegPost_Contrato_List").html("");
	}
}


function BuscarCedulaPostulado() {
	
	$("#BenefRegBenf_IdPostulado").val("");
	var ingresado = $("#BenefRegBenf_CedulaBeneficiario").val();
	if (ingresado && ingresado.length>2){
	$.ajax({
	  url: 'Beneficiarios.php',
	  type: 'POST',
	  data:{opcion:"BuscarCedulaPostulado",ingresado:ingresado,Postulados:Postulados},
	  success: function(respuesta){
	    var html = '';
	    if(respuesta.trim()!="NO"){
	        ResultadoBusquedaPostulados = JSON.parse(respuesta);
	        if(ResultadoBusquedaPostulados.length>0){
	        	for (var i = 0; i < ResultadoBusquedaPostulados.length; i++) {
	          		html += '<li class="list-group-item" onclick="AgregarPostulado(\'' + ResultadoBusquedaPostulados[i].Id + '\',\'' + ResultadoBusquedaPostulados[i].NombreCompletoJefeHogar.replace(/'/g, "\\'") + '\',\'' + ResultadoBusquedaPostulados[i].TipoDocumento + '\',\'' + ResultadoBusquedaPostulados[i].Identificacion + '\',\'' + ResultadoBusquedaPostulados[i].Convenio + '\',\'' + ResultadoBusquedaPostulados[i].NombreProyecto + '\')">' + ResultadoBusquedaPostulados[i].NombreCompletoJefeHogar + ' (' + ResultadoBusquedaPostulados[i].TipoDocumento + '.: ' + ResultadoBusquedaPostulados[i].Identificacion + ')</li>';
	        	}
	        }
	        $("#BenefRegBenf_Contrato_List").html(html);
	    }else{
	        $("#BenefRegBenf_Contrato_List").html('<li class="list-group-item">No hay datos que mostrar</li>');
	    }
	  },error: function(){
	    window.toastr.warning('Error al cargar las opciones');
	  }
	});
	}else{
	  $("#BenefRegBenf_Contrato_List").html("");
	}
}


function AgregarPostulado(ParId,ParNombre,ParTipoDocumento,ParIdentificacion,ParConvenio,ParProyecto){
	var encontrado = false;
	for (var i = 0; i < Postulados.length; i++) {
		if(ParIdentificacion==Postulados[i].Identificacion){
			encontrado = true;
		}
	}

	if(encontrado){
		window.Swal.fire("Error de Validación","Postulado repetido, por favor intenta con otro!","error");
		return false;
	}else{
		for (var i = 0; i < ResultadoBusquedaPostulados.length; i++) {
			if(ResultadoBusquedaPostulados[i].Id == ParId && ResultadoBusquedaPostulados[i]['BeneficiosOtorgados']!="NO"){
			Swal.fire({
				title: '¿Estas Seguro?',
				text: 'El Sr.(a) '+ResultadoBusquedaPostulados[i]['BeneficiosOtorgados'][0]['NombrePostulado']+' Presenta un beneficio pagado por el monto de '+formatearMonto( ResultadoBusquedaPostulados[i]['BeneficiosOtorgados'][0]['Monto'])+', en el convenio/contrato nro: '+ResultadoBusquedaPostulados[i]['BeneficiosOtorgados'][0]['Convenio']+', del proyecto '+ResultadoBusquedaPostulados[i]['BeneficiosOtorgados'][0]['NombreProyecto']+', con fecha de desembolso: '+ResultadoBusquedaPostulados[i]['BeneficiosOtorgados'][0]['Fecha_Desembolso']+', ¿Deseas Continuar?',
				icon: 'warning',
				showCancelButton: true,
				confirmButtonText: 'Sí',
				cancelButtonText: 'No',
			}).then((result) => {
				if(result.isConfirmed){
					Postulados.push({"Id":ParId,"NombrePostulado":ParNombre,"TipoDocumento":ParTipoDocumento,"Identificacion":ParIdentificacion,"Duplicado":"SI","Convenio":ParConvenio,"Proyecto":ParProyecto});
					$("#BenefRegBenf_Contrato_List").html("");
					//$("#BenefRegBenf_CedulaBeneficiario").val(ParIdentificacion);
					window.toastr.success("Postulado Agregado Satisfactoriamente!");
					ActualizarPostuladosBeneficiario();
				}
			});

			}else if(ResultadoBusquedaPostulados[i].Id == ParId && ResultadoBusquedaPostulados[i]['BeneficiosOtorgados']=="NO"){
				Postulados.push({"Id":ParId,"NombrePostulado":ParNombre,"TipoDocumento":ParTipoDocumento,"Identificacion":ParIdentificacion,"Duplicado":"NO","Convenio":ParConvenio,"Proyecto":ParProyecto});
				$("#BenefRegBenf_Contrato_List").html("");
				//$("#BenefRegBenf_CedulaBeneficiario").val(ParIdentificacion);
				window.toastr.success("Postulado Agregado Satisfactoriamente!");
				ActualizarPostuladosBeneficiario();
			}
		}
	}
}


function AplicarMonto(ParId) {
	
	var valor = $("#Monto_Postulado_"+ParId).val();
    for (var i = 0; i < Postulados.length; i++) {
    	if(Postulados[i].Identificacion == ParId){
    		Postulados[i].Monto = FormateoInversoMonto(valor);
    	}
    }
}

function GuardarPostuladoTemporal() {

	var Referencia = "";
	Swal.fire({
	  title: 'Nombre de Lista',
	  text: 'Ingresa un nombre o referencia para la lista temporal:',
	  input: 'text',
      icon: 'warning',
	  inputPlaceholder: 'Ingresa un nombre...',
	  inputAttributes: {
	    autocapitalize: 'off',
	  },showCancelButton: true,
	  confirmButtonText: 'Aceptar',
	  cancelButtonText: 'Cancelar',
	  inputValidator: (value) => {
	    if (!value) {
	      return 'Debes ingresar un valor válido';
	    }
	  }
	}).then((result) => {
	  if (result.isConfirmed) {

	    $.ajax({
		  url: 'Beneficiarios.php',
		  type: 'POST',
		  data:{opcion:"GuardarPostuladoTemporal",JsonTemp:JSON.stringify(Postulados),Referencia:result.value},
		  success: function(respuesta){
		  	if(respuesta.trim()=="OK"){
		  		window.Swal.fire("Exito!","Guardado temporal realizado exitosamente!","success");
		  	}else{
		  		window.Swal.fire("Error de Validación!",respuesta,"error");
		  	}
		  },error: function(){
		    window.toastr.warning('Error al cargar las opciones');
		  }
		});
	  } else if (result.dismiss === Swal.DismissReason.cancel) {
	    return false;
	  }
	});
}



function GuardarPostuladoDefinitivo() {
	$(".error").removeClass("error");
	if(Postulados.length>0){

	Swal.fire({
		title: '¿Estás seguro?',
		text: '¡De continuar no se podrá modificar el listado temporal ni reversar el guardado!',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonText: 'Sí',
		cancelButtonText: 'No',
	}).then((result) => {
		if(result.isConfirmed){
			var FechaDesembolso = $("#BenefRegBenf_FechaDesem").val();
			var IdListado = $("#IdListado").val();
			var Resp = false ;

			if(!FechaDesembolso){
				$("#BenefRegBenf_FechaDesem").addClass("error");
				Resp = true;
			}

			if(!IdListado){
				IdListado = "NO";
			}

			for (var i = 0; i < Postulados.length; i++) {
				if (!Postulados[i].hasOwnProperty('Monto') || Postulados[i].Monto === null || Postulados[i].Monto === undefined || Postulados[i].Monto === "") {
					Resp = true;
			        $("#Monto_Postulado_" + Postulados[i].Identificacion ).addClass("error");
			    }
			}

			if(Resp){
				window.toastr.error("Algunos campos obligatorios estan vacios!");
			}else{
				$.ajax({
				  url: 'Beneficiarios.php',
				  type: 'POST',
				  data:{opcion:"GuardarPostuladoDefinitivo",Postulados:Postulados,FechaDesembolso:FechaDesembolso,IdListado:IdListado},
				  success: function(respuesta){
				  	if(respuesta.trim()=="OK"){
				  		window.Swal.fire("Exito!","Guardado definitivo realizado exitosamente!","success");
				  	}else{
				  		window.Swal.fire("Error de Validación!",respuesta,"error");
				  	}
				  },error: function(){
				    window.toastr.warning('Error al cargar las opciones');
				  }
				});
			}		
		}
	});
	}else{
		window.toastr.error("Debe Agregar al menos un postulado!");
		return false;
	}
}

function ActualizarPostuladoTemporal() {

    $.ajax({
	  url: 'Beneficiarios.php',
	  type: 'POST',
	  data:{opcion:"ActualizarPostuladoTemporal",JsonTemp:JSON.stringify(Postulados),IdListado:$("#IdListado").val()},
	  success: function(respuesta){
	  	if(respuesta.trim()=="OK"){
	  		window.Swal.fire("Exito!","Registro temporal almacenado exitosamente!","success");
	  	}else{
	  		window.Swal.fire("Error de Validación!",respuesta,"error");
	  	}
	  },error: function(){
	    window.toastr.warning('Error al cargar las opciones');
	  }
	});
}

function AbrirCargaTemporal() {

	$("#Btn_BenefRegBenef_Modal_ListaTemporal").click();
}



function BuscarListadoTemporal(){

	$("#BenefRegBenf_Referencias_List").val("");
	var ingresado = $("#BenefRegBenf_ReferenciaLista").val();
	if (ingresado && ingresado.length>2){
		$.ajax({
		  url: 'Beneficiarios.php',
		  type: 'POST',
		  data:{opcion:"BuscarListadoTemporal",ingresado:ingresado},
		  success: function(respuesta){
		    var html = '';
		    if(respuesta.trim()!="NO"){
		        var datos = JSON.parse(respuesta);
		        if(datos.length>0){
		        	for (var i = 0; i < datos.length; i++) {
		          		html+= '<li class="list-group-item" onclick="SeleccionarListadoTemporal(\'' + datos[i].Id + '\')">' + datos[i].Nombre + '</li>';
		        	}
		        }
		        $("#BenefRegBenf_Referencias_List").html(html);
		    }else{
		        $("#BenefRegBenf_Referencias_List").html('<li class="list-group-item">No hay datos que mostrar</li>');
		    }
		  },error: function(){
		    window.toastr.warning('Error al cargar las opciones');
		  }
		});
	}else{
	  $("#BenefRegBenf_Referencias_List").html("");
	}
}

function SeleccionarListadoTemporal(ParId){
	
	$.ajax({
	  url: 'Beneficiarios.php',
	  type: 'POST',
	  data:{opcion:"SeleccionarListadoTemporal",IdTemporal:ParId},
	  success: function(respuesta){
	    var datos = JSON.parse(respuesta);

	    	$("#BenefRegBenf_Referencias_List").html("");
	    	$("#BenefRegBenf_FechaListado").val(datos[0]['FechaActualizacion']);
	    	$("#BenefRegBenf_CreadoPor").val(datos[0]['UsuarioCreacion']);
	    	$("#BenefRegBenf_NombreListado").val(datos[0]['Nombre']);
	    	$("#BenefRegBenf_Cantidad").val(datos[0]['Cantidad']);
	    	$("#IdListado").val(datos[0]['Id']);

	  },error: function(){
	    window.toastr.warning('Error al cargar las opciones');
	  }
	});

}


function ConfirmarSeleccion() {
	Swal.fire({
		title: '¿Estás seguro?',
		text: '¿De continuar se perdera el trabajo actual que no este guardado?',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonText: 'Sí',
		cancelButtonText: 'No',
	}).then((result) => {
		if(result.isConfirmed){
			$.ajax({
			  url: 'Beneficiarios.php',
			  type: 'POST',
			  data:{opcion:"SeleccionarListadoTemporal",IdTemporal:$("#IdListado").val()},
			  success: function(respuesta){
			    var datos = JSON.parse(respuesta);
			    $("#Btn_GuardarParcial").hide();
			    $("#Btn_ActualizarParcial").show();
			    Postulados = JSON.parse(datos[0]['Json_Temporal']);
			    ActualizarPostuladosBeneficiario();
			    $("#BenefRegBenf_CerrarModalTemp").click();
			  },error: function(){
			    window.toastr.warning('Error al cargar las opciones');
			  }
			});
		}
	});
}

function ActualizarPostuladosBeneficiario() {
    $("#div_tbl_Postulados_Beneficiarios").show(50);
    var tabla = $('#tbl_Postulados_Beneficiarios').DataTable();
    tabla.clear().draw();
    if (Postulados.length > 0) {
        for (var i = 0; i < Postulados.length; i++) {
            // Asignar el valor de Monto si existe
            var monto = Postulados[i].Monto ? formatearMonto(Postulados[i].Monto) : '';
            var clase = "";

            if(Postulados[i]['Duplicado']=="SI"){
            	clase = " style='color: red;' ";
            }

            tabla.row.add([
                '<center>' + parseInt(i + 1) + '</center>',
                '<center>' + Postulados[i].TipoDocumento + '.: ' + Postulados[i].Identificacion + '</center>',
                '<center '+clase+'>' + Postulados[i].NombrePostulado + '</center>',
                '<center>' + Postulados[i].Convenio + '</center>',
                '<center>' + Postulados[i].Proyecto + '</center>',
                '<center><input type="text" class="form-control MontoPostulado" autocomplete="off" onchange="AplicarMonto(\'' + Postulados[i].Identificacion + '\')" id="Monto_Postulado_' + Postulados[i].Identificacion + '" value="' + monto + '"></center>',
                '<center><button class="btn_transparente" onclick="EliminarPostuladoBeneficiario(\'' + Postulados[i].Identificacion + '\')"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'
            ]).draw();
            maquillarNumero(document.getElementById('Monto_Postulado_' + Postulados[i].Identificacion));
        }
    }
}



function formatearMonto(monto) {
  // Convertir el monto a número y verificar si es válido
  const montoNum = parseFloat(monto.replace(/[^0-9.]/g, '')); // Asegurarse de que solo queden dígitos y el punto decimal
  if (isNaN(montoNum)) {
    return '';
  }
  // Forzar la configuración regional a español
  const opcionesDeFormato = {

    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
    useGrouping: true
  };

  // Formatear el monto con la configuración regional forzada
  const montoFormateado = montoNum.toLocaleString('es-ES', opcionesDeFormato);

  return '$'+montoFormateado;
}

function BuscarDatosAfiliado(){

	var TipoIdentificacion = $("#BenefRegPost_TipoIdentificacion_Jefe").val(); 
	var NumeroIdentificacion = $("#BenefRegPost_NumIdenti_Jefe").val();

	if(TipoIdentificacion!="Ninguno" && NumeroIdentificacion){
		$.ajax({
		  url: 'Beneficiarios.php',
		  type: 'POST',
		  data:{opcion:"BuscarDatosAfiliado",TipoIdentificacion:TipoIdentificacion,NumeroIdentificacion:NumeroIdentificacion},
		  success: function(respuesta){
		    if(respuesta.trim()!="NO"){
		    	Swal.fire({
					title: 'Informacion encontrada!',
					text: 'Se ha encontrado información vinculada al número de identificación ingresado, ¿Desea Cargarla?',
					icon: 'success',
					showCancelButton: true,
					confirmButtonText: 'Sí',
					cancelButtonText: 'No',
				}).then((result) => {
					if(result.isConfirmed){
				    	var datos = JSON.parse(respuesta);
				    	$("#BenefRegPost_PrimerNombreJefe").val(datos[0]['PrimerNombreJefeHogar']);
				    	if(datos[0]['SegundoNombreJefeHogar']){$("#BenefRegPost_SegundoNombreJefe").val(datos[0]['SegundoNombreJefeHogar']);}
				    	$("#BenefRegPost_PrimerApellidoJefe").val(datos[0]['PrimerApellidoJefeHogar']);
				    	$("#BenefRegPost_SegundoApellidoJefe").val(datos[0]['SegundoApellidoJefeHogar']);
				    	$("#BenefRegPost_NivelEscolaridad_Jefe").val(datos[0]['Escolaridad']);
				    	$("#BenefRegPost_Ocupacion_Jefe").val(datos[0]['Ocupacion']);
				    	$("#BenefRegPost_FechaNac_Jefe").val(datos[0]['FechaNacimiento']);
				    	$("#BenefRegPost_Telefono_Jefe").val(datos[0]['Telefono']);
				    	$("#BenefRegPost_Ocupacion_Jefe").val(datos[0]['Ocupacion']);
		    		}
		    	});
			}
		  },error: function(){
		    window.toastr.warning('Error al cargar las opciones');
		  }
		});
	}
}


function AplicarMontoTodos() {
	var monto = $("#BenefRegBenf_MontoTodos").val();
	$(".MontoPostulado").val(monto);
	var elementos = document.querySelectorAll(".MontoPostulado");
	elementos.forEach(function (elemento) {
	  var id = elemento.id;
	  maquillarNumero(document.getElementById(id));
	  $("#"+id).change();
	});
}

function s2ab(s) {
    var buf = new ArrayBuffer(s.length);
    var view = new Uint8Array(buf);
    for (var i = 0; i < s.length; i++) {
        view[i] = s.charCodeAt(i) & 0xFF;
    }
    return buf;
}

function DescargarListadoPrevioBeneficiarios(){
	if(Postulados.length>0){
	 	var workbook = XLSX.utils.book_new();
	    var sheetData = [
	        ['#', 'Tipo de Identificación', 'Número de Identificación', 'Nombre Completo', 'Convenio', 'Proyecto', '¿Beneficiario antes?', 'Monto']
	    ];

	    for (var i = 0; i < Postulados.length; i++) {

	        var rowData = [
	            parseInt(i+1),
	            Postulados[i]['TipoDocumento'],
	            Postulados[i]['Identificacion'],
	            Postulados[i]['NombrePostulado'],
	            Postulados[i]['Convenio'],
	            Postulados[i]['Proyecto'],
	            Postulados[i]['Duplicado'],
	            Postulados[i]['Monto'] ? formatearMonto(Postulados[i]['Monto']) : "$0"
	        ];

	        sheetData.push(rowData);
	    }
	    var worksheet = XLSX.utils.aoa_to_sheet(sheetData);
	    XLSX.utils.book_append_sheet(workbook, worksheet, 'Resumen Previo');
	    var workbookOutput = XLSX.write(workbook, { type: 'binary' });
	    var blob = new Blob([s2ab(workbookOutput)], { type: 'application/octet-stream' });
	    saveAs(blob, 'ResumenPrevioBeneficiarios.xlsx'); 
    }else{
    	window.toastr.error("No hay datos para generar el excel!");
    }
}


function EliminarPostuladoBeneficiario(ParId) {
    let eliminar = false;

    for (let i = 0; i < Postulados.length; i++) {
        console.log("voy por la pos: " + i);
        if (ParId === Postulados[i]['Identificacion']) {

            Swal.fire({
                title: '¿Estás seguro?',
                text: '¿Seguro de eliminar el registro del ciudadano(a) ' + Postulados[i]['NombrePostulado'] + ' ?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí',
                cancelButtonText: 'No',
            }).then((result) => {
                if (result.isConfirmed) {
	                Postulados.splice(i, 1);
	                ActualizarPostuladosBeneficiario();
                    eliminar = true;
                }
            });

            if (eliminar) {

                break; // Sale del bucle después de eliminar el elemento
            }
        }
    }
}




function SeleccionarContrato(ParamId,NumContrato){

	$("#BenefRegPost_IdContrato").val(ParamId);
	$("#BenefRegPost_Contrato").val(NumContrato);
	$("#BenefRegPost_Contrato_List").html("");
}

function FiltrarListadosBeneficiarios() {

	var BenefList_Alcantarillado = $("#BenefList_Alcantarillado").val();
	var BenefList_Escolaridad = $("#BenefList_Escolaridad").val();
	var BenefList_Departamento = $("#BenefList_Departamento").val();
	var BenefList_Municipio = $("#BenefList_Municipio").val();
	var BenefList_DispAgua = $("#BenefList_DispAgua").val();
	var BenefList_Genero = $("#BenefList_Genero").val();
	var BenefList_Proyecto = $("#BenefList_Proyecto").val();
	var BenefList_TipoAcceso = $("#BenefList_TipoAcceso").val();
	var BenefList_TipoEnergia = $("#BenefList_TipoEnergia").val();
	var BenefList_TipoVivienda = $("#BenefList_TipoVivienda").val();
	var BenefList_TipoIntervencion = $("#BenefList_TipoIntervencion").val();
	var BenefList_TipoTenencia = $("#BenefList_TipoTenencia").val();
	var BenefList_TipoOcupacion = $("#BenefList_TipoOcupacion").val();
	var BenefList_EnfoqueDiferencial = $("#BenefList_EnfoqueDiferencial").val();
	var BenefList_Convenio = $("#BenefList_Convenio").val();
	var BenefList_Contenido = $("#BenefList_Contenido").val();
	if(BenefList_EnfoqueDiferencial<1){
		BenefList_EnfoqueDiferencial="NO";
	}

	$.ajax({
        url: '../Beneficiarios.php',
        type: 'POST',
        data: { opcion: "FiltrarListadosBeneficiarios",BenefList_Alcantarillado:BenefList_Alcantarillado,BenefList_Escolaridad:BenefList_Escolaridad,BenefList_Departamento:BenefList_Departamento,BenefList_Municipio:BenefList_Municipio,BenefList_DispAgua:BenefList_DispAgua,BenefList_Genero:BenefList_Genero,BenefList_Proyecto:BenefList_Proyecto,BenefList_TipoAcceso:BenefList_TipoAcceso,BenefList_TipoEnergia:BenefList_TipoEnergia,BenefList_TipoVivienda:BenefList_TipoVivienda,BenefList_TipoIntervencion:BenefList_TipoIntervencion,BenefList_TipoTenencia:BenefList_TipoTenencia,BenefList_TipoOcupacion:BenefList_TipoOcupacion,BenefList_EnfoqueDiferencial:BenefList_EnfoqueDiferencial,BenefList_Convenio:BenefList_Convenio,BenefList_Contenido:BenefList_Contenido}
        ,success: function (respuesta) {
	        $("#Div_tbl_Listado_Resultados").show();
        	var tabla = $('#tbl_Listado_Resultados').DataTable();
            tabla.clear().draw();
            ResultadoBusquedaListados = JSON.parse(respuesta);
            Polizas = [];
            if(ResultadoBusquedaListados.length>0){
            	$("#Btn_DescargarListadoExcel").show();
                for (var i = 0; i < ResultadoBusquedaListados.length; i++) {
                	var datos = ResultadoBusquedaListados[i];
					var button = '';

					if(datos['GrupoFamiliar']!="NO"){
						button = '<center><button class="btn_transparente" title="Ver familia" data-toggle="tooltip" data-placement="top" onclick="MostrarGrupoFamiliar(\''+i+'\')"><i class="fa-solid fa-people-group"></i></button></center>';
					}else{
						button = '<center><button class="btn_transparente" title="Ver familia" data-toggle="tooltip" data-placement="top" disabled="true"><i class="fa-solid fa-people-group"></i></button></center>';
					}				

                    tabla.row.add([
                      '<center>'+parseInt(i+1)+'</center>',
                      '<center>'+datos['ID_form']+'</center>',
                      '<center>'+datos['FechaElaboracion']+'</center>',
                      '<center>'+datos['Convenio']+'</center>',
                      '<center>'+datos['Depto']+'</center>',
                      '<center>'+datos['Municipio']+'</center>',
                      '<center>'+datos['TipoVivienda']+'</center>',
                      '<center>'+datos['NombreProyecto']+'</center>',
                      '<center>'+datos['TipoIntervencion']+'</center>',
                      '<center>'+datos['PrimerApellidoJefeHogar']+'</center>',
                      '<center>'+datos['SegundoApellidoJefeHogar']+'</center>',
                      '<center>'+datos['PrimerNombreJefeHogar']+'</center>',
                      '<center>'+datos['SegundoNombreJefeHogar']+'</center>',
                      '<center>'+datos['TipoDocumento']+'</center>',
                      '<center>'+datos['Identificacion']+'</center>',
                      '<center>'+datos['FechaNacimiento']+'</center>',
                      '<center>'+datos['TipoOcupacion']+'</center>',
                      '<center>'+formatearMonto(datos['IngresoPromedioMensual'])+'</center>',
                      '<center>'+datos['Telefono']+'</center>',
                      '<center>'+datos['Genero']+'</center>',
                      '<center>'+datos['TipoAcceso']+'</center>',
                      '<center>'+datos['Latitud']+'</center>',
                      '<center>'+datos['Longitud']+'</center>',
                      '<center>'+datos['DisponibilidadAgua']+'</center>',
                      '<center>'+datos['TipoEnergia']+'</center>',
                      '<center>'+datos['TipoAlcantarillado']+'</center>',
                      '<center>'+datos['Tenencia']+'</center>',
                      '<center>'+datos['OtraTenencia']+'</center>',
                      '<center>'+datos['EnfoqueDiferencial']+'</center>',button
                      
                    ]).draw();
                }
                $('[data-toggle="tooltip"]').tooltip();
            }else{
            	$("#Btn_DescargarListadoExcel").hide();

            }
        }, error: function () {
            window.toastr.error('Error al cargar las opciones');
        }
	});
}

function DescargarListadoPrevioBeneficiarios(){
	if(ResultadoBusquedaListados.length>0){
	 	var workbook = XLSX.utils.book_new();
	    var sheetData = [
	        ['Número', 'Id Formulario', 'Fecha Elaboración', 'Convenio', 'Departamento', 'Municipio', 'Tipo de Vivienda', 'Proyecto', 'Tipo de Integración', 'Primer Apellido', 'Segundo Apellido', 'Primer Nombre', 'Segundo Nombre', 'Tipo Identificación', 'Identificación', 'Fecha de Nacimiento', 'Ocupación', 'Ingresos Promedio', 'Teléfono', 'Genero', 'Tipo de Acceso', 'Latitud', 'Longitud', 'Disponibilidad del Agua', 'Tipo Energia', 'Tipo Alcantarillado', 'Tipo Tenencia', 'Otra Tenencia', 'Enfoque Diferencial', 'Grupo Familiar']
	    ];

	    for (var i = 0; i < ResultadoBusquedaListados.length; i++) {

			var datos = ResultadoBusquedaListados[i];
			var button = '';

			if(datos['GrupoFamiliar']!="NO"){
				button = 'SI';
			}else{
				button = 'NO';
			}		

			if(datos['IngresoPromedioMensual']!="S/D"){
				datos['IngresoPromedioMensual'] =formatearMonto(datos['IngresoPromedioMensual']);
			}		

            var rowData = [
              parseInt(i+1),datos['ID_form'],datos['FechaElaboracion'],datos['Convenio'],datos['Depto'],datos['Municipio'],datos['TipoVivienda'],datos['NombreProyecto'],datos['TipoIntervencion'],datos['PrimerApellidoJefeHogar'],datos['SegundoApellidoJefeHogar'],datos['PrimerNombreJefeHogar'],datos['SegundoNombreJefeHogar'],datos['TipoDocumento'],datos['Identificacion'],datos['FechaNacimiento'],datos['TipoOcupacion'],datos['IngresoPromedioMensual'],datos['Telefono'],datos['Genero'],datos['TipoAcceso'],datos['Latitud'],datos['Longitud'],datos['DisponibilidadAgua'],datos['TipoEnergia'],datos['TipoAlcantarillado'],datos['Tenencia'],datos['OtraTenencia'],datos['EnfoqueDiferencial'],button
	        ];

	        sheetData.push(rowData);
	    }
	    var worksheet = XLSX.utils.aoa_to_sheet(sheetData);
	    XLSX.utils.book_append_sheet(workbook, worksheet, 'Resumen Listado General');
	    var workbookOutput = XLSX.write(workbook, { type: 'binary' });
	    var blob = new Blob([s2ab(workbookOutput)], { type: 'application/octet-stream' });
	    saveAs(blob, 'ResumenListadoGeneral.xlsx'); 
    }else{
    	window.toastr.error("No hay datos para generar el excel!");
    }
}

function MostrarGrupoFamiliar(ParId){
	$("#TitularGrupoFamiliar").html(ResultadoBusquedaListados[ParId]['PrimerApellidoJefeHogar']+' '+ResultadoBusquedaListados[ParId]['PrimerNombreJefeHogar']);
	var datos = ResultadoBusquedaListados[ParId]['GrupoFamiliar'];
	var tabla = $('#tbl_Listado_GrupoFamiliar').DataTable();
    tabla.clear().draw();
	for (var i = 0; i < datos.length; i++) {
		tabla.row.add([
          '<center>'+parseInt(i+1)+'</center>',
          '<center>'+datos[i]['PrimerApellido']+'</center>',
          '<center>'+datos[i]['SegundoApellido']+'</center>',
          '<center>'+datos[i]['PrimerNombre']+'</center>',
          '<center>'+datos[i]['SegundoNombre']+'</center>',
          '<center>'+datos[i]['TipoDocumento']+'</center>',
          '<center>'+datos[i]['Identificacion']+'</center>',
          '<center>'+datos[i]['FechaNacimiento']+'</center>',
          '<center>'+datos[i]['Genero']+'</center>',
          '<center>'+datos[i]['Parentesco']+'</center>',
          '<center>'+datos[i]['Escolaridad']+'</center>',
          '<center>'+datos[i]['IngresosMes']+'</center>',
          '<center>'+datos[i]['EnfoqueDiferencial']+'</center>'
        ]).draw();
	}
	$("#Btn_BenefRegPost_mdl_Grp_Familiar").click();
}

function CargarMunicipio2(IdDepto,id_input){
    var depto = $("#"+IdDepto).val();
    $.ajax({
        url: '../../Administracion/administracion.php',
        type: 'POST',
        data:{opcion:"CargarMunicipio",depto:depto},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            var html = '<option value="Ninguno">Todos</option>';
            if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                    html+='<option RetFuente="'+datos[i].RetFuente+'" value="'+datos[i].Id+'">'+datos[i].Nombre+'</option>'
                }
            }
            $("#"+id_input).html(html);
        },
        error: function(){
            window.toastr.warning('Error al cargar las opciones');
        }
    });
}

function CargarMunicipio(IdDepto,id_input){
    var depto = $("#"+IdDepto).val();
    $.ajax({
        url: '../Administracion/administracion.php',
        type: 'POST',
        data:{opcion:"CargarMunicipio",depto:depto},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            var html = '<option value="Ninguno">Seleccione</option>';
            if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                    html+='<option RetFuente="'+datos[i].RetFuente+'" value="'+datos[i].Id+'">'+datos[i].Nombre+'</option>'
                }
            }
            $("#"+id_input).html(html);
        },
        error: function(){
            window.toastr.warning('Error al cargar las opciones');
        }
    });
}


function CargarDeptos(id_input) {

    $.ajax({
        url: '../Administracion/administracion.php',
        type: 'POST',
        data:{opcion:"CargarDeptos"},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            var html = '<option value="Ninguno">Seleccione</option>';
            if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                    html+='<option value="'+datos[i].Id+'">'+datos[i].Nombre+'</option>'
                }
            }
            $("#"+id_input).html(html);
        },
        error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });
}

function ConcatenarDireccion(element) {

    Direccion = "";
    $("#BenefRegPost_mdl_Direccion input,#BenefRegPost_mdl_Direccion select").each(function() {
      var value = $(this).val();
      if (value && value!="Ninguno") {
        Direccion += value + " ";
      }
    });
  $("#DireccionResultante").html(Direccion);
  $("#BenefRegPost_Direccion").val(Direccion);

}

function FormateoInversoMonto(monto) {
    if(monto){
      if (monto.includes('$')) {
        // Eliminar el símbolo de moneda y los separadores de miles
        var montoSinFormato = monto.replace(/\$|,/g, '');

        // Reemplazar el separador decimal por un punto
        montoSinFormato = montoSinFormato.replace(',', '.');
        return montoSinFormato;
      } else {
        return monto;
      }
    }
}

function maquillarNumero(input) {
    if(input){
      // Agregamos un listener al evento input para aplicar el maquillaje en tiempo real
      input.addEventListener("input", function () {
        // Obtenemos el valor actual del input y eliminamos todos los caracteres que no sean dígitos
        let num = input.value.replace(/\D/g, "");
        
        // Aplicamos el separador de miles usando una expresión regular que inserta una coma cada 3 dígitos
        num = num.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        
        // Actualizamos el valor del input con el número maquillado
        input.value = "$" + num;
      });
      
      // Agregamos un listener al evento blur para eliminar el separador de miles al leer el valor
      input.addEventListener("blur", function () {
        // Obtenemos el valor actual del input y eliminamos todos los caracteres que no sean dígitos
        let num = input.value.replace(/\D/g, "");
        
        // Actualizamos el valor del input con el número sin separador
        //input.value = num;
      });
      
      // Agregamos una validación al evento keypress para permitir solo números
      input.addEventListener("keypress", function (event) {
        if (!/^\d$/.test(event.key)) {
          event.preventDefault();
        }
      });
    }
}

function SoloNumeros(event) {
    event = event || window.event;
    var charCode = event.which || event.keyCode;
    
    // Verificar si el carácter ingresado NO es un dígito
    if (!/^\d$/.test(event.key)) {
        // Prevenir que el carácter se ingrese en la caja de texto
        event.preventDefault();
    }
}


function IniciarGrupoFamiliar() {
	$("#Btn_BenefRegPost_mdl_Grp_Familiar").click();
}

function AdicionarFamiliar() {

	$(".error").removeClass("error");

	var BenefRegPost_PrimerNombrePariente = $("#BenefRegPost_PrimerNombrePariente").val();
	var BenefRegPost_SegundoNombrePariente = $("#BenefRegPost_SegundoNombrePariente").val();
	var BenefRegPost_PrimerApellidoPariente = $("#BenefRegPost_PrimerApellidoPariente").val();
	var BenefRegPost_SegundoApellidoPariente = $("#BenefRegPost_SegundoApellidoPariente").val();
	var EnfoqueDiferencial = $("#BenefRegPost_EnfoqueDiferencial_Pariente").val();
	var NombresEnfoqueDiferencial = $("#BenefRegPost_EnfoqueDiferencial_Pariente option:selected").text();
	var FechaNacimiento = $("#BenefRegPost_FechaNacimiento_Pariente").val();
	var TipoDocumento = $("#BenefRegPost_TipoIdentificacion_Pariente").val();
	var NombreTipoDocumento = $("#BenefRegPost_TipoIdentificacion_Pariente option:selected").text();
	var identificacion = $("#BenefRegPost_NumIdenti_Pariente").val();
	var BenefRegPost_Genero_Pariente = $("#BenefRegPost_Genero_Pariente").val();
	var Parentesco = $("#BenefRegPost_Parentesco_Pariente").val();
	var NombreParentesco = $("#BenefRegPost_Parentesco_Pariente option:selected").text();
	var NivelEscolaridad = $("#BenefRegPost_NivelEscolaridad_Pariente").val();
	var NombreNivelEscolaridad = $("#BenefRegPost_NivelEscolaridad_Pariente option:selected").text();
	var IngresoMensual = $("#BenefRegPost_IngresosMes_Pariente").val();
	var Resp = "NO";

	if(!BenefRegPost_PrimerNombrePariente){
		$("#BenefRegPost_PrimerNombrePariente").addClass("error");
		Resp = "SI";
	}

	if(!BenefRegPost_Genero_Pariente){
		$("#BenefRegPost_Genero_Pariente").addClass("error");
		Resp = "SI";
	}


	if(!BenefRegPost_PrimerApellidoPariente){
		$("#BenefRegPost_PrimerApellidoPariente").addClass("error");
		Resp = "SI";
	}

	if(Parentesco=="Ninguno"){
		$("#BenefRegPost_Parentesco_Pariente").addClass("error");
		Resp = "SI";
	}

	if(TipoDocumento=="Ninguno"){
		NombreTipoDocumento = "";
	}

	if(NivelEscolaridad=="Ninguno"){
		NombreNivelEscolaridad = "";
	}

	if(Resp == "SI"){
		window.toastr.error("Faltan datos Obligatorios!");
		return false;
	}else{
		if(GrupoFamiliar.length>0){
			for (var i = 0; i < GrupoFamiliar.length; i++) {
				var NombreCompleto = BenefRegPost_PrimerNombrePariente+" "+BenefRegPost_SegundoNombrePariente+" "+BenefRegPost_PrimerApellidoPariente+" "+BenefRegPost_SegundoApellidoPariente;

				if(GrupoFamiliar[i]['PrimerNombre'].toUpperCase()+" "+GrupoFamiliar[i]['SegundoNombre'].toUpperCase()+" "+GrupoFamiliar[i]['PrimerApellido'].toUpperCase()+" "+GrupoFamiliar[i]['SegundoApellido'].toUpperCase()+" "==NombreCompleto.toUpperCase()){
					window.toastr.error("Familiar ya ingresado, favor intente con otro!");
					return false;
				}
			}
		}

	  	if(!BenefRegPost_SegundoNombrePariente){
	  		BenefRegPost_SegundoNombrePariente = "S/D";
	  	}

	  	if(!BenefRegPost_SegundoApellidoPariente){
	  		BenefRegPost_SegundoApellidoPariente = "S/D";
	  	}


		GrupoFamiliar.push({PrimerNombre:BenefRegPost_PrimerNombrePariente,SegundoNombre:BenefRegPost_SegundoNombrePariente,PrimerApellido:BenefRegPost_PrimerApellidoPariente,SegundoApellido:BenefRegPost_SegundoApellidoPariente,EnfoqueDiferencial:EnfoqueDiferencial,NombresEnfoqueDiferencial:NombresEnfoqueDiferencial,FechaNacimiento:FechaNacimiento,TipoDocumento:TipoDocumento,NombreTipoDocumento:NombreTipoDocumento,identificacion:identificacion,Parentesco:Parentesco,NombreParentesco:NombreParentesco,NivelEscolaridad:NivelEscolaridad,NombreNivelEscolaridad:NombreNivelEscolaridad,IngresoMensual:IngresoMensual,BenefRegPost_Genero_Pariente:BenefRegPost_Genero_Pariente});
		ActualizarTablaGrupoFamiliar();
	}
}


function ActualizarTablaGrupoFamiliar() {
    var tabla = $('#tbl_BenefRegPost_GrupoFamiliar').DataTable();
    tabla.clear().draw();
    $("#Bdg_Cant_Grp_Familiar").html(GrupoFamiliar.length);
    if(GrupoFamiliar.length>0){
        for (var i = 0; i < GrupoFamiliar.length; i++) {

        	var NombreCompleto =  GrupoFamiliar[i].PrimerNombre;

        	if(GrupoFamiliar[i].SegundoNombre!="S/D"){
        		NombreCompleto+=" "+GrupoFamiliar[i].SegundoNombre;
        	}
        	NombreCompleto+=" "+GrupoFamiliar[i].PrimerApellido;

        	if(GrupoFamiliar[i].SegundoApellido!="S/D"){
        		NombreCompleto+=" "+GrupoFamiliar[i].SegundoApellido;
        	}

            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+NombreCompleto+'</center>',
              '<center>'+GrupoFamiliar[i].NombresEnfoqueDiferencial+'</center>',
              '<center>'+GrupoFamiliar[i].FechaNacimiento+'</center>',
              '<center>'+GrupoFamiliar[i].NombreTipoDocumento+'</center>',
              '<center>'+GrupoFamiliar[i].identificacion+'</center>',
              '<center>'+GrupoFamiliar[i].NombreParentesco+'</center>',
              '<center>'+GrupoFamiliar[i].NombreNivelEscolaridad+'</center>',
              '<center>'+GrupoFamiliar[i].IngresoMensual+'</center>',
              '<center><button class="btn_transparente" onclick="EliminarFamiliar(\''+i+'\')"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'
            ]).draw(); 
        }
    }
}


function EliminarFamiliar(ParamId){
	GrupoFamiliar.splice(ParamId,1);
	ActualizarTablaGrupoFamiliar();
}

function GuardarPostulado() {
	
	$(".error").removeClass("error");
	var BenefRegPost_FechaElab = $("#BenefRegPost_FechaElab").val();
	var BenefRegPost_Contrato = $("#BenefRegPost_Contrato").val();
	var BenefRegPost_TipoIntervencion = $("#BenefRegPost_TipoIntervencion").val();
	var BenefRegPost_dpto = $("#BenefRegPost_dpto").val();
	var BenefRegPost_mpio = $("#BenefRegPost_mpio").val();
	var BenefRegPost_TipoVivienda = $("#BenefRegPost_TipoVivienda").val();
	var BenefRegPost_Direccion = $("#BenefRegPost_Direccion").val();
	var BenefRegPost_Proyecto = $("#BenefRegPost_Proyecto").val();
	var BenefRegPost_PrimerNombreJefe = $("#BenefRegPost_PrimerNombreJefe").val();
	var BenefRegPost_SegundoNombreJefe = $("#BenefRegPost_SegundoNombreJefe").val();
	var BenefRegPost_PrimerApellidoJefe = $("#BenefRegPost_PrimerApellidoJefe").val();
	var BenefRegPost_SegundoApellidoJefe = $("#BenefRegPost_SegundoApellidoJefe").val();
	var BenefRegPost_TipoIdentificacion_Jefe = $("#BenefRegPost_TipoIdentificacion_Jefe").val();
	var BenefRegPost_NumIdenti_Jefe = $("#BenefRegPost_NumIdenti_Jefe").val();
	var BenefRegPost_NivelEscolaridad_Jefe = $("#BenefRegPost_NivelEscolaridad_Jefe").val();
	var BenefRegPost_Ocupacion_Jefe = $("#BenefRegPost_Ocupacion_Jefe").val();
	var BenefRegPost_IngresosMes_Jefe = $("#BenefRegPost_IngresosMes_Jefe").val();
	var BenefRegPost_FechaNac_Jefe = $("#BenefRegPost_FechaNac_Jefe").val();
	var BenefRegPost_Telefono_Jefe = $("#BenefRegPost_Telefono_Jefe").val();
	var BenefRegPost_EnfoqueDiferencial_jefe = $("#BenefRegPost_EnfoqueDiferencial_jefe").val();
	var BenefRegPost_TipoAcceso = $("#BenefRegPost_TipoAcceso").val();
	var BenefRegPost_Latitud = $("#BenefRegPost_Latitud").val();
	var BenefRegPost_Longitud = $("#BenefRegPost_Longitud").val();
	var BenefRegPost_DisponibilidadAgua = $("#BenefRegPost_DisponibilidadAgua").val();
	var BenefRegPost_ServicioEnergia = $("#BenefRegPost_ServicioEnergia").val();
	var BenefRegPost_ServicioAlcantarillado = $("#BenefRegPost_ServicioAlcantarillado").val();
	var BenefRegPost_ServicioTenencia = $("#BenefRegPost_ServicioTenencia").val();
	var BenefRegPost_Genero_jefe = $("#BenefRegPost_Genero_jefe").val();
	var BenefRegPost_OtraTenencia = $("#BenefRegPost_OtraTenencia").val();
	var BenefRegPost_ID = $("#BenefRegPost_ID").val();
	var Resp = "NO";

	if(!BenefRegPost_FechaElab){
		$("#BenefRegPost_FechaElab").addClass("error");
		Resp="SI";
	}

	if(!BenefRegPost_Contrato){
		$("#BenefRegPost_Contrato").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_TipoIntervencion=="Ninguno"){
		$("#BenefRegPost_TipoIntervencion").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_Genero_jefe=="Ninguno"){
		$("#BenefRegPost_Genero_jefe").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_dpto=="Ninguno"){
		$("#BenefRegPost_dpto").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_mpio=="Ninguno"){
		$("#BenefRegPost_mpio").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_TipoVivienda=="Ninguno"){
		$("#BenefRegPost_TipoVivienda").addClass("error");
		Resp="SI";
	}

	if(!BenefRegPost_Direccion){
		$("#BenefRegPost_Direccion").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_Proyecto=="Ninguno"){
		$("#BenefRegPost_Proyecto").addClass("error");
		Resp="SI";
	}

	if(!BenefRegPost_PrimerNombreJefe){
		$("#BenefRegPost_PrimerNombreJefe").addClass("error");
		Resp="SI";
	}

	if(!BenefRegPost_PrimerApellidoJefe){
		$("#BenefRegPost_PrimerApellidoJefe").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_TipoIdentificacion_Jefe=="Ninguno"){
		$("#BenefRegPost_TipoIdentificacion_Jefe").addClass("error");
		Resp="SI";
	}

	if(!BenefRegPost_NumIdenti_Jefe){
		$("#BenefRegPost_NumIdenti_Jefe").addClass("error");
		Resp="SI";
	}


	if(BenefRegPost_NivelEscolaridad_Jefe=="Ninguno"){
		$("#BenefRegPost_NivelEscolaridad_Jefe").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_Ocupacion_Jefe=="Ninguno"){
		$("#BenefRegPost_Ocupacion_Jefe").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_IngresosMes_Jefe==""){
		$("#BenefRegPost_IngresosMes_Jefe").addClass("error");
		Resp="SI";
	}

	if(!BenefRegPost_FechaNac_Jefe){
		$("#BenefRegPost_FechaNac_Jefe").addClass("error");
		Resp="SI";
	}

	if(!BenefRegPost_Telefono_Jefe){
		$("#BenefRegPost_Telefono_Jefe").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_EnfoqueDiferencial_jefe.length<1){
		$("#BenefRegPost_EnfoqueDiferencial_jefe").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_TipoAcceso=="Ninguno"){
		$("#BenefRegPost_TipoAcceso").addClass("error");
		Resp="SI";
	}


	if(!BenefRegPost_ID){
		$("#BenefRegPost_ID").addClass("error");
		Resp="SI";
	}	


	if(BenefRegPost_DisponibilidadAgua=="Ninguno"){
		$("#BenefRegPost_DisponibilidadAgua").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_ServicioEnergia=="Ninguno"){
		$("#BenefRegPost_ServicioEnergia").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_ServicioAlcantarillado=="Ninguno"){
		$("#BenefRegPost_ServicioAlcantarillado").addClass("error");
		Resp="SI";
	}

	if(BenefRegPost_ServicioTenencia=="Ninguno"){
		$("#BenefRegPost_ServicioTenencia").addClass("error");
		Resp="SI";
	}

	if((BenefRegPost_ServicioTenencia=="4" || BenefRegPost_ServicioTenencia==4) && (!BenefRegPost_OtraTenencia)){
		$("#BenefRegPost_OtraTenencia").addClass("error");
		Resp="SI";
	}


	if(Resp=="SI"){
		window.toastr.error("Faltan algunos campos obligatorios!");
		return false;
	}else{	

		var pasefamilia = false;
		if(!GrupoFamiliar.length>0){
			Swal.fire({
			  title: '¿Estás seguro?',
			  text: 'se va registrar la planilla sin grupo familiar! ¿desea continuar?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Sí',
			  cancelButtonText: 'No'
			}).then((result) => {
			  if (result.isConfirmed) {
			  	GrupoFamiliar = "NO";
			    
			  	if(!BenefRegPost_SegundoNombreJefe){
			  		BenefRegPost_SegundoNombreJefe = "S/D";
			  	}

			  	if(!BenefRegPost_SegundoApellidoJefe){
			  		BenefRegPost_SegundoApellidoJefe = "S/D";
			  	}

			  	if(!BenefRegPost_Longitud){
			  		BenefRegPost_Longitud= "S/D";
			  	}

			  	if(!BenefRegPost_Latitud){
			  		BenefRegPost_Latitud= "S/D";
			  	}			  	

				$.ajax({
			        url: 'Beneficiarios.php',
			        type: 'POST',
			        data: { opcion: "GuardarPostulado",BenefRegPost_FechaElab:BenefRegPost_FechaElab,BenefRegPost_Contrato:BenefRegPost_Contrato,BenefRegPost_TipoIntervencion:BenefRegPost_TipoIntervencion,BenefRegPost_dpto:BenefRegPost_dpto,BenefRegPost_mpio:BenefRegPost_mpio,BenefRegPost_TipoVivienda:BenefRegPost_TipoVivienda,BenefRegPost_Direccion:BenefRegPost_Direccion,BenefRegPost_Proyecto:BenefRegPost_Proyecto,BenefRegPost_PrimerNombreJefe:BenefRegPost_PrimerNombreJefe,BenefRegPost_SegundoNombreJefe:BenefRegPost_SegundoNombreJefe,BenefRegPost_PrimerApellidoJefe:BenefRegPost_PrimerApellidoJefe,BenefRegPost_SegundoApellidoJefe:BenefRegPost_SegundoApellidoJefe,BenefRegPost_TipoIdentificacion_Jefe:BenefRegPost_TipoIdentificacion_Jefe,BenefRegPost_NumIdenti_Jefe:BenefRegPost_NumIdenti_Jefe,BenefRegPost_NivelEscolaridad_Jefe:BenefRegPost_NivelEscolaridad_Jefe,BenefRegPost_Ocupacion_Jefe:BenefRegPost_Ocupacion_Jefe,BenefRegPost_IngresosMes_Jefe:BenefRegPost_IngresosMes_Jefe,BenefRegPost_FechaNac_Jefe:BenefRegPost_FechaNac_Jefe,BenefRegPost_Telefono_Jefe:BenefRegPost_Telefono_Jefe,BenefRegPost_EnfoqueDiferencial_jefe:BenefRegPost_EnfoqueDiferencial_jefe,BenefRegPost_TipoAcceso:BenefRegPost_TipoAcceso,BenefRegPost_Latitud:BenefRegPost_Latitud,BenefRegPost_Longitud:BenefRegPost_Longitud,BenefRegPost_DisponibilidadAgua:BenefRegPost_DisponibilidadAgua,BenefRegPost_ServicioEnergia:BenefRegPost_ServicioEnergia,BenefRegPost_ServicioAlcantarillado:BenefRegPost_ServicioAlcantarillado,BenefRegPost_ServicioTenencia:BenefRegPost_ServicioTenencia,BenefRegPost_Genero_jefe:BenefRegPost_Genero_jefe,BenefRegPost_OtraTenencia:BenefRegPost_OtraTenencia,GrupoFamiliar:GrupoFamiliar,BenefRegPost_ID:BenefRegPost_ID}
			        ,success: function (respuesta) {
			        	LimpiarFormularioPostulados();
			            window.Swal.fire("Exito!","Se Almacena de forma exitosa la planilla con el número :"+respuesta+" !","success");
			        }, error: function () {
			            window.toastr.error('Error al cargar las opciones');
			        }
			    });
			  }
			});
		}else{
		    $.ajax({
		        url: 'Beneficiarios.php',
		        type: 'POST',
		        data: { opcion: "GuardarPostulado",BenefRegPost_FechaElab:BenefRegPost_FechaElab,BenefRegPost_Contrato:BenefRegPost_Contrato,BenefRegPost_TipoIntervencion:BenefRegPost_TipoIntervencion,BenefRegPost_dpto:BenefRegPost_dpto,BenefRegPost_mpio:BenefRegPost_mpio,BenefRegPost_TipoVivienda:BenefRegPost_TipoVivienda,BenefRegPost_Direccion:BenefRegPost_Direccion,BenefRegPost_Proyecto:BenefRegPost_Proyecto,BenefRegPost_PrimerNombreJefe:BenefRegPost_PrimerNombreJefe,BenefRegPost_SegundoNombreJefe:BenefRegPost_SegundoNombreJefe,BenefRegPost_PrimerApellidoJefe:BenefRegPost_PrimerApellidoJefe,BenefRegPost_SegundoApellidoJefe:BenefRegPost_SegundoApellidoJefe,BenefRegPost_TipoIdentificacion_Jefe:BenefRegPost_TipoIdentificacion_Jefe,BenefRegPost_NumIdenti_Jefe:BenefRegPost_NumIdenti_Jefe,BenefRegPost_NivelEscolaridad_Jefe:BenefRegPost_NivelEscolaridad_Jefe,BenefRegPost_Ocupacion_Jefe:BenefRegPost_Ocupacion_Jefe,BenefRegPost_IngresosMes_Jefe:BenefRegPost_IngresosMes_Jefe,BenefRegPost_FechaNac_Jefe:BenefRegPost_FechaNac_Jefe,BenefRegPost_Telefono_Jefe:BenefRegPost_Telefono_Jefe,BenefRegPost_EnfoqueDiferencial_jefe:BenefRegPost_EnfoqueDiferencial_jefe,BenefRegPost_TipoAcceso:BenefRegPost_TipoAcceso,BenefRegPost_Latitud:BenefRegPost_Latitud,BenefRegPost_Longitud:BenefRegPost_Longitud,BenefRegPost_DisponibilidadAgua:BenefRegPost_DisponibilidadAgua,BenefRegPost_ServicioEnergia:BenefRegPost_ServicioEnergia,BenefRegPost_ServicioAlcantarillado:BenefRegPost_ServicioAlcantarillado,BenefRegPost_ServicioTenencia:BenefRegPost_ServicioTenencia,BenefRegPost_Genero_jefe:BenefRegPost_Genero_jefe,BenefRegPost_OtraTenencia:BenefRegPost_OtraTenencia,GrupoFamiliar:GrupoFamiliar,BenefRegPost_ID:BenefRegPost_ID}
		        ,success: function (respuesta) {
			        LimpiarFormularioPostulados();
		            window.Swal.fire("Exito!","Se Almacena de forma exitosa la planilla con el número :"+respuesta+" !","success");
		        }, error: function () {
		            window.toastr.error('Error al cargar las opciones');
		        }
		    });
		}
	}
}


function TipoTenencia() {

	var TipoTenencia = $("#BenefRegPost_ServicioTenencia").val();
	if(TipoTenencia=="4" || TipoTenencia==4){
		$("#Div_BenefRegPost_OtraTenencia").show();
	}else{
		$("#Div_BenefRegPost_OtraTenencia").hide();
	}
}

function LimpiarFormularioPostulados(){

	GrupoFamiliar = [];
	ActualizarTablaGrupoFamiliar();
	$("#BenefRegPost_FechaElab").val("");
	$("#BenefRegPost_Contrato").val("");
	$("#BenefRegPost_TipoIntervencion").val("Ninguno");
	$("#BenefRegPost_dpto").val("Ninguno");
	$("#BenefRegPost_mpio").val("Ninguno");
	$("#BenefRegPost_TipoVivienda").val("Ninguno");
	$("#BenefRegPost_Direccion").val("");
	$("#DireccionResultante").html("");
	$("#tipo_via").val("Ninguno");
	$("#Numero1").val("");
	$("#Letra").val("Ninguno");
	$("#Bis_1").val("Ninguno");
	$("#Numero2").val("");
	$("#Letra2").val("Ninguno");
	$("#Cardinalidad").val("Ninguno");
	$("#vivienda").val("Ninguno");
	$("#Numero3").val("");
	$("#Otro").val("");
	$("#BenefRegPost_Proyecto").val("Ninguno");
	$("#BenefRegPost_NombreJefe").val("");
	$("#BenefRegPost_TipoIdentificacion_Jefe").val("Ninguno");
	$("#BenefRegPost_NumIdenti_Jefe").val("");
	$("#BenefRegPost_NivelEscolaridad_Jefe").val("Ninguno");
	$("#BenefRegPost_Ocupacion_Jefe").val("Ninguno");
	$("#BenefRegPost_IngresosMes_Jefe").val("");
	$("#BenefRegPost_FechaNac_Jefe").val("");
	$("#BenefRegPost_Telefono_Jefe").val("");
	$("#BenefRegPost_EnfoqueDiferencial_jefe").val([]);
	$('#BenefRegPost_EnfoqueDiferencial_jefe').multipleSelect({
    	width: '100%', placeholder: 'Seleccione opciones'
	});
	$("#BenefRegPost_TipoAcceso").val("Ninguno");
	$("#BenefRegPost_Latitud").val("");
	$("#BenefRegPost_Longitud").val("");
	$("#BenefRegPost_DisponibilidadAgua").val("Ninguno");
	$("#BenefRegPost_ServicioEnergia").val("Ninguno");
	$("#BenefRegPost_ServicioAlcantarillado").val("Ninguno");
	$("#BenefRegPost_ServicioTenencia").val("Ninguno");
	$("#BenefRegPost_Genero_jefe").val("Ninguno");
	$("#BenefRegPost_OtraTenencia").val("");
	TipoTenencia();

	$("#BenefRegPost_NombrePariente").val("");
	$("#BenefRegPost_EnfoqueDiferencial_Pariente").val([]);
	$('#BenefRegPost_EnfoqueDiferencial_Pariente').multipleSelect({
    	width: '100%', placeholder: 'Seleccione opciones'
	});
	$("#BenefRegPost_FechaNacimiento_Pariente").val("");
	$("#BenefRegPost_TipoIdentificacion_Pariente").val("Ninguno");
	$("#BenefRegPost_NumIdenti_Pariente").val("");
	$("#BenefRegPost_Parentesco_Pariente").val("Ninguno");
	$("#BenefRegPost_NivelEscolaridad_Pariente").val("Ninguno");
	$("#BenefRegPost_IngresosMes_Pariente").val("");

}