<?php
session_start();

if (isset($_SESSION['Usuario'])) {
  $respuesta = array('estado' => 'activo', 'usuario' => $_SESSION['Usuario']);
} else {
  $respuesta = array('estado' => 'inactivo');
}

echo json_encode($respuesta);
?>
