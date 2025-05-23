var Pasajeros = [];
var Invitados = [];
var Direccion = "";
var Servicio = [];
var poseglobal = "";
var solicitante = "NO";
var ServiciosIguales = [];
var ServiciosParciales = [];
var ServiciosUnificados = [];
var ServicioEditados = "NO";

function FiltrarOpcionesSolicitante(){

  $("#Div_TranGestionar_Proceso").hide();
  solicitante = "SI";

}


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
    /*var valor = 0;
    // Determinar el valor según la diferencia de días
    if (diferenciaDias === 0) {
      // Ambas fechas son el mismo día
      valor = 0.5;
    } else {
      // Diferentes días, sumar 1 por noche y 0.5 por día
       valor = 1 + diferenciaDias * 0.5;
    }*/
     $("#TranSolicitar_CantDias").val(diferenciaDias);
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

function CargarInformeServicio() {
  
  var Resp = "NO";
  var mes = $("#TranInforServ_MesReporte").val();
  var MesNombre = $("#TranInforServ_MesReporte option:selected").text();
  var anio = $("#TranInforServ_AnioReporte").val();
  $(".error").removeClass("error");
  if(mes=="Ninguno"){

    $("#TranInforServ_MesReporte").addClass("error");
    window.toastr.error("El mes del reporte es obligatorio");
    Resp = "SI";
  }

  if(!anio){

    $("#TranInforServ_AnioReporte").addClass("error");
    window.toastr.error("El año del reporte es obligatorio");
    Resp = "SI";
  }

  if(Resp=="NO"){
    $.ajax({
      url: '../Transporte.php',
      type: 'POST',
      data: {opcion:"CargarInformeServicio",mes:mes,anio:anio},
      success: function(respuesta) {
        if(respuesta.trim()!="NO"){
          var datos = JSON.parse(respuesta);
          var workbook = XLSX.utils.book_new();
          var trans_servicios_efectivos = datos[0]['trans_servicios_efectivos'];
          
          var sheetData = [ [ 'Tipo de Servicio', 'Cantidad de Servicios', 'Costo de Servicios', 'Participación'] ];
          var total = datos[datos.length-1]['Costo'];
          for (var i = 0; i < datos.length; i++) {
            var rowData = [ datos[i]['NomTipoServicio'], datos[i]['cantidad_servicios'], formatearMonto( parseFloat(datos[i]['Costo']).toFixed(2)), (parseFloat( datos[i]['Costo']/total )*100 ).toFixed(2).toString().replaceAll('.',',')+'%'];
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
          saveAs(blob, 'Informe_de_Servicio_de_Transporte_de_'+MesNombre+'.xlsx');
        }else{
          window.toastr.error("No hay datos que mostrar");
        }
      }
    }); 
  }
}



function GenerarExcelReporteGestion() {
  
  var Contrato = $("#TranGestionar_Contrato").val();
  var mpio = $("#TranGestionar_MpioOrigen").val();
  var Placa = $("#AsignarVehiculo").val();
  var TVehiculo = $("#TranGestionar_TipoVehiculo").val();
  var proceso = $("#TranGestionar_Proceso").val();
  var FechaIni = $("#TranGestionar_FechaIni").val();
  var FechaFin = $("#TranGestionar_FechaFin").val();
  var Estado = $("#TranGestionar_Estado").val();


    $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data: {opcion:"CargarServicios",mpio:mpio,Contrato:Contrato,TVehiculo:TVehiculo,proceso:proceso,FechaIni:FechaIni,FechaFin:FechaFin,Estado:Estado,Placa:Placa},
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
  var Placa = $("#AsignarVehiculo").val();
  var TVehiculo = $("#TranGestionar_TipoVehiculo").val();
  var proceso = $("#TranGestionar_Proceso").val();
  var FechaIni = $("#TranGestionar_FechaIni").val();
  var FechaFin = $("#TranGestionar_FechaFin").val();
  var Estado = $("#TranGestionar_Estado").val();
  var TipoContrato = $("#TranGestionar_TipoContrato").val();

  if(solicitante == "NO"){

    $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"CargarServicios",mpio:mpio,Placa:Placa,TVehiculo:TVehiculo,proceso:proceso,FechaIni:FechaIni,FechaFin:FechaFin,Estado:Estado,TipoContrato:TipoContrato},
      success: function(respuesta){
        Servicio = JSON.parse(respuesta);
        var tabla = $('#tbl_servicios_cargados').DataTable();
        tabla.clear().draw();
        if(Servicio.length>0){
            for (var i = 0; i < Servicio.length; i++) {
              var button = "";
              if(Servicio[i].DiasFaltante>0){
                button = '<center><button type="button" class="btn_transparente" data-toggle="tooltip" onclick="agregarPasajerosGestion(\''+i+'\')" title="Editar Pasajeros"><i class="fa-regular fa-pen-to-square fa-2xs"></i></button></center>';
              }

              tabla.row.add([
                '<center>'+parseInt(i+1)+'</center>',
                '<center>'+Servicio[i].FechaSalida+'</center>',
                '<center>'+Servicio[i].FechaRegreso+'</center>',
                '<center>'+Servicio[i].mpio+'</center>',
                '<center>'+Servicio[i].Pernocta+'</center>',
                '<center>'+Servicio[i].TipoServicio+'</center>',
                '<center>'+Servicio[i].Convenio+'</center>',
                '<center>'+Servicio[i].proceso+'</center>',
                '<center>'+Servicio[i].Estado+'</center>',
                '<center>'+Servicio[i].TipoVehiculo+'</center>',
                '<center>'+Servicio[i].dias+'</center>',
                '<center>'+Servicio[i].UsuarioCreacion+'</center>',
                '<center>'+Servicio[i].personas+'</center>', button ,
                '<center><button type="button" class="btn_transparente" data-toggle="tooltip" onclick="EliminarServicioEnlace(\''+i+'\')" title="Eliminar Servicio"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'
              ]).draw();
            }
            $('[data-toggle="tooltip"]').tooltip();
        }else{
          window.toastr.error('No hay datos que mostrar');
        }
      },error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
    });

  }else{
    var Usuario = $("#TranGestionar_UsuarioActivo").val();

    $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"CargarServiciosSolicitante",mpio:mpio,Placa:Placa,TVehiculo:TVehiculo,proceso:proceso,FechaIni:FechaIni,FechaFin:FechaFin,Estado:Estado,Usuario:Usuario},
      success: function(respuesta){
        Servicio = JSON.parse(respuesta);
        var tabla = $('#tbl_servicios_cargados').DataTable();
        tabla.clear().draw();
        if(Servicio.length>0){
            for (var i = 0; i < Servicio.length; i++) {
              var button = "";
              if(Servicio[i].DiasFaltante>2 && Servicio[i].Estado!="Cancelado"){
                button = '<center><button type="button" class="btn_transparente" data-toggle="tooltip" onclick="agregarPasajerosGestion(\''+i+'\')" title="Editar Pasajeros"><i class="fa-regular fa-pen-to-square fa-2xs"></i></button></center>';
              }

              var button2 = "";
              if(Servicio[i].DiasFaltante>2 && Servicio[i].Estado!="Cancelado"){
                button2 = '<center><button type="button" class="btn_transparente" data-toggle="tooltip" onclick="EliminarServicioEnlace(\''+i+'\')" title="Eliminar Servicio"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>';
              }

              tabla.row.add([
                '<center>'+parseInt(i+1)+'</center>',
                '<center>'+Servicio[i].FechaSalida+'</center>',
                '<center>'+Servicio[i].FechaRegreso+'</center>',
                '<center>'+Servicio[i].mpio+'</center>',
                '<center>'+Servicio[i].Pernocta+'</center>',
                '<center>'+Servicio[i].TipoServicio+'</center>',
                '<center>'+Servicio[i].Convenio+'</center>',
                '<center>'+Servicio[i].proceso+'</center>',
                '<center>'+Servicio[i].Estado+'</center>',
                '<center>'+Servicio[i].TipoVehiculo+'</center>',
                '<center>'+Servicio[i].dias+'</center>',
                '<center>'+Servicio[i].UsuarioCreacion+'</center>',
                '<center>'+Servicio[i].personas+'</center>', button ,button2
                
              ]).draw();
            }
            $('[data-toggle="tooltip"]').tooltip();
        }else{
          window.toastr.error('No hay datos que mostrar');

        }
      },error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
    });
  }
}


