<?php
extract($_POST);
require_once("../Seguridad/conex.php");
require_once("../funciones_generales.php");
switch($opcion){


	case 'GuardarProveedor':
		if($Nombre && $NumeroNit && $Direccion && $NumeroTelf && $depto!="Ninguno" && $mpio!="Ninguno" ){
			$Campos = ["Nombre","Nit","Direccion","Telefono","depto","mpio"];
			$Valores = [$Nombre, $NumeroNit, $Direccion , $NumeroTelf ,$depto , $mpio ];
			$Tabla = "proveedor";
			$MensajeLog1 = "Se registra Nuevo proveedor ".$Nombre;
			$IdServicio = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			echo "OK";
		}
	break;
	case 'CargarListaProveedores':
		$con = conectar();
		$sql = "SELECT a.Nombre , a.Nit , a.Direccion , a.Telefono ,b.nombre Depto, c.nombre Mpio FROM proveedor a , cfg_departamentos b , cfg_municipios c WHERE ACTIVO = 1 and a.Depto = b.id and a.Mpio = c.id";
		$query = mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Nombre" => $datos['Nombre'],
				    "Nit" => $datos['Nit'],
				    "Direccion" => $datos['Direccion'],
				    "Telefono" => $datos['Telefono'],
				    "Depto" => $datos['Depto'],
				    "Mpio" => $datos['Mpio']
				));
			}
		}
		mysqli_close($con);
		echo json_encode($resultados);
	break;
	case 'BuscarProveedore':
		if(isset($ingresado) && strlen($ingresado) >= 3){
			$con=conectar();
			$sql="SELECT a.Nombre , a.Id from proveedor a where ACTIVO = 1 and a.Nombre like '%".$ingresado."%' ORDER BY a.Nombre ";
			$query = mysqli_query($con,$sql);
			mysqli_close($con);
			$resultados = [];
			if(mysqli_num_rows($query)>0){
				while($datos = mysqli_fetch_assoc($query)){
					array_push($resultados, array(
					    "ID" => $datos['Id'],
					    "Nombre" => $datos['Nombre']
					));
				}
			}else{
				$resultados = "NO";
			}
		}
		echo json_encode($resultados);
	break;
	case 'GuardarPrecioElemento':
		if($Elemento && $Und && $Precio && $IdProveedor && $depto!="Ninguno" && $mpio!="Ninguno" && $FechaActualizacion ){
			$Campos = ["Elemento","IdProveedor","Unidad","Precio","depto","mpio","FechaCambioPrecio"];
			$Valores = [$Elemento, $IdProveedor, $Und , $Precio ,$depto , $mpio , $FechaActualizacion ];
			$Tabla = "proveedor_Precio";
			$MensajeLog1 = "Se registra precio del elemento ".$Elemento." para el proveedor ".$IdProveedor;
			$IdServicio = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			echo "OK";
		}
	break;
	case 'CargarListaPreciosProveedor':
		
		$con=conectar();
		$sql="SELECT a.Id,a.Elemento,a.Precio , Unidad  , b.Nombre mpio, a.FechaCambioPrecio FROM proveedor_Precio a , cfg_municipios b  where a.IdProveedor = ".$ParamIdProveedor." and a.mpio = b.Id order by a.FechaCambioPrecio desc ,a.Elemento";
		$query = mysqli_query($con,$sql);
		mysqli_close($con);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "Elemento" => $datos['Elemento'],
				    "Precio" => $datos['Precio'],
				    "Unidad" => $datos['Unidad'],
				    "mpio" => $datos['mpio'],
				    "FechaCambioPrecio" => FormatatearFecha($datos['FechaCambioPrecio'])
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'TraerMpioCargaMasiva':
		
		$con=conectar();
		$sql = "SELECT nombre FROM cfg_municipios WHERE departamento_id = 1 ORDER BY nombre";
		$query = mysqli_query($con,$sql);
		mysqli_close($con);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "nombre" => $datos['nombre']
				));
			}
		}
		echo json_encode($resultados);

	break;

	case 'upload_file':
		// Ruta de la carpeta temporal
		$temp_dir = '../Temp';
		if (!file_exists($temp_dir)) {
	            mkdir($temp_dir, 0777,true);
	        }

		// Inicializar el array para los datos de los archivos cargados
		$files = [];

		// Validar que se haya enviado un archivo
		if (isset($_FILES['archivo']) && $_FILES['archivo']['size'] > 0) {
		  // Cargar el archivo y agregarlo al array de datos
		  $result = upload_file($_FILES['archivo'],  $temp_dir);
		  $temp_dir.='/'.$_FILES['archivo']['name'];
	  		array_push($files, array(
			    "Nombre" => $_FILES['archivo']['name'],
			    "Url" => $temp_dir,
			    "size" => $_FILES['archivo']['size']
			));

		}
		
		// Crear el JSON con los datos de los archivos cargados
		echo json_encode($files);

	break;


	case 'SubirCargaMasiva':
		
		if($ArchivosCargados[0]['Url']  && $IdProveedor && $FechaActualizacion ){

			echo CargarMasivaPrecioProveedor($ArchivosCargados[0]['Url'], $IdProveedor,$FechaActualizacion);

		}

	break;


}



function upload_file($file,  $temp_dir) {
  $result = array();
  $result['success'] = false;

  // Mover el archivo a la carpeta temporal
  $tmp_name = $file['tmp_name'];
  $name = $file['name'];
  $destination = $temp_dir . '/' . $name;
  move_uploaded_file($tmp_name, $destination);

  $result['success'] = true;
  $result['filename'] = $name;

  return $result;
}
