var Material = [];
var elemento = "";
var ArchivosCargados = [];
var CotizacionesCargadas = [];
var OrdenesPedidoCargadas = [];
var OrdenPedidoEditar = "";
var IdElementoMaterial = "";
var PrecioElementoMaterial = "";
var IdProveedor = "";
var NomProveedor = "";
var NumeroCotizacion = "";
var IdNumeroCotizacion = "";
var FechaCotizacion = "";
var NumeroOrdenPedidoProveedor = "";
var SaldoComprometido = "";
var SaldoFacturado = "";
var saldoDisponible = "";
var SaldoActual = 0;
var SaldoLiberar =0;
var NotaCredito = [];

function CargarMunicipio() {
  return new Promise(function(resolve, reject) {
    var depto = $("#GenOrdenPedido_Dpto").val();
    $.ajax({
      url: '../Administracion/administracion.php',
      type: 'POST',
      data: { opcion: "CargarMunicipio", depto: depto },
      success: function(respuesta) {
        var datos = JSON.parse(respuesta);
        var html = '<option value="Ninguno">Seleccione</option>';
        if (datos.length > 0) {
          for (var i = 0; i < datos.length; i++) {
            html += '<option retfuente="' + datos[i].RetFuente + '" value="' + datos[i].Id + '">' + datos[i].Nombre + '</option>';
          }
        }
        $("#GenOrdenPedido_Mpio").html(html);
        resolve(); // Resuelve la promesa cuando la carga de municipios está completa
      },
      error: function() {
        window.toastr.error('Error al cargar las opciones');
        reject(); // Rechaza la promesa en caso de error
      }
    });
  });
}

function CargarElementoReportar(NumOpp){

    $.ajax({
      url: 'Pedidos.php',
      type: 'POST',
      data: { opcion: "CargarElementoReportar", NumOpp: NumOpp },
      success: function(respuesta) {
        var datos = JSON.parse(respuesta);

        var tabla = $('#Tbl_Materiales_OPP').DataTable();
        tabla.clear().draw();
        if(datos.length>0){
            for (var i = 0; i < datos.length; i++) {
                tabla.row.add([
                  '<center>'+parseInt(i+1)+'</center>',
                  '<center>'+datos[i].Proveedor+'</center>',
                  '<center>'+datos[i].Material+'</center>',
                  '<center><input class="form-control" style="width: 60px;" id="Cantidad_'+datos[i].Id+'" value='+datos[i].Cantidad+'></center>',
                  '<center>'+formatearMonto(datos[i].Precio)+'</center>',
                  '<center> <select class="form-control" style="width: 120px;" NumOpp="'+NumOpp+'" MatenialNombre="'+datos[i].Material+'" Id_Material_Opp="'+datos[i].Id+'" id="Motivo_Id_'+datos[i].Proveedor+'"><option value="Ninguno">Seleccione</option><option value="Defectuoso">Defectuoso</option><option value="No llego">No llego</option><select></center>'
                ]).draw();
            }
            $('[data-toggle="tooltip"]').tooltip();
        }
        $("#btn_modal_AddElement").click();

      },error: function() {
        window.toastr.error('Error al cargar las opciones');
      }
    });
}



function CargarElementoResolverReportar(NumOpp){

    $.ajax({
      url: 'Pedidos.php',
      type: 'POST',
      data: { opcion: "CargarElementoResolverReportar", NumOpp: NumOpp },
      success: function(respuesta) {
        var datos = JSON.parse(respuesta);

        var tabla = $('#Tbl_Materiales_OPP').DataTable();
        tabla.clear().draw();
        if(datos.length>0){
            for (var i = 0; i < datos.length; i++) {
                tabla.row.add([
                  '<center>'+parseInt(i+1)+'</center>',
                  '<center>'+datos[i].Proveedor+'</center>',
                  '<center>'+datos[i].Material+'</center>',
                  '<center><input class="form-control" style="width: 60px;" disabled id="Cantidad_'+datos[i].Id+'" value='+datos[i].Cantidad+'></center>',
                  '<center>'+formatearMonto(datos[i].Precio)+'</center>',
                  '<center> <select class="form-control" style="width: 120px;"  NumOpp="'+NumOpp+'" MatenialNombre="'+datos[i].Material+'" Id_Material_Opp="'+datos[i].Id+'" id="Motivo_Id_'+datos[i].Proveedor+'"><option value="Ninguno">Seleccione</option><option value="Solucionado">Solucionado</option><option value="No Solucionado">No Solucionado</option><select></center>'
                ]).draw();
            }
            $('[data-toggle="tooltip"]').tooltip();
        }
        $("#btn_modal_AddElement").click();

      },error: function() {
        window.toastr.error('Error al cargar las opciones');
      }
    });
}

function GuardarSolucionReportarElementosOPP() {
    
    var datosSeleccionados = [];
    $("#Tbl_Materiales_OPP select").each(function() {
        var valorSelect = $(this).val();
        var idMaterialOpp = $(this).attr("id_material_opp");
        var NombreMaterial = $(this).attr("matenialnombre");
        var NumOpp = $(this).attr("numopp");
        
        if (valorSelect !== "Ninguno") {
          var datos = {
            "Motivo": valorSelect,
            "MatenialNombre":NombreMaterial,
            "NumOpp":NumOpp,
            "IdMaterialOpp": idMaterialOpp
          };
          datosSeleccionados.push(datos);
        }
    });
    if(datosSeleccionados.length>0){
        $.ajax({
          url: 'Pedidos.php',
          type: 'POST',
          data: { opcion: "GuardarSolucionReportarElementosOPP", datosSeleccionados:datosSeleccionados },
          success: function(respuesta) {
            window.Swal.fire("Exito!","Elementos Reportados Exitosamente!","success").then((result) => {
                FiltrarOrdenesPedidoReportados();
                $("#btn_CerrarModal_OrdenPEdido").click();
            });
          }
        });
    }else{
        window.toastr.error("Debe cambiar el estado de al menos un motivo!");
    }
}


function ReportarElementosOPP() {
    
    var datosSeleccionados = [];
    $("#Tbl_Materiales_OPP select").each(function() {
        var valorSelect = $(this).val();
        var idMaterialOpp = $(this).attr("Id_Material_Opp");
        var NombreMaterial = $(this).attr("MatenialNombre");
        var NumOpp = $(this).attr("NumOpp");
        var valorCantidad = $("#Cantidad_" + idMaterialOpp).val();
        
        if (valorSelect !== "Ninguno") {
          var datos = {
            "Motivo": valorSelect,
            "Cantidad": valorCantidad,
            "MatenialNombre":NombreMaterial,
            "NumOpp":NumOpp,
            "IdMaterialOpp": idMaterialOpp
          };
          datosSeleccionados.push(datos);
        }
    });
    if(datosSeleccionados.length>0){
        $.ajax({
          url: 'Pedidos.php',
          type: 'POST',
          data: { opcion: "ReportarElementosOPP", datosSeleccionados:datosSeleccionados },
          success: function(respuesta) {
            window.Swal.fire("Exito!","Elementos Reportados Exitosamente!","success").then((result) => {
                $("#btn_CerrarModal_OrdenPedido").click();
            });
          }
        });
    }else{
        window.toastr.error("Debe cambiar el estado de al menos un motivo!");
    }
}


function FiltrarOrdenesPedidoReportados() {
    
    var depto = $("#GenOrdenPedido_Dpto").val();
    var mpio = $("#GenOrdenPedido_Mpio").val();
    var contrato = $("#GenOrdenPedido_contrato").val();
    var FechaIni,FechaFin,Estado;


    if($("#GenOrdenPedido_FechaIni").val()){
        FechaIni = $("#GenOrdenPedido_FechaIni").val();
    }else{
        FechaIni = "NO";
    }

    if($("#GenOrdenPedido_FechaIni").val()){
        FechaFin = $("#GenOrdenPedido_FechaIni").val();
    }else{
        FechaFin = "NO";
    }


    if($("#GenOrdenPedido_Estado").val()!="Ninguno"){
        Estado = $("#GenOrdenPedido_Estado").val();
    }else{
        Estado = "NO";
    }

    $.ajax({
      url: 'Pedidos.php',
      type: 'POST',
      data: { opcion: "FiltrarOrdenesPedidoReportados", depto: depto , mpio : mpio , contrato : contrato , FechaIni:FechaIni , FechaFin:FechaFin , Estado:Estado },
      success: function(respuesta) {
        var datos = JSON.parse(respuesta);
        var tabla = $('#tbl_CotizacionesOrdenPedido').DataTable();
        tabla.clear().draw();
        if(datos.length>0){
            for (var i = 0; i < datos.length; i++) {
                tabla.row.add([
                  '<center>'+parseInt(i+1)+'</center>',
                  '<center>'+datos[i].Numero_Orden_Pedido+'</center>',
                  '<center>'+datos[i].depto+'</center>',
                  '<center>'+datos[i].mpio+'</center>',
                  '<center>'+datos[i].CONTRATO_NUMERO_VIVA+'</center>',
                  '<center>'+datos[i].Observaciones+'</center>',
                  '<center>'+ formatearMonto(datos[i].saldo)+'</center>' ,                
                  '<center>'+datos[i].EstadoOrden+'</center>' ,             
                  '<center><button type="button" class="btn_transparente" data-toggle="tooltip" onclick="CargarElementoResolverReportar(\''+datos[i].Numero_Orden_Pedido+'\')" title="Gestionar elemento faltante/mal estado"><i class="fa-regular fa-pen-to-square fa-2xs"></i></button></center>',
                  '<center><button class="btn_transparente" title="Generar PDF de Resumen" data-toggle="tooltip" ><i class="fa-regular fa-file-pdf fa-2xs"></i></button><button class="btn_transparente" onclick="CargarOrdenPedidoReporte(\''+datos[i].Numero_Orden_Pedido+'\')" title="Generar Excel de Resumen" data-toggle="tooltip" ><i class="fa-regular fa-file-excel fa-2xs"></i></button></center>',
                  '<center><button type="button" onclick="DesactivarOrdenPedido(\''+datos[i].Numero_Orden_Pedido+'\')" class="btn_transparente" data-toggle="tooltip" title="Desactivar Orden de Pedido"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'  
                ]).draw();
            }
            $('[data-toggle="tooltip"]').tooltip();
        }
      },error: function() {
        window.toastr.error('Error al cargar las opciones');
      }
    });
}


