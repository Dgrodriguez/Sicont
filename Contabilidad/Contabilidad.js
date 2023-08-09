ArchivosCargados = [];
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

// Función para aplicar formato al valor con separador de miles y símbolo del dólar
function formatCurrency(value) {
  return "$" + value.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}


function MostrarArchivosSoporteCargados() {

    var tabla = $('#GridCuentaCobroSoporte').DataTable();
    tabla.clear().draw();
    if(ArchivosCargados.length>0){
        for (var i = 0; i < ArchivosCargados.length; i++) {
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+ArchivosCargados[i].NombreArchivo+'</center>',
              '<center>'+ArchivosCargados[i].TipoDocumento+'</center>'
            ]).draw();
        }
    }

    $("#Btn_ModalSoportesCuentaCobro").click();
}


function AgregarCuentaCobro(){

    var IdContrato = $("#IdContrato").val();
    var Monto = $("#CrearCuentaCobro_Monto").val();
    var Fecha = $("#CrearCuentaCobro_Fecha").val();
    var Numero = $("#CrearCuentaCobro_Numero").val();
    var Resp = 'NO';
    $(".error").removeClass("error");


    if(!Monto){
        $("#CrearCuentaCobro_Monto").addClass("error");
        Resp = 'SI';
    }

    if(!Fecha){
        $("#CrearCuentaCobro_Fecha").addClass("error");
        Resp = 'SI';
    }

    if(!Numero){
        $("#CrearCuentaCobro_Numero").addClass("error");
        Resp = 'SI';
    }

    if (Resp=='SI') {

        window.toastr.error("Algunos campos obligatorios estan en blanco!");

    }else{

        $.ajax({
            url: 'Contabilidad.php',
            type: 'POST',
            data:{opcion:"AgregarCuentaCobro",IdContrato:IdContrato,Fecha:Fecha,Monto:Monto.replaceAll('$','').replaceAll(',',''),Numero:Numero,ArchivosCargados:ArchivosCargados},
            success: function(respuesta){
                if(respuesta.trim() =="Ok"){
                    //MostrarInfoContrato($("#IdContrato").val());

                    window.toastr.success('Monto agregado exitosamente!');
                    $("#CerrarModal").click();
                }else{
                    window.Swal.fire("Error de Validación!",respuesta,"error");
                }
            },error: function(){
                window.toastr.error('lo siento, ocurrio un error');
            }
        });

    }
}

function CargarHistoricoCuentaCobro(){

    var IdContrato = $("#IdContrato").val();

    $.ajax({
        url: 'Contabilidad.php',
        type: 'POST',
        data:{opcion:"CargarHistoricoCuentaCobro",IdContrato:IdContrato},
        success: function(respuesta){

            var datos = JSON.parse(respuesta);
            var html = "";
            var monto = 0;
            for (var i = 0; i < datos.length; i++) {
               monto+=parseFloat(datos[i]['MontoCobro']);
               html+="<tr><td>"+parseInt(i+1)+"</td><td>"+datos[i]['FechaCobro']+"</td><td>"+formatearMonto(datos[i]['MontoCobro'])+"</td><td>"+datos[i]['NumeroCobro']+"</td></tr>";
            }
            $("#GridContratoCuentaCobroCargados tbody").html(html);
            $("#GridContratoCuentaCobroCargados tfoot").html("<tr><td colspan='4'>El saldo Adicionado al contrato hasta el momento es: "+formatearMonto(monto)+"</td></tr>");
            $("#Btn_ModalHistoricoCuentaCobro").click();
        },error: function(){
            window.toastr.warning('Error al cargar las opciones');
        }
    });


    $("#ModalHistoricoCuentaCobro").click();

}

 
function CalcularCuentaCobro() {


  $('#Btn_ModalAgregarCuentaCobro').click();
}





