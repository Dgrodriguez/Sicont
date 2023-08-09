var Pasajeros = [];
var Direccion = "";
var Servicio = [];

function calcularDiferenciaFechas() {
  var fechaInicio = $("#TranSolicitar_FechaSalida").val();
  var fechaFin = $("#TranSolicitar_Fechallegada").val();

  if(fechaInicio && fechaFin){

    // Validar formato de las fechas
    var formatoValido = /^\d{4}-\d{2}-\d{2}$/;
    if (!formatoValido.test(fechaInicio) || !formatoValido.test(fechaFin)) {
      window.toastr.error("El formato no es válido para una o ambas fechas");
      $("#TranSolicitar_FechaSalida").val("");
      $("#TranSolicitar_Fechallegada").val("");
      $("#TranSolicitar_CantDias").val(0);
      return false;
    }

    // Convertir las fechas a objetos Date
    var fechaInicio = new Date(fechaInicio);
    var fechaFin = new Date(fechaFin);

    // Verificar el orden lógico de las fechas
    if (fechaInicio > fechaFin) {
      // El orden de las fechas es incorrecto
      window.toastr.error("El orden de las fechas es incorrecto");
      $("#TranSolicitar_CantDias").val(0);
      $("#TranSolicitar_FechaSalida").val("");
      $("#TranSolicitar_Fechallegada").val("");
      return false;
    }

    // Calcular la diferencia de días
    var unDia = 24 * 60 * 60 * 1000; // Milisegundos en un día
    var diferenciaDias = Math.round((fechaFin - fechaInicio) / unDia);
    var valor = 0;
    // Determinar el valor según la diferencia de días
    if (diferenciaDias === 0) {
      // Ambas fechas son el mismo día
      valor = 0.5;
    } else {
      // Diferentes días, sumar 1 por noche y 0.5 por día
       valor = 1 + diferenciaDias * 0.5;
    }
     $("#TranSolicitar_CantDias").val(valor);
  }else{
    $("#TranSolicitar_CantDias").val(0);
  }
}


function FiltrarContratoBusqueda(){

  var mpio = $("#TranGestionar_MpioOrigen").val();
  $.ajax({
    url: 'Transporte.php',
    type: 'POST',
    data:{opcion:"FiltrarContratoBusqueda",mpio:mpio},
    success: function(respuesta){
      var datos = JSON.parse(respuesta);
      var html = '<option value="Ninguno">Todos</option>';
      if(datos.length>0){
        for (var i = 0; i < datos.length; i++) {
          html+='<option value="'+datos[i]['CONTRATO_NUMERO_VIVA']+'">'+datos[i]['CONTRATO_NUMERO_VIVA']+'</option>';
        }
      }
      $("#TranGestionar_Contrato").html(html);
    },error: function(){
        window.toastr.error('Error al cargar las opciones');
    }
  });
}