/*


function FiltrarOrdenesPedido() {
    
    var depto = $("#GenOrdenPedido_Dpto").val();
    var mpio = $("#GenOrdenPedido_Mpio").val();
    var contrato = $("#GenOrdenPedido_contrato").val();
    var FechaIni,FechaFin,Estado;


    if($("#GenOrdenPedido_FechaIni").val()){
        FechaIni = $("#GenOrdenPedido_FechaIni").val();
    }else{
        FechaIni = "NO";
    }

    if($("#GenOrdenPedido_FechaFin").val()){
        FechaFin = $("#GenOrdenPedido_FechaFin").val();
    }else{
        FechaFin = "NO";
    }


    if($("#GenOrdenPedido_Estado").val()!="Ninguno"){
        Estado = $("#GenOrdenPedido_Estado").val();
    }else{
        Estado = "NO";
    }

    $.ajax({
      url: 'Pedidos.php',
      type: 'POST',
      data: { opcion: "FiltrarOrdenesPedido", depto: depto , mpio : mpio , contrato : contrato , FechaIni:FechaIni , FechaFin:FechaFin , Estado:Estado },
      success: function(respuesta) {
        var datos = JSON.parse(respuesta);
        var tabla = $('#tbl_CotizacionesOrdenPedido').DataTable();
        tabla.clear().draw();
        if(datos.length>0){
            for (var i = 0; i < datos.length; i++) {
                tabla.row.add([
                  '<center>'+parseInt(i+1)+'</center>',
                  '<center>'+datos[i].Numero_Orden_Pedido+'</center>',
                  '<center>'+datos[i].depto+'</center>',
                  '<center>'+datos[i].mpio+'</center>',
                  '<center>'+datos[i].CONTRATO_NUMERO_VIVA+'</center>',
                  '<center>'+datos[i].Observaciones+'</center>',
                  '<center>'+ formatearMonto(datos[i].saldo)+'</center>' ,                
                  '<center><button type="button" class="btn_transparente" data-toggle="tooltip" onclick="CargarElementoReportar(\''+datos[i].Numero_Orden_Pedido+'\')" title="Reportar elemento faltante/mal estado"><i class="fa-regular fa-pen-to-square fa-2xs"></i></button></center>', 
                  '<center><button class="btn_transparente" title="Generar PDF de Resumen" data-toggle="tooltip" ><i class="fa-regular fa-file-pdf fa-2xs"></i></button><button class="btn_transparente" onclick="CargarOrdenPedidoReporte(\''+datos[i].Numero_Orden_Pedido+'\')" title="Generar Excel de Resumen" data-toggle="tooltip" ><i class="fa-regular fa-file-excel fa-2xs"></i></button></center>',
                  '<center><button type="button" onclick="DesactivarOrdenPedido(\''+datos[i].Numero_Orden_Pedido+'\')" class="btn_transparente" data-toggle="tooltip" title="Desactivar Orden de Pedido"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'  
                ]).draw();
            }
            $('[data-toggle="tooltip"]').tooltip();
        }
      },error: function() {
        window.toastr.error('Error al cargar las opciones');
      }
    });
}




*/

function FiltrarOrdenesPedido() {
    
    var depto = $("#GenOrdenPedido_Dpto").val();
    var mpio = $("#GenOrdenPedido_Mpio").val();
    var contrato = $("#GenOrdenPedido_contrato").val();
    var FechaIni,FechaFin,Estado;


    if($("#GenOrdenPedido_FechaIni").val()){
        FechaIni = $("#GenOrdenPedido_FechaIni").val();
    }else{
        FechaIni = "NO";
    }

    if($("#GenOrdenPedido_FechaFin").val()){
        FechaFin = $("#GenOrdenPedido_FechaFin").val();
    }else{
        FechaFin = "NO";
    }



    if($("#GenOrdenPedido_Estado").val()!="Ninguno"){
        Estado = $("#GenOrdenPedido_Estado").val();
    }else{
        Estado = "NO";
    }

    $.ajax({
      url: 'Pedidos.php',
      type: 'POST',
      data: { opcion: "FiltrarOrdenesPedido", depto: depto , mpio : mpio , contrato : contrato , FechaIni:FechaIni , FechaFin:FechaFin , Estado:Estado },
      success: function(respuesta) {
        var datos = JSON.parse(respuesta);
        var tabla = $('#tbl_CotizacionesOrdenPedido').DataTable();
        tabla.clear().draw();
        if(datos.length>0){
            for (var i = 0; i < datos.length; i++) {
                tabla.row.add([
                  '<center>'+parseInt(i+1)+'</center>',
                  '<center>'+datos[i].Numero_Orden_Pedido+'</center>',
                  '<center>'+datos[i].depto+'</center>',
                  '<center>'+datos[i].mpio+'</center>',
                  '<center>'+datos[i].CONTRATO_NUMERO_VIVA+'</center>',
                  '<center>'+datos[i].Observaciones+'</center>',
                  '<center>'+ formatearMonto(datos[i].saldo)+'</center>' ,                
                  '<center>'+datos[i].EstadoOrden+'</center>' ,                
                  '<center><button type="button" class="btn_transparente" data-toggle="tooltip" onclick="CargarElementoReportar(\''+datos[i].Numero_Orden_Pedido+'\')" title="Reportar elemento faltante/mal estado"><i class="fa-regular fa-pen-to-square fa-2xs"></i></button></center>', 
                  '<center><button class="btn_transparente" title="Generar PDF de Resumen" data-toggle="tooltip" ><i class="fa-regular fa-file-pdf fa-2xs"></i></button><button class="btn_transparente" onclick="CargarOrdenPedidoReporte(\''+datos[i].Numero_Orden_Pedido+'\')" title="Generar Excel de Resumen" data-toggle="tooltip" ><i class="fa-regular fa-file-excel fa-2xs"></i></button></center>',
                  '<center><button type="button" onclick="DesactivarOrdenPedido(\''+datos[i].Numero_Orden_Pedido+'\')" class="btn_transparente" data-toggle="tooltip" title="Desactivar Orden de Pedido"><i class="fa-regular fa-trash-can fa-2xs"></i></button></center>'  
                ]).draw();
            }
            $('[data-toggle="tooltip"]').tooltip();
        }
      },error: function() {
        window.toastr.error('Error al cargar las opciones');
      }
    });
}



function DesactivarOrdenPedido(ParNumero_Orden_Pedido){

    Swal.fire({
      title: 'Confirmar',
      text: '¿Estás seguro de desactivar la Orden de Pedido? Esta acción no se podrá revertir',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sí',
      cancelButtonText: 'No'
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
            url: 'Pedidos.php',
            type: 'POST',
            data: { opcion: "DesactivarOrdenPedido", ParNumero_Orden_Pedido: ParNumero_Orden_Pedido },
            success: function(respuesta) {
                window.Swal.fire({
                  title: "Exito!",
                  text: "Orden de Pedido Desactivada con Exito!",
                  icon: "success",
                }).then((result) => {

                    FiltrarOrdenesPedido();

                });
            },error: function() {
                window.toastr.error('Error al cargar las opciones');
            }
        });
      } 
    });
}


function CargarContrato() {
    var depto = $("#GenOrdenPedido_Dpto").val();
    var mpio = $("#GenOrdenPedido_Mpio").val();

    return new Promise(function(resolve, reject) {
        $.ajax({
            url: 'Pedidos.php',
            type: 'POST',
            data: { opcion: "CargarContrato", depto: depto, mpio: mpio },
            success: function(respuesta) {
                var datos = JSON.parse(respuesta);
                var html = '<option value="Ninguno">Seleccione</option>';
                if (datos.length > 0) {
                    for (var i = 0; i < datos.length; i++) {
                        html += '<option value="' + datos[i].ID + '">' + datos[i].CONTRATO_NUMERO_VIVA + '</option>';
                    }
                }
                $("#GenOrdenPedido_contrato").html(html);
                resolve(); // Resuelve la promesa una vez que la carga de contratos esté completa
            },
            error: function() {
                window.toastr.error('Error al cargar las opciones');
                reject(); // Rechaza la promesa en caso de error
            }
        });
    });
}

function CargarMunicipio2() {
  return new Promise(function(resolve, reject) {
    var depto = $("#EditOrdenPedido_Filt_Dpto").val();
    $.ajax({
      url: '../Administracion/administracion.php',
      type: 'POST',
      data: { opcion: "CargarMunicipio", depto: depto },
      success: function(respuesta) {
        var datos = JSON.parse(respuesta);
        var html = '<option value="Ninguno">Seleccione</option>';
        if (datos.length > 0) {
          for (var i = 0; i < datos.length; i++) {
            html += '<option retfuente="' + datos[i].RetFuente + '" value="' + datos[i].Id + '">' + datos[i].Nombre + '</option>';
          }
        }
        $("#EditOrdenPedido_Filt_Mpio").html(html);
        resolve(); // Resuelve la promesa cuando la carga de municipios está completa
      },
      error: function() {
        window.toastr.error('Error al cargar las opciones');
        reject(); // Rechaza la promesa en caso de error
      }
    });
  });
}


function CargarContrato2() {
    var depto = $("#EditOrdenPedido_Filt_Dpto").val();
    var mpio = $("#EditOrdenPedido_Filt_Mpio").val();

    return new Promise(function(resolve, reject) {
        $.ajax({
            url: 'Pedidos.php',
            type: 'POST',
            data: { opcion: "CargarContrato", depto: depto, mpio: mpio },
            success: function(respuesta) {
                var datos = JSON.parse(respuesta);
                var html = '<option value="Ninguno">Seleccione</option>';
                if (datos.length > 0) {
                    for (var i = 0; i < datos.length; i++) {
                        html += '<option value="' + datos[i].ID + '">' + datos[i].CONTRATO_NUMERO_VIVA + '</option>';
                    }
                }
                $("#EditOrdenPedido_Filt_contrato").html(html);
                resolve(); // Resuelve la promesa una vez que la carga de contratos esté completa
            },
            error: function() {
                window.toastr.error('Error al cargar las opciones');
                reject(); // Rechaza la promesa en caso de error
            }
        });
    });
}







function ConcatenarDireccion(element) {

    Direccion = "";
    $("#segundoModal input,#segundoModal select").each(function() {
      var value = $(this).val();
      if (value && value!="Ninguno") {
        Direccion += value + " ";
      }
    });
  $("#DireccionResultante").html(Direccion);

}


function AplicarDireccionPedido(){
    var direccion = $("#DireccionResultante").html();
    $("#GenOrdenPedido_DirFinal").html(direccion);
    $("#mdl_cerrar_direccion").click();
}


