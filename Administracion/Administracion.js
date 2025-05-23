var ArchivosCargados = [];
var ContratistasDirecto = [];
var SupervisoresContrato = [];
var AmparosPoliza = [];
var OtraFuente = [];
var MontoOtraFuente = 0;
var Polizas = [];
var Contratos = [];
var TotalesContratos = [];

function AdicionarValorOtraFuenta2() {
    var NombreFuente = $("#AddInfoContratoProceso_NombreOtrasFuentes").val();
    var MontoFuente = $("#AddInfoContratoProceso_ValorOtrasFuentes").val();

    if(!NombreFuente || !MontoFuente){

        if(!NombreFuente){$("#AddInfoContratoProceso_NombreOtrasFuentes").addClass("error");}
        if(!MontoFuente){$("#AddInfoContratoProceso_ValorOtrasFuentes").addClass("error");}

        window.toastr.error("El Nombre y el Monto de la fuente son obligatorios!");
        return false;
    }
    if(NombreFuente && MontoFuente){
        OtraFuente.push({ "Id":OtraFuente.length, "NombreOtraFuente":NombreFuente , "MontoOtraFuente": MontoFuente });
    }
    $("#AddInfoContratoProceso_NombreOtrasFuentes").val("");
    $("#AddInfoContratoProceso_ValorOtrasFuentes").val("");
    CalcularSaldoTotalSeleccion2();
    MostrarOtrasFuentes();
}


function AdicionarValorOtraFuenta() {
    var NombreFuente = $("#CrearContratoDirect_NombreOtrasFuentes").val();
    var MontoFuente = $("#CrearContratoDirect_ValorOtrasFuentes").val();

    if(!NombreFuente || !MontoFuente){

        if(!NombreFuente){$("#CrearContratoDirect_NombreOtrasFuentes").addClass("error");}
        if(!MontoFuente){$("#CrearContratoDirect_ValorOtrasFuentes").addClass("error");}

        window.toastr.error("El Nombre y el Monto de la fuente son obligatorios!");
        return false;
    }
    if(NombreFuente && MontoFuente){
        OtraFuente.push({ "Id":OtraFuente.length, "NombreOtraFuente":NombreFuente , "MontoOtraFuente": MontoFuente });
    }
    $("#CrearContratoDirect_NombreOtrasFuentes").val("");
    $("#CrearContratoDirect_ValorOtrasFuentes").val("");
    if($("#CrearContrato_TipoContrato").val()=="ContratoDirecto"){
        CalcularSaldoTotalDirecto();
    }else if($("#CrearContrato_TipoContrato").val()=="ContratoProceso"){
        CalcularSaldoTotalSeleccion();
    }
    MostrarOtrasFuentes();
}

function MostrarOtrasFuentes() {
    var tabla = $('#Tbl_ValorOtrasFuenta').DataTable();
    tabla.clear().draw();
    MontoOtraFuente = 0;
    if(OtraFuente.length>0){
        for (var i = 0; i < OtraFuente.length; i++) {
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+OtraFuente[i].NombreOtraFuente+'</center>',
              '<center>'+OtraFuente[i].MontoOtraFuente+'</center>',
              '<center><button class="btn_transparente" onclick="EliminarOtrasFuentes(\''+i+'\')"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'
            ]).draw(); 
            MontoOtraFuente+= parseFloat(FormateoInversoMonto(OtraFuente[i].MontoOtraFuente));
        }
    }
}


function EliminarOtrasFuentes(ParamPos) {
    
    OtraFuente.splice(ParamPos, 1);
    MostrarOtrasFuentes();

}

function CargarMunicipioEspera(IdDepto, id_input, callback) {
    var depto = $("#" + IdDepto).val();
    $.ajax({
        url: 'administracion.php',
        type: 'POST',
        data: { opcion: "CargarMunicipio", depto: depto },
        success: function (respuesta) {
            var datos = JSON.parse(respuesta);
            var html = '<option value="Ninguno">Seleccione</option>';
            if (datos.length > 0) {
                for (var i = 0; i < datos.length; i++) {
                    html += '<option RetFuente="' + datos[i].RetFuente + '" value="' + datos[i].Id + '">' + datos[i].Nombre + '</option>';
                }
            }
            $("#" + id_input).html(html);
            if (typeof callback === 'function') {
                callback(); // Llama al callback después de cargar los datos
            }
        },
        error: function () {
            alert('Error al cargar las opciones');
        }
    });
}



function CargarDeptosEspera(id_input,callback) {

    $.ajax({
        url: 'administracion.php',
        type: 'POST',
        data: { opcion: "CargarDeptos" },
        success: function (respuesta) {
            var datos = JSON.parse(respuesta);
            var html = '<option value="Ninguno">Seleccione</option>';
            if (datos.length > 0) {
                for (var i = 0; i < datos.length; i++) {
                    html += '<option value="' + datos[i].Id + '">' + datos[i].Nombre + '</option>';
                }
            }
            $("#" + id_input).html(html);

            if (typeof callback === 'function') {
                callback(); // Llama al callback después de cargar los datos
            }
        },
        error: function () {
            window.toastr.error('Error al cargar las opciones');
        }
    });
}

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

function GuardarPolizaContrato(){

    $(".error").removeClass("error");
    var TipoPoliza = $("#CrearContratoPoliza_TipoPoliza").val();
    var CompañiaPoliza = $("#CrearContratoPoliza_CompañiaPoliza").val();
    var NumeroPoliza = $("#CrearContratoPoliza_NumPoliza").val();
    var Resp = "NO";

    if(TipoPoliza=="Ninguno"){
        $("#CrearContratoPoliza_TipoPoliza").addClass("error");
        Resp = "SI";
    }

    if(!CompañiaPoliza){
        $("#CrearContratoPoliza_CompañiaPoliza").addClass("error");
        Resp = "SI";
    }

    if(!NumeroPoliza){
        $("#CrearContratoPoliza_NumPoliza").addClass("error");
        Resp = "SI";
    }

    if(Resp=="SI" || AmparosPoliza.length<1){

        if(AmparosPoliza.length<1){
            window.toastr.error("Se debe agregar al menos un(01) amparo a la póliza!");
            return false;
        }else{
            window.toastr.error("Algunos Campos Obligatorios aun estan en blanco!");
            return false;
        }
    }else{

        var  IdContrato = $("#IdContrato").val();
        $.ajax({
            url: 'administracion.php',
            type: 'POST',
            data:{opcion:"GuardarPolizaContrato",IdContrato:IdContrato,TipoPoliza:TipoPoliza,CompañiaPoliza:CompañiaPoliza,NumeroPoliza:NumeroPoliza,AmparosPoliza:AmparosPoliza },
            success: function(respuesta){
               window.Swal.fire("Exito!","Póliza agregada Exitosamente!","success");
            },
            error: function(){
                window.toastr.error('Error al cargar las opciones');
            }
        });
    }
}

function MostrarSeccionPoliza(Par_Tipo) {
    if(Par_Tipo==1){
        $("#AddPoliza").show();
        $("#MostrarPoliza").hide();
    }else{
        $("#MostrarPoliza").show();
        $("#AddPoliza").hide(); 
        CargarPolizasContrato(); 
    }
}


function CargarPolizasContrato(){
    var  IdContrato = $("#IdContrato").val();
    $.ajax({
        url: 'administracion.php',
        type: 'POST',
        data:{opcion:"CargarPolizasContrato",IdContrato:IdContrato },
        success: function(respuesta){
            var tabla = $('#Tbl_Lista_Poliza').DataTable();
            tabla.clear().draw();
            var datos = JSON.parse(respuesta);
            Polizas = [];
            if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                    Polizas.push({"Id":datos[i]['Id'],"CompañiaPoliza":datos[i]['Compania_Poliza'],"Numero_Poliza":datos[i]['Numero_Poliza'],"TipoPoliza":datos[i]['TipoPoliza'],"Amparos":datos[i]['Amparos']});

                    tabla.row.add([
                      '<center>'+parseInt(i+1)+'</center>',
                      '<center>'+datos[i].TipoPoliza+'</center>',
                      '<center>'+datos[i].Compania_Poliza+'</center>',
                      '<center>'+datos[i].Numero_Poliza+'</center>',
                      '<center><button class="btn_transparente" onclick="VerAmparosPolizaContrato(\''+datos[i].Id+'\')"><i class="fa-solid fa-table-list fa-2xs"></i></button></center>',
                      '<center><button class="btn_transparente" title onclick="EliminarPolizaContrato(\''+datos[i].Id+'\')"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'
                    ]).draw();
                }
            }
        },error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });
}

