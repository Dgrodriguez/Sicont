<!DOCTYPE html>
<html lang="es" style="height:100%">
<head>
  <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" href="img/favicon_viva.png"/>
<title>SICONT</title>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Toastr -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<!-- Bootstrap icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- DataTables JS -->
<script type="text/javascript" src="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />

<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js" ></script>
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js" ></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js" ></script>

<script src="https://cdn.jsdelivr.net/npm/file-saver@2.0.5/dist/FileSaver.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<!-- Biblioteca de DataTables Buttons -->
<script src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js"></script>
<!-- Estilos CSS de DataTables Buttons -->
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.dataTables.min.css">


<script type="text/javascript">
    window.onpageshow = function(event) {
      if (event.persisted) {
        ValidarSesion();
      }
    };
    function ValidarSesion(){
       $.ajax({
            url: "validar_sesion.php?rand=" + Math.random(),
            type: "GET",
            dataType: "json",
            success: function(respuesta) {
          
              if (respuesta.estado == "activo") {
                $("#nombre-usuario").text(respuesta.usuario);
                $("#boton-salir").show();
              } else {
               Swal.fire({
                  title: 'Sesión expirada',
                  text: 'Será redirigido a continuación',
                  icon: 'error',
                  showCancelButton: false,
                  confirmButtonColor: '#3085d6',
                  confirmButtonText: 'OK'
                }).then((result) => {
                  if (result.isConfirmed) {
                    window.location.href = 'index.php';
                  }
                });
              }
            },
            error: function() {
              $("#mensaje-error").show();
            }
          });
    } 

    document.addEventListener('pageshow', ValidarSesion);


      
</script>

</head>
<body onload="ValidarSesion()" style="overflow-x: hidden;height: 100%;" >
    <?php session_start(); ?>

