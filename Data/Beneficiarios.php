<?php
extract($_POST);
require_once("../Seguridad/conex.php");
require_once("../funciones_generales.php");
switch($opcion){
	case 'BuscarContratoPostulado':
		$con = conectar();
		$sql = "SELECT a.CONTRATO_NUMERO_VIVA, a.ID from vw_contratos_para_beneficiarios a WHERE a.CONTRATO_NUMERO_VIVA LIKE '%".$ingresado."%' order by  a.CONTRATO_NUMERO_VIVA";
		$query= mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "ID" => $datos['ID'],
				    "Contrato" => $datos['CONTRATO_NUMERO_VIVA']
				));
			}
			echo json_encode($resultados);
		}else{
			echo "NO";
		}
		mysqli_close($con);
	break;
	case 'BuscarDatosAfiliado':
		$con = conectar();
		$sql = "SELECT a.PrimerNombreJefeHogar , a.SegundoNombreJefeHogar , a.PrimerApellidoJefeHogar , a.SegundoApellidoJefeHogar , a.Identificacion , a.Id_TipoDocumento , a.Escolaridad , a.Ocupacion ,a.FechaNacimiento , a.Telefono , a.Id_Genero from beneficiario_datos_postulados a where a.Identificacion = $NumeroIdentificacion and a.Id_TipoDocumento = $TipoIdentificacion ";
		$query= mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "PrimerNombreJefeHogar" => $datos['PrimerNombreJefeHogar'],
				    "SegundoNombreJefeHogar" => $datos['SegundoNombreJefeHogar'],
				    "PrimerApellidoJefeHogar" => $datos['PrimerApellidoJefeHogar'],
				    "SegundoApellidoJefeHogar" => $datos['SegundoApellidoJefeHogar'],
				    "Identificacion" => $datos['Identificacion'],
				    "Escolaridad" => $datos['Escolaridad'],
				    "Ocupacion" => $datos['Ocupacion'],
				    "FechaNacimiento" => $datos['FechaNacimiento'],
				    "Telefono" => $datos['Telefono'],
				    "Id_Genero" => $datos['Id_Genero']
				));
			}
			echo json_encode($resultados);
		}else{
			echo "NO";
		}
		mysqli_close($con);
	break;
	case 'GuardarPostuladoTemporal':
		$con = conectar();
		$sql = "SELECT Id FROM Beneficiario_datos_Json_Temp WHERE Activo = 1 and  Nombre = '".$Referencia."'";
		$query= mysqli_query($con,$sql);
		if(mysqli_num_rows($query)>0){
			echo "Referencia duplicada, intente con otra!";
		}else{

			$Campos = ["Json_Temporal","Nombre"];
			$Valores = [$JsonTemp,$Referencia];
			$Tabla = "Beneficiario_datos_Json_Temp";
			$MensajeLog1 = "Se registra el json del listado temporal ".$Referencia;
			funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			echo "OK";
		}
		mysqli_close($con);	
	break;
	case 'GuardarPostuladoDefinitivo':
		$con = conectar();
		if($IdListado=="NO"){
			$IdListado=null;
		}else{
			$Campos = ["Activo"];
			$Valores = ["0"];
			$Tabla = "Beneficiario_datos_Json_Temp";
			$MensajeLog1 = "Se inactiva la lista temporal una vez almacenado los datos del Id ".$IdListado;
			funciones_generales_BDActualizarDatos($IdListado,$Campos,$Valores,$Tabla,$MensajeLog1);
		}

		for ($i=0; $i <count($Postulados) ; $i++) { 
			$dato = $Postulados[$i];
			$sql = "SELECT a.Id FROM beneficiario_datos_postulados a WHERE a.Identificacion = '".$dato['Identificacion']."' LIMIT 1";
			$query= mysqli_query($con,$sql);
			$dato_id = mysqli_fetch_assoc($query);
			$Campos = ["Id_Postulado","Monto","Id_listado","Fecha_Desembolso"];
			$Valores = [ $dato_id['Id'] ,$dato['Monto'],$IdListado,$FechaDesembolso  ];
			$Tabla = "beneficiario_datos_pagos";
			$MensajeLog1 = "Se registra de forma permanente el listado de postulados ";
			funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
		}

		echo "OK";
		mysqli_close($con);	
	break;	
	case 'ActualizarPostuladoTemporal':
		$Campos = ["Json_Temporal"];
		$Valores = [$JsonTemp];
		$Tabla = "Beneficiario_datos_Json_Temp";
		$MensajeLog1 = "Se actualiza el Json del Id ".$IdListado;
		funciones_generales_BDActualizarDatos($IdListado,$Campos,$Valores,$Tabla,$MensajeLog1);
		echo "OK";
	break;
	case 'SeleccionarListadoTemporal':
		$con = conectar();
		$sql = "SELECT Id,Nombre,Json_Temporal,DATE_FORMAT(FechaActualizacion,'%d/%m/%Y %h:%i %p') FechaActualizacion,UsuarioCreacion FROM beneficiario_datos_json_temp WHERE Id = ".$IdTemporal." ORDER BY Nombre";
		$query= mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){

				$cantidad = 0;

				if($datos['Json_Temporal']!=""){
					$cantidad = count(json_decode($datos['Json_Temporal'], true));
				}


				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "Nombre" => $datos['Nombre'],
				    "Json_Temporal" => $datos['Json_Temporal'],
				    "FechaActualizacion" => $datos['FechaActualizacion'],
				    "UsuarioCreacion" => $datos['UsuarioCreacion'],
				    "Cantidad" => $cantidad
				));
			}
			echo json_encode($resultados);
		}else{
			echo "NO";
		}
		mysqli_close($con);
	break;
	case 'BuscarListadoTemporal':

		$con = conectar();
		$sql = "SELECT Id,Nombre,Json_Temporal,FechaActualizacion,UsuarioCreacion FROM beneficiario_datos_json_temp WHERE  Activo = 1  and Nombre LIKE '%".$ingresado."%' ORDER BY Nombre";
		$query= mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				$cantidad = 0;

				if($datos['Json_Temporal']!=""){
					$cantidad = count(json_decode($datos['Json_Temporal'], true));
				}

				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "Nombre" => $datos['Nombre'],
				    "FechaActualizacion" => $datos['FechaActualizacion'],
				    "UsuarioCreacion" => $datos['UsuarioCreacion'],
				    "Cantidad" => $cantidad
				));
			}
			echo json_encode($resultados);
		}else{
			echo "NO";
		}
		mysqli_close($con);

	break;
	case 'FiltrarListadosBeneficiarios':
		
		$where = " ";

		if($BenefList_Alcantarillado != "Ninguno"){
			$where.=" and a.IdAlcantarillado = ".$BenefList_Alcantarillado;
		}

		if($BenefList_Escolaridad != "Ninguno"){
			$where.=" and a.Escolaridad = ".$BenefList_Escolaridad;
		}

		if($BenefList_Departamento != "Ninguno"){
			$where.=" and a.Id_depto = ".$BenefList_Departamento;
		}

		if($BenefList_Municipio != "Ninguno"){
			$where.=" and a.Id_mpio = ".$BenefList_Municipio;
		}

		if($BenefList_DispAgua != "Ninguno"){
			$where.=" and a.Id_DisponibilidadAgua = ".$BenefList_DispAgua;
		}

		if($BenefList_Genero != "Ninguno"){
			$where.=" and a.Id_Genero = ".$BenefList_Genero;
		}

		if($BenefList_Proyecto != "Ninguno"){
			$where.=" and a.Id_Proyecto = ".$BenefList_Proyecto;
		}

		if($BenefList_TipoAcceso != "Ninguno"){
			$where.=" and a.Id_Tipo_Acceso = ".$BenefList_TipoAcceso;
		}

		if($BenefList_TipoEnergia != "Ninguno"){
			$where.=" and a.IdEnergia = ".$BenefList_TipoEnergia;
		}

		if($BenefList_TipoVivienda != "Ninguno"){
			$where.=" and a.IdTipoVivienda = ".$BenefList_TipoVivienda;
		}

		if($BenefList_TipoIntervencion != "Ninguno"){
			$where.=" and a.Id_Tipo_Intervencion = ".$BenefList_TipoIntervencion;
		}

		if($BenefList_TipoTenencia != "Ninguno"){
			$where.=" and a.IdTenencia = ".$BenefList_TipoTenencia;
		}

		if($BenefList_TipoOcupacion != "Ninguno"){
			$where.=" and a.Ocupacion = ".$BenefList_TipoOcupacion;
		}

		if($BenefList_Convenio != "Ninguno"){
			$where.=" and a.Convenio = '".$BenefList_Convenio."'";
		}

		if($BenefList_EnfoqueDiferencial!="NO"){
			$where.= " and r.Id in (";
			for ($i=0; $i < count($BenefList_EnfoqueDiferencial); $i++) { 
				$where.=$BenefList_EnfoqueDiferencial[$i].',';
			}
			$where.='0)';
		}