function FiltrarResultadosGeneralContraros(){
    var Vigencia = $("#ResumenGenContr_Vigencia").val() || "NO";
    var Modalidades = $("#ResumenGenContr_Modalidad").val() || "NO";
    var TipoContrato = $("#ResumenGenContr_TipoContrato").val() || "NO";
    var Direccion = $("#ResumenGenContr_Direc").val() || "NO";
    var Proyecto = $("#ResumenGenContr_AreaProyecto").val() || "NO";
    var Supervisor = $("#ResumenGenContr_Supervisor").val() || "NO";
    var EstadoContrato = $("#ResumenGenContr_EstadoContrato").val() || "NO";
    var FechaIniFirma = $("#ResumenGenContr_FechaIniFirmaContrato").val() || "NO";
    var FechaFinFirma = $("#ResumenGenContr_FechaFinFirmaContrato").val() || "NO";
    var FechaIniEjec = $("#ResumenGenContr_FechaIniEjecContrato").val() || "NO";
    var FechaFinEjec = $("#ResumenGenContr_FechaFinEjecContrato").val() || "NO";

    $.ajax({
        url: '../administracion.php',
        type: 'POST',
        data:{opcion:"FiltrarResultadosGeneralContraros",  Vigencia:Vigencia,Modalidades:Modalidades, TipoContrato:TipoContrato,Direccion:Direccion,Proyecto:Proyecto,Supervisor:Supervisor , EstadoContrato:EstadoContrato , FechaIniFirma: FechaIniFirma , FechaFinFirma: FechaFinFirma , FechaIniEjec:FechaIniEjec,FechaFinEjec:FechaFinEjec },
        success: function(respuesta){
            var tabla = $('#Tbl_ResumenGenContr_Reporte_Total').DataTable();
            tabla.clear().draw();
            var datos = JSON.parse(respuesta);
            Contratos = [];
            if(datos.length>0){
                $("#DivResumenGenContr_Reporte_Total").show();
                for (var i = 0; i < datos.length; i++) {
                    Contratos.push({"CONTRATO_NUMERO_VIVA":datos[i]['CONTRATO_NUMERO_VIVA'],"ROL_JURIDICO":datos[i]['ROL_JURIDICO'],"ROL_LOGISTICO":datos[i]['ROL_LOGISTICO'],"ROL_TECNICO":datos[i]['ROL_TECNICO'],"TipoModalidad":datos[i]['TipoModalidad'],"TipoContrato":datos[i]['TipoContrato'],"ContratanteNombre":datos[i]['ContratanteNombre'],"ContratanteIdentificacion":datos[i]['ContratanteIdentificacion'],"DigitoVerificacion":datos[i]['DigitoVerificacion'],"OBJETO_CONTRATO":datos[i]['OBJETO_CONTRATO'],"APORTES_ESPECIE_VIVA":formatearMonto (datos[i]['APORTES_ESPECIE_VIVA']),"APORTES_RECURSOS_VIVA":formatearMonto (datos[i]['APORTES_RECURSOS_VIVA']),"APORTES_ESPECIE_MPIO":formatearMonto (datos[i]['APORTES_ESPECIE_MPIO']),"APORTES_RECURSOS_MPIO":formatearMonto (datos[i]['APORTES_RECURSOS_MPIO']),"OtrasFuentes":formatearMonto(datos[i]['OtrasFuentes']),"NombreOtrasFuentes":datos[i]['NombreOtrasFuentes'],"Segmento":datos[i]['Segmento'],"PlazoDias":datos[i]['PlazoDias'],"Direccion":datos[i]['Direccion'],"Area_Proceso":datos[i]['Area_Proceso'],"ORDENADOR_GASTO":datos[i]['ORDENADOR_GASTO'],"Supervisores":datos[i]['Supervisores'],"FECHA_CONTRATO":datos[i]['FECHA_CONTRATO'],"FECHA_INI":datos[i]['FECHA_INI'],"FECHA_FIN":datos[i]['FECHA_FIN'],"ESTADO_CONTRATO":datos[i]['ESTADO_CONTRATO'],"FECHA_PUBLICACION_SECOP":datos[i]['FECHA_PUBLICACION_SECOP'],"LINK_PUBLICACION_SECOP":datos[i]['LINK_PUBLICACION_SECOP'],"FECHA_PUBLICACION_GEST_TRANS":datos[i]['FECHA_PUBLICACION_GEST_TRANS'],"TOTAL_APORTES":formatearMonto(datos[i]['TOTAL_APORTES'])});
                    tabla.row.add([
                      '<center><b>'+parseInt(i+1)+'</b></center>',
                      '<center>'+datos[i]['CONTRATO_NUMERO_VIVA']+'</center>',
                      '<center>'+datos[i]['ROL_JURIDICO']+'</center>',
                      '<center>'+datos[i]['ROL_LOGISTICO']+'</center>',
                      '<center>'+datos[i]['ROL_TECNICO']+'</center>',
                      '<center>'+datos[i]['TipoContrato']+'</center>',
                      '<center>'+datos[i]['TipoModalidad']+'</center>',
                      '<center>'+datos[i]['ContratanteNombre']+'</center>',
                      '<center>'+datos[i]['ContratanteIdentificacion']+'</center>',
                      '<center>'+datos[i]['DigitoVerificacion']+'</center>',
                      '<center>'+datos[i]['OBJETO_CONTRATO']+'</center>',
                      '<center>'+formatearMonto(datos[i]['TOTAL_APORTES'])+'</center>',
                      '<center>'+formatearMonto(datos[i]['APORTES_RECURSOS_VIVA'])+'</center>',
                      '<center>'+formatearMonto(datos[i]['APORTES_ESPECIE_VIVA'])+'</center>',
                      '<center>'+formatearMonto(datos[i]['APORTES_RECURSOS_MPIO'])+'</center>',
                      '<center>'+formatearMonto(datos[i]['APORTES_ESPECIE_MPIO'])+'</center>',
                      '<center>'+formatearMonto(datos[i]['OtrasFuentes'])+'</center>',
                      '<center>'+datos[i]['NombreOtrasFuentes']+'</center>',
                      '<center>'+datos[i]['Segmento']+'</center>',
                      '<center>'+datos[i]['PlazoDias']+'</center>',
                      '<center>'+datos[i]['Direccion']+'</center>',
                      '<center>'+datos[i]['Area_Proceso']+'</center>',
                      '<center>'+datos[i]['ORDENADOR_GASTO']+'</center>',
                      '<center>'+datos[i]['Supervisores']+'</center>',
                      '<center>'+datos[i]['FECHA_CONTRATO']+'</center>',
                      '<center>'+datos[i]['FECHA_INI']+'</center>',
                      '<center>'+datos[i]['FECHA_FIN']+'</center>',
                      '<center>'+datos[i]['ESTADO_CONTRATO']+'</center>',
                      '<center>'+datos[i]['FECHA_PUBLICACION_SECOP']+'</center>',
                      '<center>'+datos[i]['LINK_PUBLICACION_SECOP']+'</center>',
                      '<center>'+datos[i]['FECHA_PUBLICACION_GEST_TRANS']+'</center>'
                  ]).draw();
                }
            }
        },error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });
}


function GenerarResultadosGeneralContraros() {
    var workbook = XLSX.utils.book_new();
    var sheetData = [
        ['#', 'NÚMERO DE CONTRATO', 'ROL JURÍDICO ', 'ROL LOGÍSTICO', 'ROL TÉCNICO', 'TIPO DE CONTRATO', 'MODALIDAD', 'CONTRATISTA','IDENTIFICACIÓN','Digito de Verificación','OBJETO','TOTAL DE APORTES','APORTES VIVA RECURSO','APORTES VIVA ESPECIE','APORTES MUNICIPIO RECURSO','APORTES MUNICIPIO ESPECIE','VALOR OTRAS FUENTES','NOMBRE(S) OTRAS FUENTES','SEGMENTO','PLAZO','DIRECCIÓN O JEFATURA','AREA O PROYECTO','ORDENADOR DEL GASTO','SUPERVISOR','FECHA DEL CONTRATO','FECHA DE INICIO','FECHA DE TERMINACIÓN','ESTADO','Fecha Publicación en Secop','Link Publicación en Secop','PUBLICADOS EN GESTIÓN TRANSPARENTE']
    ];

    for (var i = 0; i < Contratos.length; i++) {
        var rowData = [
            parseInt(i+1),
            Contratos[i]['CONTRATO_NUMERO_VIVA'],
            Contratos[i]['ROL_JURIDICO'],
            Contratos[i]['ROL_LOGISTICO'],
            Contratos[i]['ROL_TECNICO'],
            Contratos[i]['TipoContrato'],
            Contratos[i]['TipoModalidad'],
            Contratos[i]['ContratanteNombre'],
            Contratos[i]['ContratanteIdentificacion'],
            Contratos[i]['DigitoVerificacion'],
            Contratos[i]['OBJETO_CONTRATO'],
            Contratos[i]['TOTAL_APORTES'],
            Contratos[i]['APORTES_RECURSOS_VIVA'],
            Contratos[i]['APORTES_ESPECIE_VIVA'],
            Contratos[i]['APORTES_RECURSOS_MPIO'],
            Contratos[i]['APORTES_ESPECIE_MPIO'],
            Contratos[i]['OtrasFuentes'],
            Contratos[i]['NombreOtrasFuentes'],
            Contratos[i]['Segmento'],
            Contratos[i]['PlazoDias'],
            Contratos[i]['Direccion'],
            Contratos[i]['Area_Proceso'],
            Contratos[i]['ORDENADOR_GASTO'],
            Contratos[i]['Supervisores'],
            Contratos[i]['FECHA_CONTRATO'],
            Contratos[i]['FECHA_INI'],
            Contratos[i]['FECHA_FIN'],
            Contratos[i]['ESTADO_CONTRATO'],
            Contratos[i]['FECHA_PUBLICACION_SECOP'],
            Contratos[i]['LINK_PUBLICACION_SECOP'],
            Contratos[i]['FECHA_PUBLICACION_GEST_TRANS']
        ];
        sheetData.push(rowData);
    }

    var worksheet = XLSX.utils.aoa_to_sheet(sheetData);
    XLSX.utils.book_append_sheet(workbook, worksheet, 'Resumen');
    var workbookOutput = XLSX.write(workbook, { type: 'binary' });
    var blob = new Blob([s2ab(workbookOutput)], { type: 'application/octet-stream' });
    saveAs(blob, 'ResumenGeneralDeContrato.xlsx');       
}


function CargarPolizasContrato(){
    var  IdContrato = $("#IdContrato").val();
    $.ajax({
        url: 'administracion.php',
        type: 'POST',
        data:{opcion:"CargarPolizasContrato",IdContrato:IdContrato },
        success: function(respuesta){
            var tabla = $('#Tbl_Lista_Poliza').DataTable();
            tabla.clear().draw();
            var datos = JSON.parse(respuesta);
            Polizas = [];
            if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                    Polizas.push({"Id":datos[i]['Id'],"CompañiaPoliza":datos[i]['Compania_Poliza'],"Numero_Poliza":datos[i]['Numero_Poliza'],"TipoPoliza":datos[i]['TipoPoliza'],"Amparos":datos[i]['Amparos']});

                    tabla.row.add([
                      '<center>'+parseInt(i+1)+'</center>',
                      '<center>'+datos[i].TipoPoliza+'</center>',
                      '<center>'+datos[i].Compania_Poliza+'</center>',
                      '<center>'+datos[i].Numero_Poliza+'</center>',
                      '<center><button class="btn_transparente" onclick="VerAmparosPolizaContrato(\''+datos[i].Id+'\')"><i class="fa-solid fa-table-list fa-2xs"></i></button></center>',
                      '<center><button class="btn_transparente" title onclick="EliminarPolizaContrato(\''+datos[i].Id+'\')"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'
                    ]).draw();
                }
            }
        },error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });
}

function VerAmparosPolizaContrato(ParId){
    var tabla = $('#Tbl_VerAmparosPoliza').DataTable();
    tabla.clear().draw();
    if(Polizas.length>0){
        for (var i = 0; i < Polizas.length; i++) {
            if(Polizas[i].Id == ParId){
                for (var a = 0; a < Polizas[i]['Amparos'].length;a++) {
                    tabla.row.add([
                      '<center>'+parseInt(i+1)+'</center>',
                      '<center>'+Polizas[i]['Amparos'][a].TipoAmparo+'</center>',
                      '<center>'+Polizas[i]['Amparos'][a].Fecha_Inicio_Amparo+'</center>',
                      '<center>'+Polizas[i]['Amparos'][a].Fecha_Fin_Amparo+'</center>',
                      '<center>'+formatearMonto( Polizas[i]['Amparos'][a].Cuantia_Amparo) +'</center>',
                      '<center><button title="Eliminar Amparo" data-toggle="tooltip" data-placement="top" class="btn_transparente" onclick="EliminarAmparoPolizaContrato(\''+Polizas[i]['Amparos'][a].Id+'\',\''+ParId+'\')"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'
                    ]).draw();
                }
            }
        }
    }
    $('[data-toggle="tooltip"]').tooltip();
    $("#btn_Modal_VerAmparosPolizas").click();
}