function AgregarElementoOrdenPedido() {
    $(".error").removeClass("error");
    var elemento = $("#GenOrdenPedido_NMaterial").val();
    var unidad = $("#GenOrdenPedido_Und").val();
    var Cantidad = $("#GenOrdenPedido_CantMaterial").val();
    var Resp = "NO";

    if(!elemento){
        $("#GenOrdenPedido_NMaterial").addClass("error");
        Resp = "SI";
    }

    if(!unidad){
        $("#GenOrdenPedido_Und").addClass("error");
        Resp = "SI";
    }

    if(!Cantidad){
        $("#GenOrdenPedido_CantMaterial").addClass("error");
        Resp = "SI";
    }

    if(Resp=="SI"){
        window.toastr.error("Algunos campos obligatorios estan vacios, favor llenarlos!");
        return false;
    }


    // Validar si el elemento ya existe en la lista
    var existeElemento = Material.some(function(item) {
        return item.Elemento === elemento;
    });
    
    if (existeElemento) {
        window.toastr.error("El elemento ya ha sido agregado anteriormente, intente con otro!");
        return;
    }
    
    Material.push({'Elemento': elemento,'IdElemento':IdElementoMaterial,'PrecioElemento':PrecioElementoMaterial,'IdProveedor':IdProveedor,'NombreProveedor':NomProveedor, 'Unidad': unidad, 'Cantidad': Cantidad,'NombreMpio':$("#GenOrdenPedido_Mpio option:selected").val()});
    window.toastr.success("Elemento Agregado!");
    $("#GenOrdenPedido_NMaterial").val("");
    $("#GenOrdenPedido_Und").val("");
    $("#GenOrdenPedido_CantMaterial").val("");
    $("#ProveedorListaPrecio_Proveedor").val("");
    IdElementoMaterial = "";
    PrecioElementoMaterial = "";
    IdProveedor = "";
    NomProveedor = "";
    CargarElementosOrdenPedido();
}


function CargarElementosOrdenPedido(){

    var tabla = $('#tbl_DetalleOrdenPedido').DataTable();
    tabla.clear().draw();
    if(Material.length>0){
        for (var i = 0; i < Material.length; i++) {
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+Material[i].NombreProveedor+'</center>',
              '<center>'+Material[i].NombreMpio+'</center>',
              '<center>'+Material[i].Elemento+'</center>',
              '<center>'+formatearMonto(Material[i].PrecioElemento)+'</center>',
              '<center>'+Material[i].Unidad+'</center>',
              '<center>'+Material[i].Cantidad+'</center>' ,                
             '<center><button type="button" class="btn_transparente" data-toggle="tooltip" title="ELiminar Elemento" onclick=\'eliminarElementoPorNombre("' + Material[i].Elemento + '")\' ><i class="fa-regular fa-trash-can"></i></button><button type="button" class="btn_transparente" data-toggle="tooltip" title="Editar Elemento" onclick=\'EditarElementoPorNombre("' + Material[i].Elemento + '")\' ><i class="fa-solid fa-pen"></i></button></center>' 
            ]).draw();
        }
        $('[data-toggle="tooltip"]').tooltip();
    }

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





function ActualizarElementoOrdenPedido(){

    for (var i = 0; i < Material.length; i++) {
        if (Material[i].Elemento === elemento) {
            Material[i].Elemento = $("#GenOrdenPedido_NMaterial").val();
            Material[i].Unidad = $("#GenOrdenPedido_Und").val();
            Material[i].Cantidad = $("#GenOrdenPedido_CantMaterial").val();
            CargarElementosOrdenPedido();
            window.toastr.success("Elemento Actualizado exitosamente!");
            $("#btn_CerrarModal_OrdenPEdido").click();
        }
    }
}

function EditarElementoPorNombre(nombre) {
    elemento = nombre;
    $("#Btn_AgregarItem").hide();
    $("#Btn_ActualizarItem").show();
    for (var i = 0; i < Material.length; i++) {
        if (Material[i].Elemento === nombre) {
            $("#ProveedorListaPrecio_Proveedor").val(Material[i].NombreProveedor);
            $("#GenOrdenPedido_NMaterial").val(Material[i].Elemento);
            $("#GenOrdenPedido_Und").val(Material[i].Unidad);
            $("#GenOrdenPedido_CantMaterial").val(Material[i].Cantidad);
            IdProveedor = Material[i].IdProveedor;
            NomProveedor = Material[i].NombreProveedor;
            $("#btn_modal_AddElement").click();
        }
    }
}



function CargarArchivoOP() {
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
formData.append('opcion', 'upload_file_Orden_Pedido');

$.ajax({
    url: 'Pedidos.php',
    type: 'POST',
    data: formData,
    contentType: false,
    processData: false,
    success: function(response) {
       response = response.replaceAll("null","");
       var datos = JSON.parse(response);
       if(datos.length){
        for (var i = 0; i < datos.length; i++) {
            Material.push({'Elemento':  datos[i][0], 'Unidad': datos[i][1], 'Precio': datos[i][2], 'Cantidad': datos[i][3], 'IdProveedor': datos[i][7], 'IdMpio': datos[i][8], 'NombreProveedor': datos[i][9], 'NombreMpio': datos[i][10]});
        }
        CargarElementosOrdenPedido();
        window.toastr.success("Elementos Cargados exitosamente!");
       }
    },
    error: function() {
        window.toastr.warning('Se ha producido un error al cargar el archivo');
    }
});

}

function EliminarAdjuntoOP(nombre){
    for (var i = 0; i < ArchivosCargados.length; i++) {
        if (ArchivosCargados[i].NombreArchivo === nombre) {
            ArchivosCargados.splice(i, 1);
            window.toastr.success("Archivo eliminado exitosamente!");
            MostrarArchivosCargadosOrdenPedido();
            return true; // Indicar que se eliminó el elemento
        }
    }
    return false; // Indicar que no se encontró el elemento
}

function MostrarArchivosCargadosOrdenPedido() {
 var tabla = $('#GridArchivosAdjuntosOrdenPendido').DataTable();
    tabla.clear().draw();
    if(ArchivosCargados.length>0){
        for (var i = 0; i < ArchivosCargados.length; i++) {
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+ArchivosCargados[i].NombreArchivo+'</center>',
              '<center>'+ArchivosCargados[i].size+'</center>',          
             '<center><button type="button" class="btn_transparente" data-toggle="tooltip" title="ELiminar Archivo" onclick=\'EliminarAdjuntoOP("' + ArchivosCargados[i].NombreArchivo + '")\' ><i class="fa-regular fa-trash-can"></i></button></center>']).draw();
        }
        $("#Btn_MostrarCargadosOP").click();
    }
}


