var alertas = [];

function CargarMenu() {
  $.ajax({
    url: "bases.php",
    method: "POST",
    success: function(respuesta) {
      $("#menu_Content").html(respuesta);
    },
    error: function(jqXHR, estado, error) {
      toastr.error("Ha ocurrido un error: " + error);
    }
  });
}

function MarcarAlertaComoLeido() {

  for (var i = 0; i < alertas[0]['Alertas30Dias'].length; i++) {
    var dato  = alertas[0]['Alertas30Dias'];
    $.ajax({
      url: "Administracion/administracion.php",
      method: "POST",
      data:{opcion:"MarcarAlertaComoLeido",NumContrato:dato[i].CONTRATO_NUMERO_VIVA,dias:'30'},
      success: function(respuesta) {



      },error: function(jqXHR, estado, error) {
        toastr.error("Ha ocurrido un error: " + error);
      }
    });
  }


  for (var i = 0; i < alertas[0]['Alertas15Dias'].length; i++) {
    var dato  = alertas[0]['Alertas15Dias'];
    $.ajax({
      url: "Administracion/administracion.php",
      method: "POST",
      data:{opcion:"MarcarAlertaComoLeido",NumContrato:dato[i].CONTRATO_NUMERO_VIVA,dias:'15'},
      success: function(respuesta) {



      },error: function(jqXHR, estado, error) {
        toastr.error("Ha ocurrido un error: " + error);
      }
    });
  }

  for (var i = 0; i < alertas[0]['Amparos'].length; i++) {
    var dato  = alertas[0]['Amparos'];
    $.ajax({
      url: "Administracion/administracion.php",
      method: "POST",
      data:{opcion:"MarcarAlertaComoLeido",NumContrato:dato[i].NumContrato,Poliza:dato[i].Numero_Poliza,TipoAmparo:dato[i].TipoAmparo,dias:'Amparos'},
      success: function(respuesta) {



      },error: function(jqXHR, estado, error) {
        toastr.error("Ha ocurrido un error: " + error);
      }
    });
  }

  $("#btn_CerrarModal_Alertas").click();

}

function ConsultarAlertas() {
  $.ajax({
    url: "Administracion/administracion.php",
    method: "POST",
    data:{opcion:"ConsultarAlertas"},
    success: function(respuesta) {
      var datos = JSON.parse(respuesta);
      alertas = JSON.parse(respuesta);
      if(datos[0]['Alertas30Dias'].length>0 ||  datos[0]['Alertas15Dias'].length>0 || datos[0]['Amparos'].length>0 ){
        $("#btn_Modal_ModalAlertas").click();
        var tabla1 = $('#Tbl_Alerta30Dias').DataTable();
        tabla1.clear().draw();
        var tabla2 = $('#Tbl_Alerta15Dias').DataTable();
        tabla2.clear().draw();
        var tabla3 = $('#Tbl_Amparos30Dias').DataTable();
        tabla3.clear().draw();
        if(datos[0]['Alertas30Dias'].length>0){
          for (var a = 0; a < datos[0]['Alertas30Dias'].length; a++) {
            tabla1.row.add([
              '<center>'+parseInt(a+1)+'</center>',
              '<center>'+datos[0]['Alertas30Dias'][a].CONTRATO_NUMERO_VIVA+'</center>',
              '<center>'+datos[0]['Alertas30Dias'][a].FECHA_INI+'</center>',
              '<center>'+datos[0]['Alertas30Dias'][a].FECHA_FIN+'</center>',
              '<center>'+datos[0]['Alertas30Dias'][a].TIPO_PROCESO_CONTRATO+'</center>',
              '<center>'+datos[0]['Alertas30Dias'][a].TipoModalidad+'</center>',
              '<center>'+datos[0]['Alertas30Dias'][a].TipoContrato+'</center>',
            ]).draw();
          }
          $("#div_Alerta30Dias").show("500");
        }else{
          $("#div_Alerta30Dias").hide("500");
        }

        if(datos[0]['Alertas15Dias'].length>0){
          for (var b = 0; b < datos[0]['Alertas15Dias'].length; b++) {
            tabla2.row.add([
              '<center>'+parseInt(b+1)+'</center>',
              '<center>'+datos[0]['Alertas15Dias'][b].CONTRATO_NUMERO_VIVA+'</center>',
              '<center>'+datos[0]['Alertas15Dias'][b].FECHA_INI+'</center>',
              '<center>'+datos[0]['Alertas15Dias'][b].FECHA_FIN+'</center>',
              '<center>'+datos[0]['Alertas15Dias'][b].TIPO_PROCESO_CONTRATO+'</center>',
              '<center>'+datos[0]['Alertas15Dias'][b].TipoModalidad+'</center>',
              '<center>'+datos[0]['Alertas15Dias'][b].TipoContrato+'</center>',
            ]).draw();
          }
          $("#div_Alerta15Dias").show("500");
        }else{
          $("#div_Alerta15Dias").hide("500");
        }

        if(datos[0]['Amparos'].length>0){
          for (var b = 0; b < datos[0]['Amparos'].length; b++) {
            tabla3.row.add([
              '<center>'+parseInt(b+1)+'</center>',
              '<center>'+datos[0]['Amparos'][b].Compania_Poliza+'</center>',
              '<center>'+datos[0]['Amparos'][b].Numero_Poliza+'</center>',
              '<center>'+datos[0]['Amparos'][b].NumContrato+'</center>',
              '<center>'+datos[0]['Amparos'][b].TipoAmparo+'</center>',
              '<center>'+datos[0]['Amparos'][b].Fecha_Inicio_Amparo+'</center>',
              '<center>'+datos[0]['Amparos'][b].Fecha_Fin_Amparo+'</center>',
              '<center>'+formatearMonto( datos[0]['Amparos'][b].Cuantia_Amparo )+'</center>'
            ]).draw();
          }
          $("#div_AlertaAmparos").show("500");
        }else{
          $("#div_AlertaAmparos").hide("500");
        }

      }
    },error: function(jqXHR, estado, error) {
      toastr.error("Ha ocurrido un error: " + error);
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


function cargarContenido($ruta,$TITULO) {
  $("#Lbltitulo").html($TITULO);
  $("#CuerpoForm").html('<object class="ObjetoContenedor" type="text/html" data="'+$ruta+'" ></object>');

}


