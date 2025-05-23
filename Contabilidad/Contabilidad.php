<?php
extract($_POST);
require_once("../Seguridad/conex.php");
require_once("../funciones_generales.php");
switch($opcion){


	case 'AgregarHonorarios':

		$Campos = ["Id_Contrato","Monto","FechaFactura","NumeroFactura"];
		$Valores = [$IdContrato,$monto,$Fecha,$Fatura];
		$Tabla = "JURIDICA_CONTRATO_HONORARIOS";
		$MensajeLog1 = "Se registra el Honorario para el contrato ID ".$IdContrato;
		$IdHonorarios = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

		echo "OK";
	break;

	case 'CargarHistoricoCuentaCobro':
	
		if($IdContrato){
			$con = conectar();
			$sql = "SELECT a.FechaCobro , a.MontoCobro, a.NumeroCobro FROM juridica_contrato_cuentacobros a WHERE a.Id_Contrato = ".$IdContrato." ORDER BY a.FechaCobro";
			$query = mysqli_query($con,$sql);
			$resultados = [];
			if(mysqli_num_rows($query)>0){
				while($datos = mysqli_fetch_assoc($query)){
					array_push($resultados, array(
					    "MontoCobro" => $datos['MontoCobro'],
					    "FechaCobro" => $datos['FechaCobro'],
					    "NumeroCobro" => $datos['NumeroCobro']
					));
				}
			}
			mysqli_close($con);
			echo json_encode($resultados);
		}	
	break;
	case 'CargarHistoricoHonorarios':
		
		if($IdContrato){
			$con = conectar();
			$sql = "SELECT Id,Monto,FechaFactura,NumeroFactura FROM juridica_contrato_honorarios a WHERE a.ACTIVO='1' and a.Id_Contrato = ".$IdContrato." ORDER BY a.FechaFactura";
			$query = mysqli_query($con,$sql);
			$resultados = [];
			if(mysqli_num_rows($query)>0){
				while($datos = mysqli_fetch_assoc($query)){
					array_push($resultados, array(
					    "ID" => $datos['Id'],
					    "Monto" => $datos['Monto'],
					    "FechaFactura" => $datos['FechaFactura'],
					    "NumeroFactura" => $datos['NumeroFactura']
					));
				}
			}
			mysqli_close($con);
			echo json_encode($resultados);
		}
	break;
	case 'AgregarCuentaCobro':
	
		$sql = "SELECT MONTO FROM juridica_contrato WHERE ID = ".$IdContrato;
		$con = conectar();
		$query = mysqli_query($con,$sql);

		$datos = mysqli_fetch_assoc($query);	
		if($Monto>= $datos['MONTO']){
			echo "Monto no puede ser mayor o igual al del contrato!";

		}ELSE{
			$Campos = ["Id_Contrato","FechaCobro","MontoCobro","NumeroCobro"];
			$Valores = [$IdContrato,$Fecha,$Monto,$Numero];
			$Tabla = "Juridica_contrato_CuentaCobros";
			$MensajeLog1 = "Se registra el contrato nuevo: ".$IdContrato;
			$IdCuentaCobro = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

			$sql = "SELECT CONTRATO_NUMERO_VIVA FROM juridica_contrato WHERE ID =".$IdContrato;
			$query = mysqli_query($con,$sql);
			$datos = mysqli_fetch_assoc($query);

			if(count($ArchivosCargados)>0 && $IdCuentaCobro){
				for ($i=0; $i < count($ArchivosCargados); $i++) { 

					$base = explode('.', $ArchivosCargados[$i]['NombreArchivo']);
					$formato = $base[1];

					$nuevaRuta = CargarArchivo('CuentaCobro',"AdjuntoCuentaCobro-".$IdCuentaCobro."_".$i.".".$formato,$ArchivosCargados[$i]['Url'],$ArchivosCargados[$i]['NombreArchivo'],$datos['CONTRATO_NUMERO_VIVA']."---".$IdCuentaCobro);
					$ArchivosCargados[$i]['NombreArchivo'] = "AdjuntoCuentaCobro-".$IdContrato."_".$i.".".$formato;

					$Campos = ["NOMBRE_ARCHIVO","ID_JURIDICA_CONTRATO_CUENTACOBRO","URL","SIZE","TIPO_DOCUMENTO"];
					$Valores = [$ArchivosCargados[$i]['NombreArchivo'],$IdCuentaCobro,$nuevaRuta ,$ArchivosCargados[$i]['size'],$ArchivosCargados[$i]['TipoDocumento']];
					$Tabla = "juridica_contrato_CuentaCobros_adjuntos";
					$MensajeLog1 = "Se registra el adjunto ".$ArchivosCargados[$i]['NombreArchivo']." para la cuenta de cobro del contrato ".$IdContrato;
					funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

				}
			}

			mysqli_close($con);
			echo "Ok";
		}

	break;
}


?>