function CargarArchivoOrdenPedido(){

  var files = []; // Array para los datos de los archivos cargados
event.preventDefault();

var archivo = $('#GenOrdenPedido_archivo')[0].files[0];

// Validar que se haya seleccionado un archivo
if (!archivo) {
    window.toastr.error('Por favor seleccione un archivo');
    return;
}


// Crear objeto FormData con los datos del archivo y tipo de documento
var formData = new FormData();
formData.append('archivo', archivo);
formData.append('opcion', 'upload_file');

$.ajax({
    url: '../Proveedores/Proveedores.php',
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


function CargarListadoOrdenProveedores(){
    var depto = $("#EditOrdenPedido_Filt_Dpto").val();
    var mpio = $("#EditOrdenPedido_Filt_Mpio").val();
    var Contrato = $("#EditOrdenPedido_Filt_contrato").val();
    var FechaIni = $("#EditOrdenPedido_Filt_fechaIni").val();
    var FechaFin = $("#EditOrdenPedido_Filt_fechaFin").val();

    if(depto=="Ninguno"){
        depto = "";
    }

    if(mpio=="Ninguno"){
        mpio = "";
    }

    if(Contrato=="Ninguno"){
        Contrato = "";
    }

    $.ajax({
        url: 'Pedidos.php',
        type: 'POST',
        data:{opcion:"CargarListadoOrdenProveedores",depto:depto,mpio:mpio,Contrato:Contrato,FechaIni:FechaIni,FechaFin:FechaFin},
        success: function(respuesta){
           var tabla = $('#tbl_ListadoOrdenPedido').DataTable();
            tabla.clear().draw();
            var datos = JSON.parse(respuesta);
            if(datos.length>0){
                for (var i = 0; i < datos.length; i++) {
                    tabla.row.add([
                      '<center>'+parseInt(i+1)+'</center>',
                      '<center>'+datos[i].NumeroOrdenPedido+'</center>',
                      '<center>'+datos[i].Mpio+'</center>',
                      '<center>'+datos[i].CONTRATO_NUMERO_VIVA+'</center>' ,                
                      '<center>'+datos[i].FechaSol+'</center>' ,                
                      '<center>'+datos[i].Solicitante+'</center>' ,                
                     '<center><button type="button" class="btn_transparente" data-toggle="tooltip" title="Editar la Cotización" onclick=\'EditarOrdenPedido("' + datos[i].Id + '")\' ><i class="fa-solid fa-pen-to-square"></i></button>'
                     ,'<a class="btn_transparente" data-toggle="tooltip" target="_blank" title="Generar PDF de Cotización" href="reportes/PDFCotizacion.php?NumeroCotizacion=' + datos[i].NumeroOrdenPedido + '") ><i class="fa-regular fa-file-pdf"></i></a><button type="button" class="btn_transparente" data-toggle="tooltip" title="Generar Excel de Cotización" onclick=\'GenerarOrdenPedidoExcel("' + datos[i].Id + '")\' ><i class="fa-regular fa-file-excel"></i></button></center>'
                       
                    ]).draw();
                }
             $('[data-toggle="tooltip"]').tooltip();
            }
        },error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });
}


function BuscarElementoProveedor() {
    
    var ingresado = $("#GenOrdenPedido_NMaterial").val();
    var Mpio = $("#GenOrdenPedido_Mpio").val();
    if (ingresado && ingresado.length >= 3) {

        if(IdProveedor==""){
            window.toastr.error("Debe seleccionar un Proveedor primero");
            return false;
        }

        if(Mpio=="Ninguno"){
            window.toastr.error("Debe seleccionar un Municipio primero");
            return false;
        }


        $("#GenOrdenPedido_ListaMaterial").show(500);
        $.ajax({
            url: 'Pedidos.php',
            type: 'POST',
            data:{opcion:"BuscarElementoProveedor",ingresado:ingresado,IdProveedor:IdProveedor,Mpio:Mpio},
            success: function(respuesta){
                var html = '';
                var datos = JSON.parse(respuesta);
                if(datos.length>0){
                    for (var i = 0; i < datos.length; i++) {
                        html+='<li class="list-group-item" onclick="SeleccionarElementoIndividual(\''+datos[i].Id+'\',\''+datos[i].Elemento+'\',\''+datos[i].Precio+'\')" >'+datos[i].Elemento+'('+formatearMonto( datos[i].Precio) +')</li>';

                    }
                    $("#GenOrdenPedido_ListaMaterial").html(html);
                }else{
                    $("#GenOrdenPedido_ListaMaterial").html('<li class="list-group-item">No hay datos que mostrar</li>');
                }
            },
            error: function(){
                 window.toastr.warning('Error al cargar las opciones');
            }
        });
    }else{
        $("#GenOrdenPedido_ListaMaterial").hide(500);

    }
}

function HabilitarCargaElementos(){

    if($("#GenOrdenPedido_contrato").val()!="Ninguno"){
        $("#btn_Agr_Material_OP").removeAttr("disabled");
        $("#btn_Agr_Material_OP").removeClass("btn_inactivo");

    }else{
        $("#btn_Agr_Material_OP").addClass("btn_inactivo");
        $("#btn_Agr_Material_OP").attr("disabled","true");
    }
}


function BuscarProveedore() {
    
    var ingresado = $("#ProveedorListaPrecio_Proveedor").val();
    if (ingresado && ingresado.length >= 3) {
        $("#ProveedorListaPrecio_ListaProveedores").show(500);
        $.ajax({
            url: '../Proveedores/Proveedores.php',
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

function SeleccionarElementoIndividual(ParamIdElemento,ParamNombreElemento,ParamPrecioElem){

    IdElementoMaterial = ParamIdElemento;
    PrecioElementoMaterial = ParamPrecioElem;
    $("#GenOrdenPedido_NMaterial").val(ParamNombreElemento);
    $("#GenOrdenPedido_ListaMaterial").html("");
    $("#GenOrdenPedido_ListaMaterial").hide();

}


function MostrarInfoProveedor(ParamIdProveedor,ParamNombreProveedor){
    NomProveedor = ParamNombreProveedor;
    IdProveedor = ParamIdProveedor;
    $("#ProveedorListaPrecio_Proveedor").val(ParamNombreProveedor);
    $("#ProveedorListaPrecio_ListaProveedores").html("");
    $("#ProveedorListaPrecio_ListaProveedores").hide();

}

function RegresarOrdenPedido() {
    $("#CuerpoTotal").show(500);
    $("#cuerpoEditar").hide(500);
    OrdenPedidoEditar = "";
    CargarListadoOrdenProveedores();
}

 
function EditarOrdenPedido(ParIdOrden){

    $("#CuerpoTotal").hide(500);
    $("#cuerpoEditar").show(500);
    OrdenPedidoEditar = ParIdOrden;

    $.ajax({
        url: 'Pedidos.php',
        type: 'POST',
        data:{opcion:"CargarEditarOrdenPedido",OrdenPedidoEditar:OrdenPedidoEditar,IdMpio:$("#GenOrdenPedido_Mpio").val()},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);

            $("#GenOrdenPedido_Dpto").val(datos[0]['Id_Depto']);

            CargarMunicipio().then(function() {
              $("#GenOrdenPedido_Mpio").val(datos[0]['Id_Mpio']);
              return CargarContrato();
            }).then(function() {
              $("#GenOrdenPedido_contrato").val(datos[0]['Id_Contrato']);
              $("#GenOrdenPedido_fecha").val(datos[0]['FechaSol']);
              $("#GenOrdenPedido_DirFinal").html(datos[0]['Direccion']);
              $("#Otro").val(datos[0]['Direccion']);
              $("#DireccionResultante").val(datos[0]['Direccion']);
              $("#GenOrdenPedido_Solicitante").val(datos[0]['Solicitante']);
              $("#GenOrdenPedido_identificacion").val(datos[0]['Cedula']);
              $("#GenOrdenPedido_Telf").val(datos[0]['Telefono']);
              $("#GenOrdenPedido_Cargo").val(datos[0]['Cargo']);
            }).catch(function(error) {
              // Manejar errores, si es necesario
            });

            Material = [];
            for (var i = 0; i < datos[0]['Materiales'].length; i++) {
                Material.push({'Elemento': datos[0]['Materiales'][i].Material, 'Unidad': datos[0]['Materiales'][i].Unidad,'Precio': datos[0]['Materiales'][i].Precio, 'Cantidad': datos[0]['Materiales'][i].Cantidad, 'IdProveedor': datos[0]['Materiales'][i].Id_Proveedor, 'IdMpio': datos[0]['Materiales'][i].Id_Mpio, 'NombreProveedor': datos[0]['Materiales'][i].Proveedor, 'NombreMpio': datos[0]['Materiales'][i].Mpio});     
            }
            CargarElementosOrdenPedido();



            ArchivosCargados = [];
            for (var i = 0; i < datos[0]['Adjuntos'].length; i++) {
                ArchivosCargados.push({
                    NombreArchivo: datos[0]['Adjuntos'][i]['NOMBRE_ARCHIVO'],
                    Url: datos[0]['Adjuntos'][i]['URL'],
                    size: datos[0]['Adjuntos'][i]['SIZE']
                });
            }

        },error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });
    

}


function GuardarOrdenPedido(){

    $(".error").removeClass("error");
    var depto = $("#GenOrdenPedido_Dpto").val();
    var mpio = $("#GenOrdenPedido_Mpio").val();
    var contrato = $("#GenOrdenPedido_contrato").val();
    var fechasol = $("#GenOrdenPedido_fecha").val();
    var direccion = $("#GenOrdenPedido_DirFinal").html();
    var solicitante = $("#GenOrdenPedido_Solicitante").val();
    var cedula = $("#GenOrdenPedido_identificacion").val();
    var telefono = $("#GenOrdenPedido_Telf").val();
    var cargo = $("#GenOrdenPedido_Cargo").val();
    var Resp = "NO";

    if(depto=="Ninguno"){
        $("#GenOrdenPedido_Dpto").addClass("error");
        Resp = "SI";
    }


    if(mpio=="Ninguno"){
        $("#GenOrdenPedido_Mpio").addClass("error");
        Resp = "SI";
    }


    if(contrato=="Ninguno"){
        $("#GenOrdenPedido_contrato").addClass("error");
        Resp = "SI";
    }


    if(!fechasol){
        $("#GenOrdenPedido_fecha").addClass("error");
        Resp = "SI";
    }


    if(!direccion){
        $("#GenOrdenPedido_DirFinal").addClass("error");
        Resp = "SI";
    }

    if(!solicitante){
        $("#GenOrdenPedido_Solicitante").addClass("error");
        Resp = "SI";
    }

    if(!cedula){
        $("#GenOrdenPedido_identificacion").addClass("error");
        Resp = "SI";
    }


    if(!telefono){
        $("#GenOrdenPedido_Telf").addClass("error");
        Resp = "SI";
    }


    if(!cargo){
        $("#GenOrdenPedido_Cargo").addClass("error");
        Resp = "SI";
    }


    if(Resp=="SI"){
        window.toastr.error("Algunos campos obligatorios estan vacios, favor verificar");
        return false;
    }

    if(!Material.length>0){
        window.toastr.error("Debe agregar al menos un material a la orden!");
        $("#tbl_DetalleOrdenPedido").addClass("error");
        return false;
    }

    var PoseeAdjuntos = "NO";

    if(ArchivosCargados.length>0){
        PoseeAdjuntos = "SI";
    }

    $.ajax({
        url: 'Pedidos.php',
        type: 'POST',
        data:{opcion:"GuardarOrdenPedido",depto:depto,mpio:mpio,contrato:contrato,fechasol:fechasol,direccion:direccion,solicitante:solicitante,cedula:cedula,telefono:telefono,cargo:cargo,Material:Material,ArchivosCargados:ArchivosCargados,PoseeAdjuntos},
        success: function(respuesta){
            window.Swal.fire("Exito!", "Cotización guardada exitosamente bajo el número "+respuesta, "success").then(function() {
            limpiarOrdenCompra();
            });
        },error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });
}



function GuardarActualizarOrdenPedido(){

    $(".error").removeClass("error");
    var depto = $("#GenOrdenPedido_Dpto").val();
    var mpio = $("#GenOrdenPedido_Mpio").val();
    var contrato = $("#GenOrdenPedido_contrato").val();
    var fechasol = $("#GenOrdenPedido_fecha").val();
    var direccion = $("#GenOrdenPedido_DirFinal").html();
    var solicitante = $("#GenOrdenPedido_Solicitante").val();
    var cedula = $("#GenOrdenPedido_identificacion").val();
    var telefono = $("#GenOrdenPedido_Telf").val();
    var cargo = $("#GenOrdenPedido_Cargo").val();
    var Resp = "NO";

    if(depto=="Ninguno"){
        $("#GenOrdenPedido_Dpto").addClass("error");
        Resp = "SI";
    }


    if(mpio=="Ninguno"){
        $("#GenOrdenPedido_Mpio").addClass("error");
        Resp = "SI";
    }


    if(contrato=="Ninguno"){
        $("#GenOrdenPedido_contrato").addClass("error");
        Resp = "SI";
    }


    if(!fechasol){
        $("#GenOrdenPedido_fecha").addClass("error");
        Resp = "SI";
    }


    if(!direccion){
        $("#GenOrdenPedido_DirFinal").addClass("error");
        Resp = "SI";
    }

    if(!solicitante){
        $("#GenOrdenPedido_Solicitante").addClass("error");
        Resp = "SI";
    }

    if(!cedula){
        $("#GenOrdenPedido_identificacion").addClass("error");
        Resp = "SI";
    }


    if(!telefono){
        $("#GenOrdenPedido_Telf").addClass("error");
        Resp = "SI";
    }


    if(!cargo){
        $("#GenOrdenPedido_Cargo").addClass("error");
        Resp = "SI";
    }


    if(Resp=="SI"){
        window.toastr.error("Algunos campos obligatorios estan vacios, favor verificar");
        return false;
    }

    if(!Material.length>0){
        window.toastr.error("Debe agregar al menos un material a la orden!");
        $("#tbl_DetalleOrdenPedido").addClass("error");
        return false;
    }

    var PoseeAdjuntos = "NO";

    if(ArchivosCargados.length>0){
        PoseeAdjuntos = "SI";
    }

    $.ajax({
        url: 'Pedidos.php',
        type: 'POST',
        data:{opcion:"GuardarActualizarOrdenPedido",depto:depto,mpio:mpio,contrato:contrato,fechasol:fechasol,direccion:direccion,solicitante:solicitante,cedula:cedula,telefono:telefono,cargo:cargo,Material:Material,ArchivosCargados:ArchivosCargados,PoseeAdjuntos,OrdenPedidoEditar:OrdenPedidoEditar},
        success: function(respuesta){
            window.Swal.fire("Exito!", "Cotización Actualizada exitosamente!", "success").then(function() {
            limpiarOrdenCompra();
            RegresarOrdenPedido();
            });
        },error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });
}



function limpiarOrdenCompra() {
    Material = [];
    CargarElementosOrdenPedido();
    $("#GenOrdenPedido_Dpto").val("Ninguno");
    $("#GenOrdenPedido_Mpio").val("Ninguno");
    $("#GenOrdenPedido_contrato").val("Ninguno");
    $("#GenOrdenPedido_fecha").val("");
    $("#GenOrdenPedido_DirFinal").html("");
    $("#GenOrdenPedido_Solicitante").val("");
    $("#GenOrdenPedido_identificacion").val("");
    $("#GenOrdenPedido_Telf").val("");
    $("#GenOrdenPedido_Cargo").val("");
    $("#GenOrdenPedido_NMaterial").val("");
    $("#GenOrdenPedido_Und").val("");
    $("#GenOrdenPedido_CantMaterial").val("");
    $("#CrearContrato_archivo").val("");
    $("#tipo_via").val("Ninguno");
    $("#Numero1").val("");
    $("#Letra").val("Ninguno");
    $("#Bis_1").val("Ninguno");
    $("#Numero2").val("");
    $("#Letra2").val("");
    $("#Cardinalidad").val("Ninguno");
    $("#vivienda").val("Ninguno");
    $("#Numero3").val("");
    $("#Otro").val("");
    $("#DireccionResultante").html("");
    $("#btn_Agr_Material_OP").attr("disabled","true");
    $("#btn_Agr_Material_OP").addClass("btn_inactivo");
}


function eliminarElementoPorNombre(nombre) {
    for (var i = 0; i < Material.length; i++) {
        if (Material[i].Elemento === nombre) {
            Material.splice(i, 1);
            window.toastr.success("Elemento eliminado exitosamente!");
            CargarElementosOrdenPedido()
            return true; // Indicar que se eliminó el elemento
        }
    }
    return false; // Indicar que no se encontró el elemento
}


function GenerarOrdenPedidoExcel(OrdenPedido){


    $.ajax({
        url: 'Pedidos.php',
        type: 'POST',
        data:{opcion:"CargarEditarOrdenPedido",OrdenPedidoEditar:OrdenPedido,IdMpio:$("#GenOrdenPedido_Mpio").val()},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            var workbook = XLSX.utils.book_new();
            var sheetData = [
              ['FECHA DE SOLICITUD', datos[0]['FechaSol']],
              ['MUNICIPIO/PROYECTO', datos[0]['Mpio_Nombre']],
              ['DIRECCIÓN DE ENTREGA', datos[0]['Direccion']],
              ['CONVENIO/CONTRATO', datos[0]['CONTRATO_NUMERO_VIVA']],
              ['NOMBRE DE QUIEN SOLICITA', datos[0]['Solicitante']],
              ['CEDULA/NIT', datos[0]['Cedula']],
              ['TELÉFONO', datos[0]['Telefono']],
              ['CARGO', datos[0]['Cargo']]
            ];

            var worksheet = XLSX.utils.aoa_to_sheet(sheetData);
            var mergeCell = { s: { r: 0, c: 0 }, e: { r: 0, c: 2 } };
            worksheet['!merges'] = [mergeCell];
            worksheet['A1'].v = 'COTIZACIÓN DE MATERIALES'; // Agregar el texto en la celda combinada

            XLSX.utils.book_append_sheet(workbook, worksheet, 'CargaMasiva');

            var sheetData2 = [['Elemento', 'Unidad', 'Cantidad']];

            for (var i = 0; i < datos[0]['Materiales'].length; i++) {
              var rowData = [datos[0]['Materiales'][i]['Material'], datos[0]['Materiales'][i]['Unidad'], datos[0]['Materiales'][i]['Cantidad']];
              sheetData2.push(rowData);
            }

            var worksheet2 = XLSX.utils.aoa_to_sheet(sheetData2);
            XLSX.utils.book_append_sheet(workbook, worksheet2, 'Elementos Cargados');


            

            var sheetData2 = [['Archivo', 'Tamaño']];

            for (var i = 0; i < datos[0]['Adjuntos'].length; i++) {
              var rowData = [datos[0]['Adjuntos'][i]['NOMBRE_ARCHIVO'], datos[0]['Adjuntos'][i]['SIZE']];
              sheetData2.push(rowData);
            }

            var worksheet2 = XLSX.utils.aoa_to_sheet(sheetData2);
            XLSX.utils.book_append_sheet(workbook, worksheet2, 'ArchivosAdjuntados');



            var workbookOutput = XLSX.write(workbook, { type: 'binary' });
            var buf = new ArrayBuffer(workbookOutput.length);
            var view = new Uint8Array(buf);
            for (var i = 0; i < workbookOutput.length; i++) {
              view[i] = workbookOutput.charCodeAt(i) & 0xFF;
            }
            var blob = new Blob([buf], { type: 'application/octet-stream' });
            saveAs(blob, 'Cotizacion_' + datos[0]['NumeroOrdenPedido'] + '.xlsx');

        },error: function(){
            window.toastr.error('Error al cargar las opciones');
        }
    });

}
function BuscarOrdenPedido(){

    var IdContrato = $("#GenOrdenPedido_contrato").val();
    var IdMpio = $("#GenOrdenPedido_Mpio").val();
    var Ingresado = $("#OPP_Num_Cotizacion").val();


    if(Ingresado.length>3){


        if(IdContrato=="Ninguno"){

            $("#OPP_Num_Cotizacion_ListaCotizacion").html('<li class="list-group-item">Debe escoger un contrato</li>').show();

        }else{

        var NumerosOpp = [];
        $.each(OrdenesPedidoCargadas, function(index, cotizacion) {
          NumerosOpp.push('"' + cotizacion.NumeroOrdenPedido + '"');
        });

        var numerosCotizacionString = NumerosOpp.join(',');


            $.ajax({
                url: 'Pedidos.php',
                type: 'POST',
                data:{opcion:"BuscarOrdenPedido",IdContrato:IdContrato,IdMpio:IdMpio,Ingresado:Ingresado,numerosCotizacionString:numerosCotizacionString},
                success: function(respuesta){
                    var html = '';
                    if(respuesta.trim()!="NO"){
                        var datos = JSON.parse(respuesta);
                        if(datos.length>0){
                            for (var i = 0; i < datos.length; i++) {
                                html+='<li class="list-group-item" onclick="AgregarOPPFactura(\''+datos[i].Id+'\',\''+datos[i].Numero_Orden_Pedido+'\',\''+datos[i].FechaOrdenPedido+'\')" >'+datos[i].Numero_Orden_Pedido+'</li>';
                            }
                        }
                        $("#OPP_Num_Cotizacion_ListaCotizacion").html(html).show();
                    }else{
                        $("#OPP_Num_Cotizacion_ListaCotizacion").html('<li class="list-group-item">No hay datos que mostrar</li>').show();
                    }
                },
                error: function(){
                     window.toastr.warning('Error al cargar las opciones');
                }
            });
        }
    }else{
        $("#OPP_Num_Cotizacion_ListaCotizacion").hide();
    }
}



function BuscarCotizacion(){

    var IdContrato = $("#GenOrdenPedido_contrato").val();
    var IdMpio = $("#GenOrdenPedido_Mpio").val();
    var Ingresado = $("#OPP_Num_Cotizacion").val();


    if(Ingresado.length>3){


        if(IdContrato=="Ninguno"){

            $("#OPP_Num_Cotizacion_ListaCotizacion").html('<li class="list-group-item">Debe escoger un contrato</li>').show();

        }else{

        var numerosCotizacion = [];
        $.each(CotizacionesCargadas, function(index, cotizacion) {
          numerosCotizacion.push('"' + cotizacion.NumeroCotizacion + '"');
        });

        var numerosCotizacionString = numerosCotizacion.join(',');


            $.ajax({
                url: 'Pedidos.php',
                type: 'POST',
                data:{opcion:"CargarCotizaciones",IdContrato:IdContrato,IdMpio:IdMpio,Ingresado:Ingresado,numerosCotizacionString:numerosCotizacionString},
                success: function(respuesta){
                    var html = '';
                    if(respuesta.trim()!="NO"){
                        var datos = JSON.parse(respuesta);
                        if(datos.length>0){
                            for (var i = 0; i < datos.length; i++) {
                                html+='<li class="list-group-item" onclick="AgregarCotizacionOPP(\''+datos[i].Id+'\',\''+datos[i].NumeroCotizacion+'\',\''+datos[i].FechaCotizacion+'\')" >'+datos[i].NumeroCotizacion+'</li>';
                            }
                        }
                        $("#OPP_Num_Cotizacion_ListaCotizacion").html(html).show();
                    }else{
                        $("#OPP_Num_Cotizacion_ListaCotizacion").html('<li class="list-group-item">No hay datos que mostrar</li>').show();
                    }
                },
                error: function(){
                     window.toastr.warning('Error al cargar las opciones');
                }
            });
        }
    }else{
        $("#OPP_Num_Cotizacion_ListaCotizacion").hide();
    }
}

function AgregarCotizacionOPP(PId,PNumeroCotizacion,ParFechaCotizacion){
    $("#OPP_Num_Cotizacion_ListaCotizacion").html("").hide();
    $("#OPP_Num_Cotizacion").val(PNumeroCotizacion);
    NumeroCotizacion = PNumeroCotizacion;
    IdNumeroCotizacion = PId;
    FechaCotizacion = ParFechaCotizacion;
}


function AgregarOPPFactura(PId,PNumeroCotizacion,ParFechaCotizacion){
    $("#OPP_Num_Cotizacion_ListaCotizacion").html("").hide();
    $("#OPP_Num_Cotizacion").val(PNumeroCotizacion);
    NumeroCotizacion = PNumeroCotizacion;
    IdNumeroCotizacion = PId;
    FechaCotizacion = ParFechaCotizacion;
}

function EliminarOrdenPedido(ParIdOrden){
    for (var i = 0; i < OrdenesPedidoCargadas.length; i++) {
        if(ParIdOrden == OrdenesPedidoCargadas[i]['Id'] ){
            OrdenesPedidoCargadas.splice(i,1);
        }
    }
    MostrarOPPCargados();
    ActualizarSaldosOpp();
    Material = [];
    for (var i = 0; i < OrdenesPedidoCargadas.length; i++) {
        var detalles = OrdenesPedidoCargadas[i]['DetallesCargado']
        for (var j = 0; j < detalles.length; j++) {
            var materialExistente = Material.find(m => m.Material === detalles[j]['Material']);
            if (!materialExistente) {
                Material.push({ 'Material': detalles[j]['Material'], 'Precio': detalles[j]['Precio'] });
            }  
        }       
    }
}

function AgregarOrdenPedido() {
    $(".error").removeClass("error");

    if (NumeroCotizacion && $("#OPP_Num_Cotizacion").val() ) {
        $("#OPP_Num_Cotizacion").val("");
        $.ajax({
            url: 'Pedidos.php',
            type: 'POST',
            data: {opcion: "CargarMontosOrdenesPedidos", NumOpp: NumeroCotizacion},
            success: function(respuesta) {
                var datos = JSON.parse(respuesta);
                if (datos.length > 0) {
                    var detalles = [];
                    var saldoreportdo = 0;
                    for (var i = 0; i < datos.length; i++) {
                        detalles.push({
                            'proveedor': datos[i]['proveedor'],
                            'Cantidad': datos[i]['Cantidad'],
                            'subtotal': datos[i]['subtotal'],
                            'CantidadReportada': datos[i]['CantidadReportada'],
                            'Motivo': datos[i]['Motivo'],
                            'Material': datos[i]['Material'],
                            'Precio': datos[i]['Precio'],
                            'SaldoReportado': datos[i]['SaldoReportado']
                        });

                        var materialExistente = Material.find(m => m.Material === datos[i]['Material']);
                        if (!materialExistente) {
                            Material.push({ 'Material': datos[i]['Material'], 'Precio': datos[i]['Precio'] });
                        }
                    }

                    /*if (saldoreportdo > 0) {
                        window.Swal.fire("Advertencia!", "Esta Orden de Pedido Presenta saldos pendites por concepto de Materiales reportados, de continuar se descontará de la orden el monto " + formatearMonto(saldoreportdo) + ", por dicho concepto!", "warning");
                    }*/

                    OrdenesPedidoCargadas.push({'Id': IdNumeroCotizacion, 'NumeroOrdenPedido': NumeroCotizacion, 'Contrato': $("#GenOrdenPedido_contrato").val(), 'Convenio': $("#GenOrdenPedido_contrato option:selected").text(), 'FechaCotizacion': FechaCotizacion, "DetallesCargado": detalles , "MontoOrden": ""});

                    MostrarOPPCargados();
                }
            }
        });
    } else {
        $("#OPP_Num_Cotizacion").addClass("error");
        window.toastr.error("Debe escoger una Orden de Pedido primero!");
    }
}

function AdicionarElementoNotaCredito() {
    $(".error").removeClass("error");
    if($("#GenOrdenPedidoNC_Material").val()=="Ninguno"){
        $("#GenOrdenPedidoNC_Material").addClass("error");
    }


    NotaCredito.push({"Material":$("#GenOrdenPedidoNC_Material").val(),"PrecioOriginal":$("#GenOrdenPedidoNC_Precio").val(),"NroOrdenCredito":$("#GenOrdenPedidoNC_NroOrdenCredito").val(),"Cantidad":$("#GenOrdenPedidoNC_Cantidad").val()});  

    var tabla = $('#Tbl_NotaCreditoFactura').DataTable();
    tabla.clear().draw();
    if(NotaCredito.length>0){
        for (var i = 0; i < NotaCredito.length; i++) {
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+NotaCredito[i].NroOrdenCredito+'</center>',
              '<center>'+NotaCredito[i].Material+'</center>',
              '<center>'+NotaCredito[i].Cantidad+'</center>',
              '<center>'+NotaCredito[i].PrecioOriginal+'</center>'
              ]).draw();
        }
    }
    ActualizarSaldosOpp();
}

function AdicionarNotaCredito(){
    var html = "<option value='Ninguno'>Seleccione</option>";
    for(var i = 0; i < Material.length;i++){
        html+="<option precio='"+Material[i]['Precio']+"' value='"+Material[i]['Material']+"'>"+Material[i]['Material']+"</option>";
    }
    $("#GenOrdenPedidoNC_Material").html(html);
    $("#btn_modal_AddNotaCredito").click();
}

function CargarPrecioMaterialNC() {
    for(var i = 0; i < Material.length;i++){
        if(Material[i]['Material']==$("#GenOrdenPedidoNC_Material").val()){
            $("#GenOrdenPedidoNC_Precio").val(Material[i]['Precio']);
        }
    }
}

function AgregarCotizacionOrdenPedido(){
    $(".error").removeClass("error");
    if(NumeroCotizacion){
        CotizacionesCargadas.push({'Id':IdNumeroCotizacion,'NumeroCotizacion':NumeroCotizacion,'Contrato':$("#GenOrdenPedido_contrato").val(),'Depto':$("#GenOrdenPedido_Dpto option:selected").text(),'Mpio':$("#GenOrdenPedido_Mpio option:selected").text(),'Convenio':$("#GenOrdenPedido_contrato option:selected").text(),'FechaCotizacion':FechaCotizacion,"MaterialCargado":[]});
        MostrarCotizacionesCargadas();
        $("#OPP_Num_Cotizacion").val("");

        $.ajax({
          url: 'Pedidos.php',
          type: 'POST',
          data: {opcion: "CargarMaterialesCotizacion", NumeroCotizacion: NumeroCotizacion},
          success: function(respuesta) {
            var datos = JSON.parse(respuesta);
            if (datos.length > 0) {

              for (var i = 0; i < datos.length; i++) {
                var resultado = "";
                if(Material.length>0){
                    resultado = existeDatoEnArray(Material, datos[i].Material, datos[i].Precio);
                }

                if ( resultado ) {
                    //recorro materiales para ubicar el elemento q se esta agregando
                    for (var a = 0; a < Material.length; a++) {
                        if (datos[i].Material == Material[a].Material && datos[i].Precio == Material[a].Precio) {
                             Material[a].Cantidad = parseInt(Material[a].Cantidad) + parseInt(datos[i].Cantidad);
                        }
                    }
                }else{
                    Material.push({
                      'NumeroCotizacion': datos[i].NumeroCotizacion,
                      'Material': datos[i].Material,
                      'Cantidad': datos[i].Cantidad,
                      'Unidad': datos[i].Unidad,
                      'Precio': datos[i].Precio,
                      'proveedor': datos[i].proveedor,
                      'IdProveedor': datos[i].IdProveedor,
                      'mpio': datos[i].mpio
                    }); 
                }


                for (var a = 0; a < CotizacionesCargadas.length; a++) {
                    if(CotizacionesCargadas[a].NumeroCotizacion == datos[i].NumeroCotizacion){
                        CotizacionesCargadas[a].MaterialCargado.push({
                          'NumeroCotizacion': datos[i].NumeroCotizacion,
                          'Material': datos[i].Material,
                          'Cantidad': datos[i].Cantidad,
                          'Unidad': datos[i].Unidad,
                          'Precio': datos[i].Precio,
                          'proveedor': datos[i].proveedor,
                          'mpio': datos[i].mpio
                        }); 
                    }
                }
              }
              MostrarElementosCargados();
            }
          }
        });
    }else{
        $("#OPP_Num_Cotizacion").addClass("error");
        window.toastr.error("Debe escoger una cotización primero!");
    }
}

function MostrarElementosCargados() {
    var tabla = $('#tbl_CotizacionesMaterialesAgregados').DataTable();
    tabla.clear().draw();
    var SaldoComprometidoTemporal = 0;
    if(Material.length>0){
        $("#OPP_Flst_Mat_Agg").show(100);
        for (var i = 0; i < Material.length; i++) {
            SaldoComprometidoTemporal+= parseFloat(parseInt(Material[i].Cantidad) * parseFloat( Material[i].Precio) ); 
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+Material[i].proveedor+'</center>',
              '<center>'+Material[i].Material+'</center>',
              '<center>'+Material[i].Unidad+'</center>',
              '<center>'+Material[i].Cantidad+'</center>',
              '<center>'+ formatearMonto( Material[i].Precio)+'</center>',
              '<center>'+ formatearMonto( parseInt(Material[i].Cantidad) * parseFloat( Material[i].Precio) )+'</center>'
              ]).draw();
        }
        $('[data-toggle="tooltip"]').tooltip();
    }else{
         $("#OPP_Flst_Mat_Agg").hide(100);
    }

    $(".total .Comprometido").html( formatearMonto( parseFloat(SaldoComprometidoTemporal)    + parseFloat(SaldoComprometido) ) );
    $(".total .OrdenActual").html( formatearMonto(SaldoComprometidoTemporal) );
    validarSaldosComprometidosTemporal(parseFloat(SaldoComprometidoTemporal)+ parseFloat(SaldoComprometido));
}

