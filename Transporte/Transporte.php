<?php
extract($_POST);
require_once("../Seguridad/conex.php");
require_once("../funciones_generales.php");
switch($opcion){
	case 'GuardarSolicitudServicio':
	
		if($MpioOrigen!="Ninguno" && $FechaSalida && $HoraSalida && $Pernocta!="Ninguno" && $MpioDestino!="Ninguno" && $Fechallegada && $Proceso!= "Ninguno" &&  $Contrato && $TipoVehiculo && $ObjetoViaje && $CantPasajeros  ){

			$HoraSalida = $HoraSalida ? $HoraSalida : "";
			$DestinoObserv = $DestinoObserv ? $DestinoObserv : "";
			$CantDias = $CantDias ? $CantDias : "0";

			$Campos = ["MpioOrigen","FechaSalida","HoraSalida","MpioDestino","ObservacionesDestino","FechaRegreso","Proceso","Convenio","ObjetoViaje","CantPersonas","CantDias" ,"TipoVehiculo" , "Pernocta"];
			$Valores = [$MpioOrigen,$FechaSalida , $HoraSalida , $MpioDestino , $DestinoObserv , $Fechallegada , $Proceso , $Contrato , $ObjetoViaje , $CantPasajeros , $CantDias, $TipoVehiculo ,$Pernocta ];
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

			if(isset($Invitados) && count($Invitados)>0){
				for ($i=0; $i < count($Invitados) ; $i++) { 
					$Campos = ["Id_Servicio","Servidor","Telefono","Direccion","Identificacion"];
					$Valores = [$IdServicio , $Invitados[$i]['Servidor'], $Invitados[$i]['Telefono'], $Invitados[$i]['PuntoRecogida'], $Invitados[$i]['Identificacion']];
					$Tabla = "trans_invitados_movilizados";
					$MensajeLog1 = "Se registra invitados de la solicitud de servicio de transporte ".$Invitados[$i]['Servidor'];
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}
			echo $IdServicio;
		}
	break;
	case 'EliminarServicio':
		$Campos = ["Estado"];
		$Valores = [ "Cancelado"];
		$Tabla = "trans_servicios";
		$MensajeLog1 = "Se Cancela el Servicio del Id ".$Id;
		funciones_generales_BDActualizarDatos($Id,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;
	case 'ConfirmarEliminarServicioEnlace':
		$Campos = ["Estado","MotivoCancelacion","ObservacionCancelacion"];
		$Valores = [ "Cancelado",$Motivo,$Observacion];
		$Tabla = "trans_servicios";
		$MensajeLog1 = "Se Cancela el Servicio del Id ".$Id;
		funciones_generales_BDActualizarDatos($Id,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;
	case 'FinalizarServicio':
		$Campos = ["FechaFinReal","HoraFinReal","ObservacionFin","Estado"];
		$Valores = [ $FechaFin , $HoraFin , $ObservacionFin , "Terminado" ];
		$Tabla = "trans_servicios";
		$MensajeLog1 = "Se Finaliza el Servicio del Id ".$IdServicio;
		funciones_generales_BDActualizarDatos($IdServicio,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;
	case 'AplicarUnificacion':
		
		if(count($ServiciosUnificados)>1){	
			$IdPPal = "";
			for ($i=0; $i < count($ServiciosUnificados) ; $i++) { 
				if ($i==0) {
					$IdPPal = $ServiciosUnificados[$i]["Id"];

					$Campos = ["Unificado_Con"];
					$Valores = [$ServiciosUnificados[$i]["Id"]];
					$Tabla = "trans_servicios";
					$MensajeLog1 = "Se define como ppl el Servicio ".$ServiciosUnificados[$i]["Id"];
					funciones_generales_BDActualizarDatos($ServiciosUnificados[$i]["Id"],$Campos,$Valores,$Tabla,$MensajeLog1);

				}else{
					$Campos = ["Unificado_Con"];
					$Valores = [$IdPPal];
					$Tabla = "trans_servicios";
					$MensajeLog1 = "Se unifica el Servicio ".$ServiciosUnificados[$i]["Id"]." con el servicio de Id ".$IdPPal;
					funciones_generales_BDActualizarDatos($ServiciosUnificados[$i]["Id"],$Campos,$Valores,$Tabla,$MensajeLog1);
				}		
			}
			echo "OK";		
		}


	break;
	case 'AplicarCambiosServicio':

		$OtroDestino = $OtroDestino!="NO" ? $OtroDestino : "";
		$Campos = ["MpioDestino","ObservacionesDestino","Placas","Conductor","TelefonoConductor","TipoVehiculo"];
		$Valores = [$mpioDest,$OtroDestino,$Placa,$NombreConductor,$TelefonoConductor , $TipoVehiculo];
		$Tabla = "trans_servicios";
		$MensajeLog1 = "Se Edita el Destino del Servicio del Id ".$Id;
		funciones_generales_BDActualizarDatos($Id,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;	
	case 'CargarServicios':
		$con = conectar();
		$filtro = "";

		if($mpio!="Ninguno"){
			$filtro.=" and MpioDestino = ".$mpio; 
		}

		if($Placa!="Ninguno"){
			$filtro.=" and Placas = '".$Placa."'"; 
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

		if($TipoContrato!="Ninguno"){
			$filtro.=" and a.TipoServicio = ".$TipoContrato; 
		}

		$sql = "SELECT a.ID, DATE_FORMAT(a.FechaSalida, '%d/%m/%Y' ) FechaSalida, DATE_FORMAT(a.FechaRegreso, '%d/%m/%Y' ) FechaRegreso, DATEDIFF(a.FechaRegreso, CURDATE()) AS DiasDiferencia,
	       	b.nombre AS mpio, IFNULL(c.Nombre, 'No Definido') AS TipoServicio, a.Convenio, d.NOMBRE AS proceso,
	       	a.Estado, a.Pernocta, ifnull(a.Placas,'Ninguno') Placas, e.Nombre  TipoVehiculo,e.Id IdTipoVehiculo, a.CantDias AS dias, a.CantPersonas AS personas , a.MpioDestino , a.ObservacionesDestino OtrosDestinos, a.UsuarioCreacion
			FROM trans_servicios a
			INNER JOIN cfg_municipios b ON a.MpioDestino = b.id
			LEFT JOIN trans_tipo_servicio c ON c.ID = a.TipoServicio
			INNER JOIN cfg_areas_depto d ON d.ID = a.Proceso
			left JOIN trans_tipo_vehiculo e ON e.ID = a.TipoVehiculo
			WHERE a.ACTIVO='1' ".$filtro."
			ORDER BY a.FechaSalida asc, a.FechaRegreso DESC";
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
				    "IdTipoVehiculo" => $datos['IdTipoVehiculo'],
				    "Pernocta" => $datos['Pernocta'],
				    "DiasFaltante" => $datos['DiasDiferencia'],
				    "MpioDestino" => $datos['MpioDestino'],
				    "OtrosDestinos" => $datos['OtrosDestinos'],
				    "Convenio" => $datos['Convenio'],
				    "Placas" => $datos['Placas'],
				    "proceso" => $datos['proceso'],
				    "UsuarioCreacion" => $datos['UsuarioCreacion'],
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
	case 'CargarServiciosSolicitante':
		$con = conectar();
		$filtro = " and a.UsuarioCreacion ='".$Usuario."'";

		if($mpio!="Ninguno"){
			$filtro.=" and MpioDestino = ".$mpio; 
		}

		if($Placa!="Ninguno"){
			$filtro.=" and Placas = '".$Placa."'"; 
		}

		if($TVehiculo!="Ninguno"){
			$filtro.=" and TipoVehiculo = '".$TVehiculo."'"; 
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

		$sql = "SELECT a.ID, DATE_FORMAT(a.FechaSalida, '%d/%m/%Y' ) FechaSalida, DATE_FORMAT(a.FechaRegreso, '%d/%m/%Y' ) FechaRegreso, DATEDIFF(a.FechaSalida, CURDATE()) AS DiasDiferencia,
	       	b.nombre AS mpio, IFNULL(c.Nombre, 'No Definido') AS TipoServicio, a.Convenio, d.NOMBRE AS proceso,
	       	a.Estado, a.Pernocta, ifnull(a.Placas,'No Definido') Placas, e.Nombre  TipoVehiculo,e.Id IdTipoVehiculo, a.CantDias AS dias, a.CantPersonas AS personas , a.MpioDestino , a.ObservacionesDestino OtrosDestinos, a.UsuarioCreacion , ifnull(a.Conductor,'No Definido') Conductor , ifnull(a.TelefonoConductor,'No Definido') TelefonoConductor
			FROM trans_servicios a
			INNER JOIN cfg_municipios b ON a.MpioDestino = b.id
			LEFT JOIN trans_tipo_servicio c ON c.ID = a.TipoServicio
			INNER JOIN cfg_areas_depto d ON d.ID = a.Proceso
			left JOIN trans_tipo_vehiculo e ON e.ID = a.TipoVehiculo
			WHERE a.ACTIVO='1' ".$filtro."
			ORDER BY a.FechaSalida asc, a.FechaRegreso DESC";
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
				    "IdTipoVehiculo" => $datos['IdTipoVehiculo'],
				    "Placas" => $datos['Placas'],
				    "Conductor" => $datos['Conductor'],
				    "TelefonoConductor" => $datos['TelefonoConductor'],
				    "mpio" => $datos['mpio'],
				    "TipoServicio" => $datos['TipoServicio'],
				    "Pernocta" => $datos['Pernocta'],
				    "DiasFaltante" => $datos['DiasDiferencia'],
				    "MpioDestino" => $datos['MpioDestino'],
				    "OtrosDestinos" => $datos['OtrosDestinos'],
				    "Convenio" => $datos['Convenio'],
				    "proceso" => $datos['proceso'],
				    "UsuarioCreacion" => $datos['UsuarioCreacion'],
				    "Estado" => $datos['Estado'],
				    "TipoVehiculo" => $datos['TipoVehiculo'],
				    "dias" => $datos['dias'],
				    "personas" => $datos['personas'],
				    "Pasajeros" => TraerMovilizados($datos['ID']),
				    "Invitados" => TraerInvitados($datos['ID'])
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'CargarInformeServicio':

		$Result = [];

		$temporal = trans_servicios_efectivos($mes,$anio);
	/*	if(count($temporal)>0){
			array_push($Result,"trans_servicios_efectivos" => $temporal);
		}*/


		$temporal = trans_servicios_efectivos_cancelado($mes,$anio);
		/*if(count($temporal)>0){
			array_push($Result,"trans_servicios_efectivos_cancelado" => $temporal);
		}*/


		if(count($Result)>0){
			echo json_encode($resultados);
		}else{
			echo "NO";
		}
	break;
	case 'MostrarCantidadContrato':
		$con = conectar();
		$sql = "SELECT count(a.ID) cantidad , b.TipoContrato
			from trans_tipo_contrato b left join  trans_servicios a on a.TipoServicio = b.ID
			and a.FechaSalida >= ( SELECT a1.FechaSalida FROM trans_servicios a1 WHERE a1.Id = ".$IdPeticion." ) 
			and a.FechaSalida <= ( SELECT a1.FechaRegreso FROM trans_servicios a1 WHERE a1.Id = ".$IdPeticion." )
			GROUP BY b.ID";
			#echo $sql;
		$query = mysqli_query($con,$sql);
		$resultados = [];
		mysqli_close($con);
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "TipoContrato" => $datos['TipoContrato'],
				    "cantidad" => $datos['cantidad'] ? $datos['cantidad'] : 0 
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'MostrarDetallesConductor':
		$con = conectar();
		$sql = "SELECT  a.Placas,ifnull(COUNT(a.Placas),0) cantidad 
			from trans_vehiculo a 
			INNER JOIN trans_servicios b ON a.Placas = b.Placas
			WHERE b.FechaSalida >= ( SELECT a1.FechaSalida FROM trans_servicios a1 WHERE a1.Id = ".$IdPeticion." ) 
			and b.FechaSalida <= ( SELECT a1.FechaRegreso FROM trans_servicios a1 WHERE a1.Id = ".$IdPeticion." )
			and b.Placas = '".$Placa."'
			GROUP BY a.Placas";
			#echo $sql;
		$query = mysqli_query($con,$sql);
		$resultados = [];
		mysqli_close($con);
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Placas" => $datos['Placas'],
				    "cantidad" => $datos['cantidad'] ? $datos['cantidad'] : 0 
				));
			}
		}else{
			array_push($resultados, array(
				"Placas" => $Placa,
			    "cantidad" => 0 
			));
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
		$sql = "SELECT a.Id,DATE_FORMAT(a.FechaSalida, '%d/%m/%Y' ) FechaSalida, a.HoraSalida ,DATE_FORMAT(a.FechaRegreso, '%d/%m/%Y' ) FechaRegreso, orig.nombre 'MpioOrigen', dest.nombre 'MpioDestino',a.CantDias,a.CantPersonas,a.Convenio , b.NOMBRE Proceso , c.Nombre TipoVehiculo , a.Pernocta , a.ObservacionesDestino , a.ObjetoViaje, a.UsuarioCreacion , ifnull((SELECT count(a1.Id) FROM trans_invitados_movilizados a1 WHERE a1.Id_Servicio = a.ID),0) CantidadInvitados from trans_servicios a, cfg_municipios orig, cfg_municipios dest , cfg_areas_depto b , trans_tipo_vehiculo c WHERE a.ACTIVO = '1' and a.Estado = 'Autorizado' and c.Id = a.TipoVehiculo and orig.id = a.MpioOrigen and dest.id = a.MpioDestino and b.ID = a.Proceso and ( a.Unificado_Con is NULL or a.Unificado_Con = a.ID ) ORDER BY a.FechaSalida";
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
				    "Pernocta" => $datos['Pernocta'],
				    "MpioDestino" => $datos['MpioDestino'],
				    "CantidadInvitados" => $datos['CantidadInvitados'],
				    "CantDias" => $datos['CantDias'],
				    "CantPersonas" => $datos['CantPersonas'],
				    "UsuarioCreacion" => $datos['UsuarioCreacion'],
				    "Convenio" => $datos['Convenio'],
				    "Proceso" => $datos['Proceso'],
				    "TipoVehiculo" => $datos['TipoVehiculo'],
				    "ObservacionesDestino" => $datos['ObservacionesDestino'],
				    "ObjetoViaje" => $datos['ObjetoViaje']
				    ,"Pasajeros" => TraerMovilizados($datos['Id']),
				    "Invitados" => TraerInvitados($datos['Id'])
				));
			}
		}
		echo json_encode($resultados);
	break;

	case 'CargarFinalizar':
		$con = conectar();
		$sql = "SELECT a.Id,DATE_FORMAT(a.FechaSalida, '%d/%m/%Y' ) FechaSalida, a.HoraSalida ,DATE_FORMAT(a.FechaRegreso, '%d/%m/%Y' ) FechaRegreso, orig.nombre 'MpioOrigen', dest.nombre 'MpioDestino',a.CantDias,a.CantPersonas,a.Convenio , b.NOMBRE Proceso , c.Nombre TipoVehiculo , a.Pernocta , a.ObservacionesDestino , a.ObjetoViaje, a.UsuarioCreacion , ifnull((SELECT count(a1.Id) FROM trans_invitados_movilizados a1 WHERE a1.Id_Servicio = a.ID),0) CantidadInvitados from trans_servicios a, cfg_municipios orig, cfg_municipios dest , cfg_areas_depto b , trans_tipo_vehiculo c WHERE a.ACTIVO = '1' and a.Estado = 'Asignado' and c.Id = a.TipoVehiculo and orig.id = a.MpioOrigen and dest.id = a.MpioDestino and b.ID = a.Proceso and ( a.Unificado_Con is NULL or a.Unificado_Con = a.ID ) ORDER BY a.FechaSalida";
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
				    "Pernocta" => $datos['Pernocta'],
				    "MpioDestino" => $datos['MpioDestino'],
				    "CantidadInvitados" => $datos['CantidadInvitados'],
				    "CantDias" => $datos['CantDias'],
				    "CantPersonas" => $datos['CantPersonas'],
				    "UsuarioCreacion" => $datos['UsuarioCreacion'],
				    "Convenio" => $datos['Convenio'],
				    "Proceso" => $datos['Proceso'],
				    "TipoVehiculo" => $datos['TipoVehiculo'],
				    "ObservacionesDestino" => $datos['ObservacionesDestino'],
				    "ObjetoViaje" => $datos['ObjetoViaje']
				    ,"Pasajeros" => TraerMovilizados($datos['Id']),
				    "Invitados" => TraerInvitados($datos['Id'])
				));
			}
		}
		echo json_encode($resultados);
	break;


	case 'CargarAsignados':
		$con = conectar();
		$sql = "SELECT a.Id, DATE_FORMAT(a.FechaSalida, '%d/%m/%Y') FechaSalida, a.HoraSalida, DATE_FORMAT(a.FechaRegreso, '%d/%m/%Y') FechaRegreso, orig.nombre 'MpioOrigen', dest.nombre 'MpioDestino', a.CantDias, a.CantPersonas, a.Convenio, b.NOMBRE Proceso, c.Nombre TipoVehiculo, a.Pernocta, a.ObservacionesDestino, a.ObjetoViaje, a.Conductor, a.Placas, a.UsuarioCreacion, ifnull(( SELECT count(a1.Id) FROM trans_invitados_movilizados a1 WHERE a1.Id_Servicio = a.ID ), 0 ) CantidadInvitados, IFNULL(a.Unificado_Con, 'NO') Unificado_Con FROM trans_servicios a, cfg_municipios orig, cfg_municipios dest, cfg_areas_depto b, trans_tipo_vehiculo c WHERE a.ACTIVO = '1' AND a.Estado = 'Solicitado' AND a.TipoVehiculo = c.Id AND orig.id = a.MpioOrigen AND dest.id = a.MpioDestino AND b.ID = a.Proceso AND ( a.Unificado_Con IS NULL OR a.Unificado_Con = a.ID ) ORDER BY a.FechaSalida ASC, a.FechaRegreso DESC";
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
				    "UsuarioCreacion" => $datos['UsuarioCreacion'],
				    "MpioDestino" => $datos['MpioDestino'],
				    "CantDias" => $datos['CantDias'],
				    "CantidadInvitados" => $datos['CantidadInvitados'],
				    "Pernocta" => $datos['Pernocta'],
				    "CantPersonas" => $datos['CantPersonas'],
				    "Conductor" => $datos['Conductor'],
				    "Unificado_Con" => $datos['Unificado_Con'],
				    "Placas" => $datos['Placas'],
				    "Convenio" => $datos['Convenio'],
				    "Proceso" => $datos['Proceso'],
				    "TipoVehiculo" => $datos['TipoVehiculo'],
				    "ObservacionesDestino" => $datos['ObservacionesDestino'],
				    "ObjetoViaje" => $datos['ObjetoViaje']
				    ,"Pasajeros" => TraerMovilizados($datos['Id']),
				    "Invitados" => TraerInvitados($datos['Id'])
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'AutorizarServicio':
		$con = conectar();
		$sql = "SELECT a.ID FROM trans_servicios a WHERE a.Unificado_Con = ".$Id_servicio;
		$query = mysqli_query($con,$sql);
		if(mysqli_num_rows($query)>0){
			while($dato = mysqli_fetch_assoc($query)){
				$Campos = ["TipoServicio","Costo","Estado"];
				$Valores = [$TipoServicio,$TranAutorizar_CostoVehiculo,"Autorizado"];
				$Tabla = "trans_servicios";
				$MensajeLog1 = "Se Actualiza datos de autorización";
				funciones_generales_BDActualizarDatos($dato['ID'],$Campos,$Valores,$Tabla,$MensajeLog1);
			}
		}else{	
			$Campos = ["TipoServicio","Costo","Estado"];
			$Valores = [$TipoServicio,$TranAutorizar_CostoVehiculo,"Autorizado" ];
			$Tabla = "trans_servicios";
			$MensajeLog1 = "Se Actualiza datos de autorización";
			funciones_generales_BDActualizarDatos($Id_servicio,$Campos,$Valores,$Tabla,$MensajeLog1);
		}
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
		$con = conectar();
		$sql = "SELECT a.FechaSalida, a.FechaRegreso FROM trans_servicios a WHERE a.Placas = '".$placa."' AND (SELECT FechaSalida FROM trans_servicios WHERE ID = ".$Id.") BETWEEN a.FechaSalida AND a.FechaRegreso";
		$query = mysqli_query($con,$sql);
		if (mysqli_num_rows($query)>0) {
			echo "Error";
		}else{
			$sql2 = "SELECT a.ID FROM trans_servicios a WHERE a.Unificado_Con = ".$Id;
			$query2 = mysqli_query($con,$sql2);
			if(mysqli_num_rows($query2)>0){
				while($dato = mysqli_fetch_assoc($query2)){
					$Campos = ["Placas","Conductor","TelefonoConductor","Estado"];
					$Valores = [$placa,$NombreConductor ,$TelefonoConductor,"Asignado" ];
					$Tabla = "trans_servicios";
					$MensajeLog1 = "Se registra Vehiculo aplicado a la solicitud";
					funciones_generales_BDActualizarDatos($dato['ID'],$Campos,$Valores,$Tabla,$MensajeLog1);

				}
			}else{
				$Campos = ["Placas","Conductor","TelefonoConductor","Estado"];
				$Valores = [$placa,$NombreConductor ,$TelefonoConductor,"Asignado" ];
				$Tabla = "trans_servicios";
				$MensajeLog1 = "Se registra Vehiculo aplicado a la solicitud";
				funciones_generales_BDActualizarDatos($Id,$Campos,$Valores,$Tabla,$MensajeLog1);
			}
			echo "OK";
		}
		
		mysqli_close($con);
	break;
}

