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
    CargarMenu();
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
<?php include('footer.php'); ?>