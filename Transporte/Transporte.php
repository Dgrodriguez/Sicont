<?php
extract($_POST);
require_once("../Seguridad/conex.php");
require_once("../funciones_generales.php");
switch($opcion){
	case 'GuardarSolicitudServicio':
	
		if($MpioOrigen!="Ninguno" && $FechaSalida && $HoraSalida && $MpioDestino!="Ninguno" && $Fechallegada && $Proceso!= "Ninguno" &&  $Contrato && $TipoVehiculo && $ObjetoViaje && $CantPasajeros ){

			$HoraSalida = $HoraSalida ? $HoraSalida : "";
			$DestinoObserv = $DestinoObserv ? $DestinoObserv : "";
			$CantDias = $CantDias ? $CantDias : "0";

			$Campos = ["MpioOrigen","FechaSalida","HoraSalida","MpioDestino","ObservacionesDestino","FechaRegreso","Proceso","Convenio","ObjetoViaje","CantPersonas","CantDias" ,"TipoVehiculo"];
			$Valores = [$MpioOrigen,$FechaSalida , $HoraSalida , $MpioDestino , $DestinoObserv , $Fechallegada , $Proceso , $Contrato , $ObjetoViaje , $CantPasajeros , $CantDias, $TipoVehiculo ];
			$Tabla = "trans_servicios";
			$MensajeLog1 = "Se registra solicitud de servicio de transporte para el servidor ";
			$IdServicio = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			

			if(count($Pasajeros)>0){
				for ($i=0; $i < count($Pasajeros) ; $i++) { 
					$Campos = ["Id_Servicio","Servidor","Telefono","Direccion","Identificacion"];
					$Valores = [$IdServicio , $Pasajeros[$i]['Servidor'], $Pasajeros[$i]['Telefono'], $Pasajeros[$i]['PuntoRecogida'], $Pasajeros[$i]['Identificacion']];
					$Tabla = "Trans_Servidores_Movilizados";
					$MensajeLog1 = "Se registra Servidores de la solicitud de servicio de transporte ".$Pasajeros[$i]['Servidor'];
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}
			echo "OK";
		}
	break;
	case 'CargarServicios':
		$con = conectar();

		$filtro = "";

		if($mpio!="Ninguno"){
			$filtro.=" and MpioDestino = ".$mpio; 
		}


		if($Contrato!="Ninguno"){
			$filtro.=" and Convenio = '".$Contrato."'"; 
		}


		if($TVehiculo!="Ninguno"){
			$filtro.=" and TipoVehiculo = '".$TVehiculo."'"; 
		}


		if($proceso!="Ninguno"){
			$filtro.=" and Proceso = ".$proceso; 
		}

		if($FechaIni){
			$filtro.=" and a.FechaSalida>= '".$FechaIni."'"; 
		}

		if($FechaFin){
			$filtro.=" and a.FechaSalida<= '".$FechaFin."'"; 
		}

		if($Estado!="Ninguno"){
			$filtro.=" and a.Estado = '".$Estado."' "; 
		}


		$sql = "SELECT a.ID, a.FechaSalida, a.FechaRegreso, DATEDIFF(a.FechaRegreso, CURDATE()) AS DiasDiferencia,
	       	b.nombre AS mpio, IFNULL(c.Nombre, 'No Definido') AS TipoServicio, a.Convenio, d.NOMBRE AS proceso,
	       	a.Estado, a.TipoVehiculo, a.CantDias AS dias, a.CantPersonas AS personas
			FROM trans_servicios a
			INNER JOIN cfg_municipios b ON a.MpioDestino = b.id
			LEFT JOIN trans_tipo_servicio c ON c.ID = a.TipoServicio
			INNER JOIN cfg_areas_depto d ON d.ID = a.Proceso
			WHERE a.ACTIVO='1' ".$filtro."
			ORDER BY a.FechaSalida DESC";
			#echo $sql;
		$query = mysqli_query($con,$sql);
		$resultados = [];
		mysqli_close($con);
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['ID'],
				    "FechaSalida" => $datos['FechaSalida'],
				    "FechaRegreso" => $datos['FechaRegreso'],
				    "mpio" => $datos['mpio'],
				    "TipoServicio" => $datos['TipoServicio'],
				    "DiasFaltante" => $datos['DiasDiferencia'],
				    "Convenio" => $datos['Convenio'],
				    "proceso" => $datos['proceso'],
				    "Estado" => $datos['Estado'],
				    "TipoVehiculo" => $datos['TipoVehiculo'],
				    "dias" => $datos['dias'],
				    "personas" => $datos['personas'],
				    "Pasajeros" => TraerMovilizados($datos['ID'])
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'ActualizarVehiculo':
		$con = conectar();
		$sql = "SELECT Placas,Telefono,Conductor,Tipo FROM trans_vehiculo WHERE Id = ".$Vehiculo;
		$query = mysqli_query($con,$sql);
		$resultados = [];
		$datos = mysqli_fetch_assoc($query);
		$update = "UPDATE trans_servicios SET Placas = '".$datos['Placas']."' , Conductor = '".$datos['Conductor']."' , TelefonoConductor = '".$datos['Telefono']."' , TipoVehiculo = '".$datos['Tipo']."' WHERE Id = ".$IdServicio;
		#echo $update;
		$query = mysqli_query($con,$update);		

		echo "OK";
		mysqli_close($con);

	break;
	case 'FiltrarContratoBusqueda':
		$con = conectar();
		$sql = "SELECT a.CONTRATO_NUMERO_VIVA,a.ID FROM juridica_contrato a WHERE a.ID_MUNICIPIO = $mpio order by a.CONTRATO_NUMERO_VIVA";
		$query = mysqli_query($con,$sql);
		$resultados = [];
		mysqli_close($con);
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "ID" => $datos['ID'],
				    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA']
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'AbrirDetalleAutorizar':
		
		$con = conectar();
		$sql= "SELECT ifnull(COUNT(a.FechaSalida),0) cantidad FROM trans_servicios a WHERE a.TipoServicio = 1 and  a.FechaSalida = (SELECT FechaSalida FROM  trans_servicios WHERE ID = $id_Servicio)";
		$query = mysqli_query($con,$sql);
		$dato = mysqli_fetch_assoc($query);
		if($dato['cantidad']>19){
			echo "NO";
		}else{
			echo "SI";
		}
	break;
	case 'AdicionarPasajeroTransporte':

		$Campos = ["Id_Servicio","Servidor","Telefono","Direccion","Identificacion"];
		$Valores = [$IdServicio,$nombre , $Telefono , $direccion , $identificacion ];
		$Tabla = "trans_servidores_movilizados";
		$MensajeLog1 = "Se registra solicitud de servicio de transporte para el servidor ";
		funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
		$con = conectar();
		//echo "UPDATE trans_servicios SET CantPersonas = CantPersonas + 1 WHERE ID = $IdServicio";
		mysqli_query($con, "UPDATE trans_servicios SET CantPersonas = CantPersonas + 1 WHERE ID = $IdServicio");
		mysqli_close($con);
		echo "OK";

	break;
	case 'EliminarPasajero':
		$con = conectar();
		$sql_update = "UPDATE trans_servidores_movilizados a set Activo = 0 WHERE Id_Servicio = $ParId and Id = $ParIdPersona";
		#echo $sql_update."<br>";
		$query_Update = mysqli_query($con,$sql_update);

		$sql = "SELECT a.Id,a.FechaSalida, a.HoraSalida , a.FechaRegreso, orig.nombre 'MpioOrigen', dest.nombre 'MpioDestino',a.CantDias,a.CantPersonas,a.Convenio , b.NOMBRE Proceso , a.TipoVehiculo , a.ObservacionesDestino , a.ObjetoViaje , a.Conductor , a.Placas FROM trans_servicios a, cfg_municipios orig, cfg_municipios dest , cfg_areas_depto b WHERE a.ACTIVO = '1' and  orig.id = a.MpioOrigen and dest.id = a.MpioDestino and b.ID = a.Proceso and a.Id = $ParId ";
		#echo $sql."<br>";
		mysqli_query($con, "UPDATE trans_servicios SET CantPersonas = CantPersonas - 1 WHERE ID = $ParId");

		$query = mysqli_query($con,$sql);
		$resultados = [];
		mysqli_close($con);
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				$resultados = array(
				    "Id" => $datos['Id'],
				    "FechaSalida" => $datos['FechaSalida'],
				    "HoraSalida" => $datos['HoraSalida'],
				    "FechaRegreso" => $datos['FechaRegreso'],
				    "MpioOrigen" => $datos['MpioOrigen'],
				    "MpioDestino" => $datos['MpioDestino'],
				    "CantDias" => $datos['CantDias'],
				    "CantPersonas" => $datos['CantPersonas'],
				    "Conductor" => $datos['Conductor'],
				    "Placas" => $datos['Placas'],
				    "Convenio" => $datos['Convenio'],
				    "Proceso" => $datos['Proceso'],
				    "TipoVehiculo" => $datos['TipoVehiculo'],
				    "ObservacionesDestino" => $datos['ObservacionesDestino'],
				    "ObjetoViaje" => $datos['ObjetoViaje'],
				    "Pasajeros" => TraerMovilizados($datos['Id'])
				);
			}
		}
		echo json_encode($resultados);
	break;
	case 'CargarPendientes':
		$con = conectar();
		$sql = "SELECT a.Id,a.FechaSalida, a.HoraSalida , a.FechaRegreso, orig.nombre 'MpioOrigen', dest.nombre 'MpioDestino',a.CantDias,a.CantPersonas,a.Convenio , b.NOMBRE Proceso , a.TipoVehiculo  , a.ObservacionesDestino , a.ObjetoViaje from trans_servicios a, cfg_municipios orig, cfg_municipios dest , cfg_areas_depto b WHERE a.ACTIVO = '1' and a.Estado = 'Autorizado' and orig.id = a.MpioOrigen and dest.id = a.MpioDestino and b.ID = a.Proceso ORDER BY a.FechaSalida";
		$query = mysqli_query($con,$sql);
		$resultados = [];
		mysqli_close($con);
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "FechaSalida" => $datos['FechaSalida'],
				    "HoraSalida" => $datos['HoraSalida'],
				    "FechaRegreso" => $datos['FechaRegreso'],
				    "MpioOrigen" => $datos['MpioOrigen'],
				    "MpioDestino" => $datos['MpioDestino'],
				    "CantDias" => $datos['CantDias'],
				    "CantPersonas" => $datos['CantPersonas'],
				    "Convenio" => $datos['Convenio'],
				    "Proceso" => $datos['Proceso'],
				    "TipoVehiculo" => $datos['TipoVehiculo'],
				    "ObservacionesDestino" => $datos['ObservacionesDestino'],
				    "ObjetoViaje" => $datos['ObjetoViaje']
				    ,"Pasajeros" => TraerMovilizados($datos['Id'])
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'CargarAsignados':
		$con = conectar();
		$sql = "SELECT a.Id,a.FechaSalida, a.HoraSalida , a.FechaRegreso, orig.nombre 'MpioOrigen', dest.nombre 'MpioDestino',a.CantDias,a.CantPersonas,a.Convenio , b.NOMBRE Proceso , a.TipoVehiculo , a.ObservacionesDestino , a.ObjetoViaje , a.Conductor , a.Placas FROM trans_servicios a, cfg_municipios orig, cfg_municipios dest , cfg_areas_depto b WHERE a.ACTIVO = '1' and a.Estado = 'Solicitado' and orig.id = a.MpioOrigen and dest.id = a.MpioDestino and b.ID = a.Proceso ORDER BY a.FechaSalida";
		$query = mysqli_query($con,$sql);
		$resultados = [];
		mysqli_close($con);
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "FechaSalida" => $datos['FechaSalida'],
				    "HoraSalida" => $datos['HoraSalida'],
				    "FechaRegreso" => $datos['FechaRegreso'],
				    "MpioOrigen" => $datos['MpioOrigen'],
				    "MpioDestino" => $datos['MpioDestino'],
				    "CantDias" => $datos['CantDias'],
				    "CantPersonas" => $datos['CantPersonas'],
				    "Conductor" => $datos['Conductor'],
				    "Placas" => $datos['Placas'],
				    "Convenio" => $datos['Convenio'],
				    "Proceso" => $datos['Proceso'],
				    "TipoVehiculo" => $datos['TipoVehiculo'],
				    "ObservacionesDestino" => $datos['ObservacionesDestino'],
				    "ObjetoViaje" => $datos['ObjetoViaje']
				    ,"Pasajeros" => TraerMovilizados($datos['Id'])
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'AutorizarServicio':
		$Campos = ["TipoServicio","Costo","Estado"];
		$Valores = [$TipoServicio,$TranAutorizar_CostoVehiculo,"Autorizado" ];
		$Tabla = "trans_servicios";
		$MensajeLog1 = "Se Actualiza datos de autorización";
		funciones_generales_BDActualizarDatos($Id_servicio,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	
	break;
	case 'GuardarNuevoVehiculo':
		$Campos = ["Placas","Tipo","Conductor","Telefono"];
		$Valores = [$Placas,$TipoVehiculo, $Conductor , $Telefono];
		$Tabla = "Trans_Vehiculo";
		$MensajeLog1 = "Se registra Nuevo Vehiculo";
		funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

		$con = conectar();
		$sql = "SELECT Conductor,Placas,Id from trans_vehiculo a WHERE ACTIVO = '1' ORDER BY Conductor";
		$query = mysqli_query($con,$sql);
		$resultados = [];
		mysqli_close($con);
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "Conductor" => $datos['Conductor'],
				    "Placas" => $datos['Placas']
				));
			}
		}
		echo json_encode($resultados);		
	break;
	case 'AplicarVehiculo':
		
		$Campos = ["Placas","Conductor","TelefonoConductor","Estado"];
		$Valores = [$placa,$NombreConductor ,$TelefonoConductor,"Asignado" ];
		$Tabla = "trans_servicios";
		$MensajeLog1 = "Se registra Vehiculo aplicado a la solicitud";
		funciones_generales_BDActualizarDatos($Id,$Campos,$Valores,$Tabla,$MensajeLog1);

		echo "OK";

	break;
}



function TraerMovilizados($Id_servicio){
	$con = conectar();
	$sql = "SELECT a.Id,a.Servidor , a.Telefono , a.Direccion FROM trans_servidores_movilizados a WHERE a.ACTIVO = '1' and a.Id_Servicio =".$Id_servicio." ORDER BY a.Servidor";
	$query = mysqli_query($con,$sql);
	$pasajero = [];
	mysqli_close($con);
	while($datos = mysqli_fetch_assoc($query )){
		array_push($pasajero, array(
		    "Id" => $datos['Id'],
		    "Servidor" => $datos['Servidor'],
		    "Telefono" => $datos['Telefono'],
		    "Direccion" => $datos['Direccion']
		));
	}
	return $pasajero;
}
?>