<?php
extract($_POST);
require_once("../Seguridad/conex.php");
require_once("../funciones_generales.php");
switch ($opcion) {
	case 'GuardarUsuario':
		if($Nombre && $Apellido && $Usuario && count($Perfiles)>0){
			$con = conectar();
			$sql_val = "SELECT ID FROM usuarios WHERE USUARIO = '".$Usuario."'";
			if(mysqli_num_rows(mysqli_query($con,$sql_val)) >0){
				echo "Usuario ya existe, intente con uno diferente!";
			}else{

				$Campos = ["USUARIO","NOMBRES","APELLIDOS","CLAVE","ACTIVO"];
				$Valores = [$Usuario,$Nombre,$Apellido,hash('sha256', '123'),$Activo];
				$Tabla = "usuarios";
				$MensajeLog1 = "Se registra el usuario nuevo: ".$Usuario;
				$id = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

				for ($i=0; $i < count($Perfiles) ; $i++) { 	
					$Campos = ["ID_USUARIOS","ID_PERFIL"];
					$Valores = [$id ,$Perfiles[$i]];
					$Tabla = "USUARIOS_PERFILES";
					$MensajeLog1 = "Se registra el perfil de ID ".$Perfiles[$i]." para el usuario: ".$Usuario;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
				mysqli_close($con);
				echo "OK";
			}
		}
	break;
	case 'GuardarNuevoPerfil':
		$con = conectar();
		$sql_val = "SELECT PERFIL FROM usuarios_cfg_perfiles WHERE  PERFIL = '".$Nombre."'";
		if(mysqli_num_rows(mysqli_query($con,$sql_val)) >0){
			echo "PERFIL ya existe, intente con uno diferente!";
		}else{
			$Campos = ["PERFIL"];
			$Valores = [$Nombre];
			$Tabla = "usuarios_cfg_perfiles";
			$MensajeLog1 = "Se registra el PERFIL nuevo: ".$Nombre;
			$id = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			echo "OK";
		}
		mysqli_close($con);
	break;
	case 'GuardarNuevoMenu':

		$Formulario = $Formulario ? $Formulario : "NULL";
		$IdPadre = $IdPadre ? $IdPadre : "NULL";
		$Icono = $Icono ? $Icono : "NULL";
		$Orden = $Orden ? $Orden : "NULL";

		$con = conectar();
		$sql_val = "SELECT ID FROM menu WHERE  NOMBRE = '".$Nombre."'";
		if(mysqli_num_rows(mysqli_query($con,$sql_val)) >0){
			echo "Menú ya existe, intente con uno diferente!";
		}else{
			$Campos = ["NOMBRE","URL","ID_PADRE","ICONO","ORDEN","TITULO"];
			$Valores = [$Nombre,$Formulario,$IdPadre,$Icono,$Orden,$Nombre];
			$Tabla = "menu";
			$MensajeLog1 = "Se registra el menu nuevo: ".$Nombre;
			$id = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			echo "OK";
		}
		mysqli_close($con);
	break;	
	case 'GuardarVinculacionMenuPerfil':

		$con = conectar();
		$upd = "UPDATE menu_perfil SET ACTIVO = 0 WHERE ID_PERFIL = ".$Perfil;
		mysqli_query($con,$upd);
		for ($i=0; $i <count($idsMenuMarcados); $i++) { 
			$sql_val = "SELECT ID FROM menu_perfil WHERE ID_PERFIL = ".$Perfil." and ID_MENU = ".$idsMenuMarcados[$i] ;
			if(mysqli_num_rows(mysqli_query($con,$sql_val)) >0){
				mysqli_query($con,"UPDATE menu_perfil SET ACTIVO = 1 WHERE ID_PERFIL = ".$Perfil);
			}else{
				$Campos = ["ID_PERFIL","ID_MENU"];
				$Valores = [$Perfil,$idsMenuMarcados[$i]];
				$Tabla = "menu_perfil";
				$MensajeLog1 = "Se registra el menu nuevo: ".$idsMenuMarcados[$i];
				$id = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			}
		}
		mysqli_close($con);
		echo "OK";
	break;	
	case 'BuscarPadreMenu':
		if(isset($ingresado) && strlen($ingresado) >= 3){
			$con=conectar();
			$sql="SELECT ID,NOMBRE FROM menu WHERE ACTIVO=1 AND NOMBRE LIKE '%".$ingresado."%' order by NOMBRE ";
			$query = mysqli_query($con,$sql);
			mysqli_close($con);
			$resultados = [];
			if(mysqli_num_rows($query)>0){
				while($datos = mysqli_fetch_assoc($query)){
					array_push($resultados, array(
					    "ID" => $datos['ID'],
					    "NOMBRE" => $datos['NOMBRE']
					));
				}
			}else{
				$resultados = "NO";
			}
		}
		echo json_encode($resultados);
	break;
	case 'ListarOpcionesMenu':
		$con = conectar();
		$sql = "SELECT ID,NOMBRE,URL,ICONO,ORDEN FROM menu WHERE ACTIVO=1  ORDER BY NOMBRE";
		$query= mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "ID" => $datos['ID'],
				    "NOMBRE" => $datos['NOMBRE'],
				    "URL" => $datos['URL'],
				    "ICONO" => $datos['ICONO'],
				    "ORDEN" => $datos['ORDEN']
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'BuscarPerfil':
		$con = conectar();
		$sql = "SELECT ID,PERFIL FROM usuarios_cfg_perfiles WHERE ACTIVO=1 and PERFIL LIKE '%".$ingresado."%' ORDER BY PERFIL";
		$query= mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "ID" => $datos['ID'],
				    "PERFIL" => $datos['PERFIL']
				));
			}
		}
		echo json_encode($resultados);
	break;	
	case 'ListarOpcionesMenu':
		$con = conectar();
		$sql = "SELECT ID,NOMBRE FROM menu WHERE ACTIVO=1 ORDER BY PERFIL";
		$query= mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "ID" => $datos['ID'],
				    "NOMBRE" => $datos['NOMBRE']
				));
			}
		}
		echo json_encode($resultados);
	break;	
	case 'ListarPerfil':
		$con = conectar();
		$sql = "SELECT ID,PERFIL FROM usuarios_cfg_perfiles WHERE ACTIVO=1 ORDER BY PERFIL";
		$query= mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "ID" => $datos['ID'],
				    "PERFIL" => $datos['PERFIL']
				));
			}
		}
		echo json_encode($resultados);
	break;	
	case 'GuardarUsuarioActualizar':
		if($Nombre && $Apellido && $Usuario && count($Perfiles)>0){
			$con = conectar();
			$Campos = ["USUARIO","NOMBRES","APELLIDOS","ACTIVO"];
			$Valores = [$Usuario,$Nombre,$Apellido,$Activo];
			$Tabla = "usuarios";
			$MensajeLog1 = "Se registra el usuario nuevo: ".$Usuario;
			funciones_generales_BDActualizarDatos($IdUsuario,$Campos,$Valores,$Tabla,$MensajeLog1);

			$perfil_Viejos = [];
			#Inicio actualización de perfiles
			$sqlPerfil = "SELECT ID,ID_USUARIOS,ID_PERFIL FROM USUARIOS_PERFILES WHERE Activo = 1 and ID_USUARIOS = ".$IdUsuario;
			$query = mysqli_query($con,$sqlPerfil); 
			while ($datos=mysqli_fetch_array($query)) {
				#si se encuentra en la lista de la consulta y no en los traidos del form es porque fue removido el perfil y procedo a desactivar el permiso
				if(!in_array($datos['ID_PERFIL'], $Perfiles)){
					$Campos = ["ACTIVO"];
					$Valores = ["0"];
					$Tabla = "USUARIOS_PERFILES";
					$MensajeLog1 = "Se Actualizan los datos del usuario: ".$Usuario;
					funciones_generales_BDActualizarDatos($datos['ID'],$Campos,$Valores,$Tabla,$MensajeLog1);
				}
				array_push($perfil_Viejos,$datos['ID_PERFIL']);	
			}

			#procedo a validar si existen perfiles que esten en la lista de $Perfiles y no en $perfil_Viejos, lo que significa que son los nuevos a agregar
			$resultado = array_values(array_diff($Perfiles, $perfil_Viejos));
			//print_r($resultado );
			for ($a=0; $a < count($resultado); $a++) { 
				$Campos = ["ID_USUARIOS","ID_PERFIL"];
				$Valores = [$IdUsuario ,$resultado[$a]];
				$Tabla = "USUARIOS_PERFILES";
				$MensajeLog1 = "Se registra el perfil de ID ".$resultado[$a]." para el usuario: ".$Usuario;
				funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			}

			mysqli_close($con);
			echo "OK";
		}
	break;
	case 'GridUsuariosCargados':
		$resultados = [];
		$sql = "SELECT a.ID ,a.USUARIO , a.NOMBRES,a.APELLIDOS , if(a.ACTIVO=1,'SI','NO') ACTIVO FROM usuarios a ORDER BY a.Nombres";
		$con = conectar();
		$query = mysqli_query($con,$sql);
		mysqli_close($con);
		if(mysqli_num_rows($query)>0){
			while($datos=mysqli_fetch_array($query)){
				array_push($resultados, array(
				    "ID" => $datos['ID'],
				    "USUARIO" => $datos['USUARIO'],
				    "NOMBRES" => $datos['NOMBRES'],
				    "APELLIDOS" => $datos['APELLIDOS'],
				    "ACTIVO" => $datos['ACTIVO']
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'CargarEditarUsuario':
		$resultados = [];
		$sql = "SELECT a.ID ,a.USUARIO , a.NOMBRES,a.APELLIDOS ,a.ACTIVO Id_Estado ,if(a.ACTIVO=1,'SI','NO') ACTIVO FROM usuarios a where a.ID =".$IdUsuario;
		$con = conectar();
		$query = mysqli_query($con,$sql);
		if(mysqli_num_rows($query)>0){
			while($datos=mysqli_fetch_array($query)){
				array_push($resultados, array(
				    "ID" => $datos['ID'],
				    "USUARIO" => $datos['USUARIO'],
				    "NOMBRES" => $datos['NOMBRES'],
				    "APELLIDOS" => $datos['APELLIDOS'],
				    "Id_Estado" => $datos['Id_Estado'],
				    "Perfiles" => [],
				    "ACTIVO" => $datos['ACTIVO']
				));
			}
			for ($i=0; $i < count($resultados); $i++) { 
				$sql_perfiles = "SELECT a.ID_PERFIL FROM usuarios_perfiles a WHERE a.ACTIVO=1 and a.ID_USUARIOS = ".$resultados[$i]['ID'];
				$query_perfiles = mysqli_query($con,$sql_perfiles);
				if(mysqli_num_rows($query_perfiles)>0){
					while($datos=mysqli_fetch_array($query_perfiles)){
						array_push($resultados[$i]['Perfiles'], array(
						    "ID_PERFIL" => $datos['ID_PERFIL']
						));
					}
				}
			}
		}
		mysqli_close($con);
		echo json_encode($resultados);
	break;
	case 'RestaurarClave':
		
		if($IdUsuario){
			$Campos = ["CLAVE"];
			$Valores = [hash('sha256',strval("123") )];
			$Tabla = "usuarios";
			$MensajeLog1 = "Se Restaura la contraseña del usuario de Id: ".$IdUsuario;
			funciones_generales_BDActualizarDatos($IdUsuario,$Campos,$Valores,$Tabla,$MensajeLog1);
		}
		echo "OK";
	break;

	case 'CambiarClave':
		
		if($usuario){
			$con = conectar();
			$sql = mysqli_query($con,"SELECT ID FROM usuarios WHERE USUARIO = '".$usuario."'");
			if(mysqli_num_rows($sql)>0){
				$dato = mysqli_fetch_assoc($sql);
				$Campos = ["CLAVE"];
				$Valores = [hash('sha256',strval($password))];
				$Tabla = "usuarios";
				$MensajeLog1 = "Se Restaura la contraseña del usuario de Id: ".$usuario;
				funciones_generales_BDActualizarDatos($dato["ID"],$Campos,$Valores,$Tabla,$MensajeLog1);
			}
		}
		mysqli_close($con);
		echo "OK";
	break;

}
?>