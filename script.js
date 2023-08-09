function CargarMenu() {
  $.ajax({
    url: "bases.php",
    method: "POST",
    success: function(respuesta) {
      $("#menu_Content").html(respuesta);
    },
    error: function(jqXHR, estado, error) {
      console.log("Ha ocurrido un error: " + error);
    }
  });
}

function cargarContenido($ruta,$TITULO) {
  $("#Lbltitulo").html($TITULO);
  $("#CuerpoForm").html('<object class="ObjetoContenedor" type="text/html" data="'+$ruta+'" ></object>');

}