function MostrarOPPCargados() {
    var tabla = $('#tbl_CotizacionesOrdenPedido').DataTable();
    tabla.clear().draw();
    if(OrdenesPedidoCargadas.length>0){
        for (var i = 0; i < OrdenesPedidoCargadas.length; i++) {
           tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+OrdenesPedidoCargadas[i].NumeroOrdenPedido+'</center>',
              '<center>'+OrdenesPedidoCargadas[i].Convenio+'</center>',
              '<center>'+OrdenesPedidoCargadas[i].FechaCotizacion+'</center>',
              '<center>'+BuscarMontoOpp(OrdenesPedidoCargadas[i].Id)+'</center>',          
              '<center><button type="button" class="btn_transparente" data-toggle="tooltip" title="Detalle de Orden de Pedido" onclick=\'DetalleOpp("' + OrdenesPedidoCargadas[i].Id + '")\' ><i class="fa-solid fa-rectangle-list"></i></button></center>',
              '<center><button type="button" class="btn_transparente" data-toggle="tooltip" title="ELiminar Orden de Pedido" onclick=\'EliminarOrdenPedido(\"' + OrdenesPedidoCargadas[i].Id + '\")\' ><i class="fa-regular fa-trash-can"></i></button></center>']).draw();
        }
        $('[data-toggle="tooltip"]').tooltip();
    }
    ActualizarSaldosOpp();
}