function EliminarPolizaContrato(ParId){

    Swal.fire({
      title: '¿Estás seguro?',
      text: '¿Seguro de eliminar la Póliza seleccionada? ¡Esta acción no se podrá revertir!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí',
      cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: 'administracion.php',
                type: 'POST',
                data:{opcion:"EliminarPolizaContrato",ParId:ParId },
                success: function(respuesta){
                    window.Swal.fire("Exito!","Se elimina la póliza exitosamente!","success");
                    CargarPolizasContrato();
                },error: function(){
                    window.toastr.error('Error al cargar las opciones');
                }
            });
        }
    });
}

function EliminarAmparoPolizaContrato(ParId,PolizaId){

    Swal.fire({
      title: '¿Estás seguro?',
      text: '¿Seguro de eliminar el amparo seleccionado? ¡Esta acción no se podrá revertir!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí',
      cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: 'administracion.php',
                type: 'POST',
                data:{opcion:"EliminarAmparoPolizaContrato",ParId:ParId },
                success: function(respuesta){
                    window.Swal.fire("Exito!","Se elimina el amparo exitosamente!","success");
                    CargarPolizasContrato();
                    VerAmparosPolizaContrato(PolizaId);
                },error: function(){
                    window.toastr.error('Error al cargar las opciones');
                }
            });
        }
    });
}


function LimpiarFormularioPoliza(){
    $("#CrearContratoPoliza_TipoPoliza").val("Ninguno");
    $("#CrearContratoPoliza_CompañiaPoliza").val("");
    $("#CrearContratoPoliza_NumPoliza").val("");
    $("#CrearContratoPoliza_TipoAmparo").val("Ninguno");
    $("#CrearContratoPoliza_FechaIniAmparo").val("");
    $("#CrearContratoPoliza_FechaFinAmparo").val("");
    $("#CrearContratoPoliza_CuantiaAmparo").val("");
    AmparosPoliza =[];
    ActualizarAmparosPolizas();

}

function DesertarContrato(){

    Swal.fire({
      title: '¿Estás seguro?',
      text: '¿Seguro de declarar Desierto el contrato/proceso ? ¡Esta acción no se podrá revertir!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí',
      cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            $("#btn_Modal_DatosDesertarContrato").click();
        }
    });
}

function Confirmardesertar() {
    var  IdContrato = $("#IdContrato").val();
    var  Motivo = $("#CargarDatosDesertar_MotivoAnular").val();
    var  FechaAnular = $("#CargarDatosDesertar_MotivoAnular").val();
    if(!Motivo || !FechaAnular){
        window.toastr.error("Tanto el Motivo como la Fecha son obligatorios, intente de nuevo!");
        return false;
    }else{

        Swal.fire({
          title: '¿Estás seguro?',
          text: '¿Confirma declarar Desierto el contrato/proceso? ¡Esta acción no se podrá revertir!',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Sí',
          cancelButtonText: 'No'
        }).then((result) => {
            if (result.isConfirmed) {

                $.ajax({
                    url: 'administracion.php',
                    type: 'POST',
                    data:{opcion:"DesertarContrato",IdContrato:IdContrato , Motivo:Motivo , FechaAnular:FechaAnular },
                    success: function(respuesta){
                        window.Swal.fire("Exito!","Se declaró Desierto el contrato/proceso exitosamente!","success");
                        $(".ModalAdicionarInfoCont .modal-footer .btn-secondary").click();
                    },error: function(){
                        window.toastr.error('Error al cargar las opciones');
                    }
                });
            }  
        });
    }
}



function AnularContrato(){

    Swal.fire({
      title: '¿Estás seguro?',
      text: '¿Seguro de anular el contrato/proceso ? ¡Esta acción no se podrá revertir!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí',
      cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            $("#btn_Modal_DatosAnularContrato").click();
        }
    });
}

function ConfirmarAnular() {
 
    var  IdContrato = $("#IdContrato").val();
    var  Motivo = $("#CargarDatosAnular_MotivoAnular").val();
    var  FechaAnular = $("#CargarDatosAnular_FechaAnular").val();   
    if(!Motivo || !FechaAnular){
        window.toastr.error("Tanto el Motivo como la Fecha son obligatorios, intente de nuevo!");
        return false;
    }else{    
        Swal.fire({
          title: '¿Estás seguro?',
          text: '¿Confirma la anulación del contrato/proceso ? ¡Esta acción no se podrá revertir!',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Sí',
          cancelButtonText: 'No'
        }).then((result) => {
            if (result.isConfirmed) {        
                $.ajax({
                    url: 'administracion.php',
                    type: 'POST',
                    data:{opcion:"AnularContrato",IdContrato:IdContrato , Motivo:Motivo , FechaAnular:FechaAnular },
                    success: function(respuesta){
                        window.Swal.fire("Exito!","Se elimina el contrato/proceso exitosamente!","success");
                        $(".ModalAdicionarInfoCont .modal-footer .btn-secondary").click();
                    },error: function(){
                        window.toastr.error('Error al cargar las opciones');
                    }
                });
            }
        });
    }
}


function ActualizarContrato() {
    
    var CrearContratoAdicionar_FechaInicio = $("#CrearContratoAdicionar_FechaInicio").val();
    var CrearContratoAdicionar_FechaFin = $("#CrearContratoAdicionar_FechaFin").val();
    var CrearContratoAdicionar_CompromisoPresupuestal = $("#CrearContratoAdicionar_CompromisoPresupuestal").val();
    var CrearContratoAdicionar_FechaCompromisoPresupuestal = $("#CrearContratoAdicionar_FechaCompromisoPresupuestal").val();
    var CrearContratoAdicionar_MontoCompromisoPresupuestal = FormateoInversoMonto($("#CrearContratoAdicionar_MontoCompromisoPresupuestal").val());
    var CrearContratoAdicionar_OrdenadorGasto = $("#CrearContratoAdicionar_OrdenadorGasto").val();
    var CrearContratoAdicionar_TipoGasto = $("#CrearContratoAdicionar_TipoGasto").val();
    var CrearContratoAdicionar_FechaPubSecop = $("#CrearContratoAdicionar_FechaPubSecop").val();
    var CrearContratoAdicionar_linkPubSecop = $("#CrearContratoAdicionar_linkPubSecop").val();
    var CrearContratoAdicionar_FechaPubGestTransp = $("#CrearContratoAdicionar_FechaPubGestTransp").val();
    var CrearContratoAdicionar_FechaTransCad = $("#CrearContratoAdicionar_FechaTransCad").val();


    if ((CrearContratoAdicionar_FechaInicio || CrearContratoAdicionar_FechaFin) && !(CrearContratoAdicionar_FechaInicio && CrearContratoAdicionar_FechaFin)) {
        window.toastr.error("Debe ingresar tanto la fecha de inicio como la fecha de fin, no se admite una sola!");
        return false;
    }


    if ((CrearContratoAdicionar_FechaPubSecop || CrearContratoAdicionar_linkPubSecop) && !(CrearContratoAdicionar_FechaPubSecop && CrearContratoAdicionar_linkPubSecop)) {
        window.toastr.error("Se debe ingresar tanto el Link de publiación como la Fecha!");
        return false;

    }

    if ((CrearContratoAdicionar_CompromisoPresupuestal || CrearContratoAdicionar_FechaCompromisoPresupuestal || CrearContratoAdicionar_MontoCompromisoPresupuestal) && !(CrearContratoAdicionar_CompromisoPresupuestal && CrearContratoAdicionar_FechaCompromisoPresupuestal && CrearContratoAdicionar_MontoCompromisoPresupuestal)) {
        window.toastr.error("Se debe ingresar tanto el Link de publiación como la Fecha!");
        return false;

    }

    var IdContrato = $("#IdContrato").val()
     $.ajax({
        url: 'administracion.php',
        type: 'POST',
        data:{opcion:"ActualizarContrato",IdContrato:IdContrato,CrearContratoAdicionar_FechaInicio:CrearContratoAdicionar_FechaInicio,CrearContratoAdicionar_FechaFin:CrearContratoAdicionar_FechaFin,CrearContratoAdicionar_CompromisoPresupuestal:CrearContratoAdicionar_CompromisoPresupuestal,CrearContratoAdicionar_FechaCompromisoPresupuestal:CrearContratoAdicionar_FechaCompromisoPresupuestal,CrearContratoAdicionar_MontoCompromisoPresupuestal:CrearContratoAdicionar_MontoCompromisoPresupuestal,CrearContratoAdicionar_FechaPubSecop:CrearContratoAdicionar_FechaPubSecop,CrearContratoAdicionar_linkPubSecop:CrearContratoAdicionar_linkPubSecop,CrearContratoAdicionar_FechaPubGestTransp:CrearContratoAdicionar_FechaPubGestTransp,CrearContratoAdicionar_FechaTransCad:CrearContratoAdicionar_FechaTransCad,CrearContratoAdicionar_OrdenadorGasto:CrearContratoAdicionar_OrdenadorGasto,CrearContratoAdicionar_TipoGasto:CrearContratoAdicionar_TipoGasto},
        success: function(respuesta){
           window.Swal.fire("Exito!","Información Actualizada satisfactoriamente!","success");
        }
    });
}





