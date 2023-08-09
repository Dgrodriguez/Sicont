var ArchivosCargados = [];
var ContratistasDirecto = [];
var SupervisoresContrato = [];
var AmparosPoliza = [];
function CargarDeptos(id_input) {

    $.ajax({
        url: 'administracion.php',
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

function GuardarInfoAdicionalContrato(){

    $(".error").removeClass("error");
    var CrearContratoAdicionar_FechaInicio = $("#CrearContratoAdicionar_FechaInicio").val();
    var CrearContratoAdicionar_FechaFin = $("#CrearContratoAdicionar_FechaFin").val();
    var CrearContratoAdicionar_FechaContrato = $("#CrearContratoAdicionar_FechaContrato").val();
    var CrearContratoAdicionar_CompromisoPresupuestal = $("#CrearContratoAdicionar_CompromisoPresupuestal").val();
    var CrearContratoAdicionar_FechaCompromisoPresupuestal = $("#CrearContratoAdicionar_FechaCompromisoPresupuestal").val();
    var CrearContratoAdicionar_MontoCompromisoPresupuestal = $("#CrearContratoAdicionar_MontoCompromisoPresupuestal").val();
    var CrearContratoAdicionar_OrdenadorGasto = $("#CrearContratoAdicionar_OrdenadorGasto").val();
    var CrearContratoAdicionar_TipoGasto = $("#CrearContratoAdicionar_TipoGasto").val();
    var CrearContratoAdicionar_FechaPubSecop = $("#CrearContratoAdicionar_FechaPubSecop").val();
    var CrearContratoAdicionar_linkPubSecop = $("#CrearContratoAdicionar_linkPubSecop").val();
    var CrearContratoAdicionar_FechaPubGestTransp = $("#CrearContratoAdicionar_FechaPubGestTransp").val();
    var CrearContratoAdicionar_TipoPersonaContratar = $("#CrearContratoAdicionar_TipoPersonaContratar").val();
    var Resp = "NO";

    if(!CrearContratoAdicionar_FechaInicio){
        $("#CrearContratoAdicionar_FechaInicio").addClass("error");
        Resp = "SI";
    }

    if(!CrearContratoAdicionar_FechaFin){
        $("#CrearContratoAdicionar_FechaFin").addClass("error");
        Resp = "SI";
    }

    if(!CrearContratoAdicionar_FechaContrato){
        $("#CrearContratoAdicionar_FechaContrato").addClass("error");
        Resp = "SI";
    }

    if(!CrearContratoAdicionar_CompromisoPresupuestal){
        $("#CrearContratoAdicionar_CompromisoPresupuestal").addClass("error");
        Resp = "SI";
    }

    if(!CrearContratoAdicionar_FechaCompromisoPresupuestal){
        $("#CrearContratoAdicionar_FechaCompromisoPresupuestal").addClass("error");
        Resp = "SI";
    }

    if(!CrearContratoAdicionar_MontoCompromisoPresupuestal){
        $("#CrearContratoAdicionar_MontoCompromisoPresupuestal").addClass("error");
        Resp = "SI";
    }

    if(!CrearContratoAdicionar_OrdenadorGasto){
        $("#CrearContratoAdicionar_OrdenadorGasto").addClass("error");
        Resp = "SI";
    }

    if(CrearContratoAdicionar_TipoGasto=="Ninguno"){
        $("#CrearContratoAdicionar_TipoGasto").addClass("error");
        Resp = "SI";
    }


    if(!CrearContratoAdicionar_FechaPubSecop){
        $("#CrearContratoAdicionar_FechaPubSecop").addClass("error");
        Resp = "SI";
    }

    if(!CrearContratoAdicionar_linkPubSecop){
        $("#CrearContratoAdicionar_linkPubSecop").addClass("error");
        Resp = "SI";
    }

    if(!CrearContratoAdicionar_FechaPubGestTransp){
        $("#CrearContratoAdicionar_FechaPubGestTransp").addClass("error");
        Resp = "SI";
    }

    if(CrearContratoAdicionar_TipoPersonaContratar=="Ninguno"){
        $("#CrearContratoAdicionar_TipoPersonaContratar").addClass("error");
        Resp = "SI";
    }


    if(Resp=="SI"){
        window.Swal.fire("Error!","Algunos campos obligatorios se encuentran vacios!");
        return false;
    }else{
        var  IdContrato = $("#IdContrato").val();
        $.ajax({
            url: 'administracion.php',
            type: 'POST',
            data:{opcion:"GuardarInfoAdicionalContrato",IdContrato:IdContrato,CrearContratoAdicionar_FechaInicio:CrearContratoAdicionar_FechaInicio,CrearContratoAdicionar_FechaFin:CrearContratoAdicionar_FechaFin,CrearContratoAdicionar_FechaContrato:CrearContratoAdicionar_FechaContrato , CrearContratoAdicionar_CompromisoPresupuestal:CrearContratoAdicionar_CompromisoPresupuestal , CrearContratoAdicionar_FechaCompromisoPresupuestal:CrearContratoAdicionar_FechaCompromisoPresupuestal,CrearContratoAdicionar_MontoCompromisoPresupuestal:CrearContratoAdicionar_MontoCompromisoPresupuestal, CrearContratoAdicionar_OrdenadorGasto:CrearContratoAdicionar_OrdenadorGasto, CrearContratoAdicionar_TipoGasto:CrearContratoAdicionar_TipoGasto , CrearContratoAdicionar_FechaPubSecop:CrearContratoAdicionar_FechaPubSecop , CrearContratoAdicionar_linkPubSecop:CrearContratoAdicionar_linkPubSecop , CrearContratoAdicionar_FechaPubGestTransp:CrearContratoAdicionar_FechaPubGestTransp,ContratistasDirecto:ContratistasDirecto,CrearContratoAdicionar_TipoPersonaContratar:CrearContratoAdicionar_TipoPersonaContratar,SupervisoresContrato:SupervisoresContrato },
            success: function(respuesta){

               window.Swal.fire("Información de contrato agregado satisfactoriamente!");
               $("#CrearContratoAdicionar_FechaInicio").attr("readonly","true");
               $("#CrearContratoAdicionar_FechaFin").attr("readonly","true");
               $("#CrearContratoAdicionar_FechaContrato").attr("readonly","true");
               $("#CrearContratoAdicionar_CompromisoPresupuestal").attr("readonly","true");
               $("#CrearContratoAdicionar_FechaCompromisoPresupuestal").attr("readonly","true");
               $("#CrearContratoAdicionar_MontoCompromisoPresupuestal").attr("readonly","true");
               $("#CrearContratoAdicionar_OrdenadorGasto").attr("readonly","true");
               $("#CrearContratoAdicionar_TipoGasto").attr("readonly","true");
               $("#CrearContratoAdicionar_FechaPubSecop").attr("readonly","true");
               $("#CrearContratoAdicionar_linkPubSecop").attr("readonly","true");
               $("#CrearContratoAdicionar_FechaPubGestTransp").attr("readonly","true");
               $("#CrearContratoAdicionar_TipoPersonaContratar").attr("readonly","true");
            },
            error: function(){
                window.toastr.error('Error al cargar las opciones');
            }
        });
    }
}

function CambiarTipoContrato(){

    var tipo = $("#CrearContrato_TipoContrato").val();
    if(tipo == "Contrato_BVM"){
        $("#FormContratoBVM").show(500);
        $("#FormContratoProceso").hide(500);
        $("#FormContratoDirecto").hide(500);
        $("#FormTipoContrato").hide(500);
        CargarDeptos("CrearContrato_dpto");
    }else if(tipo == "ContratoDirecto"){
        $("#FormContratoBVM").hide(500);
        $("#FormContratoProceso").hide(500);
        $("#FormContratoDirecto").show(500);
        $("#FormTipoContrato").hide(500);
        CargarDeptos("CrearContratoDirecto_dpto");
    }else if(tipo == "ContratoProceso"){
        $("#FormContratoBVM").hide(500);
        $("#FormContratoProceso").show(500);
        $("#FormContratoDirecto").hide(500);
        $("#FormTipoContrato").hide(500);
        CargarDeptos("CrearContratoSeleccion_dpto");   
    }
}


function CargarRetFuente(){
    var RetFuente = $("#CrearContrato_mpio option:selected").attr("RetFuente");
    $("#CrearContrato_retencion").val(RetFuente);
}



function CargarMunicipio(IdDepto,id_input){
    var depto = $("#"+IdDepto).val();
    $.ajax({
        url: 'administracion.php',
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
            alert('Error al cargar las opciones');
        }
    });
}

function formatearMonto(monto) {
  // Convertir el monto a número y verificar si es válido
  const montoNum = parseFloat(monto);
  if (isNaN(montoNum)) {
    return '';
  }

  // Formatear el monto con separador de miles y símbolo del dólar
  const montoFormateado = '$' + montoNum.toLocaleString();

  return montoFormateado;
}


function FormateoInversoMonto(monto) {
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

function SoloNumeros(event) {
    event = event || window.event;
    var charCode = event.which || event.keyCode;
    
    // Verificar si el carácter ingresado NO es un dígito
    if (!/^\d$/.test(event.key)) {
        // Prevenir que el carácter se ingrese en la caja de texto
        event.preventDefault();
    }
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
      url: 'administracion.php',
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
        url: 'administracion.php',
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

function CalcularSaldoTotalSeleccion() {
    var AportesRecursosViva = $("#CrearContratoSeleccion_AportesVivaRecurso").val();
    var AportesEspecieViva = $("#CrearContratoSeleccion_AportesVivaEspecie").val();
    var AportesRecursosMpio = $("#CrearContratoSeleccion_AportesMpioRecurso").val();
    var AportesEspecieMpio = $("#CrearContratoSeleccion_AportesMpioEspecie").val();
    var ValorOtrasFuentes = $("#CrearContratoSeleccion_ValorOtrasFuentes").val();

    // Verificar si los campos están vacíos y asignarles el valor 0 si es el caso
    AportesRecursosViva = AportesRecursosViva ? FormateoInversoMonto(AportesRecursosViva) : 0;
    AportesEspecieViva = AportesEspecieViva ? FormateoInversoMonto(AportesEspecieViva) : 0;
    AportesRecursosMpio = AportesRecursosMpio ? FormateoInversoMonto(AportesRecursosMpio) : 0;
    AportesEspecieMpio = AportesEspecieMpio ? FormateoInversoMonto(AportesEspecieMpio) : 0;
    ValorOtrasFuentes = ValorOtrasFuentes ? FormateoInversoMonto(ValorOtrasFuentes) : 0;
    var total = parseFloat(AportesRecursosViva) + parseFloat(AportesEspecieViva) + parseFloat(AportesRecursosMpio) + parseFloat(AportesEspecieMpio) + parseFloat(ValorOtrasFuentes);
    $("#CrearContratoSeleccion_TotalAportes").val(formatearMonto(total));
    maquillarNumero(document.getElementById("CrearContratoSeleccion_TotalAportes"));
}


function CalcularSaldoTotalDirecto() {
    var AportesRecursosViva = $("#CrearContratoDirect_AportesVivaRecurso").val();
    var AportesEspecieViva = $("#CrearContratoDirect_AportesVivaEspecie").val();
    var AportesRecursosMpio = $("#CrearContratoDirect_AportesMpioRecurso").val();
    var AportesEspecieMpio = $("#CrearContratoDirect_AportesMpioEspecie").val();
    var ValorOtrasFuentes = $("#CrearContratoDirect_ValorOtrasFuentes").val();

    // Verificar si los campos están vacíos y asignarles el valor 0 si es el caso
    AportesRecursosViva = AportesRecursosViva ? FormateoInversoMonto(AportesRecursosViva) : 0;
    AportesEspecieViva = AportesEspecieViva ? FormateoInversoMonto(AportesEspecieViva) : 0;
    AportesRecursosMpio = AportesRecursosMpio ? FormateoInversoMonto(AportesRecursosMpio) : 0;
    AportesEspecieMpio = AportesEspecieMpio ? FormateoInversoMonto(AportesEspecieMpio) : 0;
    ValorOtrasFuentes = ValorOtrasFuentes ? FormateoInversoMonto(ValorOtrasFuentes) : 0;
    var total = parseFloat(AportesRecursosViva) + parseFloat(AportesEspecieViva) + parseFloat(AportesRecursosMpio) + parseFloat(AportesEspecieMpio) + parseFloat(ValorOtrasFuentes);
    $("#CrearContratoDirect_TotalAportes").val(formatearMonto(total));
    maquillarNumero(document.getElementById("CrearContratoDirect_TotalAportes"));
}



function GuardarContratoProcesoSeleccion() {
    
    $(".error").removeClass("error");
    var depto = $("#CrearContratoSeleccion_dpto").val();
    var mpio = $("#CrearContratoSeleccion_mpio").val();
    var PersonaContacto = $("#CrearContratoSeleccion_PersonaContacto").val();
    var numero_contacto = $(" #CrearContratoSeleccion_NumeroContacto").val();
    var correo_contacto = $("#CrearContratoSeleccion_CorreoContacto").val();
    var rol_juridico = $("#CrearContratoSeleccion_RolJuridico").val();
    var rol_logistico= $("#CrearContratoSeleccion_RolLogistico").val();
    var rol_tecnico = $("#CrearContratoSeleccion_RolTecnico").val();
    var FechaSolicitud = $("#CrearContratoSeleccion_FechaSol").val();
    var TipoContrato = $("#CrearContratoSeleccion_TipoContrato").val();
    var TipoModalidad = $("#CrearContratoSeleccion_Modalidad").val();
    var NroActa = $("#CrearContratoSeleccion_NroActaComite").val();
    var FechaNroActa = $("#CrearContratoSeleccion_FechaActaComite").val();
    var ObjetoContrto = $("#CrearContratoSeleccion_ObjetoContrato").val();
    var SegmentoContrto = $("#CrearContratoSeleccion_SegmentoContrato").val();
    var TotalAportes = $("#CrearContratoSeleccion_TotalAportes").val();
    var AportesRecursosViva = $("#CrearContratoSeleccion_AportesVivaRecurso").val();
    var AportesEspecieViva = $("#CrearContratoSeleccion_AportesVivaEspecie").val();
    var AportesRecursosMpio = $("#CrearContratoSeleccion_AportesMpioRecurso").val();
    var AportesEspecieMpio = $("#CrearContratoSeleccion_AportesMpioEspecie").val();
    var ValorOtrasFuentes = $("#CrearContratoSeleccion_ValorOtrasFuentes").val();
    var NombreOtrasFuentes = $("#CrearContratoSeleccion_NombreOtrasFuentes").val();
    var Proceso = $("#CrearContratoSeleccion_ProcesoPertenece").val();
    var Direccion = $("#CrearContratoSeleccion_DireccionPertenece").val()
    var DisponibilidadPresupuestal = $("#CrearContratoSeleccion_DisponibilidadPresupuestal").val();
    var FechaDisponibilidadPresupuestal = $("#CrearContratoSeleccion_FechaDisponibilidad").val();
    var MontoDisponibilidad = $("#CrearContratoSeleccion_MontoDisponibilidad").val();
    var Resp = "NO";

    if(depto=="Ninguno"){
        $("#CrearContratoSeleccion_dpto").addClass("error");
        Resp="SI";
    }


    if(mpio=="Ninguno"){
        $("#CrearContratoSeleccion_mpio").addClass("error");
        Resp="SI";
    }

    if(!PersonaContacto){
        $("#CrearContratoSeleccion_PersonaContacto").addClass("error");
        Resp="SI";
    }
   
    if(!numero_contacto){
        $("#CrearContratoSeleccion_NumeroContacto").addClass("error");
        Resp="SI";
    } 

    if(!correo_contacto){
        $("#CrearContratoSeleccion_CorreoContacto").addClass("error");
        Resp="SI";
    } 

    if(!rol_juridico){
        $("#CrearContratoSeleccion_RolJuridico").addClass("error");
        Resp="SI";
    } 

    if(!rol_logistico){
        $("#CrearContratoSeleccion_RolLogistico").addClass("error");
        Resp="SI";
    } 

    if(!rol_tecnico){
        $("#CrearContratoSeleccion_RolTecnico").addClass("error");
        Resp="SI";
    } 

    if(!FechaSolicitud){
        $("#CrearContratoSeleccion_FechaSol").addClass("error");
        Resp="SI";
    } 

    if(!TipoContrato){
        $("#CrearContratoSeleccion_TipoContrato").addClass("error");
        Resp="SI";
    } 

    if(!TipoModalidad){
        $("#CrearContratoSeleccion_Modalidad").addClass("error");
        Resp="SI";
    } 

    if(!NroActa){
        $("#CrearContratoSeleccion_NroActaComite").addClass("error");
        Resp="SI";
    } 

    if(!FechaNroActa){
        $("#CrearContratoSeleccion_FechaActaComite").addClass("error");
        Resp="SI";
    } 

    if(!ObjetoContrto){
        $("#CrearContratoSeleccion_ObjetoContrato").addClass("error");
        Resp="SI";
    } 

    if(!SegmentoContrto){
        $("#CrearContratoSeleccion_SegmentoContrato").addClass("error");
        Resp="SI";
    } 

    if(!TotalAportes){
        $("#CrearContratoSeleccion_TotalAportes").addClass("error");
        Resp="SI";
    } 

    if(!AportesRecursosViva){
        $("#CrearContratoSeleccion_AportesVivaRecurso").addClass("error");
        Resp="SI";
    } 

    if(!AportesEspecieViva){
        $("#CrearContratoSeleccion_AportesVivaEspecie").addClass("error");
        Resp="SI";
    } 

    if(!AportesRecursosMpio){
        $("#CrearContratoSeleccion_AportesMpioRecurso").addClass("error");
        Resp="SI";
    } 

    if(!AportesEspecieMpio){
        $("#CrearContratoSeleccion_AportesMpioEspecie").addClass("error");
        Resp="SI";
    } 

    if(!ValorOtrasFuentes){
        $("#CrearContratoSeleccion_ValorOtrasFuentes").addClass("error");
        Resp="SI";
    } 

    if(!NombreOtrasFuentes){
        $("#CrearContratoSeleccion_NombreOtrasFuentes").addClass("error");
        Resp="SI";
    } 

    if(Proceso=="Ninguno"){
        $("#CrearContratoSeleccion_ProcesoPertenece").addClass("error");
        Resp="SI";
    } 
    if(Direccion=="Ninguno"){
        $("#CrearContratoSeleccion_DireccionPertenece").addClass("error");
        Resp="SI";
    } 
    if(!DisponibilidadPresupuestal){
        $("#CrearContratoSeleccion_DisponibilidadPresupuestal").addClass("error");
        Resp="SI";
    } 

    if(!FechaDisponibilidadPresupuestal){
        $("#CrearContratoSeleccion_FechaDisponibilidad").addClass("error");
        Resp="SI";
    } 

    if(!MontoDisponibilidad){
        $("#CrearContratoSeleccion_MontoDisponibilidad").addClass("error");
        Resp="SI";
    } 

    if(Resp=="SI"){
        window.toastr.error("Algunos campos obligatorios se encuentran vacios!");
        return false;
    }else{
        $.ajax({
            url: 'administracion.php',
            type: 'POST',
            data:{opcion:"GuardarContratoProcesoSeleccion",depto:depto,mpio:mpio,PersonaContacto:PersonaContacto,numero_contacto:numero_contacto,correo_contacto:correo_contacto,rol_juridico:rol_juridico,rol_logistico:rol_logistico,rol_tecnico:rol_tecnico,FechaSolicitud:FechaSolicitud,TipoContrato:TipoContrato,TipoModalidad:TipoModalidad,NroActa:NroActa,FechaNroActa:FechaNroActa,ObjetoContrto:ObjetoContrto,SegmentoContrto:SegmentoContrto,TotalAportes:FormateoInversoMonto(TotalAportes),AportesRecursosViva:FormateoInversoMonto(AportesRecursosViva),AportesEspecieViva:FormateoInversoMonto(AportesEspecieViva),AportesRecursosMpio:FormateoInversoMonto(AportesRecursosMpio),AportesEspecieMpio:FormateoInversoMonto(AportesEspecieMpio),ValorOtrasFuentes:FormateoInversoMonto(ValorOtrasFuentes),NombreOtrasFuentes:NombreOtrasFuentes,Proceso:Proceso,DisponibilidadPresupuestal:DisponibilidadPresupuestal,FechaDisponibilidadPresupuestal:FechaDisponibilidadPresupuestal,MontoDisponibilidad:FormateoInversoMonto(MontoDisponibilidad),ArchivosCargados:ArchivosCargados,tipoProcesoContratacion:$("#CrearContrato_TipoContrato").val(),Direccion:Direccion},
            success: function(respuesta){
                LimpiarformularioContratos();
                window.Swal.fire("Exito!","El Contrato se almaceno exitosamente!","success");
            },
            error: function(){
                window.toastr.error('Error al cargar las opciones');
            }
        });
    }
}

function GuardarContratoDirecto() {
    
    $(".error").removeClass("error");
    var depto = $("#CrearContratoDirecto_dpto").val();
    var mpio = $("#CrearContratoDirecto_mpio").val();
    var PersonaContacto = $("#CrearContratoDirecto_PersonaContacto").val();
    var numero_contacto = $(" #CrearContratoDirecto_NumeroContacto").val();
    var correo_contacto = $("#CrearContratoDirecto_CorreoContacto").val();
    var rol_juridico = $("#CrearContratoDirect_RolJuridico").val();
    var rol_logistico= $("#CrearContratoDirect_RolLogistico").val();
    var rol_tecnico = $("#CrearContratoDirect_RolTecnico").val();
    var FechaSolicitud = $("#CrearContratoDirect_FechaSol").val();
    var TipoContrato = $("#CrearContratoDirect_TipoContrato").val();
    var TipoModalidad = $("#CrearContratoDirect_Modalidad").val();
    var TipoPersona = $("#CrearContratoDirect_TipoPersonaContratar").val();
    var NroActa = $("#CrearContratoDirect_NroActaComite").val();
    var FechaNroActa = $("#CrearContratoDirect_FechaActaComite").val();
    var ObjetoContrto = $("#CrearContratoDirect_ObjetoContrato").val();
    var SegmentoContrto = $("#CrearContratoDirect_SegmentoContrato").val();
    var TotalAportes = $("#CrearContratoDirect_TotalAportes").val();
    var AportesRecursosViva = $("#CrearContratoDirect_AportesVivaRecurso").val();
    var AportesEspecieViva = $("#CrearContratoDirect_AportesVivaEspecie").val();
    var AportesRecursosMpio = $("#CrearContratoDirect_AportesMpioRecurso").val();
    var AportesEspecieMpio = $("#CrearContratoDirect_AportesMpioEspecie").val();
    var ValorOtrasFuentes = $("#CrearContratoDirect_ValorOtrasFuentes").val();
    var NombreOtrasFuentes = $("#CrearContratoDirect_NombreOtrasFuentes").val();
    var Proceso = $("#CrearContratoDirect_ProcesoPertenece").val();
    var Direccion = $("#CrearContratoDirect_DireccionPertenece").val()
    var DisponibilidadPresupuestal = $("#CrearContratoDirect_DisponibilidadPresupuestal").val();
    var FechaDisponibilidadPresupuestal = $("#CrearContratoDirect_FechaDisponibilidad").val();
    var MontoDisponibilidad = $("#CrearContratoDirect_MontoDisponibilidad").val();
    var Resp = "NO";

    if(depto=="Ninguno"){
        $("#CrearContratoDirecto_dpto").addClass("error");
        Resp="SI";
    }


    if(mpio=="Ninguno"){
        $("#CrearContratoDirecto_mpio").addClass("error");
        Resp="SI";
    }

    if(!PersonaContacto){
        $("#CrearContratoDirecto_PersonaContacto").addClass("error");
        Resp="SI";
    }
   
    if(!numero_contacto){
        $("#CrearContratoDirecto_NumeroContacto").addClass("error");
        Resp="SI";
    } 

    if(!correo_contacto){
        $("#CrearContratoDirecto_CorreoContacto").addClass("error");
        Resp="SI";
    } 

    if(!rol_juridico){
        $("#CrearContratoDirect_RolJuridico").addClass("error");
        Resp="SI";
    } 

    if(!rol_logistico){
        $("#CrearContratoDirect_RolLogistico").addClass("error");
        Resp="SI";
    } 

    if(!rol_tecnico){
        $("#CrearContratoDirect_RolTecnico").addClass("error");
        Resp="SI";
    } 

    if(!FechaSolicitud){
        $("#CrearContratoDirect_FechaSol").addClass("error");
        Resp="SI";
    } 

    if(!TipoContrato){
        $("#CrearContratoDirect_TipoContrato").addClass("error");
        Resp="SI";
    } 

    if(!TipoModalidad){
        $("#CrearContratoDirect_Modalidad").addClass("error");
        Resp="SI";
    } 

    if(!TipoPersona){
        $("#CrearContratoDirect_TipoPersonaContratar").addClass("error");
        Resp="SI";
    } 

    if(!NroActa){
        $("#CrearContratoDirect_NroActaComite").addClass("error");
        Resp="SI";
    } 

    if(!FechaNroActa){
        $("#CrearContratoDirect_FechaActaComite").addClass("error");
        Resp="SI";
    } 

    if(!ObjetoContrto){
        $("#CrearContratoDirect_ObjetoContrato").addClass("error");
        Resp="SI";
    } 

    if(!SegmentoContrto){
        $("#CrearContratoDirect_SegmentoContrato").addClass("error");
        Resp="SI";
    } 

    if(!TotalAportes){
        $("#CrearContratoDirect_TotalAportes").addClass("error");
        Resp="SI";
    } 

    if(!AportesRecursosViva){
        $("#CrearContratoDirect_AportesVivaRecurso").addClass("error");
        Resp="SI";
    } 

    if(!AportesEspecieViva){
        $("#CrearContratoDirect_AportesVivaEspecie").addClass("error");
        Resp="SI";
    } 

    if(!AportesRecursosMpio){
        $("#CrearContratoDirect_AportesMpioRecurso").addClass("error");
        Resp="SI";
    } 

    if(!AportesEspecieMpio){
        $("#CrearContratoDirect_AportesMpioEspecie").addClass("error");
        Resp="SI";
    } 

    if(!ValorOtrasFuentes){
        $("#CrearContratoDirect_ValorOtrasFuentes").addClass("error");
        Resp="SI";
    } 

    if(!NombreOtrasFuentes){
        $("#CrearContratoDirect_NombreOtrasFuentes").addClass("error");
        Resp="SI";
    } 

    if(Proceso=="Ninguno"){
        $("#CrearContratoDirect_ProcesoPertenece").addClass("error");
        Resp="SI";
    } 
    if(Direccion=="Ninguno"){
        $("#CrearContratoDirect_DireccionPertenece").addClass("error");
        Resp="SI";
    } 
    if(!DisponibilidadPresupuestal){
        $("#CrearContratoDirect_DisponibilidadPresupuestal").addClass("error");
        Resp="SI";
    } 

    if(!FechaDisponibilidadPresupuestal){
        $("#CrearContratoDirect_FechaDisponibilidad").addClass("error");
        Resp="SI";
    } 

    if(!MontoDisponibilidad){
        $("#CrearContratoDirect_MontoDisponibilidad").addClass("error");
        Resp="SI";
    } 

    if(ContratistasDirecto.length<1){
        window.toastr.error("Debe agregar contratistas!"); 
        Resp="SI";
    }


    if(Resp=="SI"){
        window.toastr.error("Algunos campos obligatorios se encuentran vacios!");
        return false;
    }else{

        $.ajax({
            url: 'administracion.php',
            type: 'POST',
            data:{opcion:"GuardarContratoDirecto",depto:depto,mpio:mpio,PersonaContacto:PersonaContacto,numero_contacto:numero_contacto,correo_contacto:correo_contacto,rol_juridico:rol_juridico,rol_logistico:rol_logistico,rol_tecnico:rol_tecnico,FechaSolicitud:FechaSolicitud,TipoContrato:TipoContrato,TipoModalidad:TipoModalidad,TipoPersona:TipoPersona,NroActa:NroActa,FechaNroActa:FechaNroActa,ObjetoContrto:ObjetoContrto,SegmentoContrto:SegmentoContrto,TotalAportes:FormateoInversoMonto(TotalAportes),AportesRecursosViva:FormateoInversoMonto(AportesRecursosViva),AportesEspecieViva:FormateoInversoMonto(AportesEspecieViva),AportesRecursosMpio:FormateoInversoMonto(AportesRecursosMpio),AportesEspecieMpio:FormateoInversoMonto(AportesEspecieMpio),ValorOtrasFuentes:FormateoInversoMonto(ValorOtrasFuentes),NombreOtrasFuentes:NombreOtrasFuentes,Proceso:Proceso,DisponibilidadPresupuestal:DisponibilidadPresupuestal,FechaDisponibilidadPresupuestal:FechaDisponibilidadPresupuestal,MontoDisponibilidad:FormateoInversoMonto(MontoDisponibilidad),ContratistasDirecto:ContratistasDirecto,ArchivosCargados:ArchivosCargados,tipoProcesoContratacion:$("#CrearContrato_TipoContrato").val(),Direccion:Direccion},
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

function CargarContratistas(ParId) {
    var tipopersona = $("#"+ParId).val();
    if(tipopersona!="Ninguno"){
        $(".BtnAddPersonas").show();
    }else{
        $(".BtnAddPersonas").hide();
    }
}

function AdicionarSupervisorContrato(){
    $(".error").removeClass("error");
    var Nombre = $("#CargarSupervisores_NombreContratista").val();
    var Identificacion = $("#CargarSupervisores_Identificacion").val();

    if (!Nombre) {
        window.toastr.error("El Nombre es obligatorio!");
        $("#CargarSupervisores_NombreContratista").addClass("error");
        return false;
    }

    if (!Identificacion) {
        window.toastr.error("La identificacion es obligatoria!");
        $("#CargarSupervisores_Identificacion").addClass("error");
        return false;
    }

    // Verificar si la identificación ya existe en el arreglo
    var identificacionExistente = false;
    for (var i = 0; i < SupervisoresContrato.length; i++) {
        if (SupervisoresContrato[i].Identificacion === Identificacion) {
            identificacionExistente = true;
            break;
        }
    }

    if (identificacionExistente) {
        window.toastr.error("La identificación ya ha sido ingresada anteriormente, pruebe con otra");
        return false;
    }

    SupervisoresContrato.push({ "Nombre": Nombre, "Identificacion": Identificacion , "Edicion" : "NO" });
    $("#CargarSupervisores_NombreContratista").val("");
    $("#CargarSupervisores_Identificacion").val("");
    ActualizarSupervisoresCargadosContrato();
}


function ActualizarSupervisoresCargadosContrato(){
    var tabla = $('#Tbl_CargarSupervisores').DataTable();
    tabla.clear().draw();
    if(SupervisoresContrato.length>0){
        for (var i = 0; i < SupervisoresContrato.length; i++) {
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+SupervisoresContrato[i].Nombre+'</center>',
              '<center>'+SupervisoresContrato[i].Identificacion+'</center>' ,
              '<center><button class="btn_transparente" onclick="EliminarSupervisorContrato(\''+SupervisoresContrato[i].Identificacion+'\')"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'
            ]).draw();
        }
    }
}



function AdicionarContratistaContratoDirecto2(ParIdCombo) {
    $(".error").removeClass("error");
    var Nombre = $("#CrearContratoDirect_NombreContratista").val();
    var Identificacion = $("#CrearContratoDirect_Identificacion").val();
    var Digito = $("#CrearContratoDirect_DigitoVerificacion").val();

    if (!Nombre) {
        window.toastr.error("El Nombre es obligatorio!");
        $("#CrearContratoDirect_NombreContratista").addClass("error");
        return false;
    }

    if (!Identificacion) {
        window.toastr.error("La identificacion es obligatoria!");
        $("#CrearContratoDirect_Identificacion").addClass("error");
        return false;
    }

    if (!Digito) {
        Digito = "NO";
    }

    // Verificar si la identificación ya existe en el arreglo
    var identificacionExistente = false;
    for (var i = 0; i < ContratistasDirecto.length; i++) {
        if (ContratistasDirecto[i].Identificacion === Identificacion) {
            identificacionExistente = true;
            break;
        }
    }

    if (identificacionExistente) {
        window.toastr.error("La identificación ya ha sido ingresada anteriormente, pruebe con otra");
        return false;
    }

    ContratistasDirecto.push({ "Nombre": Nombre, "Identificacion": Identificacion, "Digito": Digito, "Edicion":"NO" });
    $("#CrearContratoDirect_NombreContratista").val("");
    $("#CrearContratoDirect_Identificacion").val("");
    $("#CrearContratoDirect_DigitoVerificacion").val("");

    if (($("#"+ParIdCombo).val() != 3 && $("#"+ParIdCombo).val() != 4) && (ContratistasDirecto.length > 0)) {
        $("#btn_AdicionarContratistaContratoDirecto").attr("disabled", "true");
    }

    ActualizarContratistasCargadosDirecto();
}

function AdicionarInformacionAdicional(){
    $("#Btn_Modal_AdicionarInfo").click();
}

function AdicionarInformacionPoliza(){
    $("#Btn_Modal_AdicionarPoliza").click();
}


function AdicionarAmparoPoliza() {
    
    var TipoAmparo = $("#CrearContratoPoliza_TipoAmparo").val();
    var FechaInicio = $("#CrearContratoPoliza_FechaIniAmparo").val();
    var FechaFin = $("#CrearContratoPoliza_FechaFinAmparo").val();
    var CuantiaAmparo = $("#CrearContratoPoliza_CuantiaAmparo").val();
    var Resp = "NO";

    if(TipoAmparo=="Ninguno"){
        $("#CrearContratoPoliza_TipoAmparo").addClass();
        Resp="SI";
    }


    if(!FechaInicio){
        $("#CrearContratoPoliza_FechaIniAmparo").addClass();
        Resp="SI";
    }

    if(!FechaFin){
        $("#CrearContratoPoliza_FechaFinAmparo").addClass();
        Resp="SI";
    }

    if(!CuantiaAmparo){
        $("#CrearContratoPoliza_CuantiaAmparo").addClass();
        Resp="SI";
    }


    if(Resp=="SI"){
        window.toastr.error("Algunos campos obligatorios estan vacios");
        return false;
    }else{
        
        AmparosPoliza.push({"Id":AmparosPoliza.length,"TipoAmparo":$("#CrearContratoPoliza_TipoAmparo option:selected").text(),"IdTipoAmparo":TipoAmparo,"FechaInicio":FechaInicio,"FechaFin":FechaFin,"CuantiaAmparo":CuantiaAmparo,"DiasAmparo":DiferenciaEntreFechas(FechaInicio, FechaFin)});
        ActualizarAmparosPolizas();

    }
}

function ActualizarAmparosPolizas(){

    var tabla = $('#Tbl_Amparos_Poliza').DataTable();
    tabla.clear().draw();
    if(AmparosPoliza.length>0){
        for (var i = 0; i < AmparosPoliza.length; i++) {
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+AmparosPoliza[i].TipoAmparo+'</center>',
              '<center>'+AmparosPoliza[i].FechaInicio+'</center>',
              '<center>' + AmparosPoliza[i].FechaFin + '</center>',
              '<center>' + AmparosPoliza[i].DiasAmparo + '</center>',
              '<center>' + AmparosPoliza[i].CuantiaAmparo + '</center>',
              '<center><button class="btn_transparente" onclick="EliminarAmparoPoliza(\''+i+'\')"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'
            ]).draw();
        }
    }
}



function AdicionarContratistaContratoDirecto() {
    $(".error").removeClass("error");
    var Nombre = $("#CrearContratoDirect_NombreContratista").val();
    var Identificacion = $("#CrearContratoDirect_Identificacion").val();
    var Digito = $("#CrearContratoDirect_DigitoVerificacion").val();

    if (!Nombre) {
        window.toastr.error("El Nombre es obligatorio!");
        $("#CrearContratoDirect_NombreContratista").addClass("error");
        return false;
    }

    if (!Identificacion) {
        window.toastr.error("La identificacion es obligatoria!");
        $("#CrearContratoDirect_Identificacion").addClass("error");
        return false;
    }

    if (!Digito) {
        Digito = "NO";
    }

    // Verificar si la identificación ya existe en el arreglo
    var identificacionExistente = false;
    for (var i = 0; i < ContratistasDirecto.length; i++) {
        if (ContratistasDirecto[i].Identificacion === Identificacion) {
            identificacionExistente = true;
            break;
        }
    }

    if (identificacionExistente) {
        window.toastr.error("La identificación ya ha sido ingresada anteriormente, pruebe con otra");
        return false;
    }

    ContratistasDirecto.push({ "Nombre": Nombre, "Identificacion": Identificacion, "Digito": Digito , "Edicion":"NO"});
    $("#CrearContratoDirect_NombreContratista").val("");
    $("#CrearContratoDirect_Identificacion").val("");
    $("#CrearContratoDirect_DigitoVerificacion").val("");

    if (($("#CrearContratoDirect_TipoPersonaContratar").val() != 3 && $("#CrearContratoDirect_TipoPersonaContratar").val() != 4) && (ContratistasDirecto.length > 0)) {
        $("#btn_AdicionarContratistaContratoDirecto").attr("disabled", "true");
    }

    ActualizarContratistasCargadosDirecto();
}



function ActualizarContratistasCargadosDirecto() {

    var tabla = $('#Tbl_CargarContratistas').DataTable();
    tabla.clear().draw();
    if(ContratistasDirecto.length>0){
        for (var i = 0; i < ContratistasDirecto.length; i++) {
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+ContratistasDirecto[i].Nombre+'</center>',
              '<center>'+ContratistasDirecto[i].Identificacion+'</center>',
              '<center>' + (ContratistasDirecto[i].Digito !== "NO" ? ContratistasDirecto[i].Digito : "N/A") + '</center>',
              '<center><button class="btn_transparente" onclick="EliminarContratistaDirecto(\''+ContratistasDirecto[i].Identificacion+'\')"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'
            ]).draw();
        }
    }
}

function EliminarSupervisorContrato(ParIdentificacion) {
    var index = -1;
    for (var i = 0; i < SupervisoresContrato.length; i++) {
        if (SupervisoresContrato[i].Identificacion === ParIdentificacion) {
            index = i;
            break;
        }
    }

    if (SupervisoresContrato[index]['Edicion'] == "SI") {
        Swal.fire({
            title: 'Confirmación',
            text: '¿Estás seguro de que quieres eliminar este supervisor? esta acción no se podrá revertir!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Si',
            cancelButtonText: 'NO'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'administracion.php',
                    type: 'POST',
                    data: { opcion: "EliminarSupervisorContrato", "Id": SupervisoresContrato[index]['Id'] },
                    success: function (respuesta) {
                        window.toastr.success("El Supervisor se eliminó correctamente!");
                    },error: function () {
                        window.toastr.error('Ocurrió un error al eliminar el supervisor.');
                    }
                });
            }
        });
    }

    if (index !== -1) {
        SupervisoresContrato.splice(index, 1);
        ActualizarSupervisoresCargadosContrato();
    }
}



