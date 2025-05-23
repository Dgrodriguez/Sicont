var IdProveedor = "";
var ArchivosCargados=[];
function GuardarProveedor(){

 	var Nombre = $("#Proveedor_Nombre").val();
    var NumeroNit = $("#Proveedor_NumeroNit").val();
    var Direccion = $("#Proveedor_Direccion").val();
    var NumeroTelf = $("#Proveedor_NumeroTelf").val();
    var Depto = $("#CrearContrato_dpto").val();
    var Mpio = $("#CrearContrato_mpio").val();
    var Resp = 'NO';
    $(".error").removeClass("error");


    if(!Nombre){
        $("#Proveedor_Nombre").addClass("error");
        Resp = 'SI';
    }

    if(!NumeroNit){
        $("#Proveedor_NumeroNit").addClass("error");
        Resp = 'SI';
    }

    if(!Direccion){
        $("#Proveedor_Direccion").addClass("error");
        Resp = 'SI';
    }

    if(!NumeroTelf){
        $("#Proveedor_NumeroTelf").addClass("error");
        Resp = 'SI';
    }

    if(Depto=="Ninguno"){
        $("#CrearContrato_dpto").addClass("error");
        Resp = 'SI';
    }

    if(Mpio=="Ninguno"){
        $("#CrearContrato_mpio").addClass("error");
        Resp = 'SI';
    }

    if (Resp=='SI') {

        window.toastr.error("Algunos campos obligatorios estan en blanco!");

    }else{
        $.ajax({
            url: 'Proveedores.php',
            type: 'POST',
            data:{opcion:"GuardarProveedor",Nombre:Nombre,NumeroNit:NumeroNit,Direccion:Direccion,NumeroTelf:NumeroTelf,depto:Depto,mpio:Mpio},
            success: function(respuesta){
                if(respuesta.trim() =="OK"){
                    window.Swal.fire("Exito!",'Proveedor agregado exitosamente!',"success").then(function() {
                    	LimpiarCrearProveedor();
                    	CargarListaProveedores();
                	});
                }else{
                    window.Swal.fire("Error de Validación!",respuesta,"error");
                }
            },error: function(){
                window.toastr.error('lo siento, ocurrio un error');
            }
        });
    }
}


function LimpiarCrearProveedor(){

	$("#Proveedor_Nombre").val("");
    $("#Proveedor_NumeroNit").val("");
    $("#Proveedor_Direccion").val("");
    $("#Proveedor_NumeroTelf").val("");

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
            $("#CrearContrato_dpto").html(html);
        },
        error: function(){
            alert('Error al cargar las opciones');
        }
    });
}



function CargarMunicipio(){
    var depto = $("#CrearContrato_dpto").val();
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
            $("#CrearContrato_mpio").html(html);
        },
        error: function(){
            alert('Error al cargar las opciones');
        }
    });
}


function CargarListaProveedores(){
	$.ajax({
        url: 'Proveedores.php',
        type: 'POST',
        data:{opcion:"CargarListaProveedores"},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            var tabla = $('#Tbl_Proveedor_Listado').DataTable();
            tabla.clear().draw();
            if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                    tabla.row.add([
                      '<center>'+parseInt(i+1)+'</center>',
                      '<center>'+datos[i].Nombre+'</center>',
                      '<center>'+datos[i].Nit+'</center>',
                      '<center>'+datos[i].Direccion+'</center>',
                      '<center>'+datos[i].Telefono+'</center>',
                      '<center>'+datos[i].Depto+'</center>',
                      '<center>'+datos[i].Mpio+'</center>'                      
                    ]).draw();
                }
                $('[data-toggle="tooltip"]').tooltip();
            }
        },
        error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });
}




function formatearMonto(monto) {
  // Convertir el monto a número y verificar si es válido
  var montoNum = parseFloat(monto);
  if (isNaN(montoNum)) {
    return '';
  }

  // Configurar las opciones para el formateo personalizado
  const opciones = {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
    useGrouping: true,
    groupingSeparator: ',',
    decimalSeparator: '.'
  };

  // Formatear el monto con las opciones personalizadas
  const montoFormateado = '$' + montoNum.toLocaleString(undefined, opciones);

  return montoFormateado;
}