function GuardarInfoAdicionalContrato(){

    $(".error").removeClass("error");
    var CrearContratoAdicionar_FechaInicio = $("#CrearContratoAdicionar_FechaInicio").val();
    var CrearContratoAdicionar_FechaFin = $("#CrearContratoAdicionar_FechaFin").val();
    var CrearContratoAdicionar_FechaContrato = $("#CrearContratoAdicionar_FechaContrato").val();
    var CrearContratoAdicionar_CompromisoPresupuestal = $("#CrearContratoAdicionar_CompromisoPresupuestal").val();
    var CrearContratoAdicionar_OrdenadorGasto = $("#CrearContratoAdicionar_OrdenadorGasto").val();
    var CrearContratoAdicionar_TipoGasto = $("#CrearContratoAdicionar_TipoGasto").val();
    var CrearContratoAdicionar_FechaPubSecop = $("#CrearContratoAdicionar_FechaPubSecop").val();
    var CrearContratoAdicionar_linkPubSecop = $("#CrearContratoAdicionar_linkPubSecop").val();
    var CrearContratoAdicionar_FechaPubGestTransp = $("#CrearContratoAdicionar_FechaPubGestTransp").val();
    var CrearContratoAdicionar_TipoPersonaContratar = $("#CrearContratoAdicionar_TipoPersonaContratar").val();
    var CrearContratoAdicionar_FechaTransCad = $("#CrearContratoAdicionar_FechaTransCad").val();
    var CrearContratoAdicionar_FechaCompromisoPresupuestal = $("#CrearContratoAdicionar_FechaCompromisoPresupuestal").val();
    var CrearContratoAdicionar_MontoCompromisoPresupuestal = $("#CrearContratoAdicionar_MontoCompromisoPresupuestal").val();
    var Resp = "NO";


    if(!CrearContratoAdicionar_FechaContrato){
        $("#CrearContratoAdicionar_FechaContrato").addClass("error");
        Resp = "SI";
    }

    if(CrearContratoAdicionar_TipoPersonaContratar=="Ninguno"){
        $("#CrearContratoAdicionar_TipoPersonaContratar").addClass("error");
        Resp = "SI";
    }

    if(Resp=="SI"){
        window.Swal.fire("Error!","Algunos campos obligatorios se encuentran vacios!","error");
        return false;
    }else{
        if(!ContratistasDirecto.length>0){
            
            window.Swal.fire("Error!","Debe agregar al menos un contratista!","error");
            return false;
        }else{
            var  IdContrato = $("#IdContrato").val();
            $.ajax({
                url: 'administracion.php',
                type: 'POST',
                data:{
                    opcion:"GuardarInfoAdicionalContrato"
                    ,IdContrato:IdContrato
                    ,CrearContratoAdicionar_FechaInicio:CrearContratoAdicionar_FechaInicio
                    ,CrearContratoAdicionar_FechaFin:CrearContratoAdicionar_FechaFin
                    ,CrearContratoAdicionar_FechaContrato:CrearContratoAdicionar_FechaContrato
                    ,CrearContratoAdicionar_CompromisoPresupuestal:CrearContratoAdicionar_CompromisoPresupuestal 
                    ,CrearContratoAdicionar_FechaCompromisoPresupuestal:CrearContratoAdicionar_FechaCompromisoPresupuestal
                    ,CrearContratoAdicionar_MontoCompromisoPresupuestal:CrearContratoAdicionar_MontoCompromisoPresupuestal
                    ,CrearContratoAdicionar_OrdenadorGasto:CrearContratoAdicionar_OrdenadorGasto
                    ,CrearContratoAdicionar_TipoGasto:CrearContratoAdicionar_TipoGasto 
                    ,CrearContratoAdicionar_FechaPubSecop:CrearContratoAdicionar_FechaPubSecop 
                    ,CrearContratoAdicionar_linkPubSecop:CrearContratoAdicionar_linkPubSecop 
                    ,CrearContratoAdicionar_FechaPubGestTransp:CrearContratoAdicionar_FechaPubGestTransp
                    ,ContratistasDirecto:ContratistasDirecto
                    ,CrearContratoAdicionar_TipoPersonaContratar:CrearContratoAdicionar_TipoPersonaContratar
                    ,SupervisoresContrato:SupervisoresContrato
                    ,CrearContratoAdicionar_FechaTransCad:CrearContratoAdicionar_FechaTransCad 
                },
                success: function(respuesta){

                   window.Swal.fire("Exito","Información de contrato agregado satisfactoriamente!","success");
                   $("#btn_Celebrar").hide();
                   $("#btn_anular").hide();
                   $("#btn_desertar").show();
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
                   $("#CrearContratoAdicionar_FechaTransCad").attr("readonly","true");
                },
                error: function(){
                    window.toastr.error('Error al cargar las opciones');
                }
            });
        }
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

/*function formatearMonto(monto) {
  // Convertir el monto a número y verificar si es válido
  const montoNum = parseFloat(monto);
  if (isNaN(montoNum)) {
    return '';
  }

  // Formatear el monto con separador de miles y símbolo del dólar
  const montoFormateado = '$' + montoNum.toLocaleString();

  return montoFormateado;
}*/

function formatearMonto(monto) {

      if (isNaN(monto) || monto==null) {
        return '';
      }else{
        monto = String(monto);
        monto = monto.replace(".00", "");
       monto = monto.replace(/\D/g, "");
        monto = monto.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    
      // Formatear el monto con separador de miles y símbolo del dólar
      var montoFormateado = '$' + monto;
    
      return montoFormateado;
    }
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






function GenerarExcelGafico() {

 // Crear un gráfico con Chart.js
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Enero', 'Febrero', 'Marzo'],
                datasets: [{
                    label: 'Ventas',
                    data: [1000, 1200, 800],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        
 // Función para generar el Excel con el gráfico
        function generarExcel() {
            // Capturar el gráfico como una imagen
            html2canvas(document.getElementById('graficoContainer')).then(function(canvas) {
                var graficoBase64 = canvas.toDataURL('image/jpeg');

                // Crear un nuevo libro de Excel
                var workbook = XLSX.utils.book_new();
                var sheetData = [
                    ['Mes', 'Ventas'],
                    ['Enero', 1000],
                    ['Febrero', 1200],
                    ['Marzo', 800],
                    ['Gráfico']
                ];

                // Agregar la imagen del gráfico en base64
                sheetData.push([graficoBase64]);

                // Convierte los datos en una hoja de Excel
                var worksheet = XLSX.utils.aoa_to_sheet(sheetData);

                // Agrega la hoja al libro de Excel
                XLSX.utils.book_append_sheet(workbook, worksheet, 'Hoja1');

                // Guardar el archivo Excel
                XLSX.writeFile(workbook, 'archivo_excel_con_grafico.xlsx');
            });
        }


   /* var workbook = XLSX.utils.book_new();
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
    });*/
}

function s2ab(s) {
    var buf = new ArrayBuffer(s.length);
    var view = new Uint8Array(buf);
    for (var i = 0; i < s.length; i++) {
        view[i] = s.charCodeAt(i) & 0xFF;
    }
    return buf;
}


function CargarArchivo(){

    var files = []; // Array para los datos de los archivos cargados
    event.preventDefault();
    var tipo_contrato = $("#CrearContrato_TipoContrato").val();
    var id = "";
    var id2 = "";
    if(tipo_contrato=='Contrato_BVM'){
        id = 'CrearContratoBVM_archivo';
        id2 = 'CrearContratoBVM_TipoDocumentoAdjunto';
    }else if(tipo_contrato=='ContratoDirecto'){
        id = 'CrearContratoDirect_archivo';
        id2 = 'CrearContratoDirect__TipoDocumentoAdjunto';
    }else if(tipo_contrato=='ContratoProceso'){
        id = 'CrearContratoProc_archivo';
        id2 = 'CrearContratoProces_TipoDocumentoAdjunto';
    }

    var tipo_documento = $('#'+id2).val();
    var archivo = $('#'+id)[0].files[0];
    var TipoNombreDoc = $('#'+id2+' option:selected').text();
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
    formData.append('tipo_documentoNombre', TipoNombreDoc);
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
                NombreDocumento: data[0]['tipo_documentoNombre'],
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
              '<center>'+ArchivosCargados[i].NombreDocumento+'</center>',
              '<center>'+ArchivosCargados[i].size+'</center>'
            ]).draw();
        }
    }
    $("#But_Modal_ArchCarg").click();
}


function CargarTipoAdjuntoContrato(){
    $(".CrearContrato_TipoDocumentoAdjunto").html("");
    $.ajax({
        url: 'administracion.php',
        type: 'POST',
        data:{opcion:"CargarTipoAdjuntoContrato"},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            var html = '<option value="Ninguno" selected="true" disabled="true">Seleccione</option>';
            if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                    html+='<option value="'+datos[i].Id+'">'+datos[i].Nombre+'</option>'
                }
            }
            $(".CrearContrato_TipoDocumentoAdjunto").html(html);
        },
        error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });
}

function ActualziarDatosFinancierosProcesoSeleccion() {
    
    var TotalAportes = $("#CargarFuentesFinanciacion_TotalAportes").val();
    var AportesVivaEspecie = $("#CargarFuentesFinanciacion_AportesVivaEspecie").val();
    var AportesVivaRecursos = $("#CargarFuentesFinanciacion_AportesVivaRecursos").val();
    var AportesMpioEspecie = $("#CargarFuentesFinanciacion_AportesMpioEspecie").val();
    var AportesMpioRecursos = $("#CargarFuentesFinanciacion_AportesMpioRecursos").val();
   
    Swal.fire({
      title: '¿Estás seguro?',
      text: '¿Deseas actualizar los datos financieros del proceso de selección? esto generará el número de contrato y no se podra reversar!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, Actualizar',
      cancelButtonText: 'No'
    }).then((result) => {
      if (result.isConfirmed) {
        var IdContrato = $("#IdContrato").val();
        $.ajax({
          url: 'administracion.php',
          type: 'POST',
          data: {
            opcion: "ActualziarDatosFinancierosProcesoSeleccion",
            TotalAportes: TotalAportes,
            AportesVivaEspecie: AportesVivaEspecie,
            AportesVivaRecursos: AportesVivaRecursos,
            AportesMpioEspecie: AportesMpioEspecie,
            AportesMpioRecursos: AportesMpioRecursos,
            OtraFuente: OtraFuente,
            IdContrato: IdContrato
          },
          success: function (respuesta) {
            if(respuesta.trim() !="N/A"){
                Swal.fire("Éxito!", "Se almacenan exitosamente los datos financieros del proceso, quedando registrado con el contrato número: "+respuesta, "success");
                $("#btn_adicionar_adicional .btn_transparente").removeAttr("disabled");       
                $("#btn_ActualizarDatosFinancierolProceso").attr("disabled","true");       

            }else{
            
                Swal.fire({
                    title: 'Por favor Ingrese el Número de Contrato asignado al Proceso:',
                    input: 'text',
                    inputAttributes: { autocapitalize: 'off' },
                    showCancelButton: false,
                    confirmButtonText: 'Guardar',
                    allowOutsideClick: false, // Evitar cierre al hacer clic afuera
                    backdrop: 'static', // Evitar cierre al hacer clic afuera
                    allowEscapeKey: false,
                    inputValidator: (valor) => {
                        if (!valor) {
                            return 'Debe ingresar un valor';
                        }
                    },
                    preConfirm: (valor) => { return valor;}
                }).then((result) => {
                    if (result.isConfirmed) {
                         var IdContrato = $("#IdContrato").val();
                        // El usuario ingresó un valor, lo usamos en la solicitud Ajax
                        $.ajax({
                            url: 'administracion.php',
                            method: 'POST',
                            data: { opcion:"GuardarNroProcesoSeleccion",NumProceso: result.value , "IdContrato":IdContrato },
                            success: function(response) {
                                LimpiarformularioContratos();
                                window.Swal.fire("Exito!","El contrato por Proceso de Selección se almaceno exitosamente bajo el número: "+response+" !","success");
                                $("#btn_adicionar_adicional .btn_transparente").removeAttr("disabled");  
                                $("#btn_ActualizarDatosFinancierolProceso").attr("disabled","true");       

                            }, error: function() {
                                window.toastr.error("Ocurrió un error interno");
                            }
                        });
                    }
                });   
            }
          }, error: function () {
            toastr.error('Error al cargar las opciones');
          }
        });
      }
    });
} 