function CargarServiciosEnlaces() {
  
  var mpio = $("#TranGestionar_MpioOrigen").val();
  var Placa = $("#AsignarVehiculo").val();
  var TVehiculo = $("#TranGestionar_TipoVehiculo").val();
  var proceso = $("#TranGestionar_Proceso").val();
  var FechaIni = $("#TranGestionar_FechaIni").val();
  var FechaFin = $("#TranGestionar_FechaFin").val();
  var Estado = $("#TranGestionar_Estado").val();
  var TipoContrato = $("#TranGestionar_TipoContrato").val();
  var Usuario = $("#TranGestionar_UsuarioActivo").val();

    $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"CargarServiciosSolicitante",mpio:mpio,Placa:Placa,TVehiculo:TVehiculo,proceso:proceso,FechaIni:FechaIni,FechaFin:FechaFin,Estado:Estado,Usuario:Usuario},
      success: function(respuesta){
        Servicio = JSON.parse(respuesta);
        var tabla = $('#tbl_servicios_cargados_enlaces').DataTable();
        tabla.clear().draw();
        if(Servicio.length>0){
            for (var i = 0; i < Servicio.length; i++) {
              var button2 = "";
              if(Servicio[i].DiasFaltante>2 && Servicio[i].Estado!="Cancelado"){
                button2 = '<center><button type="button" class="btn_transparente" data-toggle="tooltip" onclick="EliminarServicioEnlace(\''+Servicio[i]['Id']+'\')" title="Eliminar Servicio"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>';
              }

              tabla.row.add([
                '<center>'+parseInt(i+1)+'</center>',
                '<center>'+Servicio[i].FechaSalida+'</center>',
                '<center>'+Servicio[i].FechaRegreso+'</center>',
                '<center>'+Servicio[i].mpio+'</center>',
                '<center>'+Servicio[i].Pernocta+'</center>',
                '<center>'+Servicio[i].proceso+'</center>',
                '<center>'+Servicio[i].Estado+'</center>',
                '<center>'+Servicio[i].TipoVehiculo+'</center>',
                '<center>'+Servicio[i].Conductor+'</center>',
                '<center>'+Servicio[i].TelefonoConductor+'</center>',
                '<center>'+Servicio[i].Placas+'</center>',
                "<td><button title='ver pasajeros' data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"AbrirDetalleEnlaces('"+i+"')\" class='btn_transparente'><i class=\"fa-regular fa-rectangle-list\"></i></button></td>", button2
              ]).draw();
            }
            $('[data-toggle="tooltip"]').tooltip();
        }else{
          window.toastr.error('No hay datos que mostrar');
        }
      },error: function(){
        window.toastr.error('Error al cargar las opciones');
      }
    });
}

function FiltrarObligatorio() {
  var Motivo = $("#TranGestionar_MotivoCancelar").val();
  if(Motivo=='5'){
    $("#ObligatorioTranGestionar_ObservacionCancelar").show();
  }

}