function ActualizarSaldosOpp(){

    var saldo = 0;
    var liberar = 0;
    for (var i = 0; i < OrdenesPedidoCargadas.length; i++) {
        var SaldoOrden = 0;
        for (var detalle of OrdenesPedidoCargadas[i]['DetallesCargado']) {
            saldo += parseFloat(detalle.subtotal - detalle.SaldoReportado);
            SaldoOrden+= parseFloat(detalle.subtotal - detalle.SaldoReportado);
            liberar += parseFloat(detalle.SaldoReportado);
        }
        OrdenesPedidoCargadas[i]["MontoOrden"] = SaldoOrden;
    }

    var SaldoNotaCredito = 0;

    for (var i = 0; i < NotaCredito.length; i++) {
        SaldoNotaCredito+= parseFloat(NotaCredito[i]["PrecioOriginal"])*parseFloat(NotaCredito[i]["Cantidad"]);
    }

    SaldoActual= parseFloat(saldo);

    SaldoLiberar=parseFloat(liberar);

    $(".NotasCredito").html(formatearMonto(SaldoNotaCredito));

    $(".FacturaActual").html(formatearMonto(SaldoActual - SaldoNotaCredito));

    $(".Comprometido").html(formatearMonto(SaldoComprometido - SaldoActual));

    $(".Disponible").html(formatearMonto(saldoDisponible - ((SaldoComprometido + SaldoActual) )) );
}