/*
BenefList_Contenido
*/
	$sql = "";
	if($BenefList_Contenido == "Postulados"){
		$sql = "SELECT a.Id, a.ID_form, a.FechaElaboracion, a.Convenio, IFNULL(b.nombre,'S/D') AS Depto, IFNULL(c.nombre, 'S/D') AS Municipio, a.Direccion, IFNULL(d.Nombre, 'S/D') AS TipoVivienda, IFNULL(e.NombreProyecto, 'S/D') AS NombreProyecto, IFNULL(f.Nombre, 'S/D') AS TipoIntervencion, a.PrimerApellidoJefeHogar, IFNULL(a.SegundoApellidoJefeHogar,'S/D') SegundoApellidoJefeHogar, a.PrimerNombreJefeHogar,IFNULL(a.SegundoNombreJefeHogar,'S/D') SegundoNombreJefeHogar, IFNULL(g.Nombre, 'S/D') AS TipoDocumento, a.Identificacion, a.FechaNacimiento, IFNULL(i.Nombre, 'S/D') AS TipoOcupacion, a.IngresoPromedioMensual, a.Telefono, IFNULL(j.Nombre, 'S/D') AS Genero, IFNULL(k.Nombre, 'S/D') AS TipoAcceso, IFNULL(a.Latitud,'S/D') Latitud , IFNULL(a.Longitud,'S/D') Longitud, IFNULL(l.Nombre, 'S/D') AS DisponibilidadAgua, IFNULL(m.Nombre, 'S/D') AS Tenencia, IFNULL(a.OtraTenencia, 'S/D') AS OtraTenencia, IFNULL(n.Nombre, 'S/D') AS TipoEnergia, IFNULL(o.Nombre, 'S/D') AS TipoAlcantarillado , GROUP_CONCAT(r.Nombre,',') EnfoqueDiferencial
			FROM beneficiario_datos_postulados a 
			LEFT JOIN cfg_departamentos b ON a.Id_depto = b.id
			LEFT JOIN cfg_municipios c ON a.Id_mpio = c.id
			LEFT JOIN beneficiario_cfg_tipo_vivienda d ON a.IdTipoVivienda = d.Id
			LEFT JOIN beneficiarios_cfg_proyectos e ON a.Id_Proyecto = e.Id 
			LEFT JOIN beneficiario_cfg_tipo_intervencion f ON f.Id = a.Id_Tipo_Intervencion
			LEFT JOIN cfg_tipo_identificacion_documento g ON g.Id = a.Id_TipoDocumento
			LEFT JOIN cfg_nivel_escolaridad h ON h.Id = a.Escolaridad
			LEFT JOIN cfg_tipo_ocupacion i ON i.Id = a.Ocupacion
			LEFT JOIN cfg_genero j ON j.Id = a.Id_Genero 
			LEFT JOIN beneficiario_cfg_tipo_acceso k ON k.Id = a.Id_Tipo_Acceso
			LEFT JOIN beneficiario_cfg_tipo_disponibilidad_agua l ON l.Id = a.Id_DisponibilidadAgua
			LEFT JOIN beneficiario_cfg_tipo_tenencia m ON m.Id = a.IdTenencia
			LEFT JOIN beneficiario_cfg_tipo_energia n ON n.Id = a.IdEnergia
			LEFT JOIN beneficiario_cfg_tipo_alcantarilaldo_saneamiento o ON o.Id = a.IdAlcantarillado
			LEFT JOIN beneficiario_datos_postulados_enfoque_diferencial p ON p.Id_beneficiario_postulado = a.Id
			LEFT JOIN beneficiario_cfg_tipo_enfoque_diferencial r ON r.Id = p.Id_tipo_enfoque_diferencial
			WHERE a.ACTIVO = 1 and a.Id not IN ( SELECT a1.Id_Postulado FROM beneficiario_datos_pagos a1 WHERE ACTIVO = 1 ) $where GROUP BY a.Id ORDER BY a.Identificacion";
	}else if($BenefList_Contenido == "Beneficiarios"){
		$sql = "SELECT a.Id, a.ID_form, a.FechaElaboracion, a.Convenio, IFNULL(b.nombre,'S/D') AS Depto, IFNULL(c.nombre, 'S/D') AS Municipio, a.Direccion, IFNULL(d.Nombre, 'S/D') AS TipoVivienda, IFNULL(e.NombreProyecto, 'S/D') AS NombreProyecto, IFNULL(f.Nombre, 'S/D') AS TipoIntervencion, a.PrimerApellidoJefeHogar, IFNULL(a.SegundoApellidoJefeHogar,'S/D') SegundoApellidoJefeHogar, a.PrimerNombreJefeHogar,IFNULL(a.SegundoNombreJefeHogar,'S/D') SegundoNombreJefeHogar, IFNULL(g.Nombre, 'S/D') AS TipoDocumento, a.Identificacion, a.FechaNacimiento, IFNULL(i.Nombre, 'S/D') AS TipoOcupacion, a.IngresoPromedioMensual, a.Telefono, IFNULL(j.Nombre, 'S/D') AS Genero, IFNULL(k.Nombre, 'S/D') AS TipoAcceso, IFNULL(a.Latitud,'S/D') Latitud , IFNULL(a.Longitud,'S/D') Longitud, IFNULL(l.Nombre, 'S/D') AS DisponibilidadAgua, IFNULL(m.Nombre, 'S/D') AS Tenencia, IFNULL(a.OtraTenencia, 'S/D') AS OtraTenencia, IFNULL(n.Nombre, 'S/D') AS TipoEnergia, IFNULL(o.Nombre, 'S/D') AS TipoAlcantarillado , GROUP_CONCAT(r.Nombre,',') EnfoqueDiferencial
			FROM beneficiario_datos_postulados a 
			LEFT JOIN cfg_departamentos b ON a.Id_depto = b.id
			LEFT JOIN cfg_municipios c ON a.Id_mpio = c.id
			LEFT JOIN beneficiario_cfg_tipo_vivienda d ON a.IdTipoVivienda = d.Id
			LEFT JOIN beneficiarios_cfg_proyectos e ON a.Id_Proyecto = e.Id 
			LEFT JOIN beneficiario_cfg_tipo_intervencion f ON f.Id = a.Id_Tipo_Intervencion
			LEFT JOIN cfg_tipo_identificacion_documento g ON g.Id = a.Id_TipoDocumento
			LEFT JOIN cfg_nivel_escolaridad h ON h.Id = a.Escolaridad
			LEFT JOIN cfg_tipo_ocupacion i ON i.Id = a.Ocupacion
			LEFT JOIN cfg_genero j ON j.Id = a.Id_Genero 
			LEFT JOIN beneficiario_cfg_tipo_acceso k ON k.Id = a.Id_Tipo_Acceso
			LEFT JOIN beneficiario_cfg_tipo_disponibilidad_agua l ON l.Id = a.Id_DisponibilidadAgua
			LEFT JOIN beneficiario_cfg_tipo_tenencia m ON m.Id = a.IdTenencia
			LEFT JOIN beneficiario_cfg_tipo_energia n ON n.Id = a.IdEnergia
			LEFT JOIN beneficiario_cfg_tipo_alcantarilaldo_saneamiento o ON o.Id = a.IdAlcantarillado
			LEFT JOIN beneficiario_datos_postulados_enfoque_diferencial p ON p.Id_beneficiario_postulado = a.Id
			LEFT JOIN beneficiario_cfg_tipo_enfoque_diferencial r ON r.Id = p.Id_tipo_enfoque_diferencial
			WHERE a.ACTIVO = 1 and a.Id IN ( SELECT a1.Id_Postulado FROM beneficiario_datos_pagos a1 WHERE ACTIVO = 1 ) $where GROUP BY a.Id ORDER BY a.Identificacion";
	}else{
		$sql = "SELECT a.Id, a.ID_form, a.FechaElaboracion, a.Convenio, IFNULL(b.nombre,'S/D') AS Depto, IFNULL(c.nombre, 'S/D') AS Municipio, a.Direccion, IFNULL(d.Nombre, 'S/D') AS TipoVivienda, IFNULL(e.NombreProyecto, 'S/D') AS NombreProyecto, IFNULL(f.Nombre, 'S/D') AS TipoIntervencion, a.PrimerApellidoJefeHogar, IFNULL(a.SegundoApellidoJefeHogar,'S/D') SegundoApellidoJefeHogar, a.PrimerNombreJefeHogar,IFNULL(a.SegundoNombreJefeHogar,'S/D') SegundoNombreJefeHogar, IFNULL(g.Nombre, 'S/D') AS TipoDocumento, a.Identificacion, a.FechaNacimiento, IFNULL(i.Nombre, 'S/D') AS TipoOcupacion, a.IngresoPromedioMensual, a.Telefono, IFNULL(j.Nombre, 'S/D') AS Genero, IFNULL(k.Nombre, 'S/D') AS TipoAcceso, IFNULL(a.Latitud,'S/D') Latitud , IFNULL(a.Longitud,'S/D') Longitud, IFNULL(l.Nombre, 'S/D') AS DisponibilidadAgua, IFNULL(m.Nombre, 'S/D') AS Tenencia, IFNULL(a.OtraTenencia, 'S/D') AS OtraTenencia, IFNULL(n.Nombre, 'S/D') AS TipoEnergia, IFNULL(o.Nombre, 'S/D') AS TipoAlcantarillado , GROUP_CONCAT(r.Nombre,',') EnfoqueDiferencial
			FROM beneficiario_datos_postulados a 
			LEFT JOIN cfg_departamentos b ON a.Id_depto = b.id
			LEFT JOIN cfg_municipios c ON a.Id_mpio = c.id
			LEFT JOIN beneficiario_cfg_tipo_vivienda d ON a.IdTipoVivienda = d.Id
			LEFT JOIN beneficiarios_cfg_proyectos e ON a.Id_Proyecto = e.Id 
			LEFT JOIN beneficiario_cfg_tipo_intervencion f ON f.Id = a.Id_Tipo_Intervencion
			LEFT JOIN cfg_tipo_identificacion_documento g ON g.Id = a.Id_TipoDocumento
			LEFT JOIN cfg_nivel_escolaridad h ON h.Id = a.Escolaridad
			LEFT JOIN cfg_tipo_ocupacion i ON i.Id = a.Ocupacion
			LEFT JOIN cfg_genero j ON j.Id = a.Id_Genero 
			LEFT JOIN beneficiario_cfg_tipo_acceso k ON k.Id = a.Id_Tipo_Acceso
			LEFT JOIN beneficiario_cfg_tipo_disponibilidad_agua l ON l.Id = a.Id_DisponibilidadAgua
			LEFT JOIN beneficiario_cfg_tipo_tenencia m ON m.Id = a.IdTenencia
			LEFT JOIN beneficiario_cfg_tipo_energia n ON n.Id = a.IdEnergia
			LEFT JOIN beneficiario_cfg_tipo_alcantarilaldo_saneamiento o ON o.Id = a.IdAlcantarillado
			LEFT JOIN beneficiario_datos_postulados_enfoque_diferencial p ON p.Id_beneficiario_postulado = a.Id
			LEFT JOIN beneficiario_cfg_tipo_enfoque_diferencial r ON r.Id = p.Id_tipo_enfoque_diferencial
			WHERE a.ACTIVO = 1 $where GROUP BY a.Id ORDER BY a.Identificacion";
	}	
		$con = conectar();
		$query= mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "ID_form" => $datos['ID_form'],
				    "FechaElaboracion" => $datos['FechaElaboracion'],
				    "Convenio" => $datos['Convenio'],
				    "Depto" => $datos['Depto'],
				    "Municipio" => $datos['Municipio'],
				    "Direccion" => $datos['Direccion'],
				    "TipoVivienda" => $datos['TipoVivienda'],
				    "NombreProyecto" => $datos['NombreProyecto'],
				    "TipoIntervencion" => $datos['TipoIntervencion'],
				    "PrimerApellidoJefeHogar" => $datos['PrimerApellidoJefeHogar'],
				    "SegundoApellidoJefeHogar" => $datos['SegundoApellidoJefeHogar'],
				    "PrimerNombreJefeHogar" => $datos['PrimerNombreJefeHogar'],
				    "SegundoNombreJefeHogar" => $datos['SegundoNombreJefeHogar'],
				    "TipoDocumento" => $datos['TipoDocumento'],
				    "Identificacion" => $datos['Identificacion'],
				    "FechaNacimiento" => $datos['FechaNacimiento'],
				    "TipoOcupacion" => $datos['TipoOcupacion'],
				    "IngresoPromedioMensual" => $datos['IngresoPromedioMensual'],
				    "Telefono" => $datos['Telefono'],
				    "Genero" => $datos['Genero'],
				    "TipoAcceso" => $datos['TipoAcceso'],
				    "Latitud" => $datos['Latitud'],
				    "Longitud" => $datos['Longitud'],
				    "DisponibilidadAgua" => $datos['DisponibilidadAgua'],
				    "Tenencia" => $datos['Tenencia'],
				    "OtraTenencia" => $datos['OtraTenencia'],
				    "TipoEnergia" => $datos['TipoEnergia'],
				    "TipoAlcantarillado" => $datos['TipoAlcantarillado'],
				    "EnfoqueDiferencial" => $datos['EnfoqueDiferencial'],
				    "GrupoFamiliar" => AgregarGrupoFamiliar($datos['Id'])
				));
			}
			echo json_encode($resultados);
		}else{
			echo "NO";
		}
		mysqli_close($con);

	break;	
	case 'BuscarCedulaPostulado':
		
		$where = " and a.Identificacion not in ( '0'";
		if (isset($Postulados) && is_array($Postulados) && count($Postulados) > 0) {
			for ($i=0; $i < count($Postulados); $i++) { 			
				$where.= " , '".$Postulados[$i]['Identificacion']."'";
			}
			$where.= ")";
		}else{
			$where="";
		}	

		$con = conectar();
		$sql = "SELECT a.Id, b.Siglas TipoDocumento, a.Identificacion , b.Id Id_TipoDocumento ,a.PrimerNombreJefeHogar, a.SegundoNombreJefeHogar , a.PrimerApellidoJefeHogar , a.SegundoApellidoJefeHogar, a.Convenio , c.NombreProyecto FROM beneficiario_datos_postulados a , cfg_tipo_identificacion_documento b , beneficiarios_cfg_proyectos c WHERE a.Id_TipoDocumento = b.Id and c.Id = a.Id_Proyecto and  a.Identificacion LIKE '%".$ingresado."%' ".$where." ORDER BY a.Identificacion,a.PrimerNombreJefeHogar, a.SegundoNombreJefeHogar , a.PrimerApellidoJefeHogar , a.SegundoApellidoJefeHogar";
		$query= mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "TipoDocumento" => $datos['TipoDocumento'],
				    "Identificacion" => $datos['Identificacion'],
				    "Convenio" => $datos['Convenio'],
				    "NombreProyecto" => $datos['NombreProyecto'],
				    "NombreCompletoJefeHogar" => $datos['PrimerNombreJefeHogar']." ".$datos['SegundoNombreJefeHogar']." ".$datos['PrimerApellidoJefeHogar']." ".$datos['SegundoApellidoJefeHogar'],
				    "BeneficiosOtorgados" => ValidarOtrosBenecios($datos['Id_TipoDocumento'],$datos['Identificacion'])
				));
			}
			echo json_encode($resultados);
		}else{
			echo "NO";
		}
		mysqli_close($con);

	break;
	case 'GuardarPostulado':

		$BenefRegPost_OtraTenencia = $BenefRegPost_OtraTenencia ? $BenefRegPost_OtraTenencia : "NULL";
		$BenefRegPost_SegundoApellidoJefe = $BenefRegPost_SegundoApellidoJefe=="S/D" ? $BenefRegPost_SegundoApellidoJefe : "NULL";
		$BenefRegPost_SegundoNombreJefe = $BenefRegPost_SegundoNombreJefe=="S/D" ? $BenefRegPost_SegundoNombreJefe : "NULL";
		$BenefRegPost_Longitud = $BenefRegPost_Longitud ? $BenefRegPost_Longitud : "NULL";
		$BenefRegPost_Latitud = $BenefRegPost_Latitud ? $BenefRegPost_Latitud : "NULL";

		$Campos = ["FechaElaboracion","Convenio","Id_depto","Id_mpio","Direccion","IdTipoVivienda","Id_Proyecto","Id_Tipo_Intervencion","PrimerNombreJefeHogar","SegundoNombreJefeHogar","PrimerApellidoJefeHogar","SegundoApellidoJefeHogar","Id_TipoDocumento","Identificacion","FechaNacimiento","Escolaridad","Ocupacion","IngresoPromedioMensual","Telefono","Id_Genero","Id_Tipo_Acceso","Latitud","Longitud","Id_DisponibilidadAgua","IdTenencia","OtraTenencia","IdEnergia","IdAlcantarillado","ID_form"];

		$Valores = [$BenefRegPost_FechaElab,$BenefRegPost_Contrato,$BenefRegPost_dpto,$BenefRegPost_mpio,$BenefRegPost_Direccion,$BenefRegPost_TipoVivienda,$BenefRegPost_Proyecto,$BenefRegPost_TipoIntervencion,$BenefRegPost_PrimerNombreJefe,$BenefRegPost_SegundoNombreJefe,$BenefRegPost_PrimerApellidoJefe,$BenefRegPost_SegundoApellidoJefe,$BenefRegPost_TipoIdentificacion_Jefe,$BenefRegPost_NumIdenti_Jefe,$BenefRegPost_FechaNac_Jefe,$BenefRegPost_NivelEscolaridad_Jefe,$BenefRegPost_Ocupacion_Jefe,FormateoInversoMonto($BenefRegPost_IngresosMes_Jefe),$BenefRegPost_Telefono_Jefe,$BenefRegPost_Genero_jefe,$BenefRegPost_TipoAcceso,$BenefRegPost_Latitud,$BenefRegPost_Longitud,$BenefRegPost_DisponibilidadAgua,$BenefRegPost_ServicioTenencia,$BenefRegPost_OtraTenencia , $BenefRegPost_ServicioEnergia , $BenefRegPost_ServicioAlcantarillado,$BenefRegPost_ID];
		$Tabla = "beneficiario_datos_postulados";
		$MensajeLog1 = "Se registran los datos del postulado ".$BenefRegPost_PrimerNombreJefe." ".$BenefRegPost_SegundoNombreJefe." ".$BenefRegPost_PrimerApellidoJefe." ".$BenefRegPost_SegundoApellidoJefe;
		$IdBeneficiario = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

		if (count($BenefRegPost_EnfoqueDiferencial_jefe)>0 ) {
			for ($i=0; $i < count($BenefRegPost_EnfoqueDiferencial_jefe); $i++) { 
				$Campos = ["Id_beneficiario_postulado","Id_tipo_enfoque_diferencial"];
				$Valores = [$IdBeneficiario, $BenefRegPost_EnfoqueDiferencial_jefe[$i]];
				$Tabla = "beneficiario_datos_postulados_enfoque_diferencial";
				$MensajeLog1 = "Se registra el Enfoque diferencial del postulado de id ".$IdBeneficiario;
				funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			}
		}

		if (isset($GrupoFamiliar) && is_array($GrupoFamiliar) && count($GrupoFamiliar) > 0) {
			for ($i=0; $i < count($GrupoFamiliar); $i++) { 

				$cuerpo = $GrupoFamiliar[$i]; 

				$cuerpo['TipoDocumento'] = $cuerpo['TipoDocumento']!="Ninguno" ? $cuerpo['TipoDocumento'] : "NULL";
				$cuerpo['identificacion'] = $cuerpo['identificacion'] ? $cuerpo['identificacion'] : "NULL";
				$cuerpo['Parentesco'] = $cuerpo['Parentesco'] ? $cuerpo['Parentesco'] : "NULL";
				$cuerpo['NivelEscolaridad'] = $cuerpo['NivelEscolaridad']!="Ninguno" ? $cuerpo['NivelEscolaridad'] : "NULL";
				$cuerpo['FechaNacimiento'] = $cuerpo['FechaNacimiento'] ? $cuerpo['FechaNacimiento'] : "NULL";
				$cuerpo['IngresoMensual'] = $cuerpo['IngresoMensual'] ? FormateoInversoMonto($cuerpo['IngresoMensual']) : "NULL";

				$Campos = ["PrimerNombre","SegundoNombre","PrimerApellido","SegundoApellido","Id_Parentesco","Identificacion","FechaNacimiento","Id_TipoDocumento","Id_Escolaridad","IngresosMes","Id_beneficiario_postulado","Id_Genero"];
				$Valores = [$cuerpo['PrimerNombre'],$cuerpo['SegundoNombre'],$cuerpo['PrimerApellido'],$cuerpo['SegundoApellido'],$cuerpo['Parentesco'],$cuerpo['identificacion'],$cuerpo['FechaNacimiento'],$cuerpo['TipoDocumento'],$cuerpo['NivelEscolaridad'],$cuerpo['IngresoMensual'],$IdBeneficiario,$cuerpo['BenefRegPost_Genero_Pariente']];
				$Tabla = "Beneficiario_datos_postulados_grupo_familiar";
				$MensajeLog1 = "Se registra al ciudadano ".$cuerpo['PrimerNombre']." ".$cuerpo['SegundoNombre']." ".$cuerpo['PrimerApellido']." ".$cuerpo['SegundoApellido']." como familiar del postulado ".$IdBeneficiario;
				$IdGrupoFamiliar = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);


				if (isset($cuerpo['EnfoqueDiferencial']) && is_array($cuerpo['EnfoqueDiferencial']) && count($cuerpo['EnfoqueDiferencial']) > 0) {
					for ($a=0; $a < count($cuerpo['EnfoqueDiferencial']); $a++) { 
						$datos = $cuerpo['EnfoqueDiferencial'][$a];
						$Campos = ["Id_Grupo_Familiar","Id_tipo_enfoque_diferencial","Id_beneficiario_postulado"];
						$Valores = [ $IdGrupoFamiliar,$datos,$IdBeneficiario];
						$Tabla = "beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial";
						$MensajeLog1 = "Se registra la caracterización del familiar ".$IdGrupoFamiliar;
						funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
					}
				}
			}
		}
		echo $IdBeneficiario;
	break;
}