function EliminarServicioEnlace(ParID){

  $("#Btn_ModalDetalleCancelacionServicio").click();
  $("#Id_Servicio").val(ParID);
}


function ConfirmarEliminarServicioEnlace() {
  
  $(".error").removeClass("error");
  var Id = $("#Id_Servicio").val();
  Swal.fire({
    title: '¿Estás seguro?',
    text: '¿Seguro de eliminar el Servicio seleccionado? ¡Esta acción no se podrá revertir!',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Sí',
    cancelButtonText: 'No'
  }).then((result) => {
    if (result.isConfirmed) {

      var Motivo = $("#TranGestionar_MotivoCancelar").val();
      var Observacion = $("#TranGestionar_ObservacionCancelar").val();

      if(Motivo=="Ninguno"){
        window.toastr.error("Debe Seleccionar un motivo valido!");
        $("#TranGestionar_MotivoCancelar").addClass("error");
        return false;
      }

      if(!Observacion && Motivo=='5'){
        window.toastr.error('Para el motivo "Otro", la observación es obligatoria!');
        $("#TranGestionar_ObservacionCancelar").addClass("error");
        return false;
      }else if(!Observacion){
        Observacion= "No Presenta";
      }

      $.ajax({
          url: 'Transporte.php',
          type: 'POST',
          data:{opcion:"ConfirmarEliminarServicioEnlace",Id:Id,Motivo:Motivo, Observacion : Observacion},
          success: function(respuesta){
            $("#Btn_CerrarModalEliminar").click();
            window.Swal.fire("Exito!","Se elimina el Servicio exitosamente!","success");
            CargarServiciosEnlaces();
          },error: function(){
            window.toastr.error('Error al cargar las opciones');
          }
      });
    }
  });
}







function EliminarServicio(ParPos) {
  
  var Id = Servicio[ParPos]['Id'];
  Swal.fire({
    title: '¿Estás seguro?',
    text: '¿Seguro de eliminar el Servicio seleccionado? ¡Esta acción no se podrá revertir!',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Sí',
    cancelButtonText: 'No'
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
          url: 'Transporte.php',
          type: 'POST',
          data:{opcion:"EliminarServicio",Id:Id },
          success: function(respuesta){
            window.Swal.fire("Exito!","Se elimina el Servicio exitosamente!","success");
            CargarServicios();
          },error: function(){
            window.toastr.error('Error al cargar las opciones');
          }
      });
    }
  });
}

function AplicarCambiosServicio() {
  
  var Id = Servicio[poseglobal]['Id'];
  var mpioDest = $("#TranSolicitar_MpioDestino").val();
  var OtroDestino = $("#TranSolicitar_DestinoObserv").val();
  var Placa = $("#TranSolicitar_AsignarVehiculo option:selected").attr("placaVehiculo");
  var TelefonoConductor = $("#TranSolicitar_AsignarVehiculo option:selected").attr("TelefonoConductor");
  var NombreConductor = $("#TranSolicitar_AsignarVehiculo option:selected").attr("NombreConductor");

  var TipoVehiculo = "";


  if(solicitante=="NO"){
    TipoVehiculo = $("#TranSolicitar_AsignarVehiculo option:selected").attr("TipoVehiculo");
  }else{
     TipoVehiculo = $("#TranSolicitar_TipoVehiculo").val();
  }


  var Resp = "NO";

  if(mpioDest=="Ninguno"){
    $("#TranSolicitar_MpioDestino").addClass("error");
    Resp = "SI";
  }

  if (OtroDestino=="") {
    OtroDestino= "NO";
  }


  if(Resp=="SI"){
    window.toastr.error("Error, el Munipio es obligatorio!");
    return false;
  }else{

    Swal.fire({
      title: '¿Estás seguro?',
      text: '¿Seguro de Modificar el Servicio seleccionado?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí',
      cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: 'Transporte.php',
                type: 'POST',
                data:{opcion:"AplicarCambiosServicio",Id:Id,OtroDestino:OtroDestino,mpioDest:mpioDest,Placa:Placa ,TelefonoConductor:TelefonoConductor,   NombreConductor:NombreConductor,TipoVehiculo:TipoVehiculo},
                success: function(respuesta){
                    window.Swal.fire("Exito!","Se Modificó el Servicio exitosamente!","success");
                    CargarServicios();
                },error: function(){
                    window.toastr.error('Error al cargar las opciones');
                }
            });
        }
    });
  }

}

