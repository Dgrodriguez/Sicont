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
	case 'MarcarAlertaComoLeido':
		
		$D30 = "";
		$D15 = "";
		$Amparo = "";
		if($dias=='30'){
			$D30 = "1";
			$D15 = "0";
			$Amparo = "NO";
		}else if($dias == '15'){
			$D30 = "0";
			$D15 = "1";
			$Amparo = "NO";
		}else{
			$Amparo = "SI";
		}


		if($Amparo!="SI"){

			$con=conectar();
			$sql="SELECT a.Id FROM juridica_contrato a where a.CONTRATO_NUMERO_VIVA = '".$NumContrato."'";
			$query = mysqli_query($con,$sql);
			mysqli_close($con);
			$dato = mysqli_fetch_assoc($query);

			$Campos = ["Usuario","Id_Contrato","D15","D30"];
			$Valores = [$_SESSION['Usuario'],$dato['Id'],$D15,$D30];
			$Tabla = "Juridica_Contrato_Alertas_Vistas";
			$MensajeLog1 = "Se registra la alerta del contrato ".$dato['Id'].", como leido por el usuario ".$_SESSION['Usuario'];
			funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);	

		}else{

			$con=conectar();
			$sql="SELECT a.Id from juridica_contrato_poliza_amparos a , juridica_contrato_poliza b , juridica_contrato_amparos c  WHERE a.Id_Poliza = b.Id and b.Numero_Poliza = '".$Poliza."' and a.Tipo_Amparo = c.Id and c.Nombre =  '".$TipoAmparo."'";
			//echo $sql;
			$query = mysqli_query($con,$sql);
			mysqli_close($con);
			$dato = mysqli_fetch_assoc($query);

			$Campos = ["Usuario","Id_Contrato_amparo"];
			$Valores = [$_SESSION['Usuario'],$dato['Id']];
			$Tabla = "juridica_contrato_poliza_amparos_alertas_vistas";
			$MensajeLog1 = "Se registra la alerta del amparo ".$dato['Id'].", como leido por el usuario ".$_SESSION['Usuario'];
			funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
		}
		echo "OK";

	break;
	case 'FiltrarResultadosGeneralContraros':


		$filtro = " WHERE 1=1 ";

		if($Vigencia!="NO"){
			$filtro.=" and Year(a.FECHA_CONTRATO) = ".$Vigencia;
		}

		if($Modalidades!="NO" && $Modalidades!="Ninguno"){
			$filtro.=" and IdTipoModalidad = ".$Modalidades;
		}

		if($TipoContrato!="NO" && $TipoContrato!="Ninguno"){
			$filtro.=" and IdTipoContrato = ".$TipoContrato;
		}


		if($Direccion!="NO" && $Direccion!="Ninguno"){
			$filtro.=" and IdDireccion = ".$Direccion;
		}


		if($Proyecto!="NO" && $Proyecto!="Ninguno"){
			$filtro.=" and IdProceso = ".$Proyecto;
		}


		if($Supervisor!="NO" ){
			$filtro.=" and Supervisores like '%".$Supervisor."'%";
		}


		if($EstadoContrato!="NO" && $EstadoContrato!="Ninguno") {
			$filtro.=" and IdESTADOCONTRATO = ".$EstadoContrato;
		}

		if($FechaIniFirma!="NO" ) {
			$filtro.=" and FECHA_CONTRATO < '".$FechaIniFirma."'";
		}

		if($FechaFinFirma!="NO" ) {
			$filtro.=" and FECHA_CONTRATO > '".$FechaFinFirma."'";
		}

		if($FechaIniEjec!="NO" ) {
			$filtro.=" and FECHA_INI < '".$FechaIniEjec."'";
		}
		
		if($FechaFinEjec!="NO" ) {
			$filtro.=" and FECHA_INI > '".$FechaFinEjec."'";
		}


		$sql = "SELECT a.CONTRATO_NUMERO_VIVA , a.ROL_JURIDICO , a.ROL_LOGISTICO ,a.ROL_TECNICO , a.TipoContrato , a.TipoModalidad , a.ContratanteNombre , a.ContratanteIdentificacion , a.DigitoVerificacion , a.OBJETO_CONTRATO , a.TOTAL_APORTES , a.APORTES_ESPECIE_VIVA , a.APORTES_RECURSOS_VIVA , a.APORTES_ESPECIE_MPIO , a.APORTES_RECURSOS_MPIO , a.OtrasFuentes , a.NombreOtrasFuentes , a.Segmento , a.PlazoDias , a.Direccion , a.Area_Proceso , a.ORDENADOR_GASTO , a.Supervisores , a.FECHA_CONTRATO , a.FECHA_INI,a.FECHA_FIN, a.ESTADO_CONTRATO , a.FECHA_PUBLICACION_SECOP , a.LINK_PUBLICACION_SECOP , a.FECHA_PUBLICACION_GEST_TRANS from vw_reporte_contrato_general a ".$filtro." ORDER BY a.CONTRATO_NUMERO_VIVA";

		$con=conectar();
		$query = mysqli_query($con,$sql);
		mysqli_close($con);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA'],
				    "ROL_JURIDICO" => $datos['ROL_JURIDICO']  ? $datos['ROL_JURIDICO'] : "No presenta",
				    "ROL_LOGISTICO" => $datos['ROL_LOGISTICO']  ? $datos['ROL_LOGISTICO'] : "No presenta",
				    "ROL_TECNICO" => $datos['ROL_TECNICO']  ? $datos['ROL_TECNICO'] : "No presenta",
				    "TipoContrato" => $datos['TipoContrato'] && $datos['TipoContrato'] ? $datos['TipoContrato'] : "No presenta",
				    "TipoModalidad" => $datos['TipoModalidad'] && $datos['TipoModalidad'] ? $datos['TipoModalidad'] : "No presenta",
				    "ContratanteNombre" => $datos['ContratanteNombre'] && $datos['ContratanteNombre']!="," ? $datos['ContratanteNombre'] : "No presenta",
				    "ContratanteIdentificacion" => $datos['ContratanteIdentificacion'] && $datos['ContratanteIdentificacion']!="," ? $datos['ContratanteIdentificacion'] : "No presenta",
				    "DigitoVerificacion" => $datos['DigitoVerificacion'] && $datos['DigitoVerificacion']!="," ? $datos['DigitoVerificacion'] : "No presenta",
				    "OBJETO_CONTRATO" => $datos['OBJETO_CONTRATO'] && $datos['OBJETO_CONTRATO']!="," ? $datos['OBJETO_CONTRATO'] : "No presenta",
				    "TOTAL_APORTES" => $datos['TOTAL_APORTES'],
				    "APORTES_ESPECIE_VIVA" => $datos['APORTES_ESPECIE_VIVA'] && $datos['APORTES_ESPECIE_VIVA']!="," ? $datos['APORTES_ESPECIE_VIVA'] : "No presenta",
				    "APORTES_RECURSOS_VIVA" => $datos['APORTES_RECURSOS_VIVA'] && $datos['APORTES_RECURSOS_VIVA']!="," ? $datos['APORTES_RECURSOS_VIVA'] : "No presenta",
				    "APORTES_ESPECIE_MPIO" => $datos['APORTES_ESPECIE_MPIO'] && $datos['APORTES_ESPECIE_MPIO']!="," ? $datos['APORTES_ESPECIE_MPIO'] : "No presenta",
				    "APORTES_RECURSOS_MPIO" => $datos['APORTES_RECURSOS_MPIO'] && $datos['APORTES_RECURSOS_MPIO']!="," ? $datos['APORTES_RECURSOS_MPIO'] : "No presenta",
				    "OtrasFuentes" => $datos['OtrasFuentes'] && $datos['OtrasFuentes']!="," ? $datos['OtrasFuentes'] : "No presenta",
				    "NombreOtrasFuentes" => $datos['NombreOtrasFuentes'] && $datos['NombreOtrasFuentes']!="," ? $datos['NombreOtrasFuentes'] : "No presenta",
				    "Segmento" => $datos['Segmento'] && $datos['Segmento']!="," ? $datos['Segmento'] : "No presenta",
				    "PlazoDias" => $datos['PlazoDias'] && $datos['PlazoDias']!="," ? $datos['PlazoDias'] : "No presenta",
				    "Direccion" => $datos['Direccion'] && $datos['Direccion']!="," ? $datos['Direccion'] : "No presenta",
				    "Area_Proceso" => $datos['Area_Proceso'] && $datos['Area_Proceso']!="," ? $datos['Area_Proceso'] : "No presenta",
				    "ORDENADOR_GASTO" => $datos['ORDENADOR_GASTO'] && $datos['ORDENADOR_GASTO']!="," ? $datos['ORDENADOR_GASTO'] : "No presenta",
				    "Supervisores" => $datos['Supervisores'] && $datos['Supervisores']!="," ? $datos['Supervisores'] : "No presenta",
				    "FECHA_CONTRATO" => $datos['FECHA_CONTRATO'] && $datos['FECHA_CONTRATO']!="," ? $datos['FECHA_CONTRATO'] : "No presenta",
				    "FECHA_INI" => $datos['FECHA_INI'] && $datos['FECHA_INI']!="," ? $datos['FECHA_INI'] : "No presenta",
				    "FECHA_FIN" => $datos['FECHA_FIN'] &&$datos['FECHA_FIN']!="," ? $datos['FECHA_FIN'] : "No presenta",
				    "ESTADO_CONTRATO" => $datos['ESTADO_CONTRATO'] && $datos['ESTADO_CONTRATO']!="," ? $datos['ESTADO_CONTRATO'] : "No presenta",
				    "FECHA_PUBLICACION_SECOP" => $datos['FECHA_PUBLICACION_SECOP'] && $datos['FECHA_PUBLICACION_SECOP']!="," ? $datos['FECHA_PUBLICACION_SECOP'] : "No presenta",
				    "LINK_PUBLICACION_SECOP" => $datos['LINK_PUBLICACION_SECOP'] && $datos['LINK_PUBLICACION_SECOP']!="," ? $datos['LINK_PUBLICACION_SECOP'] : "No presenta",
				    "FECHA_PUBLICACION_GEST_TRANS" => $datos['FECHA_PUBLICACION_GEST_TRANS'] && $datos['FECHA_PUBLICACION_GEST_TRANS']!="," ? $datos['FECHA_PUBLICACION_GEST_TRANS'] : "No presenta"
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'SeleccionarContratoReportInfo':
		$sql = "SELECT a.CONTRATO_NUMERO_VIVA , a.ESTADO_CONTRATO , b.Compania_Poliza , b.Numero_Poliza , d.Nombre TipoPoliza , e.Nombre TipoAmparo,c.Fecha_Inicio_Amparo , c.Fecha_Fin_Amparo , c.Cuantia_Amparo FROM juridica_contrato a INNER JOIN juridica_contrato_poliza b ON a.ID = b.Id_Contrato INNER JOIN juridica_contrato_poliza_amparos c ON c.Id_Poliza = b.Id INNER JOIN juridica_contrato_tipo_poliza d ON d.Id = b.Id_Tipo_Poliza INNER JOIN juridica_contrato_amparos e ON e.Id = c.Tipo_Amparo WHERE a.ID = $IdContrato and a.ACTIVO = 1 and b.ACTIVO = 1 and c.ACTIVO = 1 and d.ACTIVO = 1 and e.ACTIVO = 1 ORDER BY e.Nombre , c.Fecha_Fin_Amparo";
		$con=conectar();
		$query = mysqli_query($con,$sql);
		mysqli_close($con);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA'],
				    "ESTADO_CONTRATO" => $datos['ESTADO_CONTRATO'],
				    "Compania_Poliza" => $datos['Compania_Poliza'],
				    "Numero_Poliza" => $datos['Numero_Poliza'],
				    "TipoPoliza" => $datos['TipoPoliza'],
				    "TipoAmparo" => $datos['TipoAmparo'],
				    "Fecha_Inicio_Amparo" => $datos['Fecha_Inicio_Amparo'],
				    "Fecha_Fin_Amparo" => $datos['Fecha_Fin_Amparo'],
				    "Cuantia_Amparo" => $datos['Cuantia_Amparo']
				));
			}
		}
		echo json_encode($resultados);
	break;
	case 'ConsultarAlertas':
		$resultados = [];
		array_push($resultados, array(
		    "Amparos" => ConsultarAlerta('Amparos'),
		    "Alertas30Dias" => ConsultarAlerta(30),
		    "Alertas15Dias" => ConsultarAlerta(15)
		));
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
	case 'ActualizarClienteContratoProceso':
		$Campos = ["ID_DEPTO","ID_MUNICIPIO","NOMBRE_CONTACTO","NUMERO_CONTACTO","CORREO_CONTACTO"];
		$Valores = [$Depto,$Mpio,$Persona,$NumContacto,$CorreoContaccto ];
		$Tabla = "juridica_contrato";
		$MensajeLog1 = "Se Actualiza los datos del cliente del registro ".$IdContrato;
		funciones_generales_BDActualizarDatos($IdContrato,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;		
	case 'AnularContrato':
		$Campos = ["ESTADO_CONTRATO","MOTIVO_ANULACION","FECHA_ANULACION"];
		$Valores = ["ANULADO", $Motivo, $FechaAnular];
		$Tabla = "juridica_contrato";
		$MensajeLog1 = "Se elimina el contrato del Id ".$IdContrato;
		funciones_generales_BDActualizarDatos($IdContrato,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;	
	case 'DesertarContrato':
		$Campos = ["ESTADO_CONTRATO","MOTIVO_ANULACION","FECHA_ANULACION"];
		$Valores = ["DESIERTO", $Motivo, $FechaAnular];
		$Tabla = "juridica_contrato";
		$MensajeLog1 = "Se declaró Desierto el contrato del Id ".$IdContrato;
		funciones_generales_BDActualizarDatos($IdContrato,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;	
	case 'EliminarPolizaContrato':
		$Campos = ["ACTIVO"];
		$Valores = ["0" ];
		$Tabla = "juridica_contrato_poliza";
		$MensajeLog1 = "Se elimina la Poliza del Id ".$ParId;
		funciones_generales_BDActualizarDatos($ParId,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;
	case 'EliminarAmparoPolizaContrato':
		$Campos = ["ACTIVO"];
		$Valores = ["0" ];
		$Tabla = "juridica_contrato_poliza_amparos";
		$MensajeLog1 = "Se elimina el Amparo del Id ".$ParId;
		funciones_generales_BDActualizarDatos($ParId,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;
	case 'GuardarNroProcesoSeleccion':
		$Campos = ["CONTRATO_NUMERO_VIVA"];
		$Valores = [ $NumProceso ];
		$Tabla = "juridica_contrato";
		$MensajeLog1 = "Se carga el número del proceso del contrato del Id ".$IdContrato;
		funciones_generales_BDActualizarDatos($IdContrato,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo $NumProceso;
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

	case 'ActualizarContrato':
		
		if($IdContrato){

		    $Campos = [];
		    $Valores = [];

		    if($CrearContratoAdicionar_FechaInicio){
		    	array_push($Campos,"FECHA_INI");
		    	array_push($Valores,$CrearContratoAdicionar_FechaInicio);
		    }

		    if($CrearContratoAdicionar_FechaFin){
		    	array_push($Campos,"FECHA_FIN");
		    	array_push($Valores,$CrearContratoAdicionar_FechaFin);
		    }


		    if($CrearContratoAdicionar_CompromisoPresupuestal){
		    	array_push($Campos,"COMPROMISO_PRESUPUESTAL");
		    	array_push($Valores,$CrearContratoAdicionar_CompromisoPresupuestal);
		    }		    


		    if($CrearContratoAdicionar_FechaCompromisoPresupuestal){
		    	array_push($Campos,"FECHA_COMPROMISO_PRESUPUESTAL");
		    	array_push($Valores,$CrearContratoAdicionar_FechaCompromisoPresupuestal);
		    }		    

		    if($CrearContratoAdicionar_MontoCompromisoPresupuestal){
		    	array_push($Campos,"MONTO_COMPROMISO_PRESUPUESTAL");
		    	array_push($Valores,$CrearContratoAdicionar_MontoCompromisoPresupuestal);
		    }		    


		    if($CrearContratoAdicionar_FechaPubSecop){
		    	array_push($Campos,"FECHA_PUBLICACION_SECOP");
		    	array_push($Valores,$CrearContratoAdicionar_FechaPubSecop);
		    }		    


		    if($CrearContratoAdicionar_linkPubSecop){
		    	array_push($Campos,"LINK_PUBLICACION_SECOP");
		    	array_push($Valores,$CrearContratoAdicionar_linkPubSecop);
		    }		   


		     if($CrearContratoAdicionar_FechaPubGestTransp){
		    	array_push($Campos,"FECHA_PUBLICACION_GEST_TRANS");
		    	array_push($Valores,$CrearContratoAdicionar_FechaPubGestTransp);
		    }		    

		    if($CrearContratoAdicionar_FechaTransCad){
		    	array_push($Campos,"FECHA_TRANS_CAD");
		    	array_push($Valores,$CrearContratoAdicionar_FechaTransCad);
		    }


		    if($CrearContratoAdicionar_OrdenadorGasto){
		    	array_push($Campos,"ORDENADOR_GASTO");
		    	array_push($Valores,$CrearContratoAdicionar_OrdenadorGasto);
		    }


		    if($CrearContratoAdicionar_TipoGasto){
		    	array_push($Campos,"ID_TIPO_GASTO");
		    	array_push($Valores,$CrearContratoAdicionar_TipoGasto);
		    }

			$Tabla = "JURIDICA_CONTRATO";
			$MensajeLog1 = "Se Actualiza el contrato ".$IdContrato." para adicionar información ";
			funciones_generales_BDActualizarDatos($IdContrato,$Campos,$Valores,$Tabla,$MensajeLog1);
			echo "OK";
		}
	break;
	case 'GuardarInfoAdicionalContrato':
		if($IdContrato && $CrearContratoAdicionar_FechaContrato && $CrearContratoAdicionar_TipoPersonaContratar ){


		    $CrearContratoAdicionar_FechaInicio = $CrearContratoAdicionar_FechaInicio ? $CrearContratoAdicionar_FechaInicio : "";
		    $CrearContratoAdicionar_FechaFin = $CrearContratoAdicionar_FechaFin ? $CrearContratoAdicionar_FechaFin : "";
		    $CrearContratoAdicionar_CompromisoPresupuestal = $CrearContratoAdicionar_CompromisoPresupuestal ? $CrearContratoAdicionar_CompromisoPresupuestal : "";
		    $CrearContratoAdicionar_FechaCompromisoPresupuestal = $CrearContratoAdicionar_FechaCompromisoPresupuestal ? $CrearContratoAdicionar_FechaCompromisoPresupuestal : "";
		    $CrearContratoAdicionar_MontoCompromisoPresupuestal = $CrearContratoAdicionar_MontoCompromisoPresupuestal ? $CrearContratoAdicionar_MontoCompromisoPresupuestal : "";
		    $CrearContratoAdicionar_FechaPubSecop = $CrearContratoAdicionar_FechaPubSecop ? $CrearContratoAdicionar_FechaPubSecop : "";
		    $CrearContratoAdicionar_linkPubSecop = $CrearContratoAdicionar_linkPubSecop ? $CrearContratoAdicionar_linkPubSecop : "";
		    $CrearContratoAdicionar_FechaPubGestTransp = $CrearContratoAdicionar_FechaPubGestTransp ? $CrearContratoAdicionar_FechaPubGestTransp : "";
		    $CrearContratoAdicionar_FechaTransCad = $CrearContratoAdicionar_FechaTransCad ? $CrearContratoAdicionar_FechaTransCad : "";
		    $CrearContratoAdicionar_OrdenadorGasto = $CrearContratoAdicionar_OrdenadorGasto ? $CrearContratoAdicionar_OrdenadorGasto : "";
		    $CrearContratoAdicionar_TipoGasto = $CrearContratoAdicionar_TipoGasto ? $CrearContratoAdicionar_TipoGasto : "";
		    $SupervisoresContrato = $SupervisoresContrato ? $SupervisoresContrato : [];

			$Campos = ["FECHA_INI","FECHA_FIN","FECHA_CONTRATO","COMPROMISO_PRESUPUESTAL","FECHA_COMPROMISO_PRESUPUESTAL","MONTO_COMPROMISO_PRESUPUESTAL","ORDENADOR_GASTO","ID_TIPO_GASTO","FECHA_PUBLICACION_SECOP","LINK_PUBLICACION_SECOP","FECHA_PUBLICACION_GEST_TRANS","TIPO_PERSONA","ESTADO_CONTRATO","FECHA_TRANS_CAD"];

			$Valores = [$CrearContratoAdicionar_FechaInicio,$CrearContratoAdicionar_FechaFin,$CrearContratoAdicionar_FechaContrato,$CrearContratoAdicionar_CompromisoPresupuestal,$CrearContratoAdicionar_FechaCompromisoPresupuestal,FormateoInversoMonto($CrearContratoAdicionar_MontoCompromisoPresupuestal) ,$CrearContratoAdicionar_OrdenadorGasto,$CrearContratoAdicionar_TipoGasto,$CrearContratoAdicionar_FechaPubSecop,$CrearContratoAdicionar_linkPubSecop,$CrearContratoAdicionar_FechaPubGestTransp, $CrearContratoAdicionar_TipoPersonaContratar,"EN EJECUCIÓN",$CrearContratoAdicionar_FechaTransCad ];
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
					$MensajeLog1 = "Se registra el supervisor ".$cuerpo['Nombre']." para el contrato id ".$IdContrato;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
 				}
			}
			echo "OK";
		}echo "error";
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

		  // Verificar si la variable $tipo_documentoNombre está definida
          $tipo_documentoNombre = isset($tipo_documentoNombre) ? $tipo_documentoNombre : '';


	  		array_push($files, array(
			    "TipoDocumento" => $tipo_documento,
			    "tipo_documentoNombre" => $tipo_documentoNombre,
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
	case 'CargarPolizasContrato':
		if($IdContrato){
			$con=conectar();
			$sql="SELECT a.Id,b.Nombre TipoPoliza,a.Compania_Poliza , a.Numero_Poliza FROM juridica_contrato_poliza a, juridica_contrato_tipo_poliza b WHERE a.Id_Tipo_Poliza = b.Id and a.ACTIVO = 1 and b.ACTIVO = 1 and Id_Contrato = ".$IdContrato." order by b.Nombre,a.Compania_Poliza,a.Numero_Poliza ";
			$query = mysqli_query($con,$sql);
			mysqli_close($con);
			$resultados = [];
			if(mysqli_num_rows($query)>0){
				while($datos = mysqli_fetch_assoc($query)){
					array_push($resultados, array(
					    "Id" => $datos['Id'],
					    "TipoPoliza" => $datos['TipoPoliza'],
					    "Compania_Poliza" => $datos['Compania_Poliza'],
					    "Numero_Poliza" => $datos['Numero_Poliza'],
					    "Amparos" => CargarAmparosPoliza($datos['Id'])
					));
				}
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
	case 'GuardarPolizaContrato':
		if($IdContrato){

			$Campos = ["Id_Contrato","Id_Tipo_Poliza","Compania_Poliza","Numero_Poliza"];
			$Valores = [$IdContrato,$TipoPoliza,$CompañiaPoliza,$NumeroPoliza];
			$Tabla = "Juridica_Contrato_Poliza";
			$MensajeLog1 = "Se registra póliza para el contrato de  id ".$IdContrato;
			$IdPoliza = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

			if( count($AmparosPoliza)>0 ){
				for ($i=0; $i < count($AmparosPoliza) ; $i++) { 
					$Campos = ["Id_Poliza","Tipo_Amparo","Fecha_Inicio_Amparo","Fecha_Fin_Amparo","Cuantia_Amparo"];
					$Valores = [$IdPoliza,$AmparosPoliza[$i]['IdTipoAmparo'],$AmparosPoliza[$i]['FechaInicio'],$AmparosPoliza[$i]['FechaFin'], FormateoInversoMonto($AmparosPoliza[$i]['CuantiaAmparo']) ];
					$Tabla = "Juridica_contrato_poliza_amparos";
					$MensajeLog1 = "Se registra el amparo de la poliza  del contrato ID ".$IdContrato;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}
			echo "OK";
		}
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
	case 'PoseeAportesCargados':
		$con=conectar();
		$sql = "SELECT TOTAL_APORTES FROM juridica_contrato WHERE ID = ".$IdContrato;
		$query = mysqli_query($con,$sql); 
		$datos = mysqli_fetch_assoc($query);
		mysqli_close($con);
		$resp = "NO";
		if($datos['TOTAL_APORTES']>0){
			$resp = "SI";
		}
		echo $resp;
	break;
	case 'ConsultarEstadoContrato':
		$con=conectar();
		$sql = "SELECT ESTADO_CONTRATO FROM juridica_contrato WHERE ID = ".$IdContrato;
		$query = mysqli_query($con,$sql); 
		$datos = mysqli_fetch_assoc($query);
		mysqli_close($con);
		echo $datos['ESTADO_CONTRATO'];
	break;
	case 'SeleccionarContratoAddInfo':
		
		if (isset($IdContrato)) {
			$con=conectar();
			$sql="SELECT a.ID, a.ESTADO_CONTRATO , a.CONTRATO_NUMERO_VIVA AS NumContrato, a.OBJETO_CONTRATO, a.SEGMENTO_CONTRATO, a.FECHA_DISPONIBILIDAD_PRESUPUESTAL, a.DISPONIBILIDAD_PRESUPUESTAL, a.MONTO_DISPONIBILIDAD_PRESUPUESTAL, a.DIRECCION, b.NOMBRE AS NombreDireccion, a.PROCESO, c.Nombre AS ProcesoNombre, a.APORTES_ESPECIE_MPIO, a.APORTES_RECURSOS_MPIO, a.APORTES_ESPECIE_VIVA, a.APORTES_RECURSOS_VIVA, a.TOTAL_APORTES, a.NRO_ACTA, a.FECHA_NRO_ACTA, a.ID_DEPTO, d.nombre AS NombreDepto, a.ID_MUNICIPIO, e.nombre AS NombreMpio, f.Nombre AS NombreModalidad, g.Nombre AS NombreTipoContrato, a.FECHA_SOLICITUD, a.ROL_JURIDICO, a.ROL_LOGISTICO, a.ROL_TECNICO, a.NUMERO_CONTACTO, a.NOMBRE_CONTACTO, a.CORREO_CONTACTO, a.TIPO_PROCESO_CONTRATO
			FROM juridica_contrato a 
			left JOIN cfg_areas_depto b ON a.DIRECCION = b.ID 
			inner JOIN cfg_areas_proceso c ON a.PROCESO = c.Id 
			left JOIN cfg_departamentos d ON a.ID_DEPTO = d.id 
			left JOIN cfg_municipios e ON a.ID_MUNICIPIO = e.id 
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
					    "ESTADO_CONTRATO" => $datos['ESTADO_CONTRATO'],
					    "FECHA_DISPONIBILIDAD_PRESUPUESTAL" => $datos['FECHA_DISPONIBILIDAD_PRESUPUESTAL'],
					    "DISPONIBILIDAD_PRESUPUESTAL" => $datos['DISPONIBILIDAD_PRESUPUESTAL'],
					    "MONTO_DISPONIBILIDAD_PRESUPUESTAL" => $datos['MONTO_DISPONIBILIDAD_PRESUPUESTAL'],
					    "DIRECCION" => $datos['DIRECCION'],
					    "NombreDireccion" => $datos['NombreDireccion'],
					    "PROCESO" => $datos['PROCESO'],
					    "TIPO_PROCESO_CONTRATO" => $datos['TIPO_PROCESO_CONTRATO'],
					    "ProcesoNombre" => $datos['ProcesoNombre'],
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
					    "OtrasFuentes" => CargarInformacionOtrasFuentes($datos['ID']),
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
	case 'FiltrarResultadosResumenGestionContTotales':
		$con=conectar();

		$filtro = " WHERE 1=1 ";

		if($Anio!="NO"){
			$filtro.= " and anio_contrato= ".$Anio;
		}

		if($Mes!="NO"){
			$filtro.= " and mes_contrato= ".$Mes;
		}

		$sql = "";
		$resultados = [];
		$sql = "SELECT a.Cantidad , a.Cant_Anulado , a.Cant_Desierto , a.Cant_secop , a.Cant_GestTrans , a.Cant_TransCad , a.Cant_SinActa , a.Cant_SinLegalizar FROM vw_report_gestion_contractual_totales a $filtro";
		$con = conectar();
	    $query = mysqli_query($con, $sql);
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	            $material = array(
	                "Cantidad" => $datos['Cantidad'],
	                "Cant_Anulado" => $datos['Cant_Anulado'],
	                "Cant_Desierto" => $datos['Cant_Desierto'],
	                "Cant_secop" => $datos['Cant_secop'],
	                "Cant_GestTrans" => $datos['Cant_GestTrans'],
	                "Cant_TransCad" => $datos['Cant_TransCad'],
	                "Cant_SinActa" => $datos['Cant_SinActa'],
	                "Cant_SinLegalizar" => $datos['Cant_SinLegalizar']
	            );
	            array_push($resultados, $material);
	        }
	    }
		mysqli_close($con);
		echo json_encode($resultados);
	break;
	case 'FiltrarResultadosResumenGestionCont':
		$con=conectar();

		$filtro = " WHERE 1=1 ";

		if($Anio!="NO"){
			$filtro.= " and anio_solicitud= ".$Anio;
		}

		if($Mes!="NO"){
			$filtro.= " and mes_solicitud= ".$Mes;
		}

		$sql="SELECT a.ID_TIPO_CONTRATO,A.TipoContrato,A.TIPO_PROCESO_CONTRATO, A.Id_Dir ,a.Direccion , A.cantidad , A.anio_solicitud , A.mes_solicitud , A.Desierto,A.Anulado from vw_report_gestion_contractual a ".$filtro;
		#echo $sql;
		$query = mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "ID_TIPO_CONTRATO" => $datos['ID_TIPO_CONTRATO'],
				    "TipoContrato" => $datos['TipoContrato'],
				    "TIPO_PROCESO_CONTRATO" => $datos['TIPO_PROCESO_CONTRATO'],
				    "Direccion" => $datos['Direccion'],
				    "Id_Dir" => $datos['Id_Dir'],
				    "cantidad" => $datos['cantidad'],
				    "anio_solicitud" => $datos['anio_solicitud'],
				    "mes_solicitud" => $datos['mes_solicitud'],
				    "Desierto" => $datos['Desierto'],
				    "Anulado" => $datos['Anulado']
				));
			}
		}
		mysqli_close($con);
		echo json_encode($resultados);
	break;
	case 'FiltrarResultadosInfoAdicxContr':
		$con=conectar();

		$filtro = " ";

		if($Anio!="NO"){
			$filtro.= " and year(a.FECHA_SOLICITUD)= ".$Anio;
		}

		if($Mes!="NO"){
			$filtro.= " and month(a.FECHA_SOLICITUD)= ".$Mes;
		}

		$sql="SELECT a.ID , a.CONTRATO_NUMERO_VIVA ,a.FECHA_SOLICITUD  , a.FECHA_INI,a.FECHA_FIN,a.COMPROMISO_PRESUPUESTAL , a.FECHA_COMPROMISO_PRESUPUESTAL , a.MONTO_COMPROMISO_PRESUPUESTAL , a.FECHA_PUBLICACION_GEST_TRANS,a.FECHA_TRANS_CAD , a.FECHA_PUBLICACION_SECOP , a.LINK_PUBLICACION_SECOP from juridica_contrato a where a.ACTIVO = 1 and TIPO_CONTRATO != 'BVM' and CONTRATO_NUMERO_VIVA is not null and CONTRATO_NUMERO_VIVA!='' and a.CONTRATO_NUMERO_VIVA != 'N/A' $filtro ORDER BY a.CONTRATO_NUMERO_VIVA ";
		#echo $sql;
		$query = mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "ID" => $datos['ID'],
				    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA'] ? $datos['CONTRATO_NUMERO_VIVA'] : "",
				    "FECHA_SOLICITUD" => $datos['FECHA_SOLICITUD'] ? $datos['FECHA_SOLICITUD'] : "",
				    "FECHA_INI" => $datos['FECHA_INI'] ? $datos['FECHA_INI'] : "",
				    "FECHA_FIN" => $datos['FECHA_FIN'] ? $datos['FECHA_FIN'] : "",
				    "COMPROMISO_PRESUPUESTAL" => $datos['COMPROMISO_PRESUPUESTAL'] ? $datos['COMPROMISO_PRESUPUESTAL'] : "",
				    "FECHA_COMPROMISO_PRESUPUESTAL" => $datos['FECHA_COMPROMISO_PRESUPUESTAL'] ? $datos['FECHA_COMPROMISO_PRESUPUESTAL'] : "",
				    "MONTO_COMPROMISO_PRESUPUESTAL" => $datos['MONTO_COMPROMISO_PRESUPUESTAL'] ? $datos['MONTO_COMPROMISO_PRESUPUESTAL'] : "",
				    "FECHA_PUBLICACION_GEST_TRANS" => $datos['FECHA_PUBLICACION_GEST_TRANS'] ? $datos['FECHA_PUBLICACION_GEST_TRANS'] : "",
				    "FECHA_TRANS_CAD" => $datos['FECHA_TRANS_CAD'] ? $datos['FECHA_TRANS_CAD'] : "",
				    "FECHA_PUBLICACION_SECOP" => $datos['FECHA_PUBLICACION_SECOP'] ? $datos['FECHA_PUBLICACION_SECOP'] : "",
				    "LINK_PUBLICACION_SECOP" => $datos['LINK_PUBLICACION_SECOP'] ? $datos['LINK_PUBLICACION_SECOP'] : ""
				));
			}
		}
		mysqli_close($con);
		echo json_encode($resultados);
	break;


	case 'ActualziarDatosFinancierosProcesoSeleccion':
		
		if($TotalAportes && $IdContrato){

			$AportesVivaEspecie = $AportesVivaEspecie ? $AportesVivaEspecie : '0'; 
			$AportesVivaRecursos = $AportesVivaRecursos ? $AportesVivaRecursos : '0'; 
			$AportesMpioEspecie = $AportesMpioEspecie ? $AportesMpioEspecie : '0'; 
			$AportesMpioRecursos = $AportesMpioRecursos ? $AportesMpioRecursos : '0'; 

			$Campos = ["TOTAL_APORTES","APORTES_ESPECIE_VIVA","APORTES_RECURSOS_VIVA","APORTES_ESPECIE_MPIO","APORTES_RECURSOS_MPIO"];
			$Valores = [ FormateoInversoMonto($TotalAportes) , FormateoInversoMonto($AportesVivaEspecie) , FormateoInversoMonto($AportesVivaRecursos) , FormateoInversoMonto($AportesMpioEspecie) ,FormateoInversoMonto($AportesMpioRecursos) ];
			$Tabla = "JURIDICA_CONTRATO";
			$MensajeLog1 = "Se registran aportes del proceso : ".$IdContrato;
			funciones_generales_BDActualizarDatos($IdContrato ,$Campos,$Valores,$Tabla,$MensajeLog1);

			if(isset($OtraFuente) &&  count($OtraFuente)>0){
				for ($i=0; $i <count($OtraFuente) ; $i++) { 
					$Campos = ["Id_Contrato","Monto","NombreFuente"];
					$Valores = [$IdContrato,FormateoInversoMonto($OtraFuente[$i]['MontoOtraFuente']),$OtraFuente[$i]['NombreOtraFuente'] ];
					$Tabla = "juridica_contrato_otrasfuentes";
					$MensajeLog1 = "Se registran datos de otras fuentes de aportes al proceso : ".$IdContrato;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}

			//se debe invocar es a la funcion de contrato debido a que alli asignara el número de contrato final
			$NumContrato = AsignarNumeroContrato($IdContrato);

			// evaluo si la funcion retorno N/A es que se le debe solicitar al usuario ingresar el número
			if($NumContrato!="N/A"){
				$con = conectar();
				$sql = "SELECT CONTRATO_NUMERO_VIVA FROM juridica_contrato WHERE ID = ".$IdContrato;
				$QUERY = mysqli_query($con,$sql);
				$dato = mysqli_fetch_assoc($QUERY);
				mysqli_close($con );
				$Campos = ["CONTRATO_NUMERO_VIVA","CONTRATO_NUMERO_CONTRATANTE"];
				$Valores = [ $NumContrato , $dato['CONTRATO_NUMERO_VIVA']];
				$Tabla = "JURIDICA_CONTRATO";
				$MensajeLog1 = "Se registra el Número de contrato directo CON EL NÚMERO: ".$NumContrato;
				funciones_generales_BDActualizarDatos($IdContrato ,$Campos,$Valores,$Tabla,$MensajeLog1);
			}else{
				$con = conectar();
				$sql = "SELECT CONTRATO_NUMERO_VIVA FROM juridica_contrato WHERE ID = ".$IdContrato;
				$QUERY = mysqli_query($con,$sql);
				$dato = mysqli_fetch_assoc($QUERY);
				mysqli_close($con );
				$Campos = ["CONTRATO_NUMERO_CONTRATANTE"];
				$Valores = [  $dato['CONTRATO_NUMERO_VIVA']];
				$Tabla = "JURIDICA_CONTRATO";
				$MensajeLog1 = "Se registra el Número de contrato directo CON EL NÚMERO: ".$NumContrato;
				funciones_generales_BDActualizarDatos($IdContrato ,$Campos,$Valores,$Tabla,$MensajeLog1);
			}

			echo $NumContrato;
		}
	break;
	case 'GuardarContratoDirecto':
	
		if($depto!="Ninguno" && $mpio!="Ninguno" && $PersonaContacto && $numero_contacto && $correo_contacto && $rol_juridico && $rol_logistico && $rol_tecnico && $FechaSolicitud && $TipoContrato && $TipoModalidad && $TipoPersona && $NroActa && $FechaNroActa && $ObjetoContrto && $SegmentoContrto && $TotalAportes && $Proceso!="Ninguno" && $DisponibilidadPresupuestal && $FechaDisponibilidadPresupuestal && $MontoDisponibilidad && $tipoProcesoContratacion && $Direccion!="Ninguno"){

			$PoseeArchivo = isset($ArchivosCargados) && count($ArchivosCargados)>0 ? "SI" : "NO";
			$AportesRecursosViva = isset($AportesRecursosViva) ? $AportesRecursosViva : "0";
			$AportesEspecieViva = isset($AportesEspecieViva) ? $AportesEspecieViva : "0";
			$AportesRecursosMpio = isset($AportesRecursosMpio) ? $AportesRecursosMpio : "0";
			$AportesEspecieMpio = isset($AportesEspecieMpio) ? $AportesEspecieMpio : "0";

			$result = [];
			$Campos = ["ID_DEPTO","ID_MUNICIPIO","NOMBRE_CONTACTO","NUMERO_CONTACTO","CORREO_CONTACTO","ROL_JURIDICO","ROL_LOGISTICO","ROL_TECNICO","FECHA_SOLICITUD","TIPO_CONTRATO","TIPO_MODALIDAD","TIPO_PERSONA","NRO_ACTA","FECHA_NRO_ACTA","OBJETO_CONTRATO","SEGMENTO_CONTRATO","TOTAL_APORTES", "APORTES_RECURSOS_VIVA","APORTES_ESPECIE_VIVA" , "APORTES_RECURSOS_MPIO", "APORTES_ESPECIE_MPIO" ,  "PROCESO","DISPONIBILIDAD_PRESUPUESTAL","FECHA_DISPONIBILIDAD_PRESUPUESTAL","MONTO_DISPONIBILIDAD_PRESUPUESTAL" , "TIPO_PROCESO_CONTRATO","POSEE_ARCHIVOS","DIRECCION"];

			$Valores = [$depto,$mpio,$PersonaContacto,$numero_contacto,$correo_contacto,$rol_juridico,$rol_logistico,$rol_tecnico,$FechaSolicitud,$TipoContrato,$TipoModalidad,$TipoPersona,$NroActa,$FechaNroActa, $ObjetoContrto , $SegmentoContrto , $TotalAportes , $AportesRecursosViva , $AportesEspecieViva , $AportesRecursosMpio , $AportesEspecieMpio   , $Proceso , $DisponibilidadPresupuestal , $FechaDisponibilidadPresupuestal , $MontoDisponibilidad , $tipoProcesoContratacion,$PoseeArchivo,$Direccion ];
			$Tabla = "JURIDICA_CONTRATO";
			$MensajeLog1 = "Se registra el contrato directo de tipo : ".$tipoProcesoContratacion;
			$result['IdContrato'] = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

			if($PoseeOtraFuente=="SI"){
				for ($i=0; $i <count($OtraFuente) ; $i++) { 
					$Campos = ["Id_Contrato","Monto","NombreFuente"];
					$Valores = [$result['IdContrato'],FormateoInversoMonto($OtraFuente[$i]['MontoOtraFuente']),$OtraFuente[$i]['NombreOtraFuente']];
					$Tabla = "juridica_contrato_OtrasFuentes";
					$MensajeLog1 = "Se registra el Financiamiento de otras fuente para el contrato: ".$result['IdContrato'] ;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}

			$result['NumContrato'] = AsignarNumeroContrato($result['IdContrato']);
			// evaluo si la funcion retorno N/A es que se le debe solicitar al usuario ingresar el número
			if($result['NumContrato']!="N/A"){
				$Campos = ["CONTRATO_NUMERO_VIVA"];
				$Valores = [ $result['NumContrato'] ];
				$Tabla = "JURIDICA_CONTRATO";
				$MensajeLog1 = "Se registra el Número de contrato directo de tipo : ".$tipoProcesoContratacion;
				funciones_generales_BDActualizarDatos($result['IdContrato'] ,$Campos,$Valores,$Tabla,$MensajeLog1);
			}

			if (isset($ArchivosCargados) && count($ArchivosCargados) > 0) {
				for($i=0; $i < count($ArchivosCargados) ; $i++) { 

					$base = explode('.', $ArchivosCargados[$i]['NombreArchivo']);
					$formato = $base[1];
					$nuevaRuta = CargarArchivo('Contrato',"AdjuntoContrato-".$NumContratoViva."_".$i.".".$formato,$ArchivosCargados[$i]['Url'],$ArchivosCargados[$i]['NombreArchivo'],$NumContratoViva);
					$ArchivosCargados[$i]['NombreArchivo'] = "AdjuntoContrato-".$NumContratoViva."_".$i.".".$formato;
					$Campos = ["NOMBRE_ARCHIVO","ID_JURIDICA_CONTRATO","URL","SIZE","TIPO_DOCUMENTO"];
					$Valores = [$ArchivosCargados[$i]['NombreArchivo'],$result['IdContrato'],$nuevaRuta,$ArchivosCargados[$i]['size'],$ArchivosCargados[$i]['TipoDocumento'] ];
					$Tabla = "contrato_adjuntos";
					$MensajeLog1 = "Se registra el archivo adjunto ".$ArchivosCargados[$i]['NombreArchivo']." para el contrato: ".$NumContratoViva;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}

			if (isset($ContratistasDirecto) && count($ContratistasDirecto) > 0) {
				for($i=0; $i < count($ContratistasDirecto) ; $i++) { 
					$digito = $ContratistasDirecto[$i]['Digito']!="NO" ? $ContratistasDirecto[$i]['Digito'] : "";
					$Campos = ["NombreContratista","Identificacion","Digito_verificacion","Id_Contrato"];
					$Valores = [$ContratistasDirecto[$i]['Nombre'],$ContratistasDirecto[$i]['Identificacion'],$digito,$result['IdContrato']];
					$Tabla = "juridica_contrato_contratante";
					$MensajeLog1 = "Se registra el contratante adjunto ".$ContratistasDirecto[$i]['Nombre']." para el contrato: ".$result['IdContrato'] ;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}
			echo json_encode($result);
		}
	break;
	case 'GuardarContratoProcesoSeleccion':
	
		if( $rol_juridico && $rol_logistico && $rol_tecnico && $FechaSolicitud && $TipoContrato && $TipoModalidad  && $NroActa && $FechaNroActa && $ObjetoContrto && $SegmentoContrto && $Proceso!="Ninguno" && $DisponibilidadPresupuestal && $FechaDisponibilidadPresupuestal && $MontoDisponibilidad && $tipoProcesoContratacion && $Direccion!="Ninguno"){

			$PoseeArchivo = isset($ArchivosCargados) && count($ArchivosCargados)>0 ? "SI" : "NO";
			$result = [];
			$Campos = ["ID_DEPTO","ID_MUNICIPIO","NOMBRE_CONTACTO","NUMERO_CONTACTO","CORREO_CONTACTO","ROL_JURIDICO","ROL_LOGISTICO","ROL_TECNICO","FECHA_SOLICITUD","TIPO_CONTRATO","TIPO_MODALIDAD","NRO_ACTA","FECHA_NRO_ACTA","OBJETO_CONTRATO","SEGMENTO_CONTRATO", "PROCESO","DISPONIBILIDAD_PRESUPUESTAL","FECHA_DISPONIBILIDAD_PRESUPUESTAL","MONTO_DISPONIBILIDAD_PRESUPUESTAL" , "TIPO_PROCESO_CONTRATO","POSEE_ARCHIVOS","DIRECCION"];

			$Valores = [$depto,$mpio,$PersonaContacto,$numero_contacto,$correo_contacto,$rol_juridico,$rol_logistico,$rol_tecnico,$FechaSolicitud,$TipoContrato,$TipoModalidad,$NroActa,$FechaNroActa, $ObjetoContrto , $SegmentoContrto ,  $Proceso , $DisponibilidadPresupuestal , $FechaDisponibilidadPresupuestal , $MontoDisponibilidad , $tipoProcesoContratacion , $PoseeArchivo, $Direccion ];
			$Tabla = "JURIDICA_CONTRATO";
			$MensajeLog1 = "Se registra el proceso de selección de tipo : ".$tipoProcesoContratacion;
			$result['IdContrato'] =  funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

			$result['NumContrato'] = AsignarNumeroProceso($result['IdContrato']);
			if($result['NumContrato']!="N/A"){
				$Campos = ["CONTRATO_NUMERO_VIVA"];
				$Valores = [ $result['NumContrato'] ];
				$Tabla = "JURIDICA_CONTRATO";
				$MensajeLog1 = "Se registra el Número de Procceso de selección de tipo : ".$tipoProcesoContratacion;
				funciones_generales_BDActualizarDatos($result['IdContrato'] ,$Campos,$Valores,$Tabla,$MensajeLog1);
			}



			if (isset($ArchivosCargados) && count($ArchivosCargados) > 0) {
				for($i=0; $i < count($ArchivosCargados) ; $i++) { 

					$base = explode('.', $ArchivosCargados[$i]['NombreArchivo']);
					$formato = $base[1];
					$nuevaRuta = CargarArchivo('Contrato',"AdjuntoContrato-".$NumContratoViva."_".$i.".".$formato,$ArchivosCargados[$i]['Url'],$ArchivosCargados[$i]['NombreArchivo'],$NumContratoViva);
					$ArchivosCargados[$i]['NombreArchivo'] = "AdjuntoContrato-".$NumContratoViva."_".$i.".".$formato;
					$Campos = ["NOMBRE_ARCHIVO","ID_JURIDICA_CONTRATO","URL","SIZE","TIPO_DOCUMENTO"];
					$Valores = [$ArchivosCargados[$i]['NombreArchivo'],$result['IdContrato'],$nuevaRuta,$ArchivosCargados[$i]['size'],$ArchivosCargados[$i]['TipoDocumento'] ];
					$Tabla = "contrato_adjuntos";
					$MensajeLog1 = "Se registra el archivo adjunto ".$ArchivosCargados[$i]['NombreArchivo']." para el contrato: ".$NumContratoViva;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				}
			}
			echo json_encode($result);
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

				$Campos = ["CONTRATO_NUMERO_VIVA","CONTRATO_NUMERO_CONTRATANTE","CONTRATANTE","FECHA_INI","FECHA_FIN","MONTO","OBJETO_CONTRATO","ID_DEPTO","ID_MUNICIPIO","NOMBRE_CONTACTO","NUMERO_CONTACTO","CORREO_CONTACTO","POSEE_ARCHIVOS","PAGOHONORARIO","RETENCION","TIPO_PROCESO_CONTRATO"];
				$Valores = [$NumContratoViva,$NumContratoContratante,$contratante,$FechaIni,$FechaFin,$Monto,$objetoContrato,$depto,$mpio,$PersonaContacto,$numero_contacto,$correo_contacto,$PoseeArchivo,$Honorarios,$retencion,"BVM"];
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


function ConsultarAlerta($ParDias) {
	
	$sql = "";
	$resultados = [];
	if($ParDias=="30"){
		$sql = "SELECT a.CONTRATO_NUMERO_VIVA,a.FECHA_INI , a.FECHA_FIN , a.TIPO_PROCESO_CONTRATO , a.TipoModalidad , a.TipoContrato from vw_contratos_porvencer_30dias a WHERE FIND_IN_SET('".$_SESSION['Usuario']."',Usuarios) = 0 ORDER BY a.CONTRATO_NUMERO_VIVA";
		$con = conectar();
	    $query = mysqli_query($con, $sql);
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	            $material = array(
	                "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA'],
	                "FECHA_INI" => $datos['FECHA_INI'],
	                "FECHA_FIN" => $datos['FECHA_FIN'],
	                "TIPO_PROCESO_CONTRATO" => $datos['TIPO_PROCESO_CONTRATO'],
	                "TipoModalidad" => $datos['TipoModalidad'],
	                "TipoContrato" => $datos['TipoContrato']
	            );
	            array_push($resultados, $material);
	        }
	        mysqli_close($con);
	    }
	}else if($ParDias=="15"){

		$sql = "SELECT a.CONTRATO_NUMERO_VIVA,a.FECHA_INI , a.FECHA_FIN , a.TIPO_PROCESO_CONTRATO , a.TipoModalidad , a.TipoContrato from vw_contratos_porvencer_15dias a WHERE FIND_IN_SET('".$_SESSION['Usuario']."',Usuarios) = 0 ORDER BY a.CONTRATO_NUMERO_VIVA";
	    $con = conectar();
	    $query = mysqli_query($con, $sql);
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	            $material = array(
	                "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA'],
	                "FECHA_INI" => $datos['FECHA_INI'],
	                "FECHA_FIN" => $datos['FECHA_FIN'],
	                "TIPO_PROCESO_CONTRATO" => $datos['TIPO_PROCESO_CONTRATO'],
	                "TipoModalidad" => $datos['TipoModalidad'],
	                "TipoContrato" => $datos['TipoContrato']
	            );
	            array_push($resultados, $material);
	        }
	        mysqli_close($con);
	    }
	}else if($ParDias=="Amparos"){
		$sql = "SELECT a.Compania_Poliza , a.Numero_Poliza , a.NumContrato  ,a.Fecha_Inicio_Amparo , a.Fecha_Fin_Amparo , a.TipoAmparo , a.Cuantia_Amparo FROM VW_AMPAROS_VENCER30DIAS a WHERE FIND_IN_SET('".$_SESSION['Usuario']."',Usuarios) = 0 ORDER BY a.NumContrato";
	    $con = conectar();
	    $query = mysqli_query($con, $sql);
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	            $material = array(
	                "Compania_Poliza" => $datos['Compania_Poliza'],
	                "Numero_Poliza" => $datos['Numero_Poliza'],
	                "NumContrato" => $datos['NumContrato'],
	                "Fecha_Inicio_Amparo" => $datos['Fecha_Inicio_Amparo'],
	                "Fecha_Fin_Amparo" => $datos['Fecha_Fin_Amparo'],
	                "TipoAmparo" => $datos['TipoAmparo'],
	                "Cuantia_Amparo" => $datos['Cuantia_Amparo']
	            );
	            array_push($resultados, $material);
	        }
	        mysqli_close($con);
	    }
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

function CargarInformacionOtrasFuentes($ParId) {
	
	$sql = "SELECT a.Monto , a.NombreFuente  from juridica_contrato_otrasfuentes a WHERE a.ACTIVO = '1' and a.Id_Contrato =  $ParId order by a.NombreFuente";
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = [];
    if (mysqli_num_rows($query) > 0) {
        while ($datos = mysqli_fetch_assoc($query)) {
            $material = array(
                "NombreFuente" => $datos['NombreFuente'],
                "Monto" => $datos['Monto']
            );
            array_push($resultados, $material);
        }
        mysqli_close($con);
    }
    return $resultados;
}

function CargarAmparosPoliza($ParId) {
	
	$sql = "SELECT a.Id,b.Nombre TipoAmparo, a.Fecha_Inicio_Amparo , a.Fecha_Fin_Amparo , a.Cuantia_Amparo FROM juridica_contrato_poliza_amparos a , juridica_contrato_amparos b WHERE b.Id = a.Tipo_Amparo and a.Activo= 1 and a.Id_Poliza = $ParId order by b.Nombre,a.Fecha_Inicio_Amparo";
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = [];
    if (mysqli_num_rows($query) > 0) {
        while ($datos = mysqli_fetch_assoc($query)) {
            $material = array(
                "Id" => $datos['Id'],
                "TipoAmparo" => $datos['TipoAmparo'],
                "Fecha_Inicio_Amparo" => $datos['Fecha_Inicio_Amparo'],
                "Fecha_Fin_Amparo" => $datos['Fecha_Fin_Amparo'],
                "Cuantia_Amparo" => $datos['Cuantia_Amparo']
            );
            array_push($resultados, $material);
        }
        mysqli_close($con);
    }
    return $resultados;
}

function AsignarNumeroContratoProceso($ParIdCont)
{

	$sql = "SELECT ifnull(LPAD(( SELECT count(a1.ID) from juridica_contrato a1 WHERE a1.TIPO_PROCESO_CONTRATO =  a.TIPO_PROCESO_CONTRATO and a1.Total_Aportes is not null and a1.Total_Aportes)+1, 3, '0'),'001') Num , ifnull(b.Abreviatura,'N/A') Abreviatura, YEAR(now()) vigencia FROM juridica_contrato a INNER JOIN juridica_contrato_tipo_modalidad b WHERE a.TIPO_MODALIDAD = b.Id and a.TIPO_PROCESO_CONTRATO = 'ContratoProceso' and a.ID =  $ParIdCont ";
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = "";
    while ($datos = mysqli_fetch_assoc($query)) {
        $material = array(
            "Num" => $datos['Num'],
            "vigencia" => $datos['vigencia'],
            "Abreviatura" => $datos['Abreviatura']
        );
        if($datos['Abreviatura']!="N/A"){
        	$resultados = $datos['Abreviatura']."-".$datos['Num']."-".$datos['vigencia'];
        }else{
        	$resultados = "N/A";
        }
    }
    mysqli_close($con);
    return $resultados;
}


function AsignarNumeroContrato($ParIdCont)
{

	$sql = "SELECT ifnull(LPAD(( SELECT count(a1.ID) from juridica_contrato a1 where a1.ESTADO_CONTRATO = 'EN EJECUCIÓN' or a1.CONTRATO_NUMERO_CONTRATANTE is not null )+1, 3, '0'),'001') Num , ifnull(b.Abreviatura,'N/A') Abreviatura, YEAR(now()) vigencia FROM juridica_contrato a INNER JOIN cfg_tipo_contrato b WHERE a.TIPO_CONTRATO = b.Id and a.ID =  $ParIdCont ";
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = "";
    while ($datos = mysqli_fetch_assoc($query)) {
        $material = array(
            "Num" => $datos['Num'],
            "vigencia" => $datos['vigencia'],
            "Abreviatura" => $datos['Abreviatura']
        );
        if($datos['Abreviatura']!="N/A"){
        	$resultados = $datos['Abreviatura']."-".$datos['Num']."-".$datos['vigencia'];
        }else{
        	$resultados = "N/A";
        }
    }
    mysqli_close($con);
    return $resultados;
}

function AsignarNumeroProceso($ParIdCont)
{

	$sql = "SELECT ifnull(LPAD(( SELECT count(a1.ID) from juridica_contrato a1 WHERE a1.TIPO_PROCESO_CONTRATO =  a.TIPO_PROCESO_CONTRATO and a1.TIPO_MODALIDAD = a.TIPO_MODALIDAD ), 3, '0'),'001') Num , ifnull(b.Abreviatura,'N/A') Abreviatura, YEAR(now()) vigencia FROM juridica_contrato a INNER JOIN juridica_contrato_tipo_modalidad b WHERE a.TIPO_MODALIDAD = b.Id and a.TIPO_PROCESO_CONTRATO = 'ContratoProceso' and a.ID =  $ParIdCont ";
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = "";
    while ($datos = mysqli_fetch_assoc($query)) {
        $material = array(
            "Num" => $datos['Num'],
            "vigencia" => $datos['vigencia'],
            "Abreviatura" => $datos['Abreviatura']
        );
        if($datos['Abreviatura']!="N/A"){
        	$resultados = $datos['Abreviatura']."-".$datos['Num']."-".$datos['vigencia'];
        }else{
        	$resultados = "N/A";
        }
    }
    mysqli_close($con);
    return $resultados;
}
?>