function EliminarContratistaDirecto(ParIdentificacion) {
    // Encuentra el índice del contratista directo en la lista
    var index = -1;
    for (var i = 0; i < ContratistasDirecto.length; i++) {
        if (ContratistasDirecto[i].Identificacion === ParIdentificacion) {
            index = i;
            break;
        }
    }

    if (ContratistasDirecto[index]['Edicion'] == "SI") {
        Swal.fire({
            title: 'Confirmación',
            text: '¿Estás seguro de que quieres eliminar este contratisa? esta acción no se podrá revertir!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Si',
            cancelButtonText: 'NO'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'administracion.php',
                    type: 'POST',
                    data: { opcion: "EliminarContratistaDirecto", "Id": ContratistasDirecto[index]['Id'] },
                    success: function (respuesta) {
                        window.toastr.success("El contratista se eliminó correctamente!");
                    },error: function () {
                        window.toastr.error('Ocurrió un error al eliminar el contratista.');
                    }
                });
            }
        });
    }


    // Si se encontró el contratista directo, lo eliminamos de la lista
    if (index !== -1) {
        ContratistasDirecto.splice(index, 1);
        // Actualiza la tabla después de eliminar el contratista directo
        ActualizarContratistasCargadosDirecto();
    }
}


function CargarPersonasContratistas(){
    $("#btn_Modal_CargarContratistas").click();
}



