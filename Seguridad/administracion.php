<?php include('header.php'); ?>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="script.js"></script>

  <script type="text/javascript">
  $(document).ready(function() {
    $('.icono_menu').on('click', function() {
      event.stopPropagation();
      $('#menu_Content').toggleClass('active');
      $('.icono_menu').toggleClass('active');
    });

    // Evento para remover la clase 'active' del menú y del icono
    $('body').on('click', function(event) {
      $('#menu_Content').removeClass('active');
      $('.icono_menu').removeClass('active');
    });

      $('#Tbl_Alerta30Dias').DataTable({
        "language": {
          "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        "pageLength": 50,
        "lengthChange": false,
        "searching": false,
        "dom": '<"datatable-header"l>rtip',
        "drawCallback": function(settings) {
          $('div.dataTables_length').hide();
        }
      });

      $('#Tbl_Alerta15Dias').DataTable({
        "language": {
          "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        "pageLength": 50,
        "lengthChange": false,
        "searching": false,
        "dom": '<"datatable-header"l>rtip',
        "drawCallback": function(settings) {
          $('div.dataTables_length').hide();
        }
      });

      $('#Tbl_Amparos30Dias').DataTable({
        "language": {
          "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        "pageLength": 50,
        "lengthChange": false,
        "searching": false,
        "dom": '<"datatable-header"l>rtip',
        "drawCallback": function(settings) {
          $('div.dataTables_length').hide();
        }
      });

      CargarMenu();

        

    <?php  
      if(isset($_SESSION['Perfiles']) && ( in_array('Admin Contrataciones', $_SESSION['Perfiles']) )){ ?>
      ConsultarAlertas();
    <?php  }  ?>

  });
 
 $(document).ready(function() {
  $('#menu li').hover(
    function() {
      $(this).find('ul.sub-menu').addClass('active');
    },
    function() {
      $(this).find('ul.sub-menu').removeClass('active');
    }
  );
});



  </script>

   <nav class="navbar navbar-expand-lg navbar-light bg-light BarraNavEstado">
    <div class="row">
      <div class="col-sm-1 col-md-1 col-lg-1 col-xl-1"><i class="fa-solid fa-bars icono_menu"></i></div>
      <div class="col-sm-7 col-md-7 col-lg-7 col-xl-7 lblUsuario offset-sm-2 offset-md-2 offset-lg-2 offset-xl-2" id="Lbltitulo">Bienvenido!</div>
      <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 lblUsuario"><?php echo $_SESSION['Apellidos']." ".$_SESSION['Nombres']?></div>
      <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2"><a href="logout.php" class="btn-logout"> <i class="fas fa-sign-out-alt"></i> Salir </a></div>
    </div>
   </nav>
    <div class="row container" >
        <div id="menu_Content" >menu</div>
        <div id="CuerpoForm"  class="col-sm-12 col-md-12 col-lg-12 col-xl-12"> </div>   
    </div>

<button data-toggle="modal" data-target="#ModalAlertas" style="display: none;" id="btn_Modal_ModalAlertas">x</button>
<!-- Modal -->
<div class="modal fade" id="ModalAlertas" tabindex="-1" role="dialog" aria-labelledby="ModalAlertasLabel" aria-hidden="true" >
  <div class="modal-dialog modal-lg" role="document" style="width:90% !important">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalAlertasLabel">Alerta de Vencimiento del Plazo de Ejecución</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <fieldset id="div_Alerta30Dias" style="display:none;"><legend class="titulo_modal">Contratos a Vencer en los Próximos 30 días</legend>
          <div class="row" >
            <div class="col-sm-12">
              <table id="Tbl_Alerta30Dias" class="table table-striped">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Número de Contrato</th>
                    <th>Fecha de Inicio</th>
                    <th>Fecha de Fin</th>
                    <th>Tipo de Proceso</th>
                    <th>Tipo de Modalidad</th>
                    <th>Tipo de Contrato</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </fieldset>
        <br>
        <fieldset id="div_Alerta15Dias" style="display:none;"><legend class="titulo_modal">Contratos a Vencer en los Próximos 15 días</legend>
          <div class="row" >
            <div class="col-sm-12">
              <table id="Tbl_Alerta15Dias" class="table table-striped">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Número de Contrato</th>
                    <th>Fecha de Inicio</th>
                    <th>Fecha de Fin</th>
                    <th>Tipo de Proceso</th>
                    <th>Tipo de Modalidad</th>
                    <th>Tipo de Contrato</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </fieldset>
        <br>
        <fieldset id="div_AlertaAmparos" style="display:none;"><legend class="titulo_modal">Amparos a Vencer en los Próximos 30 días</legend>
          <div class="row" >
            <div class="col-sm-12">
              <table id="Tbl_Amparos30Dias" class="table table-striped">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Compañia de la Póliza</th>
                    <th>Número de Póliza</th>
                    <th>Número de Contrato</th>
                    <th>Tipo de Amparo</th>
                    <th>Fecha Inicio Amparo</th>
                    <th>Fecha Fin Amparo</th>
                    <th>Cuantia Amparo</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </fieldset>

      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-primary" onclick="MarcarAlertaComoLeido()">Marcar como Leidos</button>
        <button type="button" class="btn btn-secondary" id="btn_CerrarModal_Alertas" style="display:none;" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<?php include('footer.php'); ?>