function GuardarFactura() {
   
    $(".error").removeClass("error");
    var NroContrato = $("#GenOrdenPedido_contrato").val();
    var Depto = $("#GenOrdenPedido_Dpto").val();
    var Mpio = $("#GenOrdenPedido_Mpio").val();
    var Observaciones = $("#OPP_Observaciones").val();
    var Resp = "NO";

    if(Depto=="Ninguno"){
        $("#GenOrdenPedido_Dpto").addClass("error");
        Resp = "SI";
    }

    if(Mpio=="Ninguno"){
        $("#GenOrdenPedido_Mpio").addClass("error");
        Resp = "SI";
    }  

    if(NroContrato=="Ninguno"){
        $("#GenOrdenPedido_contrato").addClass("error");
        Resp = "SI";
    }  

    if(Resp=="SI"){
        window.toastr.error("Faltan campos obligatorios!");
        return false;
    }else{

        if (OrdenesPedidoCargadas.length<1) {
            window.toastr.error("Debe Agregar al menos una orden de pedido para poder facturar");
        }

        $.ajax({
            url: 'Pedidos.php',
            type: 'POST',
            data: {opcion: "GuardarFactura", NroContrato: NroContrato , Depto: Depto , Mpio : Mpio , Observaciones:Observaciones , OrdenesPedidoCargadas: OrdenesPedidoCargadas, NotaCredito:NotaCredito },
            success: function(respuesta) {

                Pedidos_Factura_Nota_Credito = [];
                NotaCredito = [];
                OrdenesPedidoCargadas = [];
                SaldoComprometido = "";
                SaldoFacturado = "";
                saldoDisponible = "";
                SaldoActual = 0;
                SaldoLiberar =0;
                $("#GenOrdenPedido_contrato").val("Ninguno");
                $("#GenOrdenPedido_Dpto").val("Ninguno");
                $("#GenOrdenPedido_Mpio").val("Ninguno");
                $("#OPP_Observaciones").val("");
                $("#div_saldos_contrato").hide();
                MostrarOPPCargados();
                ActualizarSaldosOpp();
                var tabla = $('#tbl_CotizacionesOrdenPedidos').DataTable();
                tabla.clear().draw();

                var tabla2 = $('#Tbl_NotaCreditoFactura').DataTable();
                tabla2.clear().draw();

                window.Swal.fire("Exito!","La factura quedo almacenada con el nro.: "+respuesta,"success");
            }
        });
    }
}



function BuscarMontoOpp(ParIdOrden) {
    var saldo = 0;
    for (var i = 0; i < OrdenesPedidoCargadas.length; i++) {
        if (OrdenesPedidoCargadas[i]['Id'] == ParIdOrden) {
            saldo = 0;
            for (var detalle of OrdenesPedidoCargadas[i]['DetallesCargado']) {
                saldo += parseFloat(detalle.subtotal - detalle.SaldoReportado);
            }
            break;
        }
    }
    return formatearMonto(saldo);
}

function DetalleOpp(ParIdOrden){
    for (var i = 0; i < OrdenesPedidoCargadas.length; i++) {
       if(OrdenesPedidoCargadas[i].Id == ParIdOrden){
            $("#NumOppTitulo").html(OrdenesPedidoCargadas[i]['NumeroOrdenPedido']);
            var tabla = $('#tbl_DetalleOrdenPedido').DataTable();
            tabla.clear().draw();
            var pos = 0;
            for(var detalle of OrdenesPedidoCargadas[i]['DetallesCargado']){
                pos++;
                var total = (parseFloat(detalle.Precio)*parseInt(detalle.Cantidad)) - (parseFloat(detalle.Precio)*parseInt(detalle.CantidadReportada)) ;
                tabla.row.add([
                  '<center>'+parseInt(pos)+'</center>',
                  '<center>'+detalle.proveedor+'</center>',
                  '<center>'+detalle.Material+'</center>',
                  '<center>'+detalle.Cantidad+'</center>',
                  '<center>'+formatearMonto(detalle.Precio)+'</center>',
                  '<center>'+formatearMonto(parseFloat(detalle.Precio)*parseInt(detalle.Cantidad))+'</center>',
                  '<center>'+detalle.CantidadReportada+'</center>',
                  '<center>'+detalle.Motivo+'</center>',
                  '<center>'+ formatearMonto( parseFloat(detalle.Precio)*parseInt(detalle.CantidadReportada) ) +'</center>',
                  '<center>'+ formatearMonto(parseFloat(total) ) +'</center>']).draw();
            }
            $("#btn_modal_AddElement").click();
       }
    }
}

function validarSaldosComprometidosTemporal(saldotemporal){
    if (saldotemporal>saldoDisponible){
        window.Swal.fire("Advertencia!","En caso de proceder la orden tal como esta, el saldo comprometido superará el disponible, por ende no se permitirá finalizar la orden en el estado actual","warning");
        $("#Btn_Guardar_OrdenPedido").attr("disabled","true");
        $("#Btn_Guardar_OrdenPedido").addClass("btn_inactivo");
        $(".total .Disponible").addClass("montoerror");
    }else{
        $("#Btn_Guardar_OrdenPedido").removeAttr("disabled");
        $("#Btn_Guardar_OrdenPedido").removeClass("btn_inactivo");
        $(".total .Disponible").removeClass("montoerror");

    }
    $(".total .Disponible").html( formatearMonto( parseFloat(saldoDisponible - saldotemporal ) ) );
}

function MostrarCotizacionesCargadas(){

    var tabla = $('#tbl_CotizacionesOrdenPedido').DataTable();
    tabla.clear().draw();
    if(CotizacionesCargadas.length>0){
        $("#GenOrdenPedido_Dpto").attr("disabled","true");
        $("#GenOrdenPedido_Mpio").attr("disabled","true");
        $("#GenOrdenPedido_contrato").attr("disabled","true");
        for (var i = 0; i < CotizacionesCargadas.length; i++) {
            tabla.row.add([
              '<center>'+parseInt(i+1)+'</center>',
              '<center>'+CotizacionesCargadas[i].NumeroCotizacion+'</center>',
              '<center>'+CotizacionesCargadas[i].Depto+'</center>',
              '<center>'+CotizacionesCargadas[i].Mpio+'</center>',
              '<center>'+CotizacionesCargadas[i].Convenio+'</center>',          
              '<center><button type="button" class="btn_transparente" data-toggle="tooltip" title="ELiminar Cotización" onclick=\'eliminarCotizacionPorNumero("' + CotizacionesCargadas[i].NumeroCotizacion + '")\' ><i class="fa-regular fa-trash-can"></i></button></center>']).draw();
        }
        $('[data-toggle="tooltip"]').tooltip();
    }else{
        $("#GenOrdenPedido_Dpto").removeAttr("disabled");
        $("#GenOrdenPedido_Mpio").removeAttr("disabled");
        $("#GenOrdenPedido_contrato").removeAttr("disabled");
    }
}


function GenerarOrdenPedidoResumen(){

    if(CotizacionesCargadas.length>0){
        $.ajax({
          url: 'Pedidos.php',
          type: 'POST',
          data: {opcion: "GenerarOrdenPedidoResumen", depto: $("#GenOrdenPedido_Dpto").val() , mpio: $("#GenOrdenPedido_Mpio").val(), contrato: $("#GenOrdenPedido_contrato").val() , CotizacionesCargadas:CotizacionesCargadas , Material:Material,Obervaciones:$("#OPP_Observaciones").val()},
          success: function(respuesta) {
                NumeroOrdenPedidoProveedor = respuesta.trim();
                $(".btn_div_Generar").show();
                $(".btn_div_Add button").attr("disabled","true");
                $("#tbl_CotizacionesOrdenPedido button").attr("disabled","true");
                $("#tbl_CotizacionesOrdenPedido button").addClass("btn_inactivo");
                $("#OPP_Num_Cotizacion").attr("disabled","true");
                $("#OPP_Observaciones").attr("disabled","true");
                window.Swal.fire("Exito!","Se almacena exitosamente la orden con número: "+respuesta.trim()+", ya puede descargar los soportes!","success");
           
          }
        });  
    }else{
        window.toastr.error("Debe agregar al menos una cotizacion para generar la orden de pedido");
    }
}

function eliminarCotizacionPorNumero(ParNumeroCotizacion) {
  for (var i = 0; i < CotizacionesCargadas.length; i++) {
    if (CotizacionesCargadas[i].NumeroCotizacion === ParNumeroCotizacion) {
      var materialesCotizacion = CotizacionesCargadas[i].MaterialCargado;

      // Ajustar las cantidades en el array Materiales
      for (var j = 0; j < materialesCotizacion.length; j++) {
        var materialCotizacion = materialesCotizacion[j];

        for (var k = 0; k < Material.length; k++) {
          var material = Material[k];

          if (
            materialCotizacion.Material === material.Material &&
            materialCotizacion.Precio === material.Precio
          ) {
            material.Cantidad -= parseInt(materialCotizacion.Cantidad);

            // Si la cantidad restante es 0, eliminar el elemento de Material
            if (material.Cantidad === 0) {
              Material.splice(k, 1);
            }

            break;
          }
        }
      }
      MostrarElementosCargados();
      CotizacionesCargadas.splice(i, 1);
      window.toastr.success("Cotización eliminada exitosamente!");
      MostrarCotizacionesCargadas();
      return true; // Indicar que se eliminó el elemento
    }
  }
  return false; // Indicar que no se encontró el elemento
}