function agregarPasajerosGestion(Id){

  if(Servicio[Id]['Pasajeros'].length>0){
    var html = "";
    $("#TranSolicitar_MpioDestino").val(Servicio[Id]['MpioDestino']);
    $("#TranSolicitar_DestinoObserv").val(Servicio[Id]['OtrosDestinos']);
    if(solicitante=="NO"){
      $("#Div_TranSolicitar_AsignarVehiculo").show();
      $("#Div_TranSolicitar_TipoVehiculo").hide();
    }else{
       $("#Div_TranSolicitar_AsignarVehiculo").hide();
      $("#Div_TranSolicitar_TipoVehiculo").show();
    }
    $("#TranSolicitar_AsignarVehiculo").val(Servicio[Id]['Placas']);
    $("#TranSolicitar_TipoVehiculo").val(Servicio[Id]['IdTipoVehiculo']);
    poseglobal = Id;
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

function AgregarInvitadoServicio() {
  var servidor = $("#TranSolicitarInvitado_Servidor").val();
  var Identificacion = $("#TranSolicitarInvitado_ServidorIdentificacion").val();
  var Telefono = $("#TranSolicitarInvitado_Tlf").val();

  // Validar que no se agreguen números de identificación duplicados
  var existeIdentificacion = Invitados.some(function(pasajero) {
    return pasajero.Identificacion === Identificacion;
  });

  if (existeIdentificacion) {
    window.toastr.error("La identificación ya ha sido ingresada");
    return;
  }

  if (servidor && Telefono && Identificacion) {
    Invitados.push({
      "Servidor": servidor,
      "Identificacion": Identificacion,
      "Telefono": Telefono,
      "PuntoRecogida": Direccion
    });

    var html = "";
    for (var i = 0; i < Invitados.length; i++) {
      html += "<tr><td>" + parseInt(i + 1) + "</td><td>" + Invitados[i].Servidor + "</td><td>" + Invitados[i].Identificacion + "</td><td>" + Invitados[i].Telefono + "</td><td>" + Invitados[i].PuntoRecogida + "</td><td><button class=\"btn_transparente\" title=\"Eliminar registro\" data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"eliminarRegistro('" + servidor + "','" + Identificacion + "')\"><i class=\"fa-solid fa-user-xmark\"></i></button></td></tr>";
    }

    $("#TranSolicitarInvitado_ServidoresPasajeros tbody").html(html);
    $('[data-toggle="tooltip"]').tooltip();

  } else {
    if (!servidor) {
      $("#TranSolicitarInvitado_Servidor").addClass("error");
      window.toastr.error("Debe Agregar el Nombre del servidor");
    }
    if (!Identificacion) {
      $("#TranSolicitarInvitado_ServidorIdentificacion").addClass("error");
      window.toastr.error("Debe Agregar la identificacion del servidor");
    }

    if (!Telefono) {
      $("#TranSolicitarInvitado_Tlf").addClass("error");
      window.toastr.error("Debe Agregar el Teléfono del servidor");
    }
  }

  $("#TranSolicitar_CantInvitados").val(Invitados.length);

  $("#segundoModal select").each(function() {
    $(this).val("Ninguno");
  });

  $("#segundoModal input").each(function() {
    $(this).val("");
  });

  $("#TranSolicitarInvitado_Servidor").val("");
  $("#TranSolicitarInvitado_Tlf").val("");
  $("#TranSolicitarInvitado_ServidorIdentificacion").val("");
  $("#DireccionResultante").html("");
  Direccion = "";
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
  var Pernocta = $("#TranSolicitar_Pernocta").val();
  var Resp = "SI";

  $(".error").removeClass("error");

  if(MpioOrigen=="Ninguno"){
    $("#TranSolicitar_MpioOrigen").addClass("error");
    Resp = "NO";
  }

  if(Pernocta=="Ninguno"){
    $("#TranSolicitar_Pernocta").addClass("error");
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

  if(Contrato.trim()=="0" || Contrato.trim()==""){
    $("#TranSolicitar_Contrato").addClass("error");
    Resp = "NO";
  }



  if(Resp=="NO"){
    window.toastr.error("Error, Faltan datos Obligatorios!");
    return false;
  }else{

   $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"GuardarSolicitudServicio",MpioOrigen:MpioOrigen,FechaSalida:FechaSalida,HoraSalida:HoraSalida,MpioDestino:MpioDestino,DestinoObserv:DestinoObserv,Fechallegada:Fechallegada,Proceso:Proceso,Contrato:Contrato,TipoVehiculo:TipoVehiculo,ObjetoViaje:ObjetoViaje,CantPasajeros:CantPasajeros,CantDias:CantDias,ObserGene:ObserGene,Pasajeros:Pasajeros,Pernocta:Pernocta,Invitados:Invitados},
      success: function(respuesta){
        LimpiarServicios();
        window.Swal.fire("Exito!","solicitud de viaje es registrada exitosamente con el número "+respuesta+"!","success");
      }, error: function(){
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
        ServiciosIguales = [];
        ServiciosParciales = [];
        if(Servicio.length>0){
          var FechaIniAnterior = "";
          var FechaFinAnterior = "";
          var MpioOrigenAnterior = "";
          var MpioRegresoAnterior = "";
          var ServicioAnterior = [];
          for (var i = 0; i < Servicio.length; i++) {

            if(i>0 && Servicio[i]['Unificado_Con']=='NO'){
              var idActual = Servicio[i]['Id'];
              var yaExisteEnIguales = ServiciosIguales.some(function (servicio) {
                return servicio['Id'] === idActual;
              });
              var yaExisteEnParciales = ServiciosParciales.some(function (servicio) {
                return servicio['Id'] === idActual;
              });

              if (!yaExisteEnIguales && !yaExisteEnParciales) {

                var idActual = ServicioAnterior['Id'];
                var yaExisteEnIguales2 = ServiciosIguales.some(function (servicio) {
                  return servicio['Id'] === idActual;
                });
                var yaExisteEnParciales2 = ServiciosParciales.some(function (servicio) {
                  return servicio['Id'] === idActual;
                });

                if(i>0 && (FechaIniAnterior == Servicio[i]['FechaSalida'] && FechaFinAnterior == Servicio[i]['FechaRegreso'] && MpioOrigenAnterior==Servicio[i]['MpioOrigen'] && MpioRegresoAnterior==Servicio[i]['MpioDestino'])){

                  if(!yaExisteEnIguales2)
                  ServiciosIguales.push(ServicioAnterior);

                  ServiciosIguales.push(Servicio[i]);

                }else if(i>0 && ((FechaIniAnterior == Servicio[i]['FechaSalida'] && MpioRegresoAnterior==Servicio[i]['MpioDestino'] ) || (FechaFinAnterior == Servicio[i]['FechaRegreso'] && MpioRegresoAnterior==Servicio[i]['MpioDestino']))){

                  if(!yaExisteEnParciales2)
                  ServiciosParciales.push(ServicioAnterior);

                  ServiciosParciales.push(Servicio[i]);

                }
              }
            }

            $("#Tbl_Servicios_Asignadas tbody").append("<tr><td><b>"+parseInt(i+1)+"</b>  </td><td>  "+Servicio[i]['FechaSalida']+"</td><td>"+Servicio[i]['FechaRegreso']+"</td><td>"+Servicio[i]['HoraSalida']+"</td><td>"+Servicio[i]['MpioOrigen']+"</td><td>"+Servicio[i]['MpioDestino']+"</td><td>"+Servicio[i]['ObservacionesDestino']+"</td><td>"+Servicio[i]['Pernocta']+"</td><td>"+Servicio[i]['TipoVehiculo']+"</td><td>"+Servicio[i]['CantPersonas']+"</td><td>"+Servicio[i]['CantidadInvitados']+"</td><td>"+Servicio[i]['CantDias']+"</td><td>"+Servicio[i]['UsuarioCreacion']+"</td><td><button title='ver pasajeros' data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"AbrirDetalle('"+i+"')\" class='btn_transparente'><i class=\"fa-regular fa-rectangle-list\"></i></button></td></td><td><button title='Autorizar Servicio' data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"AbrirDetalleAutorizar('"+Servicio[i]['Id']+"')\" class='btn_transparente'><i class=\"fa-solid fa-car-on\"></i></button></td></tr>");
              FechaIniAnterior = Servicio[i]['FechaSalida'];
              FechaFinAnterior = Servicio[i]['FechaRegreso'];
              MpioOrigenAnterior = Servicio[i]['MpioOrigen'];
              MpioRegresoAnterior = Servicio[i]['MpioDestino'];
              ServicioAnterior = Servicio[i];
          }

          if(ServiciosIguales.length>1 || ServiciosParciales.length>1){
            $("#fld_Servicios_Iguales").hide();
            $("#fld_Servicios_Parciales").hide();

            var tabla = $('#Tbl_Servicios_Iguales').DataTable();
            tabla.clear().draw();
            if(ServiciosIguales.length>1){
              $("#fld_Servicios_Iguales").show();
              for (var i = 0; i < ServiciosIguales.length; i++) {
                tabla.row.add([
                  '<center> <input type="checkbox" tipo="Iguales" onclick="MarcarUnificar(\''+ServiciosIguales[i]['Id']+'\',\''+'Iguales'+'\')" id="id_ServicioIguales_'+ServiciosIguales[i]['Id']+'"> </center>',
                  '<center><b>'+ServiciosIguales[i].FechaSalida+'</b></center>',
                  '<center><b>'+ServiciosIguales[i].FechaRegreso+'</b></center>',
                  '<center><b>'+ServiciosIguales[i].MpioOrigen+'</b></center>',
                  '<center><b>'+ServiciosIguales[i].MpioDestino+'</b></center>',
                  '<center>'+ServiciosIguales[i].TipoVehiculo+'</center>',
                  '<center>'+ServiciosIguales[i].Pernocta+'</center>',
                  '<center>'+ServiciosIguales[i].CantPersonas+'</center>',
                  '<center>'+ServiciosIguales[i].CantidadInvitados+'</center>',
                  '<center>'+ServiciosIguales[i].UsuarioCreacion+'</center>'
                ]).draw();
              }
            }

            var tabla = $('#Tbl_Servicios_Parciales').DataTable();
            tabla.clear().draw();
            if(ServiciosParciales.length>1){           
              $("#fld_Servicios_Parciales").show();
              for (var i = 0; i < ServiciosParciales.length; i++) {
                tabla.row.add([
                  '<center> <input type="checkbox" tipo="Parcial" onclick="MarcarUnificar(\''+ServiciosParciales[i]['Id']+'\',\''+'Parcial'+'\')" id="id_ServicioParcial_'+ServiciosParciales[i]['Id']+'"> </center>',
                  '<center>'+ServiciosParciales[i].FechaSalida+'</center>',
                  '<center>'+ServiciosParciales[i].FechaRegreso+'</center>',
                  '<center>'+ServiciosParciales[i].MpioOrigen+'</center>',
                  '<center>'+ServiciosParciales[i].MpioDestino+'</center>',
                  '<center>'+ServiciosParciales[i].TipoVehiculo+'</center>',
                  '<center>'+ServiciosParciales[i].Pernocta+'</center>',
                  '<center>'+ServiciosParciales[i].CantPersonas+'</center>',
                  '<center>'+ServiciosParciales[i].CantidadInvitados+'</center>',
                  '<center>'+ServiciosParciales[i].UsuarioCreacion+'</center>'
                ]).draw();
              }
            }
            if(ServicioEditados=="NO"){
              $("#Btn_ModalAlertaUnificacion").click();
            }
          }else{
            $("#Btn_CerrarAlertaModal").click();
          }
          $('[data-toggle="tooltip"]').tooltip();
        }
      }, error: function(){
        window.toastr.error('Error al cargar las opciones');
      }
  });
}

function MarcarUnificar(ParamId,Paramtipo){
  for (var i = 0; i < Servicio.length; i++) {
    if(Servicio[i]['Id'] == ParamId){
      if ($('#id_Servicio'+Paramtipo+'_'+Servicio[i]['Id']).is(':checked')) {
        ServiciosUnificados.push(Servicio[i]);
      } else {
        ServiciosUnificados.splice(i,1);
      }
    }
  }
}

function FinalizarServicio(){

  var FechaFin = $("#TranFinalizar_FechaFin").val(); 
  var HoraFin = $("#TranFinalizar_HoraFin").val(); 
  var ObservacionFin = $("#TranFinalizar_Observacion").val(); 

  if(!FechaFin){
    window.toastr.error("Debe Ingresar una Fecha de finalización del servicio");
    $("#TranFinalizar_FechaFin").addClass("error");
    return false;
  }

  if(!HoraFin){
    window.toastr.error("Debe Ingresar una hora de finalización del servicio");
    $("#TranFinalizar_HoraFin").addClass("error");
    return false;
  }

  Swal.fire({
    title: '¿Estás seguro de Finalizar el Servicio Seleccionado ?',
    text: 'Esta acción no se podrá revertir! ',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sí',
    cancelButtonText: 'Cancelar',
  }).then((result) => {
    if (result.isConfirmed) {
      var IdServicio = $("#IdPeticion").val();
      $.ajax({
        url: 'Transporte.php',
        type: 'POST',
        data:{opcion:"FinalizarServicio",IdServicio:IdServicio,FechaFin:FechaFin,HoraFin:HoraFin,ObservacionFin:ObservacionFin},
        success: function(respuesta){
          window.Swal.fire("Exito!","Servicio Finalizado Exitosamente!","success");
          $("#TranFinalizar_Observacion").val("");
          $("#TranFinalizar_HoraFin").val("");
          $("#TranFinalizar_FechaFin").val("");
          $("#IdPeticion").val("");
          $("#Btn_CerrarFinalizarServicio").click();
          CargarFinalizar();         
        },error: function(){
          window.toastr.error('Error al cargar las opciones');

        }
      });
    }
  });
}


function AplicarUnificacion(){

  if(ServiciosUnificados.length>1){
    Swal.fire({
    title: '¿Estás seguro de Unir los '+ServiciosUnificados.length+' Servicios ?',
    text: 'Esta acción no se podrá revertir y en adelante serán tratados como uno solo! ',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sí, Unificalo',
    cancelButtonText: 'Cancelar',
  }).then((result) => {
    if (result.isConfirmed) {
      $('.modal-backdrop').remove();
      $.ajax({
        url: 'Transporte.php',
        type: 'POST',
        data:{opcion:"AplicarUnificacion",ServiciosUnificados:ServiciosUnificados},
        success: function(respuesta){
          window.Swal.fire("Exito!","servicios Unificados exitosamente!","success");
          CargarAsignados();
          ServicioEditados = "SI";
          ServiciosUnificados =[];
         
        },error: function(){
          window.toastr.error('Error al cargar las opciones');
        }
      });
    }
  });

  }else{
    window.toastr.error("No hay seleccionado suficientes servicios a unificar!");
  }
}

function AutorizarServicio(){
  var Id_servicio = $("#Id_Servicio").val();
  var TipoServicio = $("#TranAutorizar_TipoContrato").val();
  var TranAutorizar_CostoVehiculo = $("#TranAutorizar_TipoContrato option:selected").attr("costo");
  $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"AutorizarServicio",Id_servicio:Id_servicio,TipoServicio:TipoServicio,TranAutorizar_CostoVehiculo:TranAutorizar_CostoVehiculo},
      success: function(respuesta){
        window.Swal.fire("Exito!","Se Autoriza el servicio Exitosamente!","success").then(function() {
          $("#btn_AplicarAutorizarVehiculo").click();
        });
        CargarAsignados();
      },error: function(){
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


function GenerarReporteFinalizado() {    

  if(Servicio.length>0){
    var workbook = XLSX.utils.book_new();
    var sheetData = [ ['#', 'Fecha Salida', 'Hora de Salida','Fecha Regreso' , 'Municipio Origen', 'Municipio Destino', 'Otros Destinos', 'Tipo Vehiculo', 'Días', 'Persona','Invitados', 'Pernocta','Usuario Solicitante'] ];

    for (var i = 0; i < Servicio.length; i++) {
      var rowData = [ parseInt(i+1) , Servicio[i]['FechaSalida'], Servicio[i]['HoraSalida'], Servicio[i]['FechaRegreso'], Servicio[i]['MpioOrigen'], Servicio[i]['MpioDestino'], Servicio[i]['ObservacionesDestino'], Servicio[i]['TipoVehiculo'], parseInt(Servicio[i]['CantDias']).toFixed(0) , Servicio[i]['CantPersonas'] , Servicio[i]['CantidadInvitados'],Servicio[i]['Pernocta'], Servicio[i]['UsuarioCreacion'] ];
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
    saveAs(blob, 'ResumenServicioFinalizados.xlsx');
  }else{
    window.toastr.error("No hay datos que mostrar!");
  }
      
}



function GenerarReporteXasignar() {    

  if(Servicio.length>0){
    var workbook = XLSX.utils.book_new();
    var sheetData = [ ['#', 'Fecha Salida', 'Hora de Salida','Fecha Regreso' , 'Municipio Origen', 'Municipio Destino', 'Otros Destinos', 'Tipo Vehiculo', 'Días', 'Persona','Invitados', 'Pernocta','Usuario Solicitante'] ];

    for (var i = 0; i < Servicio.length; i++) {
      var rowData = [ parseInt(i+1) , Servicio[i]['FechaSalida'], Servicio[i]['HoraSalida'], Servicio[i]['FechaRegreso'], Servicio[i]['MpioOrigen'], Servicio[i]['MpioDestino'], Servicio[i]['ObservacionesDestino'], Servicio[i]['TipoVehiculo'], parseInt(Servicio[i]['CantDias']).toFixed(0) , Servicio[i]['CantPersonas'] , Servicio[i]['CantidadInvitados'],Servicio[i]['Pernocta'], Servicio[i]['UsuarioCreacion'] ];
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
    saveAs(blob, 'ResumenServicioPorAsignar.xlsx');
  }else{
    window.toastr.error("No hay datos que mostrar!");
  }
      
}


function GenerarReporteXautorizar() {    

  if(Servicio.length>0){
    var workbook = XLSX.utils.book_new();
    var sheetData = [ ['#', 'Fecha Salida', 'Hora de Salida','Fecha Regreso' , 'Municipio Origen', 'Municipio Destino', 'Otros Destinos', 'Tipo Vehiculo', 'Días', 'Persona','Invitados', 'Pernocta','Usuario Solicitante'] ];

    for (var i = 0; i < Servicio.length; i++) {
      var rowData = [ parseInt(i+1) , Servicio[i]['FechaSalida'], Servicio[i]['HoraSalida'], Servicio[i]['FechaRegreso'], Servicio[i]['MpioOrigen'], Servicio[i]['MpioDestino'], Servicio[i]['ObservacionesDestino'], Servicio[i]['TipoVehiculo'], ParseInt(Servicio[i]['CantDias']).toFixed(0) , Servicio[i]['CantPersonas'] , Servicio[i]['CantidadInvitados'],Servicio[i]['Pernocta'], Servicio[i]['UsuarioCreacion'] ];
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
    saveAs(blob, 'ResumenServicioPorAutorizar.xlsx');
  }else{
    window.toastr.error("No hay datos que mostrar!");
  }
      
}

function CargarFinalizar(){
  $("#Tbl_Servicios_Asignar tbody").html("");
  $.ajax({
      url: 'Transporte.php',
      type: 'POST',
      data:{opcion:"CargarFinalizar"},
      success: function(respuesta){
        Servicio = JSON.parse(respuesta);
        if(Servicio.length>0){
          for (var i = 0; i < Servicio.length; i++) {
             $("#Tbl_Servicios_Asignar tbody").append("<tr><td>"+parseInt(i+1)+"</td><td>"+Servicio[i]['FechaSalida']+"</td><td>"+Servicio[i]['HoraSalida']+"</td><td>"+Servicio[i]['MpioOrigen']+"</td><td>"+Servicio[i]['FechaRegreso']+"</td><td>"+Servicio[i]['MpioDestino']+"</td><td>"+Servicio[i]['ObservacionesDestino']+"</td><td>"+Servicio[i]['Pernocta']+"</td><td>"+Servicio[i]['TipoVehiculo']+"</td><td>"+Servicio[i]['CantPersonas']+"</td><td>"+Servicio[i]['CantidadInvitados']+"</td><td id='Cant_'>"+Servicio[i]['CantDias']+"</td><td>"+Servicio[i]['UsuarioCreacion']+"</td><td><button title='ver pasajeros' data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"AbrirDetalle('"+i+"')\" class='btn_transparente'><i class=\"fa-regular fa-rectangle-list\"></i></button></td><td><button data-toggle=\"tooltip\" data-placement=\"top\" title='Finalizar Servicio' onclick=\"AbrirFinalizarServicio('"+Servicio[i]['Id']+"')\" class='btn_transparente'><i class=\"fa-solid fa-car-on\"></i></button></td></tr>");
          }
          $('[data-toggle="tooltip"]').tooltip();
        }
      },
      error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
  });
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
             $("#Tbl_Servicios_Asignar tbody").append("<tr><td>"+parseInt(i+1)+"</td><td>"+Servicio[i]['FechaSalida']+"</td><td>"+Servicio[i]['HoraSalida']+"</td><td>"+Servicio[i]['MpioOrigen']+"</td><td>"+Servicio[i]['FechaRegreso']+"</td><td>"+Servicio[i]['MpioDestino']+"</td><td>"+Servicio[i]['ObservacionesDestino']+"</td><td>"+Servicio[i]['Pernocta']+"</td><td>"+Servicio[i]['TipoVehiculo']+"</td><td>"+Servicio[i]['CantPersonas']+"</td><td>"+Servicio[i]['CantidadInvitados']+"</td><td id='Cant_'>"+Servicio[i]['CantDias']+"</td><td>"+Servicio[i]['UsuarioCreacion']+"</td><td><button title='ver pasajeros' data-toggle=\"tooltip\" data-placement=\"top\" onclick=\"AbrirDetalle('"+i+"')\" class='btn_transparente'><i class=\"fa-regular fa-rectangle-list\"></i></button></td><td><button data-toggle=\"tooltip\" data-placement=\"top\" title='Asignar Vehiculo' onclick=\"AsignarVehiculo('"+Servicio[i]['Id']+"')\" class='btn_transparente'><i class=\"fa-solid fa-car-on\"></i></button></td></tr>");
          }
          $('[data-toggle="tooltip"]').tooltip();
        }
      },
      error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
  });
}



