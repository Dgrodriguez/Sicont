<?php

function conectar() {
	
$servername = "localhost"; // El nombre del servidor de la base de datos
$username = "root"; // Tu nombre de usuario de MySQL
$password = ""; // Tu contraseña de MySQL
$dbname = "bancomateriales"; // El nombre de la base de datos a la que te quieres conectar

 // Crear conexión
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Verificar si hay errores en la conexión
    if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
    }

    return $conn;
}
?>