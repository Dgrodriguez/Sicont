<?php
extract($_POST);

require_once("conex.php");
$con = conectar();
$base = hash('sha256',strval("123") );
$sql = mysqli_query($con,"SELECT ID,USUARIO,NOMBRES,APELLIDOS,CLAVE FROM USUARIOS WHERE USUARIO = '".$usuario."' and CLAVE ='".hash('sha256', strval($clave))."'");
#echo "SELECT ID,USUARIO,NOMBRES,APELLIDOS,CLAVE FROM USUARIOS WHERE USUARIO = '".$usuario."' and CLAVE ='".hash('sha256', strval($clave))."'";
if(mysqli_num_rows($sql)>0){
	$datos = mysqli_fetch_assoc($sql);
	session_start();
	$_SESSION['Usuario'] = $datos['USUARIO'];
	$_SESSION['Nombres'] = $datos['NOMBRES'];
	$_SESSION['Apellidos'] = $datos['APELLIDOS'];
	$_SESSION['Id_Usuario'] = $datos['ID'];
	if($datos['CLAVE']==$base){
		echo "Restaurar";
	}else{
		echo "SI";
	}
}else{
	echo "NO";
}
mysqli_close($con);
?>