function AbrirDetalleEnlaces(Id) {

  var html = "";
  if(Servicio[Id]['Pasajeros'].length>0){
    for (var i = 0; i < Servicio[Id]['Pasajeros'].length; i++) {
      html+="<tr><td>"+ Servicio[Id]['Pasajeros'][i]['Servidor']+"</td><td>"+ Servicio[Id]['Pasajeros'][i]['Telefono']+"</td><td>"+ Servicio[Id]['Pasajeros'][i]['Direccion']+"</td></tr>";
    }
    $("#Id_Servicio").val(Id);
  }

  var Invitados = "";
  if(Servicio[Id]['Invitados'].length>0){
    for (var i = 0; i < Servicio[Id]['Invitados'].length; i++) {
      Invitados+="<tr><td>"+ Servicio[Id]['Invitados'][i]['Servidor']+"</td><td>"+ Servicio[Id]['Invitados'][i]['Telefono']+"</td><td>"+ Servicio[Id]['Invitados'][i]['Direccion']+"</td></tr>";
    }
    $("#Id_Servicio").val(Id);
  }


  //CargarAsignados();
  $("#tbl_DetallePasajeros_Enlaces tbody").html(html);
  $("#tbl_DetalleInvitados_Enlaces tbody").html(Invitados);
  $('[data-toggle="tooltip"]').tooltip();
  $("#Btn_ModalDetallePasajeros_Enlaces").click();

}