function ValidarOtrosBenecios($tipoIdentificacion, $identificacion)
{
	
	$sql = "SELECT CONCAT_WS(' ',a.PrimerApellidoJefeHogar,a.SegundoApellidoJefeHogar,a.PrimerNombreJefeHogar,a.SegundoNombreJefeHogar) as NombrePostulado ,b.Monto,a.Convenio, b.Fecha_Desembolso , c.NombreProyecto FROM beneficiario_datos_postulados a INNER JOIN beneficiario_datos_pagos b ON a.Id = b.Id_Postulado INNER JOIN beneficiarios_cfg_proyectos c ON a.Id_Proyecto = c.Id where a.Identificacion =  $identificacion and a.Id_TipoDocumento = $tipoIdentificacion";
	#echo $sql;
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = "NO";
    if (mysqli_num_rows($query) > 0) {
    	$resultados = [];
        while ($datos = mysqli_fetch_assoc($query)) {
            $material = array(
                "NombrePostulado" => $datos['NombrePostulado'],
                "Monto" => $datos['Monto'],
                "Convenio" => $datos['Convenio'],
                "Fecha_Desembolso" => $datos['Fecha_Desembolso'],
                "NombreProyecto" => $datos['NombreProyecto']
            );
            array_push($resultados, $material);
        }
        mysqli_close($con);
    }
    return $resultados;
}


