<?php

function conectar() {
    $servername = "localhost"; // El nombre del servidor de la base de datos
    $username = "root"; // Tu nombre de usuario de MySQL
    $password = "1704"; // Tu contraseña de MySQL
    $dbname = "sicont"; // El nombre de la base de datos a la que te quieres conectar
    $port = 3307; // Especifica el puerto (3306 es el predeterminado para MySQL)

    // Crear conexión
    $conn = new mysqli($servername, $username, $password, $dbname, $port);

    // Verificar si hay errores en la conexión
    if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
    }

    return $conn;
}
?>