<?php

session_start(); // iniciamos la sesión si no está iniciada aún

session_unset(); // eliminamos todas las variables de sesión

session_destroy(); // destruimos la sesión

// redireccionamos a la página de inicio de sesión o a donde sea necesario
header("Location: index.php");
exit();


?>