function AbrirDetalle(Id) {

  var html = "";
  if(Servicio[Id]['Pasajeros'].length>0){
    for (var i = 0; i < Servicio[Id]['Pasajeros'].length; i++) {
      html+="<tr><td>"+ Servicio[Id]['Pasajeros'][i]['Servidor']+"</td><td>"+ Servicio[Id]['Pasajeros'][i]['Telefono']+"</td><td>"+ Servicio[Id]['Pasajeros'][i]['Direccion']+"</td><td><button class='btn_transparente' title='Eliminar Pasajero' data-toggle=\"tooltip\" onclick='EliminarPasajero(\""+Servicio[Id]['Pasajeros'][i]['Id']+"\",\""+Servicio[Id]['Id']+"\")'><i class=\"fa-solid fa-person-circle-minus fa-2xs\"></i></button><td></tr>";
    }
    $("#Id_Servicio").val(Id);
  }

  var Invitados = "";
  if(Servicio[Id]['Invitados'].length>0){
    for (var i = 0; i < Servicio[Id]['Invitados'].length; i++) {
      Invitados+="<tr><td>"+ Servicio[Id]['Invitados'][i]['Servidor']+"</td><td>"+ Servicio[Id]['Invitados'][i]['Telefono']+"</td><td>"+ Servicio[Id]['Invitados'][i]['Direccion']+"</td><td><button class='btn_transparente' title='Eliminar Pasajero' data-toggle=\"tooltip\" onclick='EliminarPasajero(\""+Servicio[Id]['Invitados'][i]['Id']+"\",\""+Servicio[Id]['Id']+"\")'><i class=\"fa-solid fa-person-circle-minus fa-2xs\"></i></button><td></tr>";
    }
    $("#Id_Servicio").val(Id);
  }


  //CargarAsignados();
  $("#tbl_DetallePasajeros tbody").html(html);
  $("#tbl_DetalleInvitados tbody").html(Invitados);
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
  var Id_servicio = $("#Id_Servicio").val();
  $.ajax({
    url: 'Transporte.php',
    type: 'POST',
    data:{opcion:"MostrarCantidadContrato",IdPeticion:Id_servicio},
    success: function(respuesta){
      var dato = JSON.parse(respuesta);
      for (var i = 0; i < dato.length; i++) {
        switch(dato[i]['TipoContrato']){
          case 'Fijo':
            $("#bd_Fijo").html(dato[i]['cantidad']);
            break;
          case 'Adicional':
            $("#bd_Adicional").html(dato[i]['cantidad']);
            break;
          case 'Por horas AMVA':
            $("#bd_xHorasDentro").html(dato[i]['cantidad']);
            break;
          case 'Por horas por fuera del AMVA':
            $("#bd_xHorasFuera").html(dato[i]['cantidad']);
            break;    
          case 'Saliendo de uraba':
            $("#bd_SaliendoUraba").html(dato[i]['cantidad']);
            break;                     
        }
      }
    }
  });




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
          SeleccionarContrato();
        }
      },
      error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
  });
  $("#Btn_ModalAutorizarDetalle").click();

}