function CalcularSaldoTotalSeleccion2() {
    var AportesRecursosViva = $("#CargarFuentesFinanciacion_AportesVivaEspecie").val();
    var AportesEspecieViva = $("#CargarFuentesFinanciacion_AportesVivaRecursos").val();
    var AportesRecursosMpio = $("#CargarFuentesFinanciacion_AportesMpioRecursos").val();
    var AportesEspecieMpio = $("#CargarFuentesFinanciacion_AportesMpioEspecie").val();
    var ValorOtrasFuentes = 0;

    // Verificar si los campos están vacíos y asignarles el valor 0 si es el caso
    AportesRecursosViva = AportesRecursosViva ? FormateoInversoMonto(AportesRecursosViva) : 0;
    AportesEspecieViva = AportesEspecieViva ? FormateoInversoMonto(AportesEspecieViva) : 0;
    AportesRecursosMpio = AportesRecursosMpio ? FormateoInversoMonto(AportesRecursosMpio) : 0;
    AportesEspecieMpio = AportesEspecieMpio ? FormateoInversoMonto(AportesEspecieMpio) : 0;

    for (var i = 0; i < OtraFuente.length; i++) {
        ValorOtrasFuentes+= parseFloat(FormateoInversoMonto( OtraFuente[i]['MontoOtraFuente']));
    }

    var total = parseFloat(AportesRecursosViva) + parseFloat(AportesEspecieViva) + parseFloat(AportesRecursosMpio) + parseFloat(AportesEspecieMpio) + parseFloat(ValorOtrasFuentes);
    $("#CargarFuentesFinanciacion_TotalAportes").val(formatearMonto(total));
    maquillarNumero(document.getElementById("CargarFuentesFinanciacion_TotalAportes"));
}

function CalcularSaldoTotalSeleccion() {
    var AportesRecursosViva = $("#CrearContratoSeleccion_AportesVivaRecurso").val();
    var AportesEspecieViva = $("#CrearContratoSeleccion_AportesVivaEspecie").val();
    var AportesRecursosMpio = $("#CrearContratoSeleccion_AportesMpioRecurso").val();
    var AportesEspecieMpio = $("#CrearContratoSeleccion_AportesMpioEspecie").val();
    var ValorOtrasFuentes = 0;

    // Verificar si los campos están vacíos y asignarles el valor 0 si es el caso
    AportesRecursosViva = AportesRecursosViva ? FormateoInversoMonto(AportesRecursosViva) : 0;
    AportesEspecieViva = AportesEspecieViva ? FormateoInversoMonto(AportesEspecieViva) : 0;
    AportesRecursosMpio = AportesRecursosMpio ? FormateoInversoMonto(AportesRecursosMpio) : 0;
    AportesEspecieMpio = AportesEspecieMpio ? FormateoInversoMonto(AportesEspecieMpio) : 0;

    for (var i = 0; i < OtraFuente.length; i++) {
        ValorOtrasFuentes+= parseFloat(FormateoInversoMonto( OtraFuente[i]['MontoOtraFuente']));
    }

    var total = parseFloat(AportesRecursosViva) + parseFloat(AportesEspecieViva) + parseFloat(AportesRecursosMpio) + parseFloat(AportesEspecieMpio) + parseFloat(ValorOtrasFuentes);
    $("#CrearContratoSeleccion_TotalAportes").val(formatearMonto(total));
    maquillarNumero(document.getElementById("CrearContratoSeleccion_TotalAportes"));
}