function CargarOrdenPedidoReporte(ParNumero_Orden_Pedido){
    NumeroOrdenPedidoProveedor = ParNumero_Orden_Pedido;

    $.ajax({
          url: 'Pedidos.php',
          type: 'POST',
          data: {opcion: "CargarOrdenPedidoReporte", OrdenPedidoEditar:ParNumero_Orden_Pedido},
          success: function(respuesta) {
            var datoOP = JSON.parse(respuesta);
            CotizacionesCargadas =[];
            Material = [];

            for (var i = 0; i < datoOP.length; i++) {

                CotizacionesCargadas.push({'Id':datoOP[i]['Numero_Cotizacion'],'NumeroCotizacion':datoOP[i]['Numero_Cotizacion'],'Contrato':datoOP[i]['IdContrato'],'Depto':datoOP[i]['ID_DEPTO'],'Mpio':datoOP[i]['ID_MUNICIPIO'],'NDepto':datoOP[i]['depto'],'NMpio':datoOP[i]['mpio'],'Convenio':datoOP[i]['Convenio'],'FechaCotizacion':datoOP[i]['FechaSol'],"MaterialCargado":datoOP[i]['Materiales']});
               
                $.ajax({
                  url: 'Pedidos.php',
                  type: 'POST',
                  async:false,
                  data: {opcion: "CargarMaterialesCotizacion", NumeroCotizacion: datoOP[i]['Numero_Cotizacion']},
                  success: function(respuesta) {
                var datos = JSON.parse(respuesta);
                if (datos.length > 0) {

                  for (var i = 0; i < datos.length; i++) {
                    var resultado = "";
                    if(Material.length>0){
                        resultado = existeDatoEnArray(Material, datos[i].Material, datos[i].Precio);
                    }

                    if ( resultado ) {
                        //recorro materiales para ubicar el elemento q se esta agregando
                        for (var a = 0; a < Material.length; a++) {
                            if (datos[i].Material == Material[a].Material && datos[i].Precio == Material[a].Precio) {
                                 Material[a].Cantidad = parseInt(Material[a].Cantidad) + parseInt(datos[i].Cantidad);
                            }
                        }
                    }else{
                        Material.push({
                          'NumeroCotizacion': datos[i].NumeroCotizacion,
                          'Material': datos[i].Material,
                          'Cantidad': datos[i].Cantidad,
                          'Unidad': datos[i].Unidad,
                          'Precio': datos[i].Precio,
                          'proveedor': datos[i].proveedor,
                          'IdProveedor': datos[i].IdProveedor,
                          'mpio': datos[i].mpio
                        }); 
                    }


                    for (var a = 0; a < CotizacionesCargadas.length; a++) {
                        if(CotizacionesCargadas[a].NumeroCotizacion == datoOP[i].NumeroCotizacion){
                            CotizacionesCargadas[a].MaterialCargado.push({
                              'NumeroCotizacion': datos[i].NumeroCotizacion,
                              'Material': datos[i].Material,
                              'Cantidad': datos[i].Cantidad,
                              'Unidad': datos[i].Unidad,
                              'Precio': datos[i].Precio,
                              'proveedor': datos[i].proveedor,
                              'mpio': datos[i].mpio
                            }); 
                        }
                    }
                  }
                  
                }
              }
            });
            }
            GenerarExcelOrdenPedidoResumen();
        }
    });  
} 


function GenerarExcelOrdenPedidoResumen() {
      
    var workbook = XLSX.utils.book_new();
    var sheetData = [['', '', '', '', '', '', ''],
      ['Departamento', $("#GenOrdenPedido_Dpto option:selected").text().trim()!="Seleccione" ? $("#GenOrdenPedido_Dpto option:selected").text(): CotizacionesCargadas[0]['NDepto'] ],
      ['Municipio', $("#GenOrdenPedido_Mpio option:selected").text().trim()!="Seleccione" ? $("#GenOrdenPedido_Mpio option:selected").text(): CotizacionesCargadas[0]['NMpio']],
      ['Contrato', $("#GenOrdenPedido_contrato option:selected").text().trim()!="Seleccione" ? $("#GenOrdenPedido_contrato option:selected").text(): CotizacionesCargadas[0]['Convenio']],
      ['Cotización', 'Fecha']
    ];

    for (var i = 0; i < CotizacionesCargadas.length; i++) {
      var rowData = [CotizacionesCargadas[i]['NumeroCotizacion'], CotizacionesCargadas[i]['FechaCotizacion']];
      sheetData.push(rowData);
    }

    var worksheet = XLSX.utils.aoa_to_sheet(sheetData);
    var mergeCell = { s: { r: 0, c: 0 }, e: { r: 0, c: 5 } };
    worksheet['!merges'] = [mergeCell];
    worksheet['A1'].v = 'Resumen Orden de Pedido Nro. '+NumeroOrdenPedidoProveedor; // Agregar el texto en la celda combinada
    XLSX.utils.book_append_sheet(workbook, worksheet, 'Cotizaciones'); // Agregar la hoja al libro de trabajo

    /*************** Inicio proveedor *******************/

    // Crear una hoja de datos vacía
    var sheetData2 = [['Material', 'Precio', 'Unidad', 'Cantidad']];

    for (var i = 0; i < Material.length; i++) {
        var rowData = [Material[i]['Material'], Material[i]['Precio'], Material[i]['Unidad'], Material[i]['Cantidad']];

        // Verificar si la hoja del proveedor ya existe
        var sheetName = Material[i]['proveedor'].replaceAll(" ","_");
        var worksheet = workbook.Sheets[sheetName];

        if (worksheet) {
          // Si la hoja del proveedor existe, agregar la fila al final de la hoja
          var range = XLSX.utils.sheet_add_aoa(worksheet, [rowData], { origin: -1 });
        } else {
            // si no existe creo la hoja
          XLSX.utils.book_append_sheet(workbook, worksheet, Material[i]['proveedor'].replaceAll(" ","_"));

          // Si la hoja del proveedor no existe, crear una nueva hoja y agregar los datos
          var newWorksheet = XLSX.utils.aoa_to_sheet(sheetData2);
          workbook.Sheets[sheetName] = newWorksheet;

          // Agregar la fila de datos al final de la hoja
          XLSX.utils.sheet_add_aoa(newWorksheet, [rowData], { origin: -1 });
        }
    }

    /*************** Fin Proveedor *******************/

    var workbookOutput = XLSX.write(workbook, { type: 'binary' });
    var buf = new ArrayBuffer(workbookOutput.length);
    var view = new Uint8Array(buf);
    for (var i = 0; i < workbookOutput.length; i++) {
      view[i] = workbookOutput.charCodeAt(i) & 0xFF;
    }
    var blob = new Blob([buf], { type: 'application/octet-stream' });
    saveAs(blob, 'ResumenOrdendePedido_'+NumeroOrdenPedidoProveedor+'.xlsx');
}


function CargarSaldoContratos(){
    var contrato = $("#GenOrdenPedido_contrato").val();
    $.ajax({
        url: 'Pedidos.php',
        type: 'POST',
        data:{opcion:"CargarSaldoContratos",contrato:contrato},
        success: function(respuesta){
            var datos = JSON.parse(respuesta);
            SaldoComprometido = datos[0]['Comprometido'];
            SaldoFacturado = datos[0]['Facturado'];
            saldoDisponible = datos[0]['Disponible'];
            $(".total .Comprometido").html(formatearMonto( datos[0]['Comprometido']) );
            $(".total .facturado").html( formatearMonto(datos[0]['Facturado']) );
            $(".total .Disponible").html( formatearMonto( parseFloat(datos[0]['Disponible'] - (parseFloat( datos[0]['Comprometido'])   + parseFloat(datos[0]['Facturado'])  ) ) ) );
            $("#div_saldos_contrato").show(500);
        }
    });
}

function GenerarPlantillaOrdenPedido() {

    if($("#ProveedorListaPrecio_Proveedor").val()){

        $.ajax({
            url: 'Pedidos.php',
            type: 'POST',
            data:{opcion:"GenerarPlantillaOrdenPedido",IdProveedor:IdProveedor,idMpio:$("#GenOrdenPedido_Mpio").val()},
            success: function(respuesta){

                var datos = JSON.parse(respuesta);
                var workbook = XLSX.utils.book_new();
                var sheetData = [['', '', '', '', '', '', ''],
                  ['Proveedor', datos[0]['Nombre']],
                  ['IdProveedor', datos[0]['Id']],
                  ['Cedula/Nit', datos[0]['Nit']],
                  ['Municipio', datos[0]['Municipio']],
                  ['IdMpio', datos[0]['IdMpio']],
                  ['Dirección', datos[0]['Direccion']],
                  ['Teléfono', datos[0]['Telefono']],
                  ['Material','Unidad','Precio','Cantidad a Pedir']
                ];

                for (var i = 0; i < datos[0]['Materiales'].length; i++) {
                  var rowData = [datos[0]['Materiales'][i]['Elemento'],datos[0]['Materiales'][i]['Unidad'], formatearMonto(datos[0]['Materiales'][i]['Precio'])];
                  sheetData.push(rowData);
                }

                var worksheet = XLSX.utils.aoa_to_sheet(sheetData);
                var mergeCell = { s: { r: 0, c: 0 }, e: { r: 0, c: 5 } };
                worksheet['!merges'] = [mergeCell];
                worksheet['A1'].v = 'PLANTILLA DE CARGA DE MATERIALES PARA COTIZACIÓN'; // Agregar el texto en la celda combinada
                XLSX.utils.book_append_sheet(workbook, worksheet, 'CargaMasiva');
                var workbookOutput = XLSX.write(workbook, { type: 'binary' });
                var buf = new ArrayBuffer(workbookOutput.length);
                var view = new Uint8Array(buf);
                for (var i = 0; i < workbookOutput.length; i++) {
                  view[i] = workbookOutput.charCodeAt(i) & 0xFF;
                }
                var blob = new Blob([buf], { type: 'application/octet-stream' });
                saveAs(blob, 'CargaOrdenPedido_'+$("#ProveedorListaPrecio_Proveedor").val().replaceAll(' ','_')+'.xlsx');

            },error: function(){
                window.toastr.error('Error al cargar las opciones');
            }
        });
    }else{
        window.toastr.error("Debe escoger un Proveedor!");
        $("#ProveedorListaPrecio_Proveedor").addClass("error");
    }
}


function s2ab(s) {
    var buf = new ArrayBuffer(s.length);
    var view = new Uint8Array(buf);
    for (var i = 0; i < s.length; i++) {
        view[i] = s.charCodeAt(i) & 0xFF;
    }
    return buf;
}


function existeDatoEnArray(array, material, precio) {
  for (var i = 0; i < array.length; i++) {
    if (array[i].Material === material && array[i].Precio === precio) {
      return true;
    }
  }
  return false;
}
