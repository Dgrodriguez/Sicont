<?php
extract($_POST);
require_once("../Seguridad/conex.php");
require_once("../funciones_generales.php");

switch($opcion){
	case 'CargarDeptos':
		$con=conectar();
		$sql="SELECT a.id Id,a.nombre Nombre FROM cfg_departamentos a ORDER BY a.nombre";
		$query = mysqli_query($con,$sql);
		mysqli_close($con);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "Nombre" => $datos['Nombre']
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'EliminarContratistaDirecto':
		$Campos = ["ACTIVO"];
		$Valores = ["0" ];
		$Tabla = "juridica_contrato_contratante";
		$MensajeLog1 = "Se elimina el contratista del Id ".$Id;
		funciones_generales_BDActualizarDatos($Id,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;	
	case 'EliminarSupervisorContrato':
		$Campos = ["ACTIVO"];
		$Valores = ["0" ];
		$Tabla = "juridica_contrato_supervisor";
		$MensajeLog1 = "Se elimina el supervisor del Id ".$Id;
		funciones_generales_BDActualizarDatos($Id,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;	
	case 'CargarMunicipio':
		$con=conectar();
		$sql="SELECT a.id Id,a.nombre Nombre , ifnull(a.RetFuente,0) RetFuente FROM cfg_municipios a where departamento_id=".$depto." ORDER BY a.nombre";
		$query = mysqli_query($con,$sql);
		mysqli_close($con);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "Nombre" => $datos['Nombre'],
				    "RetFuente" => $datos['RetFuente']
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'GuardarInfoAdicionalContrato':
		
		if($IdContrato && $CrearContratoAdicionar_FechaInicio && $CrearContratoAdicionar_FechaFin && $CrearContratoAdicionar_FechaContrato && $CrearContratoAdicionar_CompromisoPresupuestal && $CrearContratoAdicionar_FechaCompromisoPresupuestal && $CrearContratoAdicionar_MontoCompromisoPresupuestal && $CrearContratoAdicionar_OrdenadorGasto && $CrearContratoAdicionar_TipoGasto && $CrearContratoAdicionar_FechaPubSecop && $CrearContratoAdicionar_linkPubSecop && $CrearContratoAdicionar_FechaPubGestTransp && $CrearContratoAdicionar_TipoPersonaContratar){

			$Campos = ["FECHA_INI","FECHA_FIN","FECHA_CONTRATO","COMPROMISO_PRESUPUESTAL","FECHA_COMPROMISO_PRESUPUESTAL","MONTO_COMPROMISO_PRESUPUESTAL","ORDENADOR_GASTO","ID_TIPO_GASTO","FECHA_PUBLICACION_SECOP","LINK_PUBLICACION_SECOP","FECHA_PUBLICACION_GEST_TRANS","TIPO_PERSONA"];

			$Valores = [$CrearContratoAdicionar_FechaInicio,$CrearContratoAdicionar_FechaFin,$CrearContratoAdicionar_FechaContrato,$CrearContratoAdicionar_CompromisoPresupuestal,$CrearContratoAdicionar_FechaCompromisoPresupuestal,FormateoInversoMonto($CrearContratoAdicionar_MontoCompromisoPresupuestal) ,$CrearContratoAdicionar_OrdenadorGasto,$CrearContratoAdicionar_TipoGasto,$CrearContratoAdicionar_FechaPubSecop,$CrearContratoAdicionar_linkPubSecop,$CrearContratoAdicionar_FechaPubGestTransp, $CrearContratoAdicionar_TipoPersonaContratar ];
			$Tabla = "JURIDICA_CONTRATO";
			$MensajeLog1 = "Se Actualiza el contrato ".$IdContrato." para adicionar información : ";
			funciones_generales_BDActualizarDatos($IdContrato,$Campos,$Valores,$Tabla,$MensajeLog1);

			if (count($ContratistasDirecto)>0 ) {
				for ($i=0; $i < count($ContratistasDirecto); $i++) { 
					$cuerpo = $ContratistasDirecto[$i]; 
					$Campos = ["Id_Contrato","NombreContratista","Identificacion","Digito_verificacion"];
					$Valores = [$IdContrato,$cuerpo['Nombre'],$cuerpo['Identificacion'],$cuerpo['Digito']];
					$Tabla = "juridica_contrato_contratante";
					$MensajeLog1 = "Se registra el Contratista para el contrato id ".$IdContrato;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
 				}
			}

			if (count($SupervisoresContrato)>0 ) {
				for ($i=0; $i < count($SupervisoresContrato); $i++) { 
					$cuerpo = $SupervisoresContrato[$i]; 

					$Campos = ["Id_Contrato","Nombre","Identificacion"];
					$Valores = [$IdContrato,$cuerpo['Nombre'],$cuerpo['Identificacion']];
					$Tabla = "juridica_contrato_supervisor";
					$MensajeLog1 = "Se registra el supervisor "+$cuerpo['Nombre']+" para el contrato id ".$IdContrato;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
 				}
			}
			echo "OK";
		}
	break;
	case 'upload_file':
		// Ruta de la carpeta temporal
		$temp_dir = '../Temp';
		if (!file_exists($temp_dir)) {
	            mkdir($temp_dir, 0777,true);
	        }

		// Tamaño máximo permitido en bytes (5MB)
		$max_size = 5 * 1024 * 1024;

		// Inicializar el array para los datos de los archivos cargados
		$files = [];

		// Validar que se haya enviado un archivo
		if (isset($_FILES['archivo']) && $_FILES['archivo']['size'] > 0) {
		  // Cargar el archivo y agregarlo al array de datos
		  $result = upload_file($_FILES['archivo'], $max_size, $temp_dir);
		  $temp_dir.='/'.$_FILES['archivo']['name'];
	  		array_push($files, array(
			    "TipoDocumento" => $tipo_documento,
			    "Nombre" => $_FILES['archivo']['name'],
			    "Url" => $temp_dir,
			    "size" => $_FILES['archivo']['size']
			));
		}
		
		// Crear el JSON con los datos de los archivos cargados
		echo json_encode($files);

	break;
	case 'BuscarContratoAdicionarInfo':
		if(isset($ingresado) && strlen($ingresado) >= 3){
			$con=conectar();
			$sql="SELECT a.ID , a.CONTRATO_NUMERO_VIVA from juridica_contrato a WHERE a.ACTIVO = 1 AND a.TIPO_PROCESO_CONTRATO IN ('ContratoDirecto','ContratoProceso') and a.CONTRATO_NUMERO_VIVA like '%".$ingresado."%' order by a.CONTRATO_NUMERO_VIVA ";
			$query = mysqli_query($con,$sql);
			mysqli_close($con);
			$resultados = [];
			if(mysqli_num_rows($query)>0){
				while($datos = mysqli_fetch_assoc($query)){
					array_push($resultados, array(
					    "ID" => $datos['ID'],
					    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA']
					));
				}
			}else{
				$resultados = "NO";
			}
		}
		echo json_encode($resultados);
	break;	
	case 'BuscarContratoPropio':
		if(isset($ingresado) && strlen($ingresado) >= 3){
			$con=conectar();
			$sql="SELECT a.ID,a.CONTRATO_NUMERO_VIVA FROM juridica_contrato a WHERE  a.CONTRATO_NUMERO_VIVA LIKE '%".$ingresado."%' and ACTIVO = 1 order by a.CONTRATO_NUMERO_VIVA ";
			$query = mysqli_query($con,$sql);
			mysqli_close($con);
			$resultados = [];
			if(mysqli_num_rows($query)>0){
				while($datos = mysqli_fetch_assoc($query)){
					array_push($resultados, array(
					    "ID" => $datos['ID'],
					    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA']
					));
				}
			}else{
				$resultados = "NO";
			}
		}
		echo json_encode($resultados);
	break;
	case 'GuardarOtroSiContrato':
		if($IdContrato && ($montoAdicionar || $nuevaFechaFin)){
			$montoAdicionar = $montoAdicionar ? $montoAdicionar : "NULL";
			$nuevaFechaFin = $nuevaFechaFin ? $nuevaFechaFin : "NULL";
			$Resp = "NO";

			if($montoAdicionar!=NULL){
				$con=conectar();
				$sql_limit = "SELECT (MONTO * 1.5) MONTO_LIMITE FROM juridica_contrato WHERE ID = ".$IdContrato;
				$query_limit = mysqli_query($con,$sql_limit);
				mysqli_close($con);
				$limite = mysqli_fetch_assoc($query_limit);
				$TotalActual = TraerMontoContrato($IdContrato) + $montoAdicionar;

				if($TotalActual>$limite['MONTO_LIMITE']){
					$Resp =  "$".number_format($limite['MONTO_LIMITE'], 2, ',', '.'); 
				}
			}

			if($Resp == "NO"){
				$Campos = ["ID_CONTRATO","MONTO","FECHA_FIN"];
				$Valores = [$IdContrato,$montoAdicionar,$nuevaFechaFin];
				$Tabla = "JURIDICA_CONTRATO_ADICION";
				$MensajeLog1 = "Se registra el Otro si para el contrato ID ".$IdContrato;
				funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				echo "OK";
			}else{
				echo $Resp;
			}
		}
	break;
	case 'MostrarInfoContrato':
		
		if (isset($IdContrato)) {
			$con=conectar();
			$sql="SELECT a.ID,a.CONTRATO_NUMERO_VIVA,a.CONTRATO_NUMERO_CONTRATANTE,a.CONTRATANTE,a.FECHA_INI,a.OBJETO_CONTRATO,a.NOMBRE_CONTACTO,a.NUMERO_CONTACTO,a.PAGOHONORARIO,a.CORREO_CONTACTO,a.POSEE_ARCHIVOS, b.nombre DEPTO , C.nombre MPIO , a.PAGOHONORARIO , ifnull(a.RETENCION,0) RetFuente FROM juridica_contrato a , cfg_departamentos b , cfg_municipios c  WHERE a.ID = ".$IdContrato." and ACTIVO = 1 and a.ID_DEPTO = b.id and c.id = a.ID_MUNICIPIO ";
			$query = mysqli_query($con,$sql);
			$resultados = [];
			if(mysqli_num_rows($query)>0){
				while($datos = mysqli_fetch_assoc($query)){
					array_push($resultados, array(
				    "ID" => $datos['ID'],
				    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA'],
				    "CONTRATO_NUMERO_CONTRATANTE" => $datos['CONTRATO_NUMERO_CONTRATANTE'] ? $datos['CONTRATO_NUMERO_CONTRATANTE'] : "",
				    "CONTRATANTE" => $datos['CONTRATANTE'],
				    "FECHA_INI" => $datos['FECHA_INI'],
				    "FECHA_FIN" => TraerFechaFinContrato($datos['ID']),
				    "MONTO" => TraerMontoContrato($datos['ID']),
				    "OBJETO_CONTRATO" => $datos['OBJETO_CONTRATO'],
				    "PAGOHONORARIO" => $datos['PAGOHONORARIO'],
				    "RetFuente" => $datos['RetFuente'],
				    "NOMBRE_CONTACTO" => $datos['NOMBRE_CONTACTO'],
				    "NUMERO_CONTACTO" => $datos['NUMERO_CONTACTO'],
				    "CORREO_CONTACTO" => $datos['CORREO_CONTACTO'],
				    "POSEE_ARCHIVOS" => $datos['POSEE_ARCHIVOS'],
				    "DEPTO" => $datos['DEPTO'],
				    "MPIO" => $datos['MPIO']
					));

					if($datos['POSEE_ARCHIVOS'] == "SI"){

						$sql_adjuntos = "SELECT a.ID , a.NOMBRE_ARCHIVO , b.Nombres TipoDocumento, a.URL,a.SIZE FROM contrato_adjuntos a , contrato_tipo_adjunto b where a.ID_JURIDICA_CONTRATO = ".$datos['ID']." and a.TIPO_DOCUMENTO = b.ID ORDER BY b.Nombres";
						$query_adjuntos = mysqli_query($con,$sql_adjuntos);
						if (mysqli_num_rows($query_adjuntos)>0) {
							$resultados[0]['Adjuntos'] = [];
							while($adjuntos = mysqli_fetch_assoc($query_adjuntos)){
								array_push($resultados[0]['Adjuntos'], array(
								    "ID" => $adjuntos['ID'],
								    "TipoDocumento" => $adjuntos['TipoDocumento'],
								    "NOMBRE_ARCHIVO" => $adjuntos['NOMBRE_ARCHIVO'],
								    "URL" => $adjuntos['URL'],
								    "SIZE" => $adjuntos['SIZE']
								));
							}
						}
					}
				}
			}
			mysqli_close($con);
			echo json_encode($resultados);
		}
	break;
	case 'SeleccionarContratoAddInfo':
		
		if (isset($IdContrato)) {
			$con=conectar();
			$sql="SELECT a.ID, a.CONTRATO_NUMERO_VIVA AS NumContrato, a.OBJETO_CONTRATO, a.SEGMENTO_CONTRATO, a.FECHA_DISPONIBILIDAD_PRESUPUESTAL, a.DISPONIBILIDAD_PRESUPUESTAL, a.MONTO_DISPONIBILIDAD_PRESUPUESTAL, a.DIRECCION, b.NOMBRE AS NombreDireccion, a.PROCESO, c.Nombre AS ProcesoNombre, a.NOMBRES_OTRAS_FUENTES, a.VALOR_OTRAS_FUENTA, a.APORTES_ESPECIE_MPIO, a.APORTES_RECURSOS_MPIO, a.APORTES_ESPECIE_VIVA, a.APORTES_RECURSOS_VIVA, a.TOTAL_APORTES, a.NRO_ACTA, a.FECHA_NRO_ACTA, a.ID_DEPTO, d.nombre AS NombreDepto, a.ID_MUNICIPIO, e.nombre AS NombreMpio, f.Nombre AS NombreModalidad, g.Nombre AS NombreTipoContrato, a.FECHA_SOLICITUD, a.ROL_JURIDICO, a.ROL_LOGISTICO, a.ROL_TECNICO, a.NUMERO_CONTACTO, a.NOMBRE_CONTACTO, a.CORREO_CONTACTO, a.TIPO_PROCESO_CONTRATO
			FROM juridica_contrato a 
			left JOIN cfg_areas_depto b ON a.DIRECCION = b.ID 
			inner JOIN cfg_areas_proceso c ON a.PROCESO = c.Id 
			inner JOIN cfg_departamentos d ON a.ID_DEPTO = d.id 
			inner JOIN cfg_municipios e ON a.ID_MUNICIPIO = e.id 
			inner JOIN juridica_contrato_tipo_modalidad f ON a.TIPO_MODALIDAD = f.Id 
			inner JOIN cfg_tipo_contrato g ON a.TIPO_CONTRATO = g.Id 
			WHERE a.ACTIVO = 1 and a.ID = ".$IdContrato;

			$query = mysqli_query($con,$sql);
			$resultados = [];
			if(mysqli_num_rows($query)>0){
				while($datos = mysqli_fetch_assoc($query)){
					array_push($resultados, array(
					    "ID" => $datos['ID'],
					    "NumContrato" => $datos['NumContrato'],
					    "OBJETO_CONTRATO" => $datos['OBJETO_CONTRATO'],
					    "SEGMENTO_CONTRATO" => $datos['SEGMENTO_CONTRATO'],
					    "FECHA_DISPONIBILIDAD_PRESUPUESTAL" => $datos['FECHA_DISPONIBILIDAD_PRESUPUESTAL'],
					    "DISPONIBILIDAD_PRESUPUESTAL" => $datos['DISPONIBILIDAD_PRESUPUESTAL'],
					    "MONTO_DISPONIBILIDAD_PRESUPUESTAL" => $datos['MONTO_DISPONIBILIDAD_PRESUPUESTAL'],
					    "DIRECCION" => $datos['DIRECCION'],
					    "NombreDireccion" => $datos['NombreDireccion'],
					    "PROCESO" => $datos['PROCESO'],
					    "TIPO_PROCESO_CONTRATO" => $datos['TIPO_PROCESO_CONTRATO'],
					    "ProcesoNombre" => $datos['ProcesoNombre'],
					    "NOMBRES_OTRAS_FUENTES" => $datos['NOMBRES_OTRAS_FUENTES'],
					    "VALOR_OTRAS_FUENTA" => $datos['VALOR_OTRAS_FUENTA'],
					    "APORTES_ESPECIE_MPIO" => $datos['APORTES_ESPECIE_MPIO'],
					    "APORTES_RECURSOS_MPIO" => $datos['APORTES_RECURSOS_MPIO'],
					    "APORTES_ESPECIE_VIVA" => $datos['APORTES_ESPECIE_VIVA'],
					    "APORTES_RECURSOS_VIVA" => $datos['APORTES_RECURSOS_VIVA'],
					    "TOTAL_APORTES" => $datos['TOTAL_APORTES'],
					    "NRO_ACTA" => $datos['NRO_ACTA'],
					    "FECHA_NRO_ACTA" => $datos['FECHA_NRO_ACTA'],
					    "ID_DEPTO" => $datos['ID_DEPTO'],
					    "NombreDepto" => $datos['NombreDepto'],
					    "ID_MUNICIPIO" => $datos['ID_MUNICIPIO'],
					    "NombreMpio" => $datos['NombreMpio'],
					    "NombreModalidad" => $datos['NombreModalidad'],
					    "NombreTipoContrato" => $datos['NombreTipoContrato'],
					    "FECHA_SOLICITUD" => $datos['FECHA_SOLICITUD'],
					    "ROL_JURIDICO" => $datos['ROL_JURIDICO'],
					    "ROL_LOGISTICO" => $datos['ROL_LOGISTICO'],
					    "ROL_TECNICO" => $datos['ROL_TECNICO'],
					    "NUMERO_CONTACTO" => $datos['NUMERO_CONTACTO'],
					    "NOMBRE_CONTACTO" => $datos['NOMBRE_CONTACTO'],
					    "CORREO_CONTACTO" => $datos['CORREO_CONTACTO'],
					    "InformacionAdicional" => CargarInformacionAdicionalContrato($datos['ID'])
					));


				}
			}
			mysqli_close($con);
			echo json_encode($resultados);
		}
	break;
	case 'CargarTipoAdjuntoContrato':
		$con=conectar();
		$sql="SELECT a.ID,a.Nombres FROM Contrato_Tipo_Adjunto a ORDER BY a.Nombres";
		$query = mysqli_query($con,$sql);
		mysqli_close($con);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['ID'],
				    "Nombre" => $datos['Nombres']
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'GuardarContratoDirecto':
	
		if($depto!="Ninguno" && $mpio!="Ninguno" && $PersonaContacto && $numero_contacto && $correo_contacto && $rol_juridico && $rol_logistico && $rol_tecnico && $FechaSolicitud && $TipoContrato && $TipoModalidad && $TipoPersona && $NroActa && $FechaNroActa && $ObjetoContrto && $SegmentoContrto && $TotalAportes && $AportesRecursosViva && $AportesEspecieViva && $AportesRecursosMpio && $AportesEspecieMpio && $ValorOtrasFuentes && $NombreOtrasFuentes && $Proceso!="Ninguno" && $DisponibilidadPresupuestal && $FechaDisponibilidadPresupuestal && $MontoDisponibilidad && $tipoProcesoContratacion && $Direccion!="Ninguno"){

			$PoseeArchivo = isset($ArchivosCargados) && count($ArchivosCargados)>0 ? "SI" : "NO";

			$Campos = ["ID_DEPTO","ID_MUNICIPIO","NOMBRE_CONTACTO","NUMERO_CONTACTO","CORREO_CONTACTO","ROL_JURIDICO","ROL_LOGISTICO","ROL_TECNICO","FECHA_SOLICITUD","TIPO_CONTRATO","TIPO_MODALIDAD","TIPO_PERSONA","NRO_ACTA","FECHA_NRO_ACTA","OBJETO_CONTRATO","SEGMENTO_CONTRATO","TOTAL_APORTES", "APORTES_RECURSOS_VIVA","APORTES_ESPECIE_VIVA" , "APORTES_RECURSOS_MPIO", "APORTES_ESPECIE_MPIO" , "VALOR_OTRAS_FUENTA" , "NOMBRES_OTRAS_FUENTES" , "PROCESO","DISPONIBILIDAD_PRESUPUESTAL","FECHA_DISPONIBILIDAD_PRESUPUESTAL","MONTO_DISPONIBILIDAD_PRESUPUESTAL" , "TIPO_PROCESO_CONTRATO","POSEE_ARCHIVOS","DIRECCION"];

			$Valores = [$depto,$mpio,$PersonaContacto,$numero_contacto,$correo_contacto,$rol_juridico,$rol_logistico,$rol_tecnico,$FechaSolicitud,$TipoContrato,$TipoModalidad,$TipoPersona,$NroActa,$FechaNroActa, $ObjetoContrto , $SegmentoContrto , $TotalAportes , $AportesRecursosViva , $AportesEspecieViva , $AportesRecursosMpio , $AportesEspecieMpio , $ValorOtrasFuentes , $NombreOtrasFuentes , $Proceso , $DisponibilidadPresupuestal , $FechaDisponibilidadPresupuestal , $MontoDisponibilidad , $tipoProcesoContratacion,$PoseeArchivo,$Direccion ];
			$Tabla = "JURIDICA_CONTRATO";
			$MensajeLog1 = "Se registra el contrato directo de tipo : ".$tipoProcesoContratacion;
			$IdContrato = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

			if (isset($ArchivosCargados) && count($ArchivosCargados) > 0) {
				for($i=0; $i < count($ArchivosCargados) ; $i++) { 

					$base = explode('.', $ArchivosCargados[$i]['NombreArchivo']);
					$formato = $base[1];
					$nuevaRuta = CargarArchivo('Contrato',"AdjuntoContrato-".$NumContratoViva."_".$i.".".$formato,$ArchivosCargados[$i]['Url'],$ArchivosCargados[$i]['NombreArchivo'],$NumContratoViva);
					$ArchivosCargados[$i]['NombreArchivo'] = "AdjuntoContrato-".$NumContratoViva."_".$i.".".$formato;
					$Campos = ["NOMBRE_ARCHIVO","ID_JURIDICA_CONTRATO","URL","SIZE","TIPO_DOCUMENTO"];
					$Valores = [$ArchivosCargados[$i]['NombreArchivo'],$IdContrato,$nuevaRuta,$ArchivosCargados[$i]['size'],$ArchivosCargados[$i]['TipoDocumento'] ];
					$Tabla = "contrato_adjuntos";
					$MensajeLog1 = "Se registra el archivo adjunto ".$ArchivosCargados[$i]['NombreArchivo']." para el contrato: ".$NumContratoViva;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}

			if (isset($ContratistasDirecto) && count($ContratistasDirecto) > 0) {
				for($i=0; $i < count($ContratistasDirecto) ; $i++) { 
					$digito = $ContratistasDirecto[$i]['Digito']!="NO" ? $ContratistasDirecto[$i]['Digito'] : "";
					$Campos = ["NombreContratista","Identificacion","Digito_verificacion","Id_Contrato"];
					$Valores = [$ContratistasDirecto[$i]['Nombre'],$ContratistasDirecto[$i]['Identificacion'],$digito,$IdContrato];
					$Tabla = "juridica_contrato_contratante";
					$MensajeLog1 = "Se registra el contratante adjunto ".$ContratistasDirecto[$i]['Nombre']." para el contrato: ".$IdContrato ;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}
			echo "OK";
		}
	break;
	case 'GuardarContratoProcesoSeleccion':
	
		if($depto!="Ninguno" && $mpio!="Ninguno" && $PersonaContacto && $numero_contacto && $correo_contacto && $rol_juridico && $rol_logistico && $rol_tecnico && $FechaSolicitud && $TipoContrato && $TipoModalidad  && $NroActa && $FechaNroActa && $ObjetoContrto && $SegmentoContrto && $TotalAportes && $AportesRecursosViva && $AportesEspecieViva && $AportesRecursosMpio && $AportesEspecieMpio && $ValorOtrasFuentes && $NombreOtrasFuentes && $Proceso!="Ninguno" && $DisponibilidadPresupuestal && $FechaDisponibilidadPresupuestal && $MontoDisponibilidad && $tipoProcesoContratacion && $Direccion!="Ninguno"){

			$PoseeArchivo = isset($ArchivosCargados) && count($ArchivosCargados)>0 ? "SI" : "NO";

			$Campos = ["ID_DEPTO","ID_MUNICIPIO","NOMBRE_CONTACTO","NUMERO_CONTACTO","CORREO_CONTACTO","ROL_JURIDICO","ROL_LOGISTICO","ROL_TECNICO","FECHA_SOLICITUD","TIPO_CONTRATO","TIPO_MODALIDAD","NRO_ACTA","FECHA_NRO_ACTA","OBJETO_CONTRATO","SEGMENTO_CONTRATO","TOTAL_APORTES", "APORTES_RECURSOS_VIVA","APORTES_ESPECIE_VIVA" , "APORTES_RECURSOS_MPIO", "APORTES_ESPECIE_MPIO" , "VALOR_OTRAS_FUENTA" , "NOMBRES_OTRAS_FUENTES" , "PROCESO","DISPONIBILIDAD_PRESUPUESTAL","FECHA_DISPONIBILIDAD_PRESUPUESTAL","MONTO_DISPONIBILIDAD_PRESUPUESTAL" , "TIPO_PROCESO_CONTRATO","POSEE_ARCHIVOS","DIRECCION"];

			$Valores = [$depto,$mpio,$PersonaContacto,$numero_contacto,$correo_contacto,$rol_juridico,$rol_logistico,$rol_tecnico,$FechaSolicitud,$TipoContrato,$TipoModalidad,$NroActa,$FechaNroActa, $ObjetoContrto , $SegmentoContrto , $TotalAportes , $AportesRecursosViva , $AportesEspecieViva , $AportesRecursosMpio , $AportesEspecieMpio , $ValorOtrasFuentes , $NombreOtrasFuentes , $Proceso , $DisponibilidadPresupuestal , $FechaDisponibilidadPresupuestal , $MontoDisponibilidad , $tipoProcesoContratacion , $PoseeArchivo, $Direccion ];
			$Tabla = "JURIDICA_CONTRATO";
			$MensajeLog1 = "Se registra el contrato por proceso de selección de tipo : ".$tipoProcesoContratacion;
			$IdContrato = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

			if (isset($ArchivosCargados) && count($ArchivosCargados) > 0) {
				for($i=0; $i < count($ArchivosCargados) ; $i++) { 

					$base = explode('.', $ArchivosCargados[$i]['NombreArchivo']);
					$formato = $base[1];
					$nuevaRuta = CargarArchivo('Contrato',"AdjuntoContrato-".$NumContratoViva."_".$i.".".$formato,$ArchivosCargados[$i]['Url'],$ArchivosCargados[$i]['NombreArchivo'],$NumContratoViva);
					$ArchivosCargados[$i]['NombreArchivo'] = "AdjuntoContrato-".$NumContratoViva."_".$i.".".$formato;
					$Campos = ["NOMBRE_ARCHIVO","ID_JURIDICA_CONTRATO","URL","SIZE","TIPO_DOCUMENTO"];
					$Valores = [$ArchivosCargados[$i]['NombreArchivo'],$IdContrato,$nuevaRuta,$ArchivosCargados[$i]['size'],$ArchivosCargados[$i]['TipoDocumento'] ];
					$Tabla = "contrato_adjuntos";
					$MensajeLog1 = "Se registra el archivo adjunto ".$ArchivosCargados[$i]['NombreArchivo']." para el contrato: ".$NumContratoViva;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}

			echo "OK";
		}
	break;
	case 'GuardarContrato':
		if($depto!="Ninguno" && $mpio!="Ninguno" && $PersonaContacto && $numero_contacto && $correo_contacto && $contratante && $NumContratoViva && $Monto && $FechaIni && $FechaFin && $objetoContrato){

			$con=conectar();
			#primero valido que el Número de contrato no este registrado ya
			$sql = "SELECT ID FROM juridica_contrato WHERE CONTRATO_NUMERO_VIVA = '".$NumContratoViva."'";
			$query = mysqli_query($con,$sql);
			#si me trae resultados es xq existe el contrato anteriormente
			if(mysqli_num_rows($query)>0){
				echo "Error";
			}else{

				#si no me trajo resultados proceso a insertar el nuevo contrato
				$NumContratoContratante = $NumContratoContratante ? $NumContratoContratante : "";
				$PoseeArchivo = isset($ArchivosCargados) && count($ArchivosCargados)>0 ? "SI" : "NO";

				$Campos = ["CONTRATO_NUMERO_VIVA","CONTRATO_NUMERO_CONTRATANTE","CONTRATANTE","FECHA_INI","FECHA_FIN","MONTO","OBJETO_CONTRATO","ID_DEPTO","ID_MUNICIPIO","NOMBRE_CONTACTO","NUMERO_CONTACTO","CORREO_CONTACTO","POSEE_ARCHIVOS","PAGOHONORARIO","RETENCION"];
				$Valores = [$NumContratoViva,$NumContratoContratante,$contratante,$FechaIni,$FechaFin,$Monto,$objetoContrato,$depto,$mpio,$PersonaContacto,$numero_contacto,$correo_contacto,$PoseeArchivo,$Honorarios,$retencion];
				$Tabla = "JURIDICA_CONTRATO";
				$MensajeLog1 = "Se registra el contrato de BVM nuevo: ".$NumContratoViva;
				$IdContrato = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

				if (isset($ArchivosCargados) && count($ArchivosCargados) > 0) {
					for($i=0; $i < count($ArchivosCargados) ; $i++) { 

						$base = explode('.', $ArchivosCargados[$i]['NombreArchivo']);
						$formato = $base[1];

						$nuevaRuta = CargarArchivo('Contrato',"AdjuntoContrato-".$NumContratoViva."_".$i.".".$formato,$ArchivosCargados[$i]['Url'],$ArchivosCargados[$i]['NombreArchivo'],$NumContratoViva);

						$ArchivosCargados[$i]['NombreArchivo'] = "AdjuntoContrato-".$NumContratoViva."_".$i.".".$formato;


						$Campos = ["NOMBRE_ARCHIVO","ID_JURIDICA_CONTRATO","URL","SIZE","TIPO_DOCUMENTO"];
						$Valores = [$ArchivosCargados[$i]['NombreArchivo'],$IdContrato,$nuevaRuta,$ArchivosCargados[$i]['size'],$ArchivosCargados[$i]['TipoDocumento'] ];
						$Tabla = "contrato_adjuntos";
						$MensajeLog1 = "Se registra el archivo adjunto ".$ArchivosCargados[$i]['NombreArchivo']." para el contrato: ".$NumContratoViva;
						funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
					}
				}
				mysqli_close($con);
				echo "OK";
			}
		}
	break;
	case 'CargarHistoricoOtroSi':	
		if($IdContrato){
			$resultados = [];
			$sql = "SELECT Ifnull(a.MONTO,'-') MONTO ,Ifnull(a.FECHA_FIN,'-') FECHA_FIN , FechaCreacion , UsuarioCreacion FROM juridica_contrato_adicion a WHERE a.ACTIVO = 1 and a.ID_CONTRATO =".$IdContrato;
			$con=conectar();
			$query = mysqli_query($con,$sql);
			if(mysqli_num_rows($query)>0){
				while ($datos = mysqli_fetch_assoc($query)) {
					array_push($resultados, array(
					    "MONTO" => $datos['MONTO']!='-' ? "$".number_format($datos['MONTO'], 2, ',', '.') :  $datos['MONTO'] ,
					    "FECHA_FIN" => $datos['FECHA_FIN'],
					    "FechaCreacion" => $datos['FechaCreacion'],
					    "UsuarioCreacion" => $datos['UsuarioCreacion']
					));
				}
			}
			echo json_encode($resultados);
		}
	break;
}




function upload_file($file, $max_size, $temp_dir) {
  $result = array();
  $result['success'] = false;

  // Validar que el archivo no supere el tamaño máximo permitido
  if ($file['size'] > $max_size) {
    $result['error'] = 'El archivo supera el tamaño máximo permitido';
    return $result;
  }

  // Mover el archivo a la carpeta temporal
  $tmp_name = $file['tmp_name'];
  $name = $file['name'];
  $destination = $temp_dir . '/' . $name;
  move_uploaded_file($tmp_name, $destination);

  $result['success'] = true;
  $result['filename'] = $name;

  return $result;
}


function TraerMontoContrato($contrato){
	$con=conectar();
	$MontoTotal = 0;
	$sql = "SELECT MONTO FROM juridica_contrato WHERE ID = ".$contrato;
	$query = mysqli_query($con,$sql);
	if(mysqli_num_rows($query)>0){
		$dato = mysqli_fetch_assoc($query);
		$MontoTotal = floatval($dato['MONTO']);
		$sql_adiciones = "SELECT SUM(MONTO) MONTO FROM juridica_contrato_adicion WHERE ACTIVO = 1 AND ID_CONTRATO = ".$contrato;
		$query_adiciones = mysqli_query($con,$sql_adiciones);
		if(mysqli_num_rows($query_adiciones)>0){
			$resultado = mysqli_fetch_assoc($query_adiciones);
			$MontoTotal+= floatval($resultado['MONTO']);
		}
	}
	return $MontoTotal;
}


function TraerFechaFinContrato($contrato){
	$con = conectar();
	$FechaFin = null;
	$sql = "SELECT FECHA_FIN FROM juridica_contrato WHERE ID = ".$contrato;
	$query = mysqli_query($con, $sql);
	if(mysqli_num_rows($query) > 0){
		$dato = mysqli_fetch_assoc($query);
		$FechaFin = $dato['FECHA_FIN'];
		$sql_adiciones = "SELECT MAX(FECHA_FIN) AS FECHA_PRORROGA FROM juridica_contrato_adicion WHERE  ACTIVO = 1 AND ID_CONTRATO = ".$contrato;
		$query_adiciones = mysqli_query($con, $sql_adiciones);
		if(mysqli_num_rows($query_adiciones) > 0){
			$resultado = mysqli_fetch_assoc($query_adiciones);
			$FechaProrroga = $resultado['FECHA_PRORROGA'];
			if ($FechaProrroga > $FechaFin) {
				$FechaFin = $FechaProrroga;
			}
		}
	}
	return $FechaFin;
}

function CargarInformacionAdicionalContrato($ParId) {
	
	$sql = "SELECT FECHA_INI,FECHA_FIN,FECHA_CONTRATO,COMPROMISO_PRESUPUESTAL,FECHA_COMPROMISO_PRESUPUESTAL,MONTO_COMPROMISO_PRESUPUESTAL,ORDENADOR_GASTO,ID_TIPO_GASTO,FECHA_PUBLICACION_SECOP,LINK_PUBLICACION_SECOP,FECHA_PUBLICACION_GEST_TRANS,TIPO_PERSONA FROM juridica_contrato a WHERE a.Id = $ParId and ACTIVO = 1 ";
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = [];
    if (mysqli_num_rows($query) > 0) {
        while ($datos = mysqli_fetch_assoc($query)) {
            $material = array(
                "FECHA_INI" => $datos['FECHA_INI'],
                "FECHA_FIN" => $datos['FECHA_FIN'],
                "FECHA_CONTRATO" => $datos['FECHA_CONTRATO'],
                "COMPROMISO_PRESUPUESTAL" => $datos['COMPROMISO_PRESUPUESTAL'],
                "FECHA_COMPROMISO_PRESUPUESTAL" => $datos['FECHA_COMPROMISO_PRESUPUESTAL'],
                "MONTO_COMPROMISO_PRESUPUESTAL" => $datos['MONTO_COMPROMISO_PRESUPUESTAL'],
                "ORDENADOR_GASTO" => $datos['ORDENADOR_GASTO'],
                "ID_TIPO_GASTO" => $datos['ID_TIPO_GASTO'],
                "FECHA_PUBLICACION_SECOP" => $datos['FECHA_PUBLICACION_SECOP'],
                "LINK_PUBLICACION_SECOP" => $datos['LINK_PUBLICACION_SECOP'],
                "FECHA_PUBLICACION_GEST_TRANS" => $datos['FECHA_PUBLICACION_GEST_TRANS'],
                "TIPO_PERSONA" => $datos['TIPO_PERSONA'],
                "CONTRATISTAS" => CargarContratistasContrato($ParId),
                "SUPERVISORES" => CargarSupervisoresContrato($ParId)
            );
            array_push($resultados, $material);
        }
        mysqli_close($con);
    }
    return $resultados;
}

function CargarContratistasContrato($ParId) {
	
	$sql = "SELECT Id,NombreContratista,Identificacion,Digito_verificacion FROM juridica_contrato_contratante WHERE Id_Contrato = $ParId and ACTIVO = 1 ORDER BY NombreContratista";
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = [];
    if (mysqli_num_rows($query) > 0) {
        while ($datos = mysqli_fetch_assoc($query)) {
            $material = array(
                "Nombre" => $datos['NombreContratista'],
                "Digito_verificacion" => $datos['Digito_verificacion'],
                "Identificacion" => $datos['Identificacion'],
                "Id" => $datos['Id']
            );
            array_push($resultados, $material);
        }
        mysqli_close($con);
    }
    return $resultados;
}

function CargarSupervisoresContrato($ParId) {
	
	$sql = "SELECT Id,Nombre,Identificacion FROM juridica_contrato_supervisor WHERE Id_Contrato = $ParId and ACTIVO = 1 ORDER BY Nombre";
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = [];
    if (mysqli_num_rows($query) > 0) {
        while ($datos = mysqli_fetch_assoc($query)) {
            $material = array(
                "Id" => $datos['Id'],
                "Nombre" => $datos['Nombre'],
                "Identificacion" => $datos['Identificacion']
            );
            array_push($resultados, $material);
        }
        mysqli_close($con);
    }
    return $resultados;
}

?>