function CalcularSaldoTotalDirecto() {
    var AportesRecursosViva = $("#CrearContratoDirect_AportesVivaRecurso").val();
    var AportesEspecieViva = $("#CrearContratoDirect_AportesVivaEspecie").val();
    var AportesRecursosMpio = $("#CrearContratoDirect_AportesMpioRecurso").val();
    var AportesEspecieMpio = $("#CrearContratoDirect_AportesMpioEspecie").val();
    var ValorOtrasFuentes = 0;

    // Verificar si los campos están vacíos y asignarles el valor 0 si es el caso
    AportesRecursosViva = AportesRecursosViva ? FormateoInversoMonto(AportesRecursosViva) : 0;
    AportesEspecieViva = AportesEspecieViva ? FormateoInversoMonto(AportesEspecieViva) : 0;
    AportesRecursosMpio = AportesRecursosMpio ? FormateoInversoMonto(AportesRecursosMpio) : 0;
    AportesEspecieMpio = AportesEspecieMpio ? FormateoInversoMonto(AportesEspecieMpio) : 0;
    for (var i = 0; i < OtraFuente.length; i++) {
        ValorOtrasFuentes+= parseFloat(FormateoInversoMonto( OtraFuente[i]['MontoOtraFuente']));
    }

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
    var Proceso = $("#CrearContratoSeleccion_ProcesoPertenece").val();
    var Direccion = $("#CrearContratoSeleccion_DireccionPertenece").val()
    var DisponibilidadPresupuestal = $("#CrearContratoSeleccion_DisponibilidadPresupuestal").val();
    var FechaDisponibilidadPresupuestal = $("#CrearContratoSeleccion_FechaDisponibilidad").val();
    var MontoDisponibilidad = $("#CrearContratoSeleccion_MontoDisponibilidad").val();
    var Resp = "NO";

    

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
            data:{opcion:"GuardarContratoProcesoSeleccion",depto:depto,mpio:mpio,PersonaContacto:PersonaContacto,numero_contacto:numero_contacto,correo_contacto:correo_contacto,rol_juridico:rol_juridico,rol_logistico:rol_logistico,rol_tecnico:rol_tecnico,FechaSolicitud:FechaSolicitud,TipoContrato:TipoContrato,TipoModalidad:TipoModalidad,NroActa:NroActa,FechaNroActa:FechaNroActa,ObjetoContrto:ObjetoContrto,SegmentoContrto:SegmentoContrto,Proceso:Proceso,DisponibilidadPresupuestal:DisponibilidadPresupuestal,FechaDisponibilidadPresupuestal:FechaDisponibilidadPresupuestal,MontoDisponibilidad:FormateoInversoMonto(MontoDisponibilidad),ArchivosCargados:ArchivosCargados,tipoProcesoContratacion:$("#CrearContrato_TipoContrato").val(),Direccion:Direccion},
            success: function(respuesta){
                var datos = JSON.parse(respuesta);
                if(datos['NumContrato'].trim()!="N/A"){
                    LimpiarformularioContratos();
                    window.Swal.fire("Exito!","El Proceso de Selección se almaceno exitosamente bajo el número: "+datos['NumContrato']+" !","success");
                }else{
          
                    Swal.fire({
                        title: 'Por favor Ingrese el Número de Proceso asignado:',
                        input: 'text',
                        inputAttributes: { autocapitalize: 'off' },
                        showCancelButton: false,
                        confirmButtonText: 'Guardar',
                        allowOutsideClick: false, // Evitar cierre al hacer clic afuera
                        backdrop: 'static', // Evitar cierre al hacer clic afuera
                        allowEscapeKey: false,
                        inputValidator: (valor) => {
                            if (!valor) {
                                return 'Debe ingresar un valor';
                            }
                        },
                        preConfirm: (valor) => { return valor;}
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // El usuario ingresó un valor, lo usamos en la solicitud Ajax
                            $.ajax({
                                url: 'administracion.php',
                                method: 'POST',
                                data: { opcion:"GuardarNroProcesoSeleccion",NumProceso: result.value , "IdContrato":datos['IdContrato'] },
                                success: function(response) {
                                    LimpiarformularioContratos();
                                    window.Swal.fire("Exito!","El Proceso de Selección se almaceno exitosamente bajo el número: "+response+" !","success");
                                },
                                error: function() {
                                    window.toastr.error("Ocurrió un error interno");
                                }
                            });
                        }
                    });
         
                }
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
        var PoseeOtraFuente = "NO";

        if(OtraFuente.length>0){
            PoseeOtraFuente = "SI";
        }


        $.ajax({
            url: 'administracion.php',
            type: 'POST',
            data:{opcion:"GuardarContratoDirecto",depto:depto,mpio:mpio,PersonaContacto:PersonaContacto,numero_contacto:numero_contacto,correo_contacto:correo_contacto,rol_juridico:rol_juridico,rol_logistico:rol_logistico,rol_tecnico:rol_tecnico,FechaSolicitud:FechaSolicitud,TipoContrato:TipoContrato,TipoModalidad:TipoModalidad,TipoPersona:TipoPersona,NroActa:NroActa,FechaNroActa:FechaNroActa,ObjetoContrto:ObjetoContrto,SegmentoContrto:SegmentoContrto,TotalAportes:FormateoInversoMonto(TotalAportes),AportesRecursosViva:FormateoInversoMonto(AportesRecursosViva),AportesEspecieViva:FormateoInversoMonto(AportesEspecieViva),AportesRecursosMpio:FormateoInversoMonto(AportesRecursosMpio),AportesEspecieMpio:FormateoInversoMonto(AportesEspecieMpio),ValorOtrasFuentes:FormateoInversoMonto(ValorOtrasFuentes),NombreOtrasFuentes:NombreOtrasFuentes,Proceso:Proceso,DisponibilidadPresupuestal:DisponibilidadPresupuestal,FechaDisponibilidadPresupuestal:FechaDisponibilidadPresupuestal,MontoDisponibilidad:FormateoInversoMonto(MontoDisponibilidad),ContratistasDirecto:ContratistasDirecto,ArchivosCargados:ArchivosCargados,tipoProcesoContratacion:$("#CrearContrato_TipoContrato").val(),Direccion:Direccion, OtraFuente:OtraFuente,PoseeOtraFuente:PoseeOtraFuente },
            success: function(respuesta){

                var datos = JSON.parse(respuesta);
                if(datos['NumContrato'].trim()!="N/A"){
                    LimpiarformularioContratos();
                    window.Swal.fire("Exito!","El Contrato se almaceno bajo el número: "+datos['NumContrato']+"  exitosamente!","success");
                }else{
                    Swal.fire({
                        title: 'Por favor Ingrese el Número de Contrato asignado:',
                        input: 'text',
                        inputAttributes: { autocapitalize: 'off' },
                        showCancelButton: false,
                        confirmButtonText: 'Guardar',
                        allowOutsideClick: false, // Evitar cierre al hacer clic afuera
                        backdrop: 'static', // Evitar cierre al hacer clic afuera
                        allowEscapeKey: false,
                        inputValidator: (valor) => {
                            if (!valor) {
                                return 'Debe ingresar un valor';
                            }
                        },
                        preConfirm: (valor) => {
                            return valor;
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // El usuario ingresó un valor, lo usamos en la solicitud Ajax
                            $.ajax({
                                url: 'administracion.php',
                                method: 'POST',
                                data: { opcion:"GuardarNroProcesoSeleccion",NumProceso: result.value , "IdContrato":datos['IdContrato'] },
                                success: function(response) {
                                    window.Swal.fire("Exito!","El Contrato se almaceno bajo el número: "+response+"  exitosamente!","success");
                                },
                                error: function() {
                                    window.toastr.error("Ocurrió un error interno");
                                }
                            });
                        }
                    });


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



function PoseeAportesCargados(callback){
    var IdContrato = $("#IdContrato").val();
    $.ajax({
        url: 'administracion.php',
        type: 'POST',
        data:{opcion:"PoseeAportesCargados",IdContrato:IdContrato},
        success: function(respuesta){
            callback( respuesta );
        },error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });
}


function ConsultarEstadoContrato(callback){
    var IdContrato = $("#IdContrato").val();
    $.ajax({
        url: 'administracion.php',
        type: 'POST',
        data: { opcion: "ConsultarEstadoContrato", "IdContrato": IdContrato },
        success: function (respuesta) {
           callback( respuesta);
        },error: function () {
            window.toastr.error('Ocurrió un error al eliminar el supervisor.');
        }
    });
}


function AdicionarInformacionAdicional(){
    ConsultarEstadoContrato(function (respuesta){
        if(respuesta=="INICIADO"){
            $("#btn_anular").show();
            $("#btn_desertar").hide();
            $("#btn_Celebrar").show();
        }else if(respuesta=="ANULADO" || respuesta=="TERMINADO"){
            $("#btn_anular").hide();
            $("#btn_desertar").hide();
            $("#btn_Celebrar").hide();
        }else{
            $("#btn_anular").hide();
            $("#btn_desertar").show();
            $("#btn_Celebrar").hide();
        }
        $("#Btn_Modal_AdicionarInfo").click();

    });

}

function AdicionarInformacionAportes() {

    var tabla = $('#Tbl_ValorOtrasFuenta').DataTable();
    tabla.clear().draw();
    $("#btn_Modal_CargarFuentesFinanciacion").click();
    MostrarOtrasFuentes();

    PoseeAportesCargados(function (respuesta){

        if($("#TipoContrato").val()=="ContratoProceso" && respuesta.trim()=="NO"){
            $("#CargarFuentesFinanciacion_AportesVivaEspecie").removeAttr("readonly");
            $("#CargarFuentesFinanciacion_AportesVivaRecursos").removeAttr("readonly");
            $("#CargarFuentesFinanciacion_AportesMpioEspecie").removeAttr("readonly");
            $("#CargarFuentesFinanciacion_AportesMpioRecursos").removeAttr("readonly");
            $("#btn_AdicionarOtrasFuentes").removeAttr("disabled");
            $("#btn_ActualizarDatosFinancierolProceso").removeAttr("disabled");
            $("#AddInfoContratoProceso_ValorOtrasFuentes").removeAttr("readonly");
            $("#AddInfoContratoProceso_NombreOtrasFuentes").removeAttr("readonly");
        }else{
            $("#CargarFuentesFinanciacion_AportesVivaEspecie").attr("readonly","true");
            $("#CargarFuentesFinanciacion_AportesVivaRecursos").attr("readonly","true");
            $("#CargarFuentesFinanciacion_AportesMpioEspecie").attr("readonly","true");
            $("#CargarFuentesFinanciacion_AportesMpioRecursos").attr("readonly","true");
            $("#btn_AdicionarOtrasFuentes").attr("disabled","true");
            $("#btn_ActualizarDatosFinancierolProceso").attr("disabled","true");
            $("#AddInfoContratoProceso_ValorOtrasFuentes").attr("readonly","true");
            $("#AddInfoContratoProceso_NombreOtrasFuentes").attr("readonly","true");
        }
    });
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


function EliminarAmparoPoliza(pos){
    
    AmparosPoliza.splice(pos, 1);
    ActualizarAmparosPolizas();
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
    OtraFuente = [];
    ActualizarContratistasCargadosDirecto();
    $("#btn_AdicionarContratistaContratoDirecto").removeAttr("disabled");
    MostrarOtrasFuentes();
    $(".error").removeClass("error");
}


function GenerarReporteInfoAdicxContr() {
    var workbook = XLSX.utils.book_new();
    var sheetData = [
        ['#', 'Número de Contrato', 'Fecha de Solicitud', 'Fecha Inicio', 'Fecha Fin', 'Número Compromiso Presupuestal', 'Fecha Compromiso Presupuestal', 'Monto Compromiso Presupuestal','Fecha Gest. Transp.','Fecha Trans. CAD','Fecha Publicación en Secop','Link Publicación en Secop']
    ];

    for (var i = 0; i < Contratos.length; i++) {

        var rowData = [
            parseInt(i+1),
            Contratos[i]['CONTRATO_NUMERO_VIVA'],
            Contratos[i]['FECHA_SOLICITUD'],
            Contratos[i]['FECHA_INI'],
            Contratos[i]['FECHA_FIN'],
            Contratos[i]['COMPROMISO_PRESUPUESTAL'],
            Contratos[i]['FECHA_COMPROMISO_PRESUPUESTAL'],
            Contratos[i]['MONTO_COMPROMISO_PRESUPUESTAL'],
            Contratos[i]['FECHA_PUBLICACION_GEST_TRANS'],
            Contratos[i]['FECHA_TRANS_CAD'],
            Contratos[i]['FECHA_PUBLICACION_SECOP'],
            Contratos[i]['LINK_PUBLICACION_SECOP']
        ];

        sheetData.push(rowData);
    }

    // Resto del código para generar el archivo Excel

    var worksheet = XLSX.utils.aoa_to_sheet(sheetData);

    XLSX.utils.book_append_sheet(workbook, worksheet, 'Resumen');

    var workbookOutput = XLSX.write(workbook, { type: 'binary' });
    var blob = new Blob([s2ab(workbookOutput)], { type: 'application/octet-stream' });
    saveAs(blob, 'ResumenInformacionAdicionalporContrato.xlsx');       
}




function FiltrarResultadosInfoAdicxContr() {
    var Anio = $("#InfoAdicxContrFiltros_anio").val();
    var Mes = $("#InfoAdicxContrFiltros_Mes").val();

    if(!Anio){
        Anio = "NO";
    }

    if(!Mes){
        Mes = "NO";
    }

    $.ajax({
        url: '../administracion.php',
        type: 'POST',
        data:{opcion:"FiltrarResultadosInfoAdicxContr",Anio:Anio,Mes:Mes},
        success: function(respuesta){
            Contratos = JSON.parse(respuesta);
            var tabla = $('#Tbl_ResumenGestionCont').DataTable();
            tabla.clear().draw();
            if(Contratos.length>0){
                $("#Btn_ReporteInfoAdicxContr").show();
                for (var i = 0; i < Contratos.length; i++) {
                    tabla.row.add([
                      '<td><center>'+parseInt(i+1)+'</center></td>',
                      '<td><center>'+Contratos[i].CONTRATO_NUMERO_VIVA+'</center></td>',
                      '<td><center>'+Contratos[i].FECHA_SOLICITUD+'</center></td>',
                      '<td><center>'+Contratos[i].FECHA_INI+'</center></td>',
                      '<td><center>'+Contratos[i].FECHA_FIN+'</center></td>',
                      '<td><center>'+Contratos[i].COMPROMISO_PRESUPUESTAL+'</center></td>',
                      '<td><center>'+Contratos[i].FECHA_COMPROMISO_PRESUPUESTAL+'</center></td>',
                      '<td><center>'+formatearMonto( Contratos[i].MONTO_COMPROMISO_PRESUPUESTAL)+'</center></td>',
                      '<td><center>'+Contratos[i].FECHA_PUBLICACION_GEST_TRANS+'</center></td>',
                      '<td><center>'+Contratos[i].FECHA_TRANS_CAD+'</center></td>',
                      '<td><center>'+Contratos[i].FECHA_PUBLICACION_SECOP+'</center></td>',
                      '<td class="texto-largo"><center class="texto-largo"><a href="'+Contratos[i].LINK_PUBLICACION_SECOP+'" >'+Contratos[i].LINK_PUBLICACION_SECOP+'<a></center></td>',
                    ]).draw();            
                }
            }else{
                $("#Btn_ReporteInfoAdicxContr").hide();
            }
        }, error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });
}

function FiltrarResultadosResumenGestionCont() {
    var Anio = $("#ResumenGestionContFiltros_anio").val();
    var Mes = $("#ResumenGestionContFiltros_Mes").val();

    if(!Anio){
        Anio = "NO";
    }

    if(!Mes){
        Mes = "NO";
    }

    $.ajax({
        url: '../administracion.php',
        type: 'POST',
        data:{opcion:"FiltrarResultadosResumenGestionCont",Anio:Anio,Mes:Mes},
        success: function(respuesta){
            Contratos = JSON.parse(respuesta);
            var tabla = $('#Tbl_ResumenGestionDocumental').DataTable();
            tabla.clear().draw();
            if(Contratos.length>0){
                $("#Btn_ReporteMensualContrato").show();
                var total = 0;
                var desierto = 0;
                var anulado = 0;
                for (var i = 0; i < Contratos.length; i++) {

                    total+= parseInt(Contratos[i].cantidad);
                    desierto+= parseInt(Contratos[i].Desierto);
                    anulado+= parseInt(Contratos[i].Anulado);

                    tabla.row.add([
                      '<tr><td rowspan="3"><center>'+Contratos[i].TIPO_PROCESO_CONTRATO+'</center></td>',
                      '<td><center>'+Contratos[i].TipoContrato+'</center></td>',
                      '<td><center>'+Contratos[i].cantidad+'</center></td>',
                      '<td><center>'+Contratos[i].Direccion+'</center></td>',
                      '<td><center>'+Contratos[i].cantidad+'</center></td>',
                      '<td><center>'+Contratos[i].Desierto+'</center></td></tr>',
                      '<td><center>'+Contratos[i].Anulado+'</center></td>',
                    ]).draw();            
                }
                $("#Total1").html(total);
                $("#Total2").html(total);
                $("#Total3").html(desierto);
                $("#Total4").html(anulado);
            }else{
                $("#Btn_ReporteMensualContrato").hide();
            }
        }, error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });


    $.ajax({
        url: '../administracion.php',
        type: 'POST',
        data:{opcion:"FiltrarResultadosResumenGestionContTotales",Anio:Anio,Mes:Mes},
        success: function(respuesta){
            TotalesContratos = JSON.parse(respuesta);
            var tabla = $('#Tbl_ResumenGestionDocumental_Total').DataTable();
            tabla.clear().draw();
            if(TotalesContratos.length>0){
                $("#Btn_ReporteMensualContrato").show();

                tabla.row.add([
                  '<tr><td><center>TOTAL NÚMEROS ASIGNADOS</center></td>',
                  '<td><center>'+TotalesContratos[0].Cantidad+'</center></td></tr>',
                ]).draw(); 

                tabla.row.add([
                  '<tr><td><center>TOTAL NÚMEROS ANULADOS</center></td>',
                  '<td><center>'+TotalesContratos[0].Cant_Anulado+'</center></td></tr>',
                ]).draw(); 

                tabla.row.add([
                  '<tr><td><center>TOTAL DE PROCESO DESIERTOS</center></td>',
                  '<td><center>'+TotalesContratos[0].Cant_Desierto+'</center></td></tr>',
                ]).draw(); 

                tabla.row.add([
                  '<tr><td><center>PUBLICADOS EN SECOP</center></td>',
                  '<td><center>'+TotalesContratos[0].Cant_secop+'</center></td></tr>',
                ]).draw(); 

                tabla.row.add([
                  '<tr><td><center>PUBLICADOS EN GESTIÓN TRANSPARENTE</center></td>',
                  '<td><center>'+TotalesContratos[0].Cant_GestTrans+'</center></td></tr>',
                ]).draw(); 

                tabla.row.add([
                  '<tr><td><center>PENDIENTES DE LEGALIZAR</center></td>',
                  '<td><center>'+TotalesContratos[0].Cant_SinLegalizar+'</center></td></tr>',
                ]).draw(); 

                tabla.row.add([
                  '<tr><td><center>PENDIENTES DE ACTA DE INICIO</center></td>',
                  '<td><center>'+TotalesContratos[0].Cant_SinActa+'</center></td></tr>',
                ]).draw(); 

                tabla.row.add([
                  '<tr><td><center>ENTREGADOS AL CAD</center></td>',
                  '<td><center>'+TotalesContratos[0].Cant_TransCad+'</center></td></tr>'
                ]).draw();            

            }else{
                $("#Btn_ReporteMensualContrato").hide();
            }
        }, error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });
}

function GenerarReporteMensualContrato() {
    var workbook = XLSX.utils.book_new();
    var sheetData = [
        ['Tipo de Proceso', 'Tipo de Contrato', 'Cantidad de Contratos', 'Dirección', 'Cantidad de Contratos', 'Contratos Desiertos', 'Contratos Anulados']
    ];

    var prevTipoProceso = Contratos[0]['TIPO_PROCESO_CONTRATO']; // Variable para rastrear el valor anterior de "Tipo de Proceso"
    var rowCount = 1; // Contador de filas para aplicar rowspan
    var merges = []; // Lista de combinaciones de celdas
    var inicio = 1;
    var final = 0;
    var total = 0; 
    var desiertos = 0;
    var Anulado = 0;
    for (var i = 0; i < Contratos.length; i++) {
        var currentTipoProceso = Contratos[i]['TIPO_PROCESO_CONTRATO'];
        total+= parseInt(Contratos[i]['cantidad']);
        desiertos+= parseInt(Contratos[i]['Desierto']);
        Anulado+= parseInt(Contratos[i]['Anulado']);

        // Comprobar si el valor de "Tipo de Proceso" ha cambiado desde la fila anterior
        if (currentTipoProceso !== prevTipoProceso || i== parseInt(Contratos.length-1) ) {
            if(i==parseInt(Contratos.length-1)){
                final = parseInt(i+1);
            }else{
                final = i;
            }

            rowCount = 1; // Restablecer el contador de filas
            merges.push({ s: { r: inicio, c: 0 }, e: { r: final, c: 0 } });
            inicio = parseInt(i+1);
            prevTipoProceso = currentTipoProceso; // Actualizar el valor anterior de "Tipo de Proceso"
        }

        var rowData = [
            rowCount === 1 ? currentTipoProceso : '', // Aplicar rowspan solo en la primera fila
            Contratos[i]['TipoContrato'],
            Contratos[i]['cantidad'],
            Contratos[i]['Direccion'],
            Contratos[i]['cantidad'],
            Contratos[i]['Anulado'],
            Contratos[i]['Desierto']
        ];

        sheetData.push(rowData);
    }

    final++;
    merges.push({ s: { r: final, c: 0 }, e: { r: final, c: 1 } });
        var rowData = [
            'TOTAL','',
            total,
            'TOTAL',
            total,
            desiertos,
            Anulado
        ];

        sheetData.push(rowData);

    // Resto del código para generar el archivo Excel


    sheetData.push(['']);
    sheetData.push(['Nombre', 'Cantidad']);
    sheetData.push([ 'TOTAL NÚMEROS ASIGNADOS', TotalesContratos[0]['Cantidad'] ]);
    sheetData.push([ 'TOTAL NÚMEROS ANULADOS', TotalesContratos[0]['Cant_Anulado'] ]);
    sheetData.push([ 'TOTAL DE PROCESO DESIERTOS', TotalesContratos[0]['Cant_Desierto'] ]);
    sheetData.push([ 'PUBLICADOS EN SECOP', TotalesContratos[0]['Cant_secop'] ]);
    sheetData.push([ 'PUBLICADOS EN GESTIÓN TRANSPARENTE', TotalesContratos[0]['Cant_GestTrans'] ]);
    sheetData.push([ 'PENDIENTES DE LEGALIZAR', TotalesContratos[0]['Cant_SinLegalizar'] ]);
    sheetData.push([ 'PENDIENTES DE ACTA DE INICIO', TotalesContratos[0]['Cant_SinActa'] ]);
    sheetData.push([ 'ENTREGADOS AL CAD', TotalesContratos[0]['Cant_TransCad'] ]);
    var worksheet = XLSX.utils.aoa_to_sheet(sheetData);

    // Aplicar las combinaciones de celdas
    worksheet['!merges'] = merges;

    XLSX.utils.book_append_sheet(workbook, worksheet, 'Resumen');

    var workbookOutput = XLSX.write(workbook, { type: 'binary' });
    var blob = new Blob([s2ab(workbookOutput)], { type: 'application/octet-stream' });
    saveAs(blob, 'ResumenMensualGestionContractual.xlsx');       
}


function ActualizarClienteContratoProceso(){

    var Depto = $("#CrearContratoSeleccion_dpto").val();
    var Mpio = $("#CrearContratoSeleccion_mpio").val();
    var Persona = $("#CrearContratoSeleccion_PersonaContacto").val();
    var NumContacto = $("#CrearContratoSeleccion_NumeroContacto").val();
    var CorreoContaccto = $("#CrearContratoSeleccion_CorreoContacto").val();
    var Resp = "NO";

    if(!Depto || Depto=="Ninguno"){
        $("#CrearContratoSeleccion_dpto").addClass("error");
        Resp = "SI";
    }

    if(!Mpio || Mpio=="Ninguno"){
        $("#CrearContratoSeleccion_mpio").addClass("error");
        Resp = "SI";
    }

    if(!Persona){
        $("#CrearContratoSeleccion_PersonaContacto").addClass("error");
        Resp = "SI";
    }

    if(!NumContacto){
        $("#CrearContratoSeleccion_NumeroContacto").addClass("error");
        Resp = "SI";
    }

    if(!CorreoContaccto){
        $("#CrearContratoSeleccion_CorreoContacto").addClass("error");
        Resp = "SI";
    }

    if(Resp=="SI"){

        window.toastr.error("Algunos campos obligatorios estan vacios!");
        return false;

    }else{

        var IdContrato = $("#IdContrato").val();
        $.ajax({
            url: 'administracion.php',
            type: 'POST',
            data:{opcion:"ActualizarClienteContratoProceso",IdContrato:IdContrato,Depto:Depto,Mpio:Mpio,Persona:Persona,NumContacto:NumContacto,CorreoContaccto:CorreoContaccto},
            success: function(respuesta){
                if(respuesta.trim()=="OK"){
                   window.Swal.fire("Exito!","Datos del cliente actualizado satisfactoriamente!","success");
                   $("#CrearContratoSeleccion_dpto").attr("readonly","true");
                   $("#CrearContratoSeleccion_mpio").attr("readonly","true");
                   $("#CrearContratoSeleccion_NumeroContacto").attr("readonly","true");
                   $("#CrearContratoSeleccion_CorreoContacto").attr("readonly","true");
                   $("#CrearContratoSeleccion_PersonaContacto").attr("readonly","true"); 
                   $("#Btn_Update_ClienteContrato").hide();
                }else{
                    window.toastr.error(respuesta);
                }
            }
        });
    }
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
                $("#TipoContrato").val(datos[0].TIPO_PROCESO_CONTRATO);
                $("#CrearContratoSeleccion_mpio").html("");
                CargarDeptosEspera("CrearContratoSeleccion_dpto", function () {
                   if(datos[0].TIPO_PROCESO_CONTRATO=="ContratoProceso" && (!datos[0].NombreDepto || !datos[0].NombreMpio || !datos[0].NOMBRE_CONTACTO || !datos[0].NUMERO_CONTACTO || !datos[0].CORREO_CONTACTO)){
                        $("#Btn_Update_ClienteContrato").show();
                        $("#CrearContratoSeleccion_dpto").removeAttr("readonly");
                        $("#CrearContratoSeleccion_mpio").removeAttr("readonly");
                        $("#CrearContratoSeleccion_NumeroContacto").removeAttr("readonly");
                        $("#CrearContratoSeleccion_CorreoContacto").removeAttr("readonly");
                        $("#CrearContratoSeleccion_PersonaContacto").removeAttr("readonly");
                        if(datos[0].NombreDepto) { $("#CrearContratoSeleccion_dpto").val(datos[0].ID_DEPTO); 
                            CargarMunicipioEspera('CrearContratoSeleccion_dpto','CrearContratoSeleccion_mpio', function () {
                            if(datos[0].NombreMpio) { $("#CrearContratoSeleccion_mpio").val(datos[0].ID_MUNICIPIO); }else{ $("#CrearContratoSeleccion_mpio").val("Ninguno");}
                        });
                        }else{ $("#CrearContratoSeleccion_dpto").val("Ninguno"); $("#CrearContratoSeleccion_mpio").val("Ninguno");}
                        
                        if(datos[0].NOMBRE_CONTACTO) { $("#CrearContratoSeleccion_PersonaContacto").val(datos[0].NOMBRE_CONTACTO); }else{ $("#CrearContratoSeleccion_PersonaContacto").val("");}
                        if(datos[0].NUMERO_CONTACTO) { $("#CrearContratoSeleccion_NumeroContacto").val(datos[0].NUMERO_CONTACTO); }else{ $("#CrearContratoSeleccion_NumeroContacto").val("");}
                        if(datos[0].CORREO_CONTACTO) { $("#CrearContratoSeleccion_CorreoContacto").val(datos[0].CORREO_CONTACTO); }else{ $("#CrearContratoSeleccion_CorreoContacto").val("");}
                   }else{
                       $("#CrearContratoSeleccion_dpto").val(datos[0].ID_DEPTO);
                       CargarMunicipioEspera('CrearContratoSeleccion_dpto','CrearContratoSeleccion_mpio', function () {
                           $("#CrearContratoSeleccion_mpio").val(datos[0].ID_MUNICIPIO);
                       });
                       $("#CrearContratoSeleccion_PersonaContacto").val(datos[0].NOMBRE_CONTACTO);
                       $("#CrearContratoSeleccion_NumeroContacto").val(datos[0].NUMERO_CONTACTO);
                       $("#CrearContratoSeleccion_CorreoContacto").val(datos[0].CORREO_CONTACTO);
                       $("#CrearContratoSeleccion_dpto").attr("readonly","true");
                       $("#CrearContratoSeleccion_mpio").attr("readonly","true");
                       $("#CrearContratoSeleccion_NumeroContacto").attr("readonly","true");
                       $("#CrearContratoSeleccion_CorreoContacto").attr("readonly","true");
                       $("#CrearContratoSeleccion_PersonaContacto").attr("readonly","true");  
                   }
                });

               



               $("#AdicionarInfo_ContratoBuscarId").val(datos[0].NumContrato);

               $("#CrearContratoSeleccion_ESTADO_CONTRATO").val(datos[0].ESTADO_CONTRATO);

               $("#CrearContratoSeleccion_FechaSol").val( datos[0].FECHA_SOLICITUD) ;
               $("#CrearContratoSeleccion_RolJuridico").val(datos[0].ROL_JURIDICO);
               $("#CrearContratoSeleccion_RolLogistico").val(datos[0].ROL_LOGISTICO);
               $("#CrearContratoSeleccion_RolTecnico").val(datos[0].ROL_TECNICO);
               $("#CrearContratoSeleccion_TipoContrato").val(datos[0].NombreTipoContrato);
               $("#CrearContratoSeleccion_Modalidad").val(datos[0].NombreModalidad);
               $("#CrearContratoSeleccion_FechaActaComite").val(datos[0].FECHA_NRO_ACTA);
               $("#CrearContratoSeleccion_NroActaComite").val(datos[0].NRO_ACTA);
               $("#CrearContratoSeleccion_DisponibilidadPresupuestal").val(datos[0].DISPONIBILIDAD_PRESUPUESTAL);
               $("#CrearContratoSeleccion_FechaDisponibilidad").val(datos[0].FECHA_DISPONIBILIDAD_PRESUPUESTAL);
               $("#CrearContratoSeleccion_MontoDisponibilidad").val(formatearMonto(datos[0].MONTO_DISPONIBILIDAD_PRESUPUESTAL));

                if(datos[0].TOTAL_APORTES>0){
                    $("#btn_adicionar_adicional .btn_transparente").removeAttr("disabled");
                }else{
                    $("#btn_adicionar_adicional .btn_transparente").attr("disabled","true");
                    $("#btn_adicionar_adicional .btn_addfuentes").removeAttr("disabled");
                }


               
               $("#CargarFuentesFinanciacion_AportesMpioEspecie").val(formatearMonto(datos[0].APORTES_ESPECIE_MPIO)).attr("readonly","true");
               $("#CargarFuentesFinanciacion_AportesVivaEspecie").val(formatearMonto(datos[0].APORTES_ESPECIE_VIVA)).attr("readonly","true");
               $("#CargarFuentesFinanciacion_AportesVivaRecursos").val(formatearMonto(datos[0].APORTES_RECURSOS_VIVA)).attr("readonly","true");
               $("#CargarFuentesFinanciacion_AportesMpioRecursos").val(formatearMonto(datos[0].APORTES_RECURSOS_MPIO)).attr("readonly","true");
               $("#CargarFuentesFinanciacion_TotalAportes").val( formatearMonto(datos[0].TOTAL_APORTES) );

               $("#CrearContratoSeleccion_DireccionPertenece").val(datos[0].DIRECCION);
               $("#CrearContratoSeleccion_ProcesoPertenece").val(datos[0].PROCESO);
               $("#CrearContratoSeleccion_ObjetoContrato").val(datos[0].OBJETO_CONTRATO);
               $("#CrearContratoSeleccion_SegmentoContrato").val(datos[0].SEGMENTO_CONTRATO);
               $("#btnModalNuevoOtroSi").removeAttr("disabled");
               $("#btnModalHistoricoOtroSi").removeAttr("disabled");
               $("#FormContratoProceso").show();
               $("#btn_adicionar_adicional").show();
               OtraFuente = [];
               if(datos[0]['OtrasFuentes'].length>0 ){

                    $("#AddInfoContratoProceso_ValorOtrasFuentes").attr("readonly","true");
                    $("#AddInfoContratoProceso_NombreOtrasFuentes").attr("readonly","true");
                    $("#btn_AdicionarOtrasFuentes").attr("disabled","true");
                    $("#btn_ActualizarDatosFinancierolProceso").attr("disabled","true");

                    for(var i = 0; i < datos[0]['OtrasFuentes'].length; i++) {
                        OtraFuente.push({ "Id":OtraFuente.length, "NombreOtraFuente":datos[0]['OtrasFuentes'][i]['NombreFuente'] , "MontoOtraFuente": formatearMonto( datos[0]['OtrasFuentes'][i]['Monto'] ) });
                    }
                    CalcularSaldoTotalSeleccion2();
                    MostrarOtrasFuentes();
                }

               //Cargo la informacion adicional si la ubiera
               if(datos[0]['InformacionAdicional'].length>0){

                    var detalles = datos[0]['InformacionAdicional'][0];
                    if(detalles['TIPO_PERSONA']){
                    $("#CrearContratoAdicionar_TipoPersonaContratar").val(detalles['TIPO_PERSONA']);
                    CargarContratistas('CrearContratoAdicionar_TipoPersonaContratar');}
                    $("#CrearContratoAdicionar_FechaInicio").val(detalles['FECHA_INI']);
                    $("#CrearContratoAdicionar_FechaFin").val(detalles['FECHA_FIN']);
                    $("#CrearContratoAdicionar_FechaContrato").val(detalles['FECHA_CONTRATO']);
                    $("#CrearContratoAdicionar_CompromisoPresupuestal").val(detalles['COMPROMISO_PRESUPUESTAL']);
                    $("#CrearContratoAdicionar_FechaCompromisoPresupuestal").val(detalles['FECHA_COMPROMISO_PRESUPUESTAL']);
                    $("#CrearContratoAdicionar_MontoCompromisoPresupuestal").val( formatearMonto(detalles['MONTO_COMPROMISO_PRESUPUESTAL']));
                    $("#CrearContratoAdicionar_OrdenadorGasto").val(detalles['ORDENADOR_GASTO']);
                    if(detalles['ID_TIPO_GASTO'])
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
        },error: function(){
             window.toastr.warning('Error al cargar las opciones');
        }
    });
}




function BuscarContratoReporteAdmin(){

    var ingresado = $("#PolizasAmparosContr_ContratoBuscarId").val();
    if (ingresado && ingresado.length>2){
        $.ajax({
            url: '../administracion.php',
            type: 'POST',
            data:{opcion:"BuscarContratoAdicionarInfo",ingresado:ingresado},
            success: function(respuesta){
                var html = '';
                if(respuesta.trim()!='"NO"'){
                    var datos = JSON.parse(respuesta);
                    if(datos.length>0){
                        for (var i = 0; i < datos.length; i++) {
                            html+='<li class="list-group-item" onclick=SeleccionarContratoReportInfo(\''+datos[i].ID+'\',\''+datos[i].CONTRATO_NUMERO_VIVA+'\') >'+datos[i].CONTRATO_NUMERO_VIVA+'</li>';
                        }
                    }
                    $("#PolizasAmparosContr_ContratoBuscarId_List").html(html);
                }else{
                    $("#PolizasAmparosContr_ContratoBuscarId_List").html('<li class="list-group-item">No hay datos que mostrar</li>');
                }
            },error: function(){
                 window.toastr.warning('Error al cargar las opciones');
            }
        });
    }else{
        $("#PolizasAmparosContr_ContratoBuscarId_List").html("");
    }
}

function SeleccionarContratoReportInfo(Param_Idcontrato,Param_NumeroContrato){
    $("#IdContrato").val(Param_Idcontrato);
    $.ajax({
        url: '../administracion.php',
        type: 'POST',
        data:{opcion:"SeleccionarContratoReportInfo",IdContrato:Param_Idcontrato},
        success: function(respuesta){ 
            var tabla = $('#Tbl_Reporte_PolizasAmparosContr').DataTable();
            tabla.clear().draw();
            Contratos = JSON.parse(respuesta);
            if(Contratos.length>0){
                for (var i = 0; i < Contratos.length; i++) {
                    tabla.row.add([
                      '<center>'+parseInt(i+1)+'</center>',
                      '<center>'+Contratos[i].CONTRATO_NUMERO_VIVA+'</center>',
                      '<center>'+Contratos[i].ESTADO_CONTRATO+'</center>',
                      '<center>'+Contratos[i].Compania_Poliza+'</center>',
                      '<center>'+Contratos[i].Numero_Poliza+'</center>',
                      '<center>'+Contratos[i].TipoPoliza+'</center>',
                      '<center>'+Contratos[i].TipoAmparo+'</center>',
                      '<center>'+Contratos[i].Fecha_Inicio_Amparo+'</center>',
                      '<center>'+Contratos[i].Fecha_Fin_Amparo+'</center>',
                      '<center>'+formatearMonto(Contratos[i].Cuantia_Amparo)+'</center>'
                    ]).draw();
                }
                $("#PolizasAmparosContr_ContratoBuscarId").val(Param_NumeroContrato);
                $("#Div_Reporte_PolizasAmparosContr").show();
                $("#PolizasAmparosContr_ContratoBuscarId_List").html("");
                $("#Div_Btn_PolizasAmparosContr_ReporteExcel").show();
            }else{
                $("#Div_Reporte_PolizasAmparosContr").hide();
                $("#Div_Btn_PolizasAmparosContr_ReporteExcel").hide();
            }
        },error: function(){
            alert('Error al cargar las opciones');
        }
    });
}


function ValidarMontosCdpRp(){


    var MontoRp = $("#CrearContratoAdicionar_MontoCompromisoPresupuestal").val();
    var MontoCdp = $("#CrearContratoSeleccion_MontoDisponibilidad").val();

    if(MontoRp!=MontoCdp){
        Swal.fire({
          title: "Advertencia!",
          text: "Monto de CDP y de RP son diferentes, ¿estás seguro de continuar?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonText: "Sí",
          cancelButtonText: "No",
        }).then((result) => {
          if (!result.isConfirmed) {
            $("#CrearContratoAdicionar_MontoCompromisoPresupuestal").val("");
          }
        });

    }

}

function ReporteExcelPolizasAmparosContr() {
    var workbook = XLSX.utils.book_new();
    var sheetData = [
        ['#', 'Número de Contrato', 'Estado Contrato', 'Compañia de Seguros', 'Número de Póliza', 'Tipo de Póliza', 'Amparo', 'Fecha Inicio de Amapro','Fecha Final de Amaparo','Cuantia de Amparo']
    ];

    for (var i = 0; i < Contratos.length; i++) {

        var rowData = [
            parseInt(i+1),
            Contratos[i]['CONTRATO_NUMERO_VIVA'],
            Contratos[i]['ESTADO_CONTRATO'],
            Contratos[i]['Compania_Poliza'],
            Contratos[i]['Numero_Poliza'],
            Contratos[i]['TipoPoliza'],
            Contratos[i]['TipoAmparo'],
            Contratos[i]['Fecha_Inicio_Amparo'],
            Contratos[i]['Fecha_Fin_Amparo'],
            Contratos[i]['Cuantia_Amparo']
        ];

        sheetData.push(rowData);
    }
    var worksheet = XLSX.utils.aoa_to_sheet(sheetData);
    XLSX.utils.book_append_sheet(workbook, worksheet, 'Resumen');
    var workbookOutput = XLSX.write(workbook, { type: 'binary' });
    var blob = new Blob([s2ab(workbookOutput)], { type: 'application/octet-stream' });
    saveAs(blob, 'ResumenInformacionPolizayAmparoporContrato.xlsx');  
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