function DiferenciaEntreFechas(ParamFechaInicio, ParamFechaFin) {

  // Obtener las fechas ingresadas
  var fechaInicio = new Date(ParamFechaInicio);
  var fechaFin = new Date(ParamFechaFin);

  // Validar que las fechas sean válidas y estén en el formato correcto
  if (isNaN(fechaInicio) || isNaN(fechaFin)) {
    window.toastr.error("Por favor, ingrese fechas válidas.");
    return null;
  }

  // Validar que la fecha de inicio sea anterior a la fecha de fin
  if (fechaInicio >= fechaFin) {
    window.toastr.error("La fecha de inicio debe ser anterior a la fecha de fin.");
    return null;
  }

  // Calcula la diferencia en milisegundos entre las dos fechas
  var diferenciaMs = fechaFin - fechaInicio;

  // Convierte la diferencia de milisegundos a días
  var diferenciaDias = Math.floor(diferenciaMs / (1000 * 60 * 60 * 24));

  // Muestra el resultado en el elemento con id "resultado"
  return diferenciaDias;
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
    var Honorarios = $("#CrearContrato_TP_Honorarios").val();
    var retencion = $("#CrearContrato_retencion").val();
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

    if(Honorarios=="Ninguno"){
        $("#CrearContrato_TP_Honorarios").addClass("error");
        Resp = 'SI';
    } 


    if(!retencion){
        $("#CrearContrato_retencion").addClass("error");
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
            url: 'administracion.php',
            type: 'POST',
            data:{opcion:"GuardarContrato",depto:depto,mpio:mpio,PersonaContacto:PersonaContacto,numero_contacto:numero_contacto,correo_contacto:correo_contacto,contratante:contratante,NumContratoViva:NumContratoViva,NumContratoContratante:NumContratoContratante,Monto:Monto.replaceAll('$','').replaceAll(',',''),FechaIni:FechaIni,FechaFin:FechaFin,objetoContrato:objetoContrato,ArchivosCargados:ArchivosCargados,retencion:retencion,Honorarios:Honorarios},
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
    $("#CrearContratoDirecto_dpto").val("Ninguno");
    $("#CrearContrato_mpio").val("Ninguno");
    $("#CrearContratoDirecto_mpio").val("Ninguno");
    $("#CrearContrato_PersonaContacto").val("");
    $("#CrearContratoDirecto_NumeroContacto").val("");
    $("#CrearContratoDirecto_CorreoContacto").val("");
    $("#CrearContratoDirect_RolJuridico").val("");
    $("#CrearContratoDirect_RolLogistico").val("");
    $("#CrearContratoDirect_RolTecnico").val("");
    $("#CrearContratoDirect_FechaSol").val("");
    $("#CrearContratoDirect_TipoContrato").val("Ninguno");
    $("#CrearContratoDirect_Modalidad").val("Ninguno");
    $("#CrearContratoDirect_TipoPersonaContratar").val("Ninguno");
    $("#BtnAddPersonas").hide();
    $("#CrearContratoDirecto_PersonaContacto").val("");
    $("#CrearContratoDirect_NroActaComite").val("");
    $("#CrearContratoDirect_FechaActaComite").val("");
    $("#CrearContratoDirect_ObjetoContrato").val("");
    $("#CrearContratoDirect_SegmentoContrato").val("");
    $("#CrearContratoDirect_TotalAportes").val("");
    $("#CrearContratoDirect_AportesVivaRecurso").val("");
    $("#CrearContratoDirect_AportesMpioRecurso").val("");
    $("#CrearContratoDirect_ValorOtrasFuentes").val("");
    $("#CrearContratoDirect_NombreOtrasFuentes").val("");
    $("#CrearContratoDirect_ProcesoPertenece").val("Ninguno");
    $("#CrearContratoDirect_DisponibilidadPresupuestal").val("");
    $("#CrearContratoDirect_FechaDisponibilidad").val("");
    $("#CrearContratoDirect_MontoDisponibilidad").val("");
    $("#CrearContratoDirect_AportesMpioEspecie").val("");
    $("#CrearContratoDirect_AportesVivaEspecie").val("");
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

    $("#CrearContratoSeleccion_dpto").val("Ninguno");
    $("#CrearContratoSeleccion_mpio").val("Ninguno");
    $("#CrearContratoSeleccion_PersonaContacto").val("");
    $(" #CrearContratoSeleccion_NumeroContacto").val("");
    $("#CrearContratoSeleccion_CorreoContacto").val("");
    $("#CrearContratoSeleccion_RolJuridico").val("");
    $("#CrearContratoSeleccion_RolLogistico").val("");
    $("#CrearContratoSeleccion_RolTecnico").val("");
    $("#CrearContratoSeleccion_FechaSol").val("");
    $("#CrearContratoSeleccion_TipoContrato").val("Ninguno");
    $("#CrearContratoSeleccion_Modalidad").val("Ninguno");
    $("#CrearContratoSeleccion_NroActaComite").val("");
    $("#CrearContratoSeleccion_FechaActaComite").val("");
    $("#CrearContratoSeleccion_ObjetoContrato").val("");
    $("#CrearContratoSeleccion_SegmentoContrato").val("");
    $("#CrearContratoSeleccion_TotalAportes").val("");
    $("#CrearContratoSeleccion_AportesVivaRecurso").val("");
    $("#CrearContratoSeleccion_AportesVivaEspecie").val("");
    $("#CrearContratoSeleccion_AportesMpioRecurso").val("");
    $("#CrearContratoSeleccion_AportesMpioEspecie").val("");
    $("#CrearContratoSeleccion_ValorOtrasFuentes").val("");
    $("#CrearContratoSeleccion_NombreOtrasFuentes").val("");
    $("#CrearContratoSeleccion_ProcesoPertenece").val("");
    $("#CrearContratoSeleccion_DireccionPertenece").val("")
    $("#CrearContratoSeleccion_DisponibilidadPresupuestal").val("");
    $("#CrearContratoSeleccion_FechaDisponibilidad").val("");
    $("#CrearContratoSeleccion_MontoDisponibilidad").val("");
    ArchivosCargados = [];
    ContratistasDirecto = [];
    $(".error").removeClass("error");
}


function SeleccionarContratoAddInfo(IdContrato) {
    $("#AdicionarInfo_ContratoBuscarId_List").html("");
    $.ajax({
        url: 'administracion.php',
        type: 'POST',
        data:{opcion:"SeleccionarContratoAddInfo",IdContrato:IdContrato},
        success: function(respuesta){
           var datos = JSON.parse(respuesta);

           $("#IdContrato").val(datos[0].ID);
           //if(datos[0].TIPO_PROCESO_CONTRATO == "ContratoProceso"){  
               $("#AdicionarInfo_ContratoBuscarId").val(datos[0].NumContrato);
               $("#CrearContratoSeleccion_dpto").val(datos[0].NombreDepto);
               $("#CrearContratoSeleccion_mpio").val(datos[0].NombreMpio);
               $("#CrearContratoSeleccion_PersonaContacto").val(datos[0].NOMBRE_CONTACTO);
               $("#CrearContratoSeleccion_NumeroContacto").val(datos[0].NUMERO_CONTACTO);
               $("#CrearContratoSeleccion_CorreoContacto").val(datos[0].CORREO_CONTACTO);
               $("#CrearContratoSeleccion_FechaSol").val( datos[0].FECHA_SOLICITUD) ;
               $("#CrearContratoSeleccion_RolJuridico").val(datos[0].ROL_JURIDICO);
               $("#CrearContratoSeleccion_RolLogistico").val(datos[0].ROL_LOGISTICO);
               $("#CrearContratoSeleccion_RolTecnico").val(datos[0].ROL_TECNICO);
               $("#CrearContratoSeleccion_TipoContrato").val(datos[0].NombreTipoContrato);
               $("#CrearContratoSeleccion_Modalidad").val(datos[0].NombreModalidad);
               $("#CrearContratoSeleccion_FechaActaComite").val(datos[0].FECHA_NRO_ACTA);
               $("#CrearContratoSeleccion_NroActaComite").val(datos[0].NRO_ACTA);
               $("#CrearContratoSeleccion_TotalAportes").val(datos[0].TOTAL_APORTES);
               $("#CrearContratoSeleccion_DisponibilidadPresupuestal").val(datos[0].DISPONIBILIDAD_PRESUPUESTAL);
               $("#CrearContratoSeleccion_FechaDisponibilidad").val(datos[0].FECHA_DISPONIBILIDAD_PRESUPUESTAL);
               $("#CrearContratoSeleccion_MontoDisponibilidad").val(datos[0].MONTO_DISPONIBILIDAD_PRESUPUESTAL);
               $("#CrearContratoSeleccion_AportesMpioEspecie").val(datos[0].APORTES_ESPECIE_MPIO);
               $("#CrearContratoSeleccion_AportesVivaEspecie").val(datos[0].APORTES_ESPECIE_VIVA);
               $("#CrearContratoSeleccion_AportesVivaRecurso").val(datos[0].APORTES_RECURSOS_VIVA);
               $("#CrearContratoSeleccion_AportesMpioRecurso").val(datos[0].APORTES_RECURSOS_MPIO);
               $("#CrearContratoSeleccion_ValorOtrasFuentes").val(datos[0].VALOR_OTRAS_FUENTA);
               $("#CrearContratoSeleccion_NombreOtrasFuentes").val(datos[0].NOMBRES_OTRAS_FUENTES);
               $("#CrearContratoSeleccion_DireccionPertenece").val(datos[0].DIRECCION);
               $("#CrearContratoSeleccion_ProcesoPertenece").val(datos[0].PROCESO);
               $("#CrearContratoSeleccion_ObjetoContrato").val(datos[0].OBJETO_CONTRATO);
               $("#CrearContratoSeleccion_SegmentoContrato").val(datos[0].SEGMENTO_CONTRATO);
               $("#btnModalNuevoOtroSi").removeAttr("disabled");
               $("#btnModalHistoricoOtroSi").removeAttr("disabled");
               $("#FormContratoProceso").show();
               $("#btn_adicionar_adicional").show();

               //Cargo la informacion adicional si la ubiera
               if(datos[0]['InformacionAdicional'].length>0){

                    var detalles = datos[0]['InformacionAdicional'][0];
                    $("#CrearContratoAdicionar_TipoPersonaContratar").val(detalles['TIPO_PERSONA']);
                    CargarContratistas('CrearContratoAdicionar_TipoPersonaContratar');
                    $("#CrearContratoAdicionar_FechaInicio").val(detalles['FECHA_INI']);
                    $("#CrearContratoAdicionar_FechaFin").val(detalles['FECHA_FIN']);
                    $("#CrearContratoAdicionar_FechaContrato").val(detalles['FECHA_CONTRATO']);
                    $("#CrearContratoAdicionar_CompromisoPresupuestal").val(detalles['COMPROMISO_PRESUPUESTAL']);
                    $("#CrearContratoAdicionar_FechaCompromisoPresupuestal").val(detalles['FECHA_COMPROMISO_PRESUPUESTAL']);
                    $("#CrearContratoAdicionar_MontoCompromisoPresupuestal").val( formatearMonto(detalles['MONTO_COMPROMISO_PRESUPUESTAL']));
                    $("#CrearContratoAdicionar_OrdenadorGasto").val(detalles['ORDENADOR_GASTO']);
                    $("#CrearContratoAdicionar_TipoGasto").val(detalles['ID_TIPO_GASTO']);
                    $("#CrearContratoAdicionar_FechaPubSecop").val(detalles['FECHA_PUBLICACION_SECOP']);
                    $("#CrearContratoAdicionar_linkPubSecop").val(detalles['LINK_PUBLICACION_SECOP']);
                    $("#CrearContratoAdicionar_FechaPubGestTransp").val(detalles['FECHA_PUBLICACION_GEST_TRANS']);

                    //Cargo los supervisores del contrato si los ubiera
                    SupervisoresContrato = [];
                    if(detalles['SUPERVISORES'].length>0){
                        for (var a = 0; a < detalles['SUPERVISORES'].length; a++) {
                            SupervisoresContrato.push({ "Id": detalles['SUPERVISORES'][a]['Id'], "Nombre": detalles['SUPERVISORES'][a]['Nombre'], "Identificacion": detalles['SUPERVISORES'][a]['Identificacion'] , "Edicion":"SI" });
                            ActualizarSupervisoresCargadosContrato();
                        }    
                    }

                    //Cargo los contratistas del contrato si los ubiera
                    ContratistasDirecto = [];
                    if(detalles['CONTRATISTAS'].length>0){
                        for (var a = 0; a < detalles['CONTRATISTAS'].length; a++) {
                            ContratistasDirecto.push({"Id": detalles['CONTRATISTAS'][a]['Id'],"Nombre": detalles['CONTRATISTAS'][a]['Nombre'], "Identificacion": detalles['CONTRATISTAS'][a]['Identificacion'], "Digito": detalles['CONTRATISTAS'][a]['Digito_verificacion'], "Edicion":"SI" });
                            ActualizarContratistasCargadosDirecto();
                        }    
                    }
               }

            //}
        },error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });
}


function BuscarContratoAdicionarInfo(){

    var ingresado = $("#AdicionarInfo_ContratoBuscarId").val();

    if (ingresado && ingresado.length>2){

        $.ajax({
            url: 'administracion.php',
            type: 'POST',
            data:{opcion:"BuscarContratoAdicionarInfo",ingresado:ingresado},
            success: function(respuesta){
                var html = '';
                if(respuesta.trim()!='"NO"'){
                    var datos = JSON.parse(respuesta);
                    if(datos.length>0){
                        for (var i = 0; i < datos.length; i++) {
                            html+='<li class="list-group-item" onclick=SeleccionarContratoAddInfo(\''+datos[i].ID+'\') >'+datos[i].CONTRATO_NUMERO_VIVA+'</li>';
                        }
                    }
                    $("#AdicionarInfo_ContratoBuscarId_List").html(html);
                }else{
                    $("#AdicionarInfo_ContratoBuscarId_List").html('<li class="list-group-item">No hay datos que mostrar</li>');
                }
            },
            error: function(){
                 window.toastr.warning('Error al cargar las opciones');
            }
        });
    }else{
        $("#AdicionarInfo_ContratoBuscarId_List").html("");
    }
}


function BuscarContratoPropio() {
    
    var ingresado = $("#CrearOtroSI_NumContratoViva").val();
    if (ingresado && ingresado.length >= 3) {
        $("#CrearOtroSI_ListaNumContratoViva").show(500);
        $.ajax({
            url: 'administracion.php',
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
        url: 'administracion.php',
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

           $("#CrearOtroSI_TP_Honorarios_codigo").val(datos[0].PAGOHONORARIO);
           if(datos[0].PAGOHONORARIO=="unico"){
                $("#CrearOtroSI_TP_Honorarios").val("Única Factura");
           }else if(datos[0].PAGOHONORARIO=="fraccionado"){
                $("#CrearOtroSI_TP_Honorarios").val("Pago Fraccionado");
           }else if(datos[0].PAGOHONORARIO=="vinculado"){
                $("#CrearOtroSI_TP_Honorarios").val("Vinculado a Despacho");
           }

           $("#CrearOtroSI_Monto").val( formatearMonto(datos[0].MONTO) );
           $("#CrearOtroSI_objetoContrato").html(datos[0].OBJETO_CONTRATO);
           $("#CrearOtroSI_dpto").val(datos[0].DEPTO);
           $("#CrearOtroSI_mpio").val(datos[0].MPIO);
           $("#CrearOtroSI_PersonaContacto").val(datos[0].NOMBRE_CONTACTO);
           $("#CrearOtroSI_NumeroContacto").val(datos[0].NUMERO_CONTACTO);
           $("#CrearOtroSI_CorreoContacto").val(datos[0].CORREO_CONTACTO);
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
        url: 'administracion.php',
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
        url: 'administracion.php',
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