function TraerInvitados($Id_servicio){
	$con = conectar();
	$sql = "SELECT a.Id,a.Servidor , a.Telefono , a.Direccion FROM trans_invitados_movilizados a WHERE a.ACTIVO = '1' and a.Id_Servicio =".$Id_servicio." ORDER BY a.Servidor";
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



function trans_servicios_efectivos($mes,$anio){

	$con = conectar();
	$sql = "SELECT a.cantidad_servicios, TipoServicio, a.NomTipoServicio, Costo FROM vw_trans_servicios_efectivos a WHERE a.Mes = $mes AND anio = $anio";
	$query = mysqli_query($con, $sql);
	$resultados = [];
	mysqli_close($con);
	$numFilas = mysqli_num_rows($query);
	if ($numFilas > 0) {
		$total_servicios = 0; 
		$total_Costos = 0; 

	    while($datos = mysqli_fetch_assoc($query)) {
	        $resultados[] = [
	            "cantidad_servicios" => $datos['cantidad_servicios'],
	            "NomTipoServicio" => $datos['NomTipoServicio'] ? $datos['NomTipoServicio'] : 0,
	            "Costo" => $datos['Costo'] ? $datos['Costo'] : 0
	        ];
	        $total_servicios+= $datos['cantidad_servicios'];
	        $total_Costos+= $datos['Costo'];
	    }
	    $resultados[] = [
            "cantidad_servicios" => $total_servicios,
            "NomTipoServicio" => "TOTAL",
            "Costo" => $total_Costos
        ];
		return $resultados;
	}else{
		return [];
	}
}



function trans_servicios_efectivos_cancelado($mes,$anio){

	$con = conectar();
	$sql = "SELECT a.Nombre,a.Cantidad_Servicio,a.Cantidad_Cancelados,a.Costo FROM vw_trans_servicios_efectivos_cancelados a WHERE a.Mes = $mes AND anio = $anio";
	$query = mysqli_query($con, $sql);
	$resultados = [];
	mysqli_close($con);
	$numFilas = mysqli_num_rows($query);
	if ($numFilas > 0) {
		$total_servicios = 0; 
		$total_Costos = 0; 
		$total_Cancelados = 0; 

	    while($datos = mysqli_fetch_assoc($query)) {
	        $resultados[] = [
	            "Cantidad_Servicio" => $datos['Cantidad_Servicio'],
	            "Cantidad_Cancelados" => $datos['Cantidad_Cancelados'],
	            "Nombre" => $datos['Nombre'] ? $datos['Nombre'] : 0,
	            "Costo" => $datos['Costo'] ? $datos['Costo'] : 0
	        ];
	        $total_servicios+= $datos['Cantidad_Servicio'];
	        $total_Costos+= $datos['Costo'];
	        $total_Cancelados+= $datos['Cantidad_Cancelados'];
	    }
	    $resultados[] = [
            "Cantidad_Cancelados" => $total_Cancelados,
            "Cantidad_Servicio" => $total_servicios,
            "Nombre" => "TOTAL",
            "Costo" => $total_Costos
        ];
		return $resultados;
	}else{
		return [];
	}
}
?>