function CalcularSaldosEstimados() {

  var Honorarios =  $("#Honorarios").val();

  if(Honorarios=="vinculado"){
    $("#CrearOtroSI_MontoHonorarios").val("N/A");
    $("#CrearOtroSI_FechaHonorarios").val("N/A");
    $("#CrearOtroSI_FacturaNum").val("N/A");

    $("#CrearOtroSI_MontoHonorarios").attr("readonly","true");
    $("#CrearOtroSI_FechaHonorarios").attr("readonly","true");
    $("#CrearOtroSI_FacturaNum").attr("readonly","true");
  }else{
    $("#CrearOtroSI_MontoHonorarios").removeAttr("readonly");
    $("#CrearOtroSI_FechaHonorarios").removeAttr("readonly");
    $("#CrearOtroSI_FacturaNum").removeAttr("readonly");
  }

  var porRet = parseInt($("#CrearOtroSI_Retencion").val());
  $("#PorcRet").html(porRet);
  var contrato = parseFloat($("#CrearOtroSI_Monto").val().replaceAll(".", "").replaceAll("$", ""));
  var ValMat = parseFloat((contrato * 100) / 105.95);
  var ValHon = parseFloat(ValMat * 0.05);
  var ValIva = parseFloat(ValHon * 0.19);
  var ValRet = parseFloat(ValHon * parseFloat("0."+porRet));

  if($("#CrearOtroSI_TP_Honorarios_codigo").val()=="unico"){
        $("#CrearOtroSI_MontoHonorarios").val(ValHon);
        $("#CrearOtroSI_MontoHonorarios").attr("readonly","true");
  }

  // Reemplazar las variables existentes con el formato adecuado
  $("#ValCont").text(formatCurrency(contrato));
  $("#ValMat").text(formatCurrency(ValMat));
  $("#ValHon").text(formatCurrency(ValHon));
  $("#ValIva").text(formatCurrency(ValIva));
  $("#ValRet").text(formatCurrency(ValRet));

  $('#Btn_ModalAgregarOtroSi').click();
}

function CargarHistoricoHonorarios(){
    var IdContrato = $("#IdContrato").val();
    $.ajax({
        url: 'Contabilidad.php',
        type: 'POST',
        data:{opcion:"CargarHistoricoHonorarios",IdContrato:IdContrato},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            if(datos.length>0){
                $("#GridContratoOtroSiCargados tbody").html("");
                var html = "";
                var monto = 0;
                for (var i = 0; i < datos.length; i++) {
                    monto+=parseFloat(datos[i]['Monto']);
                    html+="<tr><td>"+parseInt(i+1)+"</td><td>"+formatearMonto(datos[i]['Monto'])+"</td><td>"+moment(datos[i]['FechaFactura']).format("DD/MM/YYYY")+"</td><td>"+datos[i]['NumeroFactura']+"</td></tr>";
                }

                var contrato = parseFloat($("#CrearOtroSI_Monto").val().replaceAll(".", "").replaceAll("$", ""));
                var ValMat = parseFloat((contrato * 100) / 105.95);
                var ValHon = parseFloat(ValMat * 0.05);
                var ResultadoHonorarios = parseFloat(ValHon) - parseFloat(monto);

                $("#GridContratoOtroSiCargados tbody").html(html);
                $("#GridContratoOtroSiCargados tfoot").html("<tr><th colspan='2'><center>Monto cobrado en concepto de Honorarios: "+formatearMonto(monto.toFixed(2))+"</center></th><th colspan='2'><center>Monto Aproximado pendiente de cobro en concepto de Honorarios: "+formatearMonto(ResultadoHonorarios.toFixed(2))+"</center></th></tr>");
            }
        }, 
        error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });



    $('#Btn_ModalHistoricoOtroSi').click();

}

function AgregarHonorarios(){
    var IdContrato = $("#IdContrato").val();
    var monto = $("#CrearOtroSI_MontoHonorarios").val().replaceAll(',','').replaceAll('$','');
    var Fecha = $("#CrearOtroSI_FechaHonorarios").val();
    var Fatura = $("#CrearOtroSI_FacturaNum").val();
    $.ajax({
        url: 'Contabilidad.php',
        type: 'POST',
        data:{opcion:"AgregarHonorarios",monto:monto,Fecha:Fecha,Fatura:Fatura,IdContrato:IdContrato},
        success: function(respuesta){
            if(respuesta.trim()=="OK"){
                window.Swal.fire("Exito!", "Honorario agregado exitosamente!", "success").then(function() {
                    $("#CrearOtroSI_MontoHonorarios").val("");
                    $("#CrearOtroSI_FechaHonorarios").val("");
                    $("#CrearOtroSI_FacturaNum").val("");
                  $("#CerrarModal").click();
                });
            }
        },
        error: function(){
            window.toastr.error('Error al cargar las opciones');

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
                    html+='<option retfuente="'+datos[i].RetFuente+'" value="'+datos[i].Id+'">'+datos[i].Nombre+'</option>'
                }
            }
            $("#CrearContrato_mpio").html(html);
        },
        error: function(){
            window.toastr.error('Error al cargar las opciones');

        }
    });
}