function AbrirFinalizarServicio(Id) {
  $("#IdPeticion").val(Id);
  $("#Btn_ModalFinalizarServicio").click();

for (var i = 0; i < Servicio.length; i++) {
  if(Id==Servicio[i]['Id']){
      $("#TranFinalizar_FechaFin").val(formatearFecha(Servicio[i]['FechaRegreso']));
  }
}

}


function formatearFecha(inputDate) {
    // Parsea la fecha en formato "dd/mm/yyyy" usando Moment.js
    var parsedDate = moment(inputDate, 'DD/MM/YYYY');

    // Formatea la fecha en "yyyy-MM-dd"
    var formattedDate = parsedDate.format('YYYY-MM-DD');

    return formattedDate;
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


function MostrarDetallesConductor(){
  $("#NombreConductor").html($("#AsignarVehiculo option:selected").attr("NombreConductor"));
  $("#TelefonoConductor").html($("#AsignarVehiculo option:selected").attr("TelefonoConductor"));
  $("#TipoVehiculo").html( $("#AsignarVehiculo option:selected").attr("TipoVehiculo"));
  $("#placaVehiculo").html($("#AsignarVehiculo option:selected").attr("placaVehiculo"));
  $("#DetalleConductor").show(500);

  $.ajax({
    url: 'Transporte.php',
    type: 'POST',
    data:{opcion:"MostrarDetallesConductor",IdPeticion:$("#IdPeticion").val(),Placa: $("#AsignarVehiculo option:selected").attr("placaVehiculo")},
    success: function(respuesta){
      var datos = JSON.parse(respuesta);
      $("#CantServ").html(datos[0]["cantidad"]);
    },
    error: function(){
        window.toastr.error('Error al cargar las opciones');
    }
  });
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
        if(respuesta.trim()=="OK"){
          window.Swal.fire("Exito!","Se autoriza exitosamente!","success").then(function() {
            CargarPendientes();
            $("#btn_AplicarAutorizarVehiculo").click();
            $("#DetalleConductor").hide();
            $("#AsignarVehiculo").val("Ninguno");
            $("#Btn_CerrarAsignarVehiculo").click();
          });
        }else if(respuesta.trim()=="Error"){
          window.Swal.fire("Error!","el conductor seleccionado ya tiene un servicio aprobado para ese día","error");
        }
      },
      error: function(){
          window.toastr.error('Error al cargar las opciones');
      }
  });
}