function maquillarNumero(input) {
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


function convertirAMayusculas() {
  $(this).val($(this).val().toUpperCase());
}



function BuscarProveedore() {
    
    var ingresado = $("#ProveedorListaPrecio_Proveedor").val();
    if (ingresado && ingresado.length >= 3) {
        $("#ProveedorListaPrecio_ListaProveedores").show(500);
        $.ajax({
            url: 'Proveedores.php',
            type: 'POST',
            data:{opcion:"BuscarProveedore",ingresado:ingresado},
            success: function(respuesta){
                var html = '';
                if(respuesta.trim()!='"NO"'){
                    var datos = JSON.parse(respuesta);
                    if(datos.length>0){
                        for (var i = 0; i < datos.length; i++) {
                            html+='<li class="list-group-item" onclick="MostrarInfoProveedor(\''+datos[i].ID+'\',\''+datos[i].Nombre+'\')" >'+datos[i].Nombre+'</li>';
                        }
                    }
                    $("#ProveedorListaPrecio_ListaProveedores").html(html);
                }else{
                    $("#ProveedorListaPrecio_ListaProveedores").html('<li class="list-group-item">No hay datos que mostrar</li>');
                }
            },
            error: function(){
                 window.toastr.warning('Error al cargar las opciones');
            }
        });
    }else{
        $("#ProveedorListaPrecio_ListaProveedores").hide(500);

    }
}


function SubirCargaMasiva() {

    if(ArchivosCargados.length>0){
        var FechaActualizacion = $("#ProveedorListaPrecio_fechaActCM").val();
        if(!FechaActualizacion){
            $("#ProveedorListaPrecio_fechaActCM").addClass("error");
           window.toastr.error("Debe ingresar una fecha de actualización!");
           return false;
        }else{

            $("#ProveedorListaPrecio_ListaProveedores").show(500);
            $.ajax({
                url: 'Proveedores.php',
                type: 'POST',
                data:{opcion:"SubirCargaMasiva",ArchivosCargados:ArchivosCargados,IdProveedor:IdProveedor,FechaActualizacion:FechaActualizacion},
                success: function(respuesta){
                    if(respuesta.trim()=="OK"){
                        window.Swal.fire("Exito!","Datos Cargados exitosamente!","success").then(function() {
                            $("#ProveedorListaPrecio_ProveedorCM").val("");
                            $("#ProveedorListaPrecio_fechaActCM").val("");
                            $("#CerrarModal").click();
                        });
                    }else{
                        window.toastr.warning("Finalizo la carga del archivo, sin embargo se presentaron algunos errores");
                        $("#ProveedorListaPrecio_Errores").html(respuesta);
                        $("#ProveedorListaPrecio_Errores").show();
                    }
                },
                error: function(){
                     window.toastr.warning('Error al cargar las opciones');
                }
            });
        }
    }else{
        window.toastr.error("Debe cargar un archivo para poder guardar");
    }
}


function MostrarInfoProveedorCM(ParamIdProveedor,NombreProveedor){
    IdProveedor = ParamIdProveedor;
    $("#ProveedorListaPrecio_ProveedorCM").val(NombreProveedor);
    $("#ProveedorListaPrecio_ListaProveedoresCM").hide(500);
    $("#ProveedorListaPrecio_ListaProveedoresCM").html("");


}

function CargarArchivoCM(){

  var files = []; // Array para los datos de los archivos cargados
event.preventDefault();

var archivo = $('#CrearContrato_archivo')[0].files[0];

// Validar que se haya seleccionado un archivo
if (!archivo) {
    window.toastr.error('Por favor seleccione un archivo');
    return;
}


// Validar la extensión del archivo
var extension = archivo.name.split('.').pop().toLowerCase();
if (extension !== 'xlsx' && extension !== 'xls') {
    window.toastr.error('Por favor seleccione un archivo de Excel válido');
    return;
}

// Crear objeto FormData con los datos del archivo y tipo de documento
var formData = new FormData();
formData.append('archivo', archivo);
formData.append('opcion', 'upload_file');

$.ajax({
    url: 'Proveedores.php',
    type: 'POST',
    data: formData,
    contentType: false,
    processData: false,
    success: function(response) {
        var data = JSON.parse(response);
        if (data.length > 0) {
            ArchivosCargados.push({
                NombreArchivo: data[0]['Nombre'],
                Url: data[0]['Url'],
                size: data[0]['size']
            });
        } 
        // Agregar datos del archivo al array
        files.push(JSON.parse(response));

        // Mostrar mensaje de éxito
        window.toastr.success('El archivo se ha cargado correctamente a la carpeta temporal');

        // Limpiar el input del archivo
        $('#archivo').val('');
    },
    error: function() {
        window.toastr.warning('Se ha producido un error al cargar el archivo');
    }
});

}


function BuscarProveedoreCM() {
    
    var ingresado = $("#ProveedorListaPrecio_ProveedorCM").val();
    if (ingresado && ingresado.length >= 3) {
        $("#ProveedorListaPrecio_ListaProveedoresCM").show(500);
        $.ajax({
            url: 'Proveedores.php',
            type: 'POST',
            data:{opcion:"BuscarProveedore",ingresado:ingresado},
            success: function(respuesta){
                var html = '';
                if(respuesta.trim()!='"NO"'){
                    var datos = JSON.parse(respuesta);
                    if(datos.length>0){
                        for (var i = 0; i < datos.length; i++) {
                            html+='<li class="list-group-item" onclick="MostrarInfoProveedorCM(\''+datos[i].ID+'\',\''+datos[i].Nombre+'\')" >'+datos[i].Nombre+'</li>';
                        }
                    }
                    $("#ProveedorListaPrecio_ListaProveedoresCM").html(html);
                }else{
                    $("#ProveedorListaPrecio_ListaProveedoresCM").html('<li class="list-group-item">No hay datos que mostrar</li>');
                }
            },
            error: function(){
                 window.toastr.warning('Error al cargar las opciones');
            }
        });
    }
}

function GuardarPrecioElemento() {
	var Elemento = $("#ProveedorListaPrecio_Elemento").val();
    var Und = $("#ProveedorListaPrecio_Und").val();
    var Precio = $("#ProveedorListaPrecio_Precio").val();
    var Depto = $("#CrearContrato_dpto").val();
    var Mpio = $("#CrearContrato_mpio").val();
    var FechaActualizacion = $("#ProveedorListaPrecio_fechaAct").val();
    var Resp = 'NO';
    $(".error").removeClass("error");


    if(!Elemento){
        $("#ProveedorListaPrecio_Elemento").addClass("error");
        Resp = 'SI';
    }

    if(!FechaActualizacion){
        $("#ProveedorListaPrecio_fechaAct").addClass("error");
        Resp = 'SI';
    }

    if(!Und){
        $("#ProveedorListaPrecio_Und").addClass("error");
        Resp = 'SI';
    }

    if(!Precio){
        $("#ProveedorListaPrecio_Precio").addClass("error");
        Resp = 'SI';
    }

    if(Depto=="Ninguno"){
        $("#CrearContrato_dpto").addClass("error");
        Resp = 'SI';
    }

    if(Mpio=="Ninguno"){
        $("#CrearContrato_mpio").addClass("error");
        Resp = 'SI';
    }

    if (Resp=='SI') {

        window.toastr.error("Algunos campos obligatorios estan en blanco!");

    }else{
        $.ajax({
            url: 'Proveedores.php',
            type: 'POST',
            data:{opcion:"GuardarPrecioElemento",Elemento:Elemento,Und:Und,Precio:Precio.replaceAll("$","").replaceAll(",",""),depto:Depto,mpio:Mpio,IdProveedor:IdProveedor,FechaActualizacion:FechaActualizacion},
            success: function(respuesta){
                if(respuesta.trim() =="OK"){
                    window.Swal.fire("Exito!",'Elemento agregado exitosamente!',"success").then(function() {
                    	LimpiarCrearPrecioProveedor();

                    	$.ajax({
					        url: 'Proveedores.php',
					        type: 'POST',
					        data:{opcion:"CargarListaPreciosProveedor",ParamIdProveedor:IdProveedor},
					        success: function(respuesta){
					            var datos = JSON.parse(respuesta);
					            var tabla = $('#Tbl_Proveedor_ListadoPrecios').DataTable();
					            tabla.clear().draw();
					            if(datos.length>0){

					                for (var i = 0; i < datos.length; i++) {
					                    tabla.row.add([
					                      '<center>'+parseInt(i+1)+'</center>',
					                      '<center>'+datos[i].Elemento+'</center>',
					                      '<center>'+datos[i].Unidad+'</center>',
					                      '<center>'+datos[i].FechaCambioPrecio+'</center>',
					                      '<center>'+formatearMonto(datos[i].Precio)+'</center>',
					                      '<center>'+datos[i].mpio+'</center>'                   
					                    ]).draw();
					                }
					                $('#ListadoPrecio').show();
					            }
					        },
					        error: function(){
					             window.toastr.warning('Error al cargar las opciones');
					        }
					    });


                	});
                }else{
                    window.Swal.fire("Error de Validación!",respuesta,"error");
                }
            },error: function(){
                window.toastr.error('lo siento, ocurrio un error');
            }
        });
    }
}



function GenerarPlantilla() {
    var workbook = XLSX.utils.book_new();
    var sheetData = [
        ['Descripción de Elemento', 'Unidad']
    ];

    $.ajax({
        url: 'Proveedores.php',
        type: 'POST',
        data:{opcion:"TraerMpioCargaMasiva"},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            for (var i = 0; i < datos.length; i++) {
                sheetData[0].push(datos[i].nombre);
            }

            var worksheet = XLSX.utils.aoa_to_sheet(sheetData);
            XLSX.utils.book_append_sheet(workbook, worksheet, 'CargaMasiva');

            var workbookOutput = XLSX.write(workbook, { type: 'binary' });
            var blob = new Blob([s2ab(workbookOutput)], { type: 'application/octet-stream' });
            saveAs(blob, 'PlantillaCarga.xlsx');

        },
        error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
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


function LimpiarCrearPrecioProveedor(){
	 $("#ProveedorListaPrecio_Elemento").val("");
     $("#ProveedorListaPrecio_Und").val("");
     $("#ProveedorListaPrecio_Precio").val("");
     $("#CrearContrato_dpto").val("Ninguno");
     $("#CrearContrato_mpio").val("Ninguno");
     $("#ProveedorListaPrecio_fechaAct").val("");
     $("#ProveedorListaPrecio_Proveedor").val("");
}


function MostrarInfoProveedor(ParamIdProveedor,NombreProveedor){
	IdProveedor = ParamIdProveedor;
	$("#ProveedorListaPrecio_Proveedor").val(NombreProveedor);
	$("#ProveedorListaPrecio_ListaProveedores").hide(500);
	$("#ProveedorListaPrecio_ListaProveedores").html("");

	$.ajax({
        url: 'Proveedores.php',
        type: 'POST',
        data:{opcion:"CargarListaPreciosProveedor",ParamIdProveedor:ParamIdProveedor},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            var tabla = $('#Tbl_Proveedor_ListadoPrecios').DataTable();
            tabla.clear().draw();
            if(datos.length>0){

                for (var i = 0; i < datos.length; i++) {
                    tabla.row.add([
                      '<center>'+parseInt(i+1)+'</center>',
                      '<center>'+datos[i].Elemento+'</center>',
                      '<center>'+datos[i].Unidad+'</center>',
                      '<center>'+datos[i].FechaCambioPrecio+'</center>',
                      '<center>'+formatearMonto(datos[i].Precio)+'</center>',
                      '<center>'+datos[i].mpio+'</center>'                   
                    ]).draw();
                }
                $('#ListadoPrecio').show();
            }
        },
        error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });

}