function formatearMonto(monto) {
  // Convertir el monto a número y verificar si es válido
  var montoNum = parseFloat(monto);
  if (isNaN(montoNum)) {
    return '';
  }

  // Formatear el monto con separador de miles y símbolo del dólar
  const montoFormateado = '$' + montoNum.toLocaleString();

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

function CargarArchivo(){

    var files = []; // Array para los datos de los archivos cargados
    event.preventDefault();
    
    var tipo_documento = $('#CrearContrato_TipoDocumentoAdjunto').val();
    var archivo = $('#CrearContrato_archivo')[0].files[0];

    // Validar que se haya seleccionado un archivo
    if (!archivo) {
        window.toastr.error('Por favor seleccione un archivo');
      return;
    }
    
    // Validar que el archivo no exceda el peso máximo
    var max_size = 5 * 1024 * 1024; // 5 MB
    if (archivo.size > max_size) {
      window.toastr.error('El archivo seleccionado excede el peso máximo permitido (5 MB)');
      return;
    }
    
    // Crear objeto FormData con los datos del archivo y tipo de documento
    var formData = new FormData();
    formData.append('archivo', archivo);
    formData.append('tipo_documento', tipo_documento);
    formData.append('opcion', 'upload_file');

    $.ajax({
      url: '../Administracion/administracion.php',
      type: 'POST',
      data: formData,
      contentType: false,
      processData: false,
      success: function(response) {
        var data = JSON.parse(response);
        if(data.length>0){
            ArchivosCargados.push({
                NombreArchivo: data[0]['Nombre'],
                TipoDocumento: data[0]['TipoDocumento'],
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


function MostrarArchivosCargados() {
    


    var tabla = $('#GridContratoArchivosCargados').DataTable();
    tabla.clear().draw();
    if(ArchivosCargados.length>0){
        for (var i = 0; i < ArchivosCargados.length; i++) {
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+ArchivosCargados[i].NombreArchivo+'</center>',
              '<center>'+ArchivosCargados[i].TipoDocumento+'</center>',
              '<center>'+ArchivosCargados[i].size+'</center>'
            ]).draw();
        }
    }

    $("#But_Modal_ArchCarg").click();
}

function CargarTipoAdjuntoContrato(){

    $.ajax({
        url: '../Administracion/administracion.php',
        type: 'POST',
        data:{opcion:"CargarTipoAdjuntoContrato"},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            var html = '<option value="Ninguno">Seleccione</option>';
            if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                    html+='<option value="'+datos[i].Id+'">'+datos[i].Nombre+'</option>'
                }
            }
            $("#CrearContrato_TipoDocumentoAdjunto").html(html);
        },
        error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });

}

function GuardarContrato(){

    var depto = $("#CrearContrato_dpto").val();
    var mpio = $("#CrearContrato_mpio").val();
    var PersonaContacto = $("#CrearContrato_PersonaContacto").val();
    var numero_contacto = $("#CrearContrato_NumeroContacto").val();
    var correo_contacto = $("#CrearContrato_CorreoContacto").val();
    var contratante = $("#CrearContrato_nombreContratante").val();
    var NumContratoViva = $("#CrearContrato_NumContratoViva").val();
    var NumContratoContratante = $("#CrearContrato_NumContratoContratante").val();
    var Monto = $("#CrearContrato_Monto").val();
    var FechaIni = $("#CrearContrato_fechaIni").val();
    var FechaFin = $("#CrearContrato_fechaFin").val();
    var objetoContrato = $("#CrearContrato_objetoContrato").val();
    var Resp = 'NO';
    $(".error").removeClass("error");


    if(depto=="Ninguno"){
        $("#CrearContrato_dpto").addClass("error");
        Resp = 'SI';
    }

    if(mpio=="Ninguno"){
        $("#CrearContrato_mpio").addClass("error");
        Resp = 'SI';
    }

    if(!PersonaContacto){
        $("#CrearContrato_PersonaContacto").addClass("error");
        Resp = 'SI';
    }

    if(!numero_contacto){
        $("#CrearContrato_NumeroContacto").addClass("error");
        Resp = 'SI';
    }   

    if(!correo_contacto){
        $("#CrearContrato_CorreoContacto").addClass("error");
        Resp = 'SI';
    } 

    if(!contratante){
        $("#CrearContrato_nombreContratante").addClass("error");
        Resp = 'SI';
    }

    if(!NumContratoViva){
        $("#CrearContrato_NumContratoViva").addClass("error");
        Resp = 'SI';
    }

    if(!Monto){
        $("#CrearContrato_Monto").addClass("error");
        Resp = 'SI';
    }
    
    if(!FechaIni){
        $("#CrearContrato_fechaIni").addClass("error");
        Resp = 'SI';
    }

    if(!FechaFin){
        $("#CrearContrato_fechaFin").addClass("error");
        Resp = 'SI';
    }    

    if(!objetoContrato){
        $("#CrearContrato_objetoContrato").addClass("error");
        Resp = 'SI';
    }   

    if (Resp=='SI') {

         window.toastr.error("Algunos campos obligatorios estan en blanco!");

    }else{

        $.ajax({
            url: '../Administracion/administracion.php',
            type: 'POST',
            data:{opcion:"GuardarContrato",depto:depto,mpio:mpio,PersonaContacto:PersonaContacto,numero_contacto:numero_contacto,correo_contacto:correo_contacto,contratante:contratante,NumContratoViva:NumContratoViva,NumContratoContratante:NumContratoContratante,Monto:Monto.replaceAll('$','').replaceAll(',',''),FechaIni:FechaIni,FechaFin:FechaFin,objetoContrato:objetoContrato,ArchivosCargados:ArchivosCargados},
            success: function(respuesta){

                if(respuesta.trim() == "Error"){
                    $("#CrearContrato_NumContratoViva").val("").addClass("error");
                    window.Swal.fire("Error de Validación!","El número de contrato ingresado ya se encuentra asignado, favor ingresa uno nuevo!","error");
                }else{
                   LimpiarformularioContratos();
                    window.Swal.fire("Exito!","El Contrato se almaceno exitosamente!","success");
                }
            },
            error: function(){
                window.toastr.error('Error al cargar las opciones');
            }
        });
    }
}

function LimpiarformularioContratos(){

    $("#CrearContrato_dpto").val("Ninguno");
    $("#CrearContrato_mpio").val("Ninguno");
    $("#CrearContrato_PersonaContacto").val("");
    $("#CrearContrato_NumeroContacto").val("");
    $("#CrearContrato_CorreoContacto").val("");
    $("#CrearContrato_nombreContratante").val("");
    $("#CrearContrato_NumContratoViva").val("");
    $("#CrearContrato_NumContratoContratante").val("");
    $("#CrearContrato_Monto").val("");
    $("#CrearContrato_fechaIni").val("");
    $("#CrearContrato_fechaFin").val("");
    $("#CrearContrato_objetoContrato").val("");
    $("#btnModalNuevoOtroSi").attr("disabled","true");
    $("#btnModalHistoricoOtroSi").attr("disabled","true");
    ArchivosCargados = [];
    $(".error").removeClass("error");

}



function BuscarContratoPropio() {
    
    var ingresado = $("#CrearOtroSI_NumContratoViva").val();
    if (ingresado && ingresado.length >= 3) {
        $("#CrearOtroSI_ListaNumContratoViva").show(500);
        $.ajax({
            url: '../Administracion/administracion.php',
            type: 'POST',
            data:{opcion:"BuscarContratoPropio",ingresado:ingresado},
            success: function(respuesta){
                var html = '';
                if(respuesta.trim()!='"NO"'){
                    var datos = JSON.parse(respuesta);
                    if(datos.length>0){
                        for (var i = 0; i < datos.length; i++) {
                            html+='<li class="list-group-item" onclick="MostrarInfoContrato(\''+datos[i].ID+'\')" >'+datos[i].CONTRATO_NUMERO_VIVA+'</li>';
                        }
                    }
                    $("#CrearOtroSI_ListaNumContratoViva").html(html);
                }else{
                    $("#CrearOtroSI_ListaNumContratoViva").html('<li class="list-group-item">No hay datos que mostrar</li>');
                }
            },
            error: function(){
                 window.toastr.warning('Error al cargar las opciones');
            }
        });
    }
}

function MostrarInfoContrato(IdContrato) {
    $("#CrearOtroSI_ListaNumContratoViva").hide(500);
    $("#CrearOtroSI_ListaNumContratoViva").html("");
    
    $.ajax({
        url: '../Administracion/administracion.php',
        type: 'POST',
        data:{opcion:"MostrarInfoContrato",IdContrato:IdContrato},
        success: function(respuesta){
           var datos = JSON.parse(respuesta);
           limpiarModalOtroSi();
           $("#IdContrato").val(datos[0].ID);
           $("#CrearOtroSI_NumContratoViva").val(datos[0].CONTRATO_NUMERO_VIVA);
           $("#CrearOtroSI_NumContratoContratante").val(datos[0].CONTRATO_NUMERO_CONTRATANTE);
           $("#CrearOtroSI_nombreContratante").val(datos[0].CONTRATANTE);
           $("#CrearOtroSI_fechaIni").val(datos[0].FECHA_INI);
           $("#CrearOtroSI_fechaFin").val(datos[0].FECHA_FIN);
           $("#CrearOtroSI_Monto").val( formatearMonto(datos[0].MONTO) );
           $("#CrearOtroSI_objetoContrato").html(datos[0].OBJETO_CONTRATO);
           $("#CrearOtroSI_dpto").val(datos[0].DEPTO);
           $("#CrearOtroSI_mpio").val(datos[0].MPIO);
           $("#CrearOtroSI_PersonaContacto").val(datos[0].NOMBRE_CONTACTO);
           $("#CrearOtroSI_NumeroContacto").val(datos[0].NUMERO_CONTACTO);
           $("#CrearOtroSI_CorreoContacto").val(datos[0].CORREO_CONTACTO);
           $("#Honorarios").val(datos[0].PAGOHONORARIO);
           if(datos[0].PAGOHONORARIO=="unico"){
                $("#CrearOtroSI_TipoHonorarios").val("Única Factura");
           }else if(datos[0].PAGOHONORARIO=="fraccionado"){
                $("#CrearOtroSI_TipoHonorarios").val("Pago Fraccionado");
           }else if(datos[0].PAGOHONORARIO=="vinculado"){
                $("#CrearOtroSI_TipoHonorarios").val("Vinculado a Despacho");
           }

           $("#CrearOtroSI_Retencion").val(datos[0].RetFuente);
           $("#btnModalNuevoOtroSi").removeAttr("disabled");
           $("#btnModalHistoricoOtroSi").removeAttr("disabled");
           if(datos[0].POSEE_ARCHIVOS == "SI"){
                var tabla = $('#GridContratoArchivosCargados').DataTable();
                tabla.clear().draw();
                var adjuntos = datos[0].Adjuntos;
                if(adjuntos.length>0){
                    for (var i = 0; i < adjuntos.length; i++) {
                        tabla.row.add([
                          '<center>'+parseInt(i+1)+'</center>',
                          '<center>'+adjuntos[i].NOMBRE_ARCHIVO+'</center>',
                          '<center>'+adjuntos[i].TipoDocumento+'</center>',
                          '<center>'+adjuntos[i].SIZE+'</center>',
                          '<center><a href="'+adjuntos[i].URL+'" download data-toggle="tooltip" title="Descargar PDF"> <i class="fas fa-file-download"></i></a> </center>'
                        ]).draw();
                    }

                    $('[data-toggle="tooltip"]').tooltip();


                }
            }
            CargarHistoricoOtroSi();
        },
        error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });

}


function GuardarOtroSiContrato() {

    var IdContrato = $("#IdContrato").val();
    var tipoAdicion = $("#CrearOtroSI_tipoOtroSi").val();
    var montoAdicionar = $("#CrearOtroSI_montoAdicionar").val();
    var nuevaFechaFin = $("#CrearOtroSI_nuevaFechaFin").val();

    $.ajax({
        url: '../Administracion/administracion.php',
        type: 'POST',
        data:{opcion:"GuardarOtroSiContrato",IdContrato:IdContrato,tipoAdicion:tipoAdicion,montoAdicionar:montoAdicionar.replaceAll('$','').replaceAll(',',''),nuevaFechaFin:nuevaFechaFin},
        success: function(respuesta){
            if(respuesta.trim() =="OK"){
                MostrarInfoContrato($("#IdContrato").val());
                limpiarModalOtroSi();
                window.toastr.success('Modificación agregada exitosamente!');
                $("#CerrarModal").click();
            }else{
                window.toastr.warning('Error, el monto total posterior a la adición no puede superar los '+respuesta);
            }
        },error: function(){
            window.toastr.warning('Error al cargar las opciones');
        }
    });

}


function limpiarModalOtroSi(){
    $("#CrearOtroSI_tipoOtroSi").val("Ninguno");
    $("#CrearOtroSI_montoAdicionar").val("");
    $("#CrearOtroSI_nuevaFechaFin").val("");
    var tabla = $('#GridContratoOtroSiCargados').DataTable();
    tabla.clear().draw();
}


function CargarHistoricoOtroSi() {
    var IdContrato = $("#IdContrato").val();
    $.ajax({
        url: '../Administracion/administracion.php',
        type: 'POST',
        data:{opcion:"CargarHistoricoOtroSi",IdContrato:IdContrato},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            var tabla = $('#GridContratoOtroSiCargados').DataTable();
            tabla.clear().draw();
            if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                    tabla.row.add([
                      '<center>'+parseInt(i+1)+'</center>',
                      '<center>'+datos[i].FechaCreacion+'</center>',
                      '<center>'+datos[i].MONTO+'</center>',
                      '<center>'+datos[i].FECHA_FIN+'</center>',
                      '<center>'+datos[i].UsuarioCreacion+'</center>'
                    ]).draw();
                }
            }
        },
        error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });

}