function AgregarGrupoFamiliar($IdPostulado)
{

	$sql = "SELECT a.PrimerApellido,ifnull(a.SegundoApellido,'S/D') SegundoApellido,a.PrimerNombre,ifnull(a.SegundoNombre,'S/D') SegundoNombre, ifnull(a.FechaNacimiento,'S/D') FechaNacimiento , ifnull(b.Nombre,'S/D') TipoDocumento , ifnull(a.Identificacion,'S/D') Identificacion , ifnull(a.IngresosMes,'S/D') IngresosMes , ifnull(c.Nombre,'S/D') Parentesco , ifnull( d.Nombre,'S/D' ) Escolaridad ,ifnull(GROUP_CONCAT( f.Nombre,','),'S/D') EnfoqueDiferencial , ifnull( g.Nombre,'S/D' ) Genero
		FROM beneficiario_datos_postulados_grupo_familiar a 
		LEFT JOIN cfg_tipo_identificacion_documento b ON a.Id_TipoDocumento = b.Id 
		LEFT JOIN cfg_parentesco c on a.Id_Parentesco = c.Id 
		LEFT JOIN cfg_nivel_escolaridad d ON d.Id = a.Id_Escolaridad
		LEFT JOIN beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial e ON a.Id = e.Id_beneficiario_postulado
		LEFT JOIN beneficiario_cfg_tipo_enfoque_diferencial f ON f.Id = e.Id_tipo_enfoque_diferencial
		LEFT JOIN cfg_genero g on g.Id = a.Id_Genero
		WHERE a.ACTIVO = 1 and a.Id_beneficiario_postulado = $IdPostulado
		GROUP BY a.Id ";
	#echo $sql;
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = "NO";
    if (mysqli_num_rows($query) > 0) {
    	$resultados = [];
        while ($datos = mysqli_fetch_assoc($query)) {
            $material = array(
                "PrimerApellido" => $datos['PrimerApellido'],
                "SegundoApellido" => $datos['SegundoApellido'],
                "PrimerNombre" => $datos['PrimerNombre'],
                "SegundoNombre" => $datos['SegundoNombre'],
                "FechaNacimiento" => $datos['FechaNacimiento'],
                "Identificacion" => $datos['Identificacion'],
                "IngresosMes" => $datos['IngresosMes'],
                "Parentesco" => $datos['Parentesco'],
                "Escolaridad" => $datos['Escolaridad'],
                "TipoDocumento" => $datos['TipoDocumento'],
                "Genero" => $datos['Genero'],
                "EnfoqueDiferencial" => $datos['EnfoqueDiferencial']
            );
            array_push($resultados, $material);
        }
        mysqli_close($con);
    }
    return $resultados;


}