function GenerarExcelReporteGestion() {
  

  var mpio = $("#TranGestionar_MpioOrigen").val();

  var Contrato = $("#TranGestionar_Contrato").val();

  var TVehiculo = $("#TranGestionar_TipoVehiculo").val();

  var proceso = $("#TranGestionar_Proceso").val();

  var FechaIni = $("#TranGestionar_FechaIni").val();
  var FechaFin = $("#TranGestionar_FechaFin").val();
  var Estado = $("#TranGestionar_Estado").val();


    $.ajax({
          url: 'Transporte.php',
          type: 'POST',
          data: {opcion:"CargarServicios",mpio:mpio,Contrato:Contrato,TVehiculo:TVehiculo,proceso:proceso,FechaIni:FechaIni,FechaFin:FechaFin,Estado:Estado},
          success: function(respuesta) {
            var datos = JSON.parse(respuesta);
            

            var workbook = XLSX.utils.book_new();
            var sheetData = [ ['#', 'Fecha Salida', 'Fecha Regreso', 'Municipio Destino', 'Tipo Servicio', 'Contrato / Convenio', 'Proceso / Área', 'Estado', 'Tipo Vehículo', 'Días', 'Persona'] ];

            for (var i = 0; i < datos.length; i++) {
              var rowData = [ parseInt(i+1) , datos[i]['FechaSalida'], datos[i]['FechaRegreso'], datos[i]['mpio'], datos[i]['TipoServicio'], datos[i]['Convenio'], datos[i]['proceso'], datos[i]['Estado'], datos[i]['TipoVehiculo'] , datos[i]['DiasFaltante'] , datos[i]['personas']  ];
              sheetData.push(rowData);
            }

            var worksheet = XLSX.utils.aoa_to_sheet(sheetData);
            XLSX.utils.book_append_sheet(workbook, worksheet, 'Resumen'); // Agregar la hoja al libro de trabajo

            

            var workbookOutput = XLSX.write(workbook, { type: 'binary' });
            var buf = new ArrayBuffer(workbookOutput.length);
            var view = new Uint8Array(buf);
            for (var i = 0; i < workbookOutput.length; i++) {
              view[i] = workbookOutput.charCodeAt(i) & 0xFF;
            }
            var blob = new Blob([buf], { type: 'application/octet-stream' });
            saveAs(blob, 'ResumenSolicitudesdeServicio.xlsx');
          }
    }); 

}

function CargarServicios() {
  
  var mpio = $("#TranGestionar_MpioOrigen").val();

  var Contrato = $("#TranGestionar_Contrato").val();

  var TVehiculo = $("#TranGestionar_TipoVehiculo").val();

  var proceso = $("#TranGestionar_Proceso").val();

  var FechaIni = $("#TranGestionar_FechaIni").val();
  var FechaFin = $("#TranGestionar_FechaFin").val();
  var Estado = $("#TranGestionar_Estado").val();


  $.ajax({
    url: 'Transporte.php',
    type: 'POST',
    data:{opcion:"CargarServicios",mpio:mpio,Contrato:Contrato,TVehiculo:TVehiculo,proceso:proceso,FechaIni:FechaIni,FechaFin:FechaFin,Estado:Estado},
    success: function(respuesta){
      Servicio = JSON.parse(respuesta);
      var tabla = $('#tbl_servicios_cargados').DataTable();
      tabla.clear().draw();
      if(Servicio.length>0){
          for (var i = 0; i < Servicio.length; i++) {
            var button = "";
            if(Servicio[i].DiasFaltante>2){
              button = '<center><button type="button" class="btn_transparente" data-toggle="tooltip" onclick="agregarPasajerosGestion(\''+i+'\')" title="Editar Pasajeros"><i class="fa-regular fa-pen-to-square fa-2xs"></i></button></center>';
            }

            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+Servicio[i].FechaSalida+'</center>',
              '<center>'+Servicio[i].FechaRegreso+'</center>',
              '<center>'+Servicio[i].mpio+'</center>',
              '<center>'+Servicio[i].TipoServicio+'</center>',
              '<center>'+Servicio[i].Convenio+'</center>',
              '<center>'+Servicio[i].proceso+'</center>',
              '<center>'+Servicio[i].Estado+'</center>',
              '<center>'+Servicio[i].TipoVehiculo+'</center>',
              '<center>'+Servicio[i].dias+'</center>',
              '<center>'+Servicio[i].personas+'</center>', button , 
            ]).draw();
          }
          $('[data-toggle="tooltip"]').tooltip();
      }
    },error: function(){
        window.toastr.error('Error al cargar las opciones');
    }
  });
}


function agregarPasajerosGestion(Id){

  if(Servicio[Id]['Pasajeros'].length>0){
    var html = "";
    for (var i = 0; i < Servicio[Id]['Pasajeros'].length; i++) {
      html+="<tr><td>"+ Servicio[Id]['Pasajeros'][i]['Servidor']+"</td><td>"+ Servicio[Id]['Pasajeros'][i]['Telefono']+"</td><td>"+ Servicio[Id]['Pasajeros'][i]['Direccion']+"</td><td><button class='btn_transparente' title='Eliminar Pasajero' data-toggle=\"tooltip\" onclick='EliminarPasajeroGestion(\""+Servicio[Id]['Pasajeros'][i]['Id']+"\",\""+Servicio[Id]['Id']+"\")'><i class=\"fa-solid fa-person-circle-minus fa-2xs\"></i></button><td></tr>";
    }
    $("#Id_Servicio").val(Id);
  }

  $("#tbl_DetallePasajeros tbody").html(html);
  $('[data-toggle="tooltip"]').tooltip();
  $("#Btn_ModalDetallePasajeros").click();

}


function ConcatenarDireccion(element) {
    Direccion = "";
    $("#segundoModal input,#segundoModal select").each(function() {
      var value = $(this).val();
      if (value && value!="Ninguno" && $(this).attr("id")!='TranSolicitar_Servidor' && $(this).attr("id")!='TranSolicitar_ServidorIdentificacion' && $(this).attr("id")!='TranSolicitar_Tlf' ) {
        Direccion += value + " ";
      }
    });
  $("#DireccionResultante").html(Direccion);
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


function AdicionarPasajeroTransporte() {
 
  var nombre = $("#TranSolicitar_Servidor").val();
  var identificacion = $("#TranSolicitar_ServidorIdentificacion").val();
  var Telefono = $("#TranSolicitar_Tlf").val();
  var direccion = $("#DireccionResultante").html();
  var IdServicio = $("#Id_Servicio").val();


  $.ajax({
    url: 'Transporte.php',
    type: 'POST',
    data:{opcion:"AdicionarPasajeroTransporte",nombre:nombre,identificacion:identificacion,Telefono:Telefono,IdServicio:Servicio[IdServicio]['Id'],direccion:direccion},
    success: function(respuesta){
        
      Servicio[IdServicio]['Pasajeros'].push({"Direccion":direccion,Id:"",Servidor:nombre,Telefono:Telefono,Identificacion:identificacion});
      var Pasajeros = Servicio[IdServicio]['Pasajeros'];
      var html = "";
      for (var i = 0; i < Pasajeros.length; i++) {
        html += "<tr><td>" + Pasajeros[i].Servidor + "</td><td>" + Pasajeros[i].Telefono + "</td><td>" + Pasajeros[i].Direccion + "</td><td><button class=\"btn_transparente\" title=\"Eliminar registro\" data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"eliminarRegistro('" + nombre + "','" + identificacion + "')\"><i class=\"fa-solid fa-user-xmark\"></i></button></td></tr>";
      }
      $("#tbl_DetallePasajeros tbody").html(html);
      $('[data-toggle="tooltip"]').tooltip();
      $("#CerrarModalAddPass").click();
      CargarAsignados();
    },error: function(){
        window.toastr.error('Error al cargar las opciones');
    }
  });


}

function eliminarRegistro(servidor, Identificacion) {
  for (var i = 0; i < Pasajeros.length; i++) {
    if (Pasajeros[i].Servidor === servidor && Pasajeros[i].Identificacion === Identificacion) {
      Pasajeros.splice(i, 1);
      break;
    }
  }

  var html = "";
  for (var i = 0; i < Pasajeros.length; i++) {
    html+="<tr><td>"+parseInt(i+1)+"</td><td>"+Pasajeros[i].Servidor+"</td><td>" + Pasajeros[i].Identificacion + "</td><td>"+Pasajeros[i].Telefono+"</td><td>"+Pasajeros[i].PuntoRecogida+"</td><td><button class=\"btn_transparente\" title=\"Eliminar registro\" data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"eliminarRegistro('"+servidor+"',"+Identificacion+"')\"><i class=\"fa-solid fa-user-xmark\"></i></button></td></tr>";
  }

  $("#TranSolicitar_ServidoresPasajeros tbody").html(html);
  $('[data-toggle="tooltip"]').tooltip();

}



function AgregarPasajeroServicio() {
  var servidor = $("#TranSolicitar_Servidor").val();
  var Identificacion = $("#TranSolicitar_ServidorIdentificacion").val();
  var Telefono = $("#TranSolicitar_Tlf").val();

  // Validar que no se agreguen números de identificación duplicados
  var existeIdentificacion = Pasajeros.some(function(pasajero) {
    return pasajero.Identificacion === Identificacion;
  });

  if (existeIdentificacion) {
    window.toastr.error("La identificación ya ha sido ingresada");
    return;
  }

  if (servidor && Telefono && Identificacion) {
    Pasajeros.push({
      "Servidor": servidor,
      "Identificacion": Identificacion,
      "Telefono": Telefono,
      "PuntoRecogida": Direccion
    });

    var html = "";
    for (var i = 0; i < Pasajeros.length; i++) {
      html += "<tr><td>" + parseInt(i + 1) + "</td><td>" + Pasajeros[i].Servidor + "</td><td>" + Pasajeros[i].Identificacion + "</td><td>" + Pasajeros[i].Telefono + "</td><td>" + Pasajeros[i].PuntoRecogida + "</td><td><button class=\"btn_transparente\" title=\"Eliminar registro\" data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"eliminarRegistro('" + servidor + "','" + Identificacion + "')\"><i class=\"fa-solid fa-user-xmark\"></i></button></td></tr>";
    }

    $("#TranSolicitar_ServidoresPasajeros tbody").html(html);
  $('[data-toggle="tooltip"]').tooltip();

  } else {
    if (!servidor) {
      $("#TranSolicitar_Servidor").addClass("error");
      window.toastr.error("Debe Agregar el Nombre del servidor");
    }
    if (!Identificacion) {
      $("#TranSolicitar_ServidorIdentificacion").addClass("error");
      window.toastr.error("Debe Agregar la identificacion del servidor");
    }

    if (!Telefono) {
      $("#TranSolicitar_Tlf").addClass("error");
      window.toastr.error("Debe Agregar el Teléfono del servidor");
    }
  }

  $("#TranSolicitar_CantPasajeros").val(Pasajeros.length);

  $("#segundoModal select").each(function() {
    $(this).val("Ninguno");
  });

  $("#segundoModal input").each(function() {
    $(this).val("");
  });

  $("#TranSolicitar_Servidor").val("");
  $("#TranSolicitar_Tlf").val("");
  $("#TranSolicitar_ServidorIdentificacion").val("");
  $("#DireccionResultante").html("");
  Direccion = "";
}



function GuardarSolicitudServicio(){

  var MpioOrigen = $("#TranSolicitar_MpioOrigen").val();
  var FechaSalida = $("#TranSolicitar_FechaSalida").val();
  var HoraSalida = $("#TranSolicitar_HoraSalida").val();
  var MpioDestino = $("#TranSolicitar_MpioDestino").val();
  var DestinoObserv = $("#TranSolicitar_DestinoObserv").val();
  var Fechallegada = $("#TranSolicitar_Fechallegada").val();
  var Proceso = $("#TranSolicitar_Proceso").val();
  var Contrato = $("#TranSolicitar_Contrato").val();
  var TipoVehiculo = $("#TranSolicitar_TipoVehiculo").val();
  var ObjetoViaje = $("#TranSolicitar_ObjetoViaje").val();
  var CantPasajeros = $("#TranSolicitar_CantPasajeros").val();
  var CantDias = $("#TranSolicitar_CantDias").val();
  var ObserGene = $("#TranSolicitar_ObservGene").val();
  var Resp = "SI";

  $(".error").removeClass("error");

  if(MpioOrigen=="Ninguno"){
    $("#TranSolicitar_MpioOrigen").addClass("error");
    Resp = "NO";
  }

  if(!FechaSalida){
    $("#TranSolicitar_FechaSalida").addClass("error");
    Resp = "NO";
  }

  if(MpioDestino=="Ninguno"){
    $("#TranSolicitar_MpioDestino").addClass("error");
    Resp = "NO";
  }


  if(!Fechallegada){
    $("#TranSolicitar_Fechallegada").addClass("error");
    Resp = "NO";
  }

  if(Proceso=="Ninguno"){
    $("#TranSolicitar_Proceso").addClass("error");
    Resp = "NO";
  }


  if(!Contrato){
    $("#TranSolicitar_Contrato").addClass("error");
    Resp = "NO";
  }


  if(TipoVehiculo=="Ninguno"){
    $("#TranSolicitar_TipoVehiculo").addClass("error");
    Resp = "NO";
  }

  if(!HoraSalida){
    $("#TranSolicitar_HoraSalida").addClass("error");
    Resp = "NO";
  }


  if(!ObjetoViaje){
    $("#TranSolicitar_ObjetoViaje").addClass("error");
    Resp = "NO";
  }


  if(!CantPasajeros || CantPasajeros<1){
    $("#TranSolicitar_CantPasajeros").addClass("error");
    Resp = "NO";
  }

  if(!CantDias || CantDias<0){
    $("#TranSolicitar_CantDias").addClass("error");
    Resp = "NO";
  }

  if(Resp=="NO"){
    window.toastr.error("Error, Faltan datos Obligatorios!");
    return false;
  }else{

   $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"GuardarSolicitudServicio",MpioOrigen:MpioOrigen,FechaSalida:FechaSalida,HoraSalida:HoraSalida,MpioDestino:MpioDestino,DestinoObserv:DestinoObserv,Fechallegada:Fechallegada,Proceso:Proceso,Contrato:Contrato,TipoVehiculo:TipoVehiculo,ObjetoViaje:ObjetoViaje,CantPasajeros:CantPasajeros,CantDias:CantDias,ObserGene:ObserGene,Pasajeros:Pasajeros},
      success: function(respuesta){
        if(respuesta.trim()=="OK"){
          LimpiarServicios();
          window.Swal.fire("Exito!","solicitud de viaje registrada exitosamente!","success");
        }
      },
      error: function(){
          alert('Error al cargar las opciones');
      }
  });
  }
}

function LimpiarServicios() {
  Pasajeros = [];
  Direccion = "";
  $("#TranSolicitar_MpioOrigen").val("Ninguno");
  $("#TranSolicitar_OrigenObserv").val("");
  $("#TranSolicitar_FechaSalida").val("");
  $("#TranSolicitar_HoraSalida").val("");
  $("#TranSolicitar_MpioDestino").val("Ninguno");
  $("#TranSolicitar_DestinoObserv").val("");
  $("#TranSolicitar_Fechallegada").val("");
  $("#TranSolicitar_Proceso").val("Ninguno");
  $("#TranSolicitar_Contrato").val("");
  $("#TranSolicitar_TipoVehiculo").val("Ninguno");
  $("#TranSolicitar_ObjetoViaje").val("");
  $("#TranSolicitar_CantPasajeros").val("");
  $("#TranSolicitar_CantDias").val("");
  $("#TranSolicitar_ObservGene").val("");
}


function CargarAsignados(){
  $("#Tbl_Servicios_Asignadas tbody").html("");
  $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"CargarAsignados"},
      success: function(respuesta){
        Servicio = JSON.parse(respuesta);
        if(Servicio.length>0){
          for (var i = 0; i < Servicio.length; i++) {
             $("#Tbl_Servicios_Asignadas tbody").append("<tr><td>"+parseInt(i+1)+"</td><td>"+Servicio[i]['FechaSalida']+"</td><td>"+Servicio[i]['HoraSalida']+"</td><td>"+Servicio[i]['MpioOrigen']+"</td><td>"+Servicio[i]['FechaRegreso']+"</td><td>"+Servicio[i]['MpioDestino']+"</td><td>"+Servicio[i]['ObservacionesDestino']+"</td><td>"+Servicio[i]['TipoVehiculo']+"</td><td>"+Servicio[i]['CantPersonas']+"</td><td>"+Servicio[i]['CantDias']+"</td><td><button title='ver pasajeros' data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"AbrirDetalle('"+i+"')\" class='btn_transparente'><i class=\"fa-regular fa-rectangle-list\"></i></button></td></td><td><button title='Autorizar Servicio' data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"AbrirDetalleAutorizar('"+Servicio[i]['Id']+"')\" class='btn_transparente'><i class=\"fa-solid fa-car-on\"></i></button></td></tr>");
          }
          $('[data-toggle="tooltip"]').tooltip();
        }
      },
      error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
  });
}


function AutorizarServicio(){
  var Id_servicio = $("#Id_Servicio").val();
  var TipoServicio = $("#TranAutorizar_TipoContrato").val();
  var TranAutorizar_CostoVehiculo = $("#TranAutorizar_CostoVehiculo").val();
  $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"AutorizarServicio",Id_servicio:Id_servicio,TipoServicio:TipoServicio,TranAutorizar_CostoVehiculo:TranAutorizar_CostoVehiculo},
      success: function(respuesta){
        window.Swal.fire("Se Autoriza el servicio Exitosamente!").then(function() {
          $("#btn_AplicarAutorizarVehiculo").click();
        });
        CargarAsignados();
      },
      error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
  });
}

function ActualizarVehiculo() {
  var pos = $("#Id_Servicio").val();
  var IdServicio = Servicio[pos]['Id'];
  if($("#TranGestionar_Vehiculo").val()!="Ninguno"){
    $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"ActualizarVehiculo",IdServicio:IdServicio,Vehiculo:$("#TranGestionar_Vehiculo").val()},
      success: function(respuesta){
        window.toastr.success("Actualización Exitosa!");
      },error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
    });
  }
}


function CargarPendientes(){
  $("#Tbl_Servicios_Asignar tbody").html("");
  $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"CargarPendientes"},
      success: function(respuesta){
        Servicio = JSON.parse(respuesta);
        if(Servicio.length>0){
          for (var i = 0; i < Servicio.length; i++) {
             $("#Tbl_Servicios_Asignar tbody").append("<tr><td>"+parseInt(i+1)+"</td><td>"+Servicio[i]['FechaSalida']+"</td><td>"+Servicio[i]['HoraSalida']+"</td><td>"+Servicio[i]['MpioOrigen']+"</td><td>"+Servicio[i]['FechaRegreso']+"</td><td>"+Servicio[i]['MpioDestino']+"</td><td>"+Servicio[i]['ObservacionesDestino']+"</td><td>"+Servicio[i]['TipoVehiculo']+"</td><td>"+Servicio[i]['CantPersonas']+"</td><td id='Cant_'>"+Servicio[i]['CantDias']+"</td><td><button title='ver pasajeros' data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"AbrirDetalle('"+i+"')\" class='btn_transparente'><i class=\"fa-regular fa-rectangle-list\"></i></button></td><td><button data-toggle=\"tooltip\" data-placement=\"top\" title='Asignar Vehiculo' onclick=\"AsignarVehiculo('"+Servicio[i]['Id']+"')\" class='btn_transparente'><i class=\"fa-solid fa-car-on\"></i></button></td></tr>");
          }
          $('[data-toggle="tooltip"]').tooltip();
        }
      },
      error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
  });
}



function AbrirDetalle(Id) {

  if(Servicio[Id]['Pasajeros'].length>0){
    var html = "";
    for (var i = 0; i < Servicio[Id]['Pasajeros'].length; i++) {
      html+="<tr><td>"+ Servicio[Id]['Pasajeros'][i]['Servidor']+"</td><td>"+ Servicio[Id]['Pasajeros'][i]['Telefono']+"</td><td>"+ Servicio[Id]['Pasajeros'][i]['Direccion']+"</td><td><button class='btn_transparente' title='Eliminar Pasajero' data-toggle=\"tooltip\" onclick='EliminarPasajero(\""+Servicio[Id]['Pasajeros'][i]['Id']+"\",\""+Servicio[Id]['Id']+"\")'><i class=\"fa-solid fa-person-circle-minus fa-2xs\"></i></button><td></tr>";
    }
    $("#Id_Servicio").val(Id);
  }
  CargarAsignados();
  $("#tbl_DetallePasajeros tbody").html(html);
  $('[data-toggle="tooltip"]').tooltip();
  $("#Btn_ModalDetallePasajeros").click();

}



function EliminarPasajeroGestion(ParIdPersona,ParId){

  for (var i = 0; i < Servicio.length; i++) {
    for (var a = 0; a < Servicio[i]['Pasajeros'].length; a++) {
      if(Servicio[i]['Pasajeros'][a]['Id'] == ParIdPersona){
        Servicio[i]['Pasajeros'].splice(a,1);
        $.ajax({
          url: 'Transporte.php',
          type: 'POST',
          data:{opcion:"EliminarPasajero",ParIdPersona:ParIdPersona,ParId:ParId},
          success: function(respuesta){
            var dato = JSON.parse(respuesta);
            for (var i = 0; i < Servicio.length; i++) {
              if(Servicio[i]['Id'] == ParId ){
                Servicio[i] = dato ;
                  var html = "";
                  if(Servicio[i]['Pasajeros'].length>0){
                  for (var k = 0; k < Servicio[i]['Pasajeros'].length; k++) {
                    html+="<tr><td>"+ Servicio[i]['Pasajeros'][k]['Servidor']+"</td><td>"+ Servicio[i]['Pasajeros'][k]['Telefono']+"</td><td>"+ Servicio[i]['Pasajeros'][k]['Direccion']+"</td><td><button class='btn_transparente' title='Eliminar Pasajero' data-toggle=\"tooltip\" onclick='EliminarPasajero(\""+Servicio[i]['Pasajeros'][k]['Id']+"\",\""+Servicio[i]['Id']+"\")'><i class=\"fa-solid fa-person-circle-minus fa-2xs\"></i></button><td></tr>";
                  }
                }
                $("#tbl_DetallePasajeros tbody").html(html);
                CargarServicios();
                $('[data-toggle="tooltip"]').tooltip();
              }
            }
          },error: function(){
            window.toastr.error('Error al cargar las opciones');
          }
        });
      }
    }
  }
}



function EliminarPasajero(ParIdPersona,ParId){

  for (var i = 0; i < Servicio.length; i++) {
    for (var a = 0; a < Servicio[i]['Pasajeros'].length; a++) {
      if(Servicio[i]['Pasajeros'][a]['Id'] == ParIdPersona){
        Servicio[i]['Pasajeros'].splice(a,1);
        $.ajax({
          url: 'Transporte.php',
          type: 'POST',
          data:{opcion:"EliminarPasajero",ParIdPersona:ParIdPersona,ParId:ParId},
          success: function(respuesta){
            var dato = JSON.parse(respuesta);
            for (var i = 0; i < Servicio.length; i++) {
              if(Servicio[i]['Id'] == ParId ){
                Servicio[i] = dato ;
                  var html = "";
                  if(Servicio[i]['Pasajeros'].length>0){
                  for (var k = 0; k < Servicio[i]['Pasajeros'].length; k++) {
                    html+="<tr><td>"+ Servicio[i]['Pasajeros'][k]['Servidor']+"</td><td>"+ Servicio[i]['Pasajeros'][k]['Telefono']+"</td><td>"+ Servicio[i]['Pasajeros'][k]['Direccion']+"</td><td><button class='btn_transparente' title='Eliminar Pasajero' data-toggle=\"tooltip\" onclick='EliminarPasajero(\""+Servicio[i]['Pasajeros'][k]['Id']+"\",\""+Servicio[i]['Id']+"\")'><i class=\"fa-solid fa-person-circle-minus fa-2xs\"></i></button><td></tr>";
                  }
                }
                $("#tbl_DetallePasajeros tbody").html(html);
                CargarAsignados();
                $('[data-toggle="tooltip"]').tooltip();
              }
            }
          },error: function(){
            window.toastr.error('Error al cargar las opciones');
          }
        });
      }
    }
  }
}

function SeleccionarContrato(){

  var CostoContrato = $("#TranAutorizar_TipoContrato option:selected").attr("Costo");
  var ObservacionContrato = $("#TranAutorizar_TipoContrato option:selected").attr("observacion");
  $("#TranAutorizar_CostoVehiculo").val(formatearMonto(CostoContrato) );
  $("#TranAutorizar_ObserContrato").val(ObservacionContrato);

}

function AbrirDetalleAutorizar(Id) {
  
  $("#Id_Servicio").val(Id);
  $("#TranAutorizar_TipoContrato").val("Ninguno");
 
  $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"AbrirDetalleAutorizar",id_Servicio:$("#Id_Servicio").val()},
      success: function(respuesta){
        if(respuesta.trim()=="SI"){
          $("#TranAutorizar_TipoContrato").val("1");
        }
      },
      error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
  });
  $("#Btn_ModalAutorizarDetalle").click();
}



function AsignarVehiculo(Id) {
  $("#IdPeticion").val(Id);
  $("#AsignarVehiculoTipoVia").val("Ninguno");
  $("#Btn_ModalAsignarVehiculos").click();
}



function GuardarNuevoVehiculo(){
  var Placas = $("#TranSolicitar_PlacasVehiculo").val();
  var TipoVehiculo = $("#TranSolicitar_TipoVehiculo").val();
  var Conductor = $("#TranSolicitar_ConductorVehiculo").val();
  var Telefono = $("#TranSolicitar_ConductorTelefono").val();

  $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"GuardarNuevoVehiculo",Placas:Placas,TipoVehiculo:TipoVehiculo,Conductor:Conductor,Telefono:Telefono},
      success: function(respuesta){
        var dato = JSON.parse(respuesta);
        if(dato.length>0){
          var html = " <option value=\"Ninguno\">Seleccione</option> ";
          for (var i = 0; i < dato.length; i++) {
             html+="<option value='"+dato[i]['Id']+"'> "+dato[i]['Placas']+" - "+dato[i]['Conductor']+"</option>";
          }
 
          $("#AsignarVehiculo").html(html);
          $("#CerrarModalNuevoVehiculo").click();
        }
      },
      error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
  });
}


function MostrarDetallesConsuctor(){
  $("#NombreConductor").html($("#AsignarVehiculo option:selected").attr("NombreConductor"));
  $("#TelefonoConductor").html($("#AsignarVehiculo option:selected").attr("TelefonoConductor"));
  $("#TipoVehiculo").html( $("#AsignarVehiculo option:selected").attr("TipoVehiculo"));
  $("#placaVehiculo").html($("#AsignarVehiculo option:selected").attr("placaVehiculo"));
  $("#DetalleConductor").show(500);

}


function AplicarVehiculo() {
    var Id = $("#IdPeticion").val();
    var placa = $("#placaVehiculo").html();
    var TelefonoConductor = $("#TelefonoConductor").html();
    var NombreConductor = $("#NombreConductor").html();
    $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"AplicarVehiculo",Id:Id,placa:placa,TelefonoConductor:TelefonoConductor,NombreConductor:NombreConductor},
      success: function(respuesta){
        if(respuesta.trim("OK")){
          window.Swal.fire("Exito!","Se autoriza exitosamente!","success").then(function() {
            CargarPendientes();
            $("#btn_AplicarAutorizarVehiculo").click();
            $("#DetalleConductor").hide();
            $("#AsignarVehiculo").val("Ninguno");
            $("#Btn_CerrarAsignarVehiculo").click();
          });
        }
      },
      error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
  });
}
