<?php

function conectar() {
    $servername = [Tu_Servidor_DB]; // El nombre del servidor de la base de datos
    $username = [Tu_USuario_DD]; // Tu nombre de usuario de MySQL
    $password = [Clave_DB]; // Tu contraseña de MySQL
    $dbname = [Nombre_DB]; // El nombre de la base de datos a la que te quieres conectar
    $port = [Puerto_DB]; // Especifica el puerto (3306 es el predeterminado para MySQL)

    // Crear conexión
    $conn = new mysqli($servername, $username, $password, $dbname, $port);

    // Verificar si hay errores en la conexión
    if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
    }

    return $conn;
}
?>