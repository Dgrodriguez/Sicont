<?php
extract($_POST);
require_once("../Seguridad/conex.php");
require_once("../funciones_generales.php");
switch($opcion){


	case 'GuardarFactura':
		
		$Campos = ["Id_depto","Id_mpio","Contrato","Observaciones"];
		$Valores = [ $Depto , $Mpio , $NroContrato , $Observaciones  ];
		$Tabla = "Pedidos_Factura";
		$MensajeLog1 = "Se registra factura para el contrato nro ".$NroContrato;
		$IdFactura = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
		$numFactura =  GenerarNumeroFactura($IdFactura);

		if(count($OrdenesPedidoCargadas)>0){

			for ($i=0; $i < count($OrdenesPedidoCargadas) ; $i++) { 
				$con = conectar();
				
				$Campos = ["Id_Factura","NumeroOrdenPedido","MontoOrden"];
				$Valores = [ $IdFactura , $OrdenesPedidoCargadas[$i]["NumeroOrdenPedido"] , $OrdenesPedidoCargadas[$i]["MontoOrden"] ];
				$Tabla = "Pedidos_Factura_Orden_Pedidos";
				$MensajeLog1 = "Se registra Orden de Pedido nro ".$OrdenesPedidoCargadas[$i]["NumeroOrdenPedido"]." para la factura  ".$numFactura;
				funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

				$id_OrdenPedido = "";
				$sql = "SELECT Id FROM pedidos_orden_pedido where Numero_Orden_Pedido = '".$OrdenesPedidoCargadas[$i]["NumeroOrdenPedido"] ."'";
				$query = mysqli_query($con,$sql);
				$datos = mysqli_fetch_assoc($query);
				$id_OrdenPedido = $datos['Id'];
				$Campos = ["Id_EstadoORdenPedido"];
				$Valores = [ '2' ];
				$Tabla = "pedidos_orden_pedido";
				$MensajeLog1 = "Se actualiza la Orden de Pedido nro ".$OrdenesPedidoCargadas[$i]["NumeroOrdenPedido"]." a pagada en la factura: ".$numFactura;
				funciones_generales_BDActualizarDatos($id_OrdenPedido, $Campos,$Valores,$Tabla,$MensajeLog1);
				mysqli_close($con);
			}
		}

	if (isset($NotaCredito) && is_array($NotaCredito) && count($NotaCredito) > 0) {
	    for ($i = 0; $i < count($NotaCredito); $i++) { 
	        $Campos = ["Id_Factura", "Material", "Cantidad", "Precio", "Nro_Orden_Credito"];
	        $Valores = [$IdFactura, $NotaCredito[$i]["Material"], $NotaCredito[$i]["Cantidad"], $NotaCredito[$i]["PrecioOriginal"], $NotaCredito[$i]["NroOrdenCredito"]];
	        $Tabla = "Pedidos_Factura_Nota_Credito";
	        $MensajeLog1 = "Se registra Nota de Credito para la factura " . $numFactura;
	        funciones_generales_BDInsertarDatos($Campos, $Valores, $Tabla, $MensajeLog1);
	    }
	}


	echo $numFactura;

	break;
	case 'CargarContrato':
		$con = conectar();
		$sql = "SELECT CONTRATO_NUMERO_VIVA,ID FROM juridica_contrato WHERE ID_DEPTO = ".$depto." and ID_MUNICIPIO = ".$mpio." and now() BETWEEN FECHA_INI and FECHA_FIN ORDER BY CONTRATO_NUMERO_VIVA";
		//echo $sql;
		$query = mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA'],
				    "ID" => $datos['ID']
				));
			}
		}
		mysqli_close($con);
		echo json_encode($resultados);
	break;
	case 'DesactivarOrdenPedido':

		$con = conectar();
		#reactivo todas las cotizaciones para que esten disponibles para una nueva ordend e pedido
		$upadte1 = "UPDATE pedidos_cotizacion SET Id_estado_cotizacion = 1, FechaActualizacion = NOW(), UsuarioActualizacion = '".$_SESSION['Usuario']."' WHERE ID IN (    SELECT derived_table.ID FROM ( SELECT c.ID  FROM pedidos_orden_pedido a INNER JOIN pedidos_orden_pedido_cotizacion b ON a.Id = b.Id_Orden_Pedido INNER JOIN pedidos_cotizacion c ON c.NumeroCotizacion = b.Numero_Cotizacion WHERE a.Numero_Orden_Pedido = '".$ParNumero_Orden_Pedido."' ) AS derived_table )";
		$query_up1 = mysqli_query($con,$upadte1);	

		#una vez liberado las cotizaciones, desactivo la orden de pedido como tal
		$update2 = "UPDATE pedidos_orden_pedido a LEFT JOIN pedidos_orden_pedidos_materiales b ON a.Id = b.Id_Orden_Pedido LEFT JOIN pedidos_orden_pedidos_reportados c ON c.Numero_Orden_Pedido = a.Numero_Orden_Pedido LEFT JOIN pedidos_orden_pedido_cotizacion d ON d.Id_Orden_Pedido = a.Id set a.Activo= '0' , a.FechaActualizacion =now(), a.UsuarioActualizacion = '".$_SESSION['Usuario']."' , b.ACTIVO= '0' , b.FechaActualizacion =now(), b.UsuarioActualizacion = '".$_SESSION['Usuario']."'  , c.ACTIVO= '0' , c.FechaActualizacion =now(), c.UsuarioActualizacion = '".$_SESSION['Usuario']."'  , d.ACTIVO= '0' , d.FechaActualizacion =now(), d.UsuarioActualizacion = '".$_SESSION['Usuario']."' where a.Numero_Orden_Pedido ='".$ParNumero_Orden_Pedido."' ";
		#echo $update2."<br>";
		$query_up2 = mysqli_query($con,$update2);	
		funciones_generales_LogGuardar("El Usuario ",'NO');
		mysqli_close($con);
		echo "OK";

	break;
	case 'CargarElementoResolverReportar':
		$con = conectar();
		$sql = "SELECT 
				    a.Id,
				    r.Cantidad AS Cantidad,
				    a.Material,
				    a.IdProveedor,
				    a.Precio,
				    b.Nombre AS Proveedor,
				    c.Numero_Orden_Pedido  
				FROM 
				    pedidos_orden_pedidos_materiales a
				    INNER JOIN proveedor b ON b.Id = a.IdProveedor
				    INNER JOIN pedidos_orden_pedido c ON c.Id = a.Id_Orden_Pedido
				    LEFT JOIN (
				        SELECT   Numero_Orden_Pedido, Material,  SUM(Cantidad) AS Cantidad
				        FROM pedidos_orden_pedidos_reportados
				        WHERE  Numero_Orden_Pedido = '".$NumOpp."' and Estado is null
				        GROUP BY Numero_Orden_Pedido,  Material
				    ) r ON r.Numero_Orden_Pedido = c.Numero_Orden_Pedido AND r.Material = a.Material  and r.Cantidad>0
				WHERE r.Cantidad is not null
				ORDER BY  a.Material";
		//echo $sql;
		$query = mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "Cantidad" => $datos['Cantidad'],
				    "Material" => $datos['Material'],
				    "IdProveedor" => $datos['IdProveedor'],
				    "Precio" => $datos['Precio'],
				    "Proveedor" => $datos['Proveedor']
				));
			}
		}
		mysqli_close($con);
		echo json_encode($resultados);
	break;
	case 'CargarElementoReportar':
		$con = conectar();
		$sql = "SELECT 
				    a.Id,
				    a.Cantidad - COALESCE(r.Cantidad, 0) AS Cantidad,
				    a.Material,
				    a.IdProveedor,
				    a.Precio,
				    b.Nombre AS Proveedor,
				    c.Numero_Orden_Pedido  
				FROM 
				    pedidos_orden_pedidos_materiales a
				    INNER JOIN proveedor b ON b.Id = a.IdProveedor
				    INNER JOIN pedidos_orden_pedido c ON c.Id = a.Id_Orden_Pedido
				    LEFT JOIN (
				        SELECT Numero_Orden_Pedido,  Material, SUM(Cantidad) AS Cantidad
				        FROM pedidos_orden_pedidos_reportados
				        WHERE Numero_Orden_Pedido = '".$NumOpp."' and Estado is null
				        GROUP BY Numero_Orden_Pedido,  Material
				    ) r ON r.Numero_Orden_Pedido = c.Numero_Orden_Pedido AND r.Material = a.Material
				WHERE c.Numero_Orden_Pedido = '".$NumOpp."'
				ORDER BY a.Material";
		$query = mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "Id" => $datos['Id'],
				    "Cantidad" => $datos['Cantidad'],
				    "Material" => $datos['Material'],
				    "IdProveedor" => $datos['IdProveedor'],
				    "Precio" => $datos['Precio'],
				    "Proveedor" => $datos['Proveedor']
				));
			}
		}
		mysqli_close($con);
		echo json_encode($resultados);
	break;
	case 'ReportarElementosOPP':
		if( count($datosSeleccionados)>0 ){
			for ($i=0; $i <count($datosSeleccionados) ; $i++) { 
				$dato = $datosSeleccionados[$i];
				$Campos = ["Material","Numero_Orden_Pedido","Cantidad","Motivo"];
				$Valores = [$dato['MatenialNombre'],$dato['NumOpp'] , $dato['Cantidad'] , $dato['Motivo'] ];
				$Tabla = "Pedidos_Orden_Pedidos_Reportados";
				$MensajeLog1 = "Se registra Material reportado ";
				$IdServicio = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			}
		}	
		echo "OK";
	break;
	case 'GuardarSolucionReportarElementosOPP':
		$con = conectar();
		if( count($datosSeleccionados)>0 ){
			for ($i=0; $i <count($datosSeleccionados) ; $i++) {
				$dato = $datosSeleccionados[$i];
				$sql = "UPDATE pedidos_orden_pedidos_reportados set Estado = '".$dato['Motivo']."' where Numero_Orden_Pedido = '".$dato['NumOpp']."' and Material='".$dato['MatenialNombre']."'";
				$query = mysqli_query($con,$sql);
			}
		}
	break;
	case 'FiltrarOrdenesPedido':
		
		$filtro = " ";

		if($depto!="Ninguno"){
			$filtro.=" and a.Id_Depto= ".$depto;
		}

		if($mpio!="Ninguno"){
			$filtro.=" and a.Id_Mpio= ".$mpio;
		}

		if($contrato!="Ninguno"){
			$filtro.=" and a.Id_Contrato= ".$contrato;
		}

		if($FechaIni!="NO"){
			$filtro.=" and a.FechaCreacion>= '".$FechaIni."'";
		}

		if($FechaFin!="NO"){
			$filtro.=" and a.FechaCreacion<= '".$FechaFin."'";
		}

		if($Estado!="NO"){
			$filtro.=" and a.Id_EstadoOrdenPedido = ".$Estado;
		}

		$con = conectar();
		$sql = "SELECT a.Id,a.Numero_Orden_Pedido , a.Observaciones , ObtenerTotalOrdenPedido(a.Id) saldo , b.nombre depto, c.nombre mpio , d.CONTRATO_NUMERO_VIVA , f.Nombre EstadoOrden from pedidos_orden_pedido a INNER JOIN cfg_departamentos b ON a.Id_Depto = b.id INNER JOIN cfg_municipios c on a.Id_Mpio = c.id  INNER JOIN juridica_contrato d ON d.ID = a.Id_Contrato INNER JOIN cfg_estado_orden_pedido f on f.Id = a.Id_EstadoOrdenPedido where a.Activo = '1' ".$filtro." order by a.Numero_Orden_Pedido";
		$query = mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "ID" => $datos['Id'],
				    "Numero_Orden_Pedido" => $datos['Numero_Orden_Pedido'],
				    "Observaciones" => $datos['Observaciones'],
				    "saldo" => $datos['saldo'],
				    "depto" => $datos['depto'],
				    "mpio" => $datos['mpio'],
				    "EstadoOrden" => $datos['EstadoOrden'],
				    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA']
				));
			}
		}
		mysqli_close($con);
		echo json_encode($resultados);
	break;
	case 'FiltrarOrdenesPedidoReportados':
		$filtro = " ";

		if($depto!="Ninguno"){
			$filtro.=" and a.Id_Depto= ".$depto;
		}

		if($mpio!="Ninguno"){
			$filtro.=" and a.Id_Mpio= ".$mpio;
		}

		if($contrato!="Ninguno"){
			$filtro.=" and a.Id_Contrato= ".$contrato;
		}

		if($FechaIni!="NO"){
			$filtro.=" and a.FechaCreacion>= '".$FechaIni."'";
		}

		if($FechaFin!="NO"){
			$filtro.=" and a.FechaCreacion<= '".$FechaFin."'";
		}

		if($Estado!="NO"){
			$filtro.=" and a.Id_EstadoOrdenPedido = ".$Estado;
		}

		//$sql = "SELECT a.Id,a.Numero_Orden_Pedido , a.Observaciones , ObtenerTotalOrdenPedido(a.Id) saldo , b.nombre depto, c.nombre mpio , d.CONTRATO_NUMERO_VIVA , f.Nombre EstadoOrden from pedidos_orden_pedido a INNER JOIN cfg_departamentos b ON a.Id_Depto = b.id INNER JOIN cfg_municipios c on a.Id_Mpio = c.id  INNER JOIN juridica_contrato d ON d.ID = a.Id_Contrato INNER JOIN cfg_estado_orden_pedido f on f.Id = a.Id_EstadoOrdenPedido where a.Activo = '1' ".$filtro." order by a.Numero_Orden_Pedido"

		$con = conectar();
		$sql = "SELECT a.Id,a.Numero_Orden_Pedido , a.Observaciones , ObtenerTotalOrdenPedido(a.Id) saldo , b.nombre depto, c.nombre mpio , d.CONTRATO_NUMERO_VIVA , f.Nombre EstadoOrden  from pedidos_orden_pedido a INNER JOIN cfg_departamentos b ON a.Id_Depto = b.id INNER JOIN cfg_municipios c on a.Id_Mpio = c.id  INNER JOIN juridica_contrato d ON d.ID = a.Id_Contrato  INNER JOIN cfg_estado_orden_pedido f on f.Id = a.Id_EstadoOrdenPedido where a.Activo = '1' and a.Numero_Orden_Pedido in ( SELECT a1.Numero_Orden_Pedido FROM pedidos_orden_pedidos_reportados a1 WHERE ACTIVO = 1 and a1.Estado is null)  ".$filtro." order by a.Numero_Orden_Pedido";
		#echo $sql;
		$query = mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while($datos = mysqli_fetch_assoc($query)){
				array_push($resultados, array(
				    "ID" => $datos['Id'],
				    "Numero_Orden_Pedido" => $datos['Numero_Orden_Pedido'],
				    "Observaciones" => $datos['Observaciones'],
				    "saldo" => $datos['saldo'],
				    "depto" => $datos['depto'],
				    "mpio" => $datos['mpio'],
				    "EstadoOrden" => $datos['EstadoOrden'],
				    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA']
				));
			}
		}
		mysqli_close($con);
		echo json_encode($resultados);
	break;
	case 'upload_file_Orden_Pedido':
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
		
		echo json_encode(CargaMasivaOrdenPedido($files[0]['Url']) );
	break;
	case 'CargarSaldoContratos':

		$sql = "SELECT disponible,Facturado,comprometido FROM VW_SALDOS_CONTRATO WHERE ID ='".$contrato."' ";
	    //echo $sql;
	    $con = conectar();
	    $query = mysqli_query($con, $sql);
	    $resultados = [];
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	           array_push($resultados, array(
	                "Disponible" => $datos['disponible'],
	                "Facturado" => $datos['Facturado'],
	                "Comprometido" => $datos['comprometido']
	            ));
	        }
	    }
        mysqli_close($con);
        echo json_encode($resultados);

	break;
	case 'GenerarOrdenPedidoResumen':

		$Campos = ["Id_Depto","Id_Mpio","Id_Contrato","Observaciones"];
		$Valores = [$depto, $mpio, $contrato , $Obervaciones ];
		$Tabla = "pedidos_orden_pedido";
		$MensajeLog1 = "Se registra la orden de pedido del mpio ".$mpio;
		$IdOrdenPedido = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

		if(count($CotizacionesCargadas)>0){
			for ($i=0; $i <count($CotizacionesCargadas) ; $i++) { 

				$Campos = ["Id_Orden_Pedido","Numero_Cotizacion"];
				$Valores = [$IdOrdenPedido, $CotizacionesCargadas[$i]['NumeroCotizacion'] ];
				$Tabla = "Pedidos_orden_pedido_cotizacion";
				$MensajeLog1 = "Se registra cotización a la orden $IdOrdenPedido ";
				funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				$Campos = ["Id_estado_cotizacion"];
				$Valores = [ 2 ];
				$Tabla = "pedidos_cotizacion";
				$MensajeLog1 = "Se actualiza estado de la  cotización por vinculacion a la orden $IdOrdenPedido ";
				funciones_generales_BDActualizarDatos($CotizacionesCargadas[$i]['Id'],$Campos,$Valores,$Tabla,$MensajeLog1);
			}
		}

		if(count($Material)>0){
			for ($i=0; $i <count($Material) ; $i++) { 
				$Campos = ["Id_Orden_Pedido","Cantidad","Material","Precio","IdProveedor"];
				$Valores = [$IdOrdenPedido, $Material[$i]['Cantidad'], $Material[$i]['Material'] ,$Material[$i]['Precio'] ,$Material[$i]['IdProveedor'] ];
				$Tabla = "Pedidos_Orden_Pedidos_Materiales";
				$MensajeLog1 = "Se registra elemento de la orden  $IdOrdenPedido con al descripción ".$Material[$i]['Material'] ;
				funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
			}
		}	
		echo GenerarNuevoNumeroOrdenPedido($IdOrdenPedido);
	break;
	case 'GuardarOrdenPedido':

		if($depto != "Ninguno" && $mpio != "Ninguno" && $contrato != "Ninguno" && $fechasol && $direccion && $solicitante && $cedula && $telefono && $cargo){

			$Campos = ["Id_Depto","Id_Mpio","Id_Contrato","FechaSol","Direccion","Solicitante","Cedula","Telefono","Cargo"];
			$Valores = [$depto, $mpio, $contrato , $fechasol ,$direccion , $solicitante , $cedula, $telefono, $cargo ];
			$Tabla = "Pedidos_Cotizacion";
			$MensajeLog1 = "Se registra la orden de pedido del mpio ".$mpio." de fecha ".$fechasol;
			$IdOrdenPedido = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
				if(count($Material)>0){
					for ($i=0; $i <count($Material) ; $i++) { 

						$Campos = ["Id_Orden_Pedido","Material","Cantidad","Unidad","Precio","Id_Proveedor"];
						$Valores = [$IdOrdenPedido, $Material[$i]['Elemento'], $Material[$i]['Cantidad'] ,$Material[$i]['Unidad'],FormateoInversoMonto($Material[$i]['PrecioElemento']),$Material[$i]['IdProveedor'] ];
						$Tabla = "pedidos_Cotizacion_detalles";
						$MensajeLog1 = "Se registra elemento de la orden  $IdOrdenPedido con al descripción ".$Material[$i]['Elemento'];
						funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
					}
				}

				if($PoseeAdjuntos=="SI"){
					for ($i=0; $i <count($ArchivosCargados) ; $i++) { 
						$Campos = ["Id_Orden_Pedido","NOMBRE_ARCHIVO","URL","SIZE"];
						$Valores = [$IdOrdenPedido, $ArchivosCargados[$i]['NombreArchivo'], $ArchivosCargados[$i]['Url'] ,$ArchivosCargados[$i]['size'] ];
						$Tabla = "pedidos_Cotizacion_adjuntos";
						$MensajeLog1 = "Se registra elemento de la orden  $IdOrdenPedido con al descripción ".$ArchivosCargados[$i]['NombreArchivo'];
						funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
					}
				}

				echo GenerarNuevoNumeroCotizacion($IdOrdenPedido);

			//echo "OK";
		}
	break;
	case 'CargarCotizaciones':
		if($IdContrato && $IdMpio){

			$filtro = "";
			if($numerosCotizacionString){
				$filtro = "and a.NumeroCotizacion not in (".$numerosCotizacionString.")";
			}


			$sql = "SELECT a.ID , a.NumeroCotizacion,FechaSol FROM pedidos_cotizacion a WHERE a.ACTIVO = 1  AND A.Id_Contrato = ".$IdContrato." and a.NumeroCotizacion like '%".$Ingresado."%' ".$filtro ." and a.Id_estado_cotizacion = 1 and a.NumeroCotizacion not in ( SELECT Numero_Cotizacion from pedidos_orden_pedido_cotizacion a1 where Activo = 1 ) and a.Id_Mpio = ".$IdMpio." order by a.NumeroCotizacion ";
			//echo $sql;
			$con = conectar();
		    $query = mysqli_query($con, $sql);
		    $resultados = [];
		    if (mysqli_num_rows($query) > 0) {
		        while ($datos = mysqli_fetch_assoc($query)) {
		            array_push($resultados, array(
		                "Id" => $datos['ID'],
		                "FechaCotizacion" => $datos['FechaSol'],
		                "NumeroCotizacion" => $datos['NumeroCotizacion']
		            ));
		        }
		        mysqli_close($con);
		        echo json_encode($resultados);
		    }else{echo "NO";}
		}else{echo "NO";}
	break;
	case 'CargarMontosOrdenesPedidos':
		$con = conectar();
		$sql = "SELECT a.Id, a.Numero_Orden_Pedido, a.Observaciones, c.Nombre AS proveedor, b.Material, b.Cantidad, b.Precio, (b.Cantidad * b.Precio) AS subtotal , IFNULL(( sum( d.Cantidad ) ) ,0) CantidadReportada, IFNULL(d.Motivo,'') Motivo, a.FechaCreacion
			FROM pedidos_orden_pedido a
			INNER JOIN pedidos_orden_pedidos_materiales b ON a.Id = b.Id_Orden_Pedido AND b.ACTIVO = 1
			INNER JOIN proveedor c ON c.Id = b.IdProveedor
			LEFT JOIN pedidos_orden_pedidos_reportados d ON d.Material = b.Material AND (d.Estado != 'Solucionado' or  d.Estado is null)
			WHERE a.ACTIVO = 1 AND a.Id_EstadoOrdenPedido = 1 AND a.Numero_Orden_Pedido = '".$NumOpp."'
			GROUP BY a.Id, a.Numero_Orden_Pedido , c.Nombre,  b.Material ,  b.Precio";
		$query = mysqli_query($con,$sql);
	    $resultados = [];
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	            array_push($resultados, array(
	                "Id" => $datos['Id'],
	                "FechaOrdenPedido" => $datos['FechaCreacion'],
	                "Observaciones" => $datos['Observaciones'],
	                "proveedor" => $datos['proveedor'],
	                "Material" => $datos['Material'],
	                "Cantidad" => $datos['Cantidad'],
	                "Precio" => $datos['Precio'],
	                "subtotal" => $datos['subtotal'],
	                "CantidadReportada" => $datos['CantidadReportada'],
	                "Motivo" => $datos['Motivo'],
	                "SaldoReportado" => ($datos['CantidadReportada']*$datos['Precio'])
	            ));
	        }
	        echo json_encode($resultados);
	    }else{echo "NO";}
		mysqli_close($con);
	break;
	case 'BuscarOrdenPedido':
		if($IdContrato && $IdMpio){

			$filtro = "";
			if($numerosCotizacionString){
				$filtro = "and a.Numero_Orden_Pedido not in (".$numerosCotizacionString.")";
			}
			$sql = "SELECT a.Numero_Orden_Pedido, a.Id, a.FechaCreacion from pedidos_orden_pedido a where a.ACTIVO = 1 and Id_EstadoOrdenPedido = 1 and a.Id_Contrato = ".$IdContrato." and a.Numero_Orden_Pedido like '%".$Ingresado."%' ".$filtro."  order by a.Numero_Orden_Pedido ";

			$con = conectar();
		    $query = mysqli_query($con, $sql);
		    $resultados = [];
		    if (mysqli_num_rows($query) > 0) {
		        while ($datos = mysqli_fetch_assoc($query)) {
		            array_push($resultados, array(
		                "Id" => $datos['Id'],
		                "FechaOrdenPedido" => $datos['FechaCreacion'],
		                "Numero_Orden_Pedido" => $datos['Numero_Orden_Pedido']
		            ));
		        }
		        mysqli_close($con);
		        echo json_encode($resultados);
		    }else{echo "NO";}
		}else{echo "NO";}
	break;
	case 'CargarCotizaciones':
		if($IdContrato && $IdMpio){

			$filtro = "";
			if($numerosCotizacionString){
				$filtro = "and a.NumeroCotizacion not in (".$numerosCotizacionString.")";
			}

			$sql = "SELECT a.ID , a.NumeroCotizacion,FechaSol FROM pedidos_cotizacion a WHERE a.ACTIVO = 1  AND A.Id_Contrato = ".$IdContrato." and a.NumeroCotizacion like '%".$Ingresado."%' ".$filtro ." and a.Id_estado_cotizacion = 1 and a.Id_Mpio = ".$IdMpio." order by a.NumeroCotizacion ";
			$con = conectar();
		    $query = mysqli_query($con, $sql);
		    $resultados = [];
		    if(mysqli_num_rows($query) > 0) {
		        while ($datos = mysqli_fetch_assoc($query)) {
		            array_push($resultados, array(
		                "Id" => $datos['ID'],
		                "FechaCotizacion" => $datos['FechaSol'],
		                "NumeroCotizacion" => $datos['NumeroCotizacion']
		            ));
		        }
		        mysqli_close($con);
		        echo json_encode($resultados);
		    }else{echo "NO";}
		}else{echo "NO";}
	break;
	case 'CargarListadoOrdenProveedores':
		

		$filtro = "";

		if($depto){
			$filtro.= " and a.Id_Depto = ".$depto." ";
		}

		if($mpio){
			$filtro.= " and a.Id_Mpio = ".$mpio." ";
		}


		if($Contrato){
			$filtro.= " and a.Id_Contrato = '".$Contrato."' ";
		}


		if($FechaIni){
			$filtro.= " and a.FechaSol >= '".$FechaIni."' ";
		}


		if($FechaFin){
			$filtro.= " and a.FechaSol <= '".$FechaFin."' ";
		}

		$sql = "SELECT a.ID,a.NumeroCotizacion,a.FechaSol,a.Solicitante , b.nombre Mpio, c.CONTRATO_NUMERO_VIVA FROM pedidos_Cotizacion a , cfg_municipios b , juridica_contrato c  where a.ACTIVO = '1' and a.Id_Mpio = b.id and c.ID = a.Id_Contrato and a.NumeroCotizacion not in ( SELECT a1.Numero_Cotizacion from pedidos_orden_pedido_cotizacion a1 INNER JOIN pedidos_orden_pedido b1 ON a1.Id_Orden_Pedido = b1.Id where a1.Activo = 1 and b1.Id_EstadoOrdenPedido != 3 and b1.Activo = 1 ) ".$filtro ." order by a.FechaSol desc";

		$con = conectar();
		$query = mysqli_query($con,$sql);
		$resultados = [];
		if(mysqli_num_rows($query)>0){
			while ($datos = mysqli_fetch_assoc($query) ) {
				array_push($resultados, array(
				    "Id" => $datos['ID'],
				    "NumeroOrdenPedido" => $datos['NumeroCotizacion'],
				    "FechaSol" => FormatatearFecha($datos['FechaSol']),
				    "Solicitante" => $datos['Solicitante'],
				    "Mpio" => $datos['Mpio'],
				    "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA']
				));
			}
			mysqli_close($con);
			echo json_encode($resultados);
		}
	break;
	case 'GenerarPlantillaOrdenPedido':
	    $sql = "SELECT a.Id,a.Nombre,a.Nit, b.nombre Municipio, a.Mpio IdMpio, a.Direccion , a.Telefono from proveedor a , cfg_municipios b WHERE a.Mpio = b.id and a.Id = ".$IdProveedor;
	    //echo $sql;
	    $con = conectar();
	    $query = mysqli_query($con, $sql);
	    $resultados = [];
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	           array_push($resultados, array(
	                "Id" => $datos['Id'],
	                "Nombre" => $datos['Nombre'],
	                "Nit" => $datos['Nit'],
	                "Municipio" => $datos['Municipio'],
	                "IdMpio" => $datos['IdMpio'],
	                "Direccion" => $datos['Direccion'],
	                "Telefono" => $datos['Telefono'],
	                "Materiales" => CargarMaterialesPlanilla($IdProveedor,$idMpio)
	            ));
	        }
	    }
        mysqli_close($con);
        echo json_encode($resultados);
    break;
	case 'BuscarElementoProveedor':
	    $sql = "SELECT a.Id,a.Elemento,a.Precio FROM proveedor_precio a WHERE FechaCambioPrecio = ( SELECT Max(a1.FechaCambioPrecio) from proveedor_precio a1 where a1.IdProveedor = $IdProveedor and a1.mpio = '".$Mpio."') and a.mpio = '".$Mpio."' and a.Elemento LIKE '%".$ingresado."%' ORDER BY a.Elemento";
	    //echo $sql;
	    $con = conectar();
	    $query = mysqli_query($con, $sql);
	    $resultados = [];
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	           array_push($resultados, array(
	                "Id" => $datos['Id'],
	                "Elemento" => $datos['Elemento'],
	                "Precio" => $datos['Precio']
	            ));
	        }
	    }
        mysqli_close($con);
        echo json_encode($resultados);
    break;
    case 'CargarMaterialesCotizacion':
	    $sql = "SELECT a.NumeroCotizacion,b.Material, b.Cantidad, b.Unidad, b.Precio, c.Nombre proveedor , d.nombre mpio , c.Id IdProveedor FROM pedidos_cotizacion a , pedidos_cotizacion_detalles b , proveedor c , cfg_municipios d WHERE a.Id  = b.Id_Orden_Pedido and c.Id = b.Id_Proveedor and a.Id_Mpio  = d.id and a.NumeroCotizacion = '".$NumeroCotizacion."' ORDER BY Material ";
	    #echo $sql;
	    $con = conectar();
	    $query = mysqli_query($con, $sql);
	    $resultados = [];
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	            array_push($resultados, array(
	                "Material" => $datos['Material'],
	                "Cantidad" => $datos['Cantidad'],
	                "Unidad" => $datos['Unidad'],
	                "Precio" => $datos['Precio'],
	                "NumeroCotizacion" => $datos['NumeroCotizacion'],
	                "proveedor" => $datos['proveedor'],
	                "IdProveedor" => $datos['IdProveedor'],
	                "mpio" => $datos['mpio']
	            ));
	        }
	    }
	    mysqli_close($con);
	    echo json_encode($resultados);
	    
    break;	

    case 'CargarOrdenPedidoReporte':
    	
    	$sql = "SELECT a.Id,b.Numero_Cotizacion, c.ID AS IdContrato, c.ID_DEPTO , e.nombre depto , c.ID_MUNICIPIO, f.nombre mpio ,c.CONTRATO_NUMERO_CONTRATANTE AS Convenio, d.FechaSol  , g.Nombre Estado
		FROM pedidos_orden_pedido AS a
		LEFT JOIN pedidos_orden_pedido_cotizacion AS b ON a.Id = b.Id_Orden_Pedido
		LEFT JOIN juridica_contrato AS c ON c.ID = a.Id_Contrato
		INNER JOIN cfg_departamentos e ON e.id = c.ID_DEPTO
		INNER JOIN cfg_municipios f ON f.id = c.ID_MUNICIPIO
		INNER JOIN cfg_estado_orden_pedido g ON g.Id = a.Id_EstadoOrdenPedido 
		LEFT JOIN pedidos_cotizacion AS d ON d.NumeroCotizacion = b.Numero_Cotizacion
		WHERE a.Numero_Orden_Pedido =  '".$OrdenPedidoEditar."'";
		$con = conectar();
	    $query = mysqli_query($con, $sql);
	    $resultados = [];
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	            $ordenPedido = array(
	                "Id" => $datos['Id'],
	                "Numero_Cotizacion" => $datos['Numero_Cotizacion'],
	                "IdContrato" => $datos['IdContrato'],
	                "ID_DEPTO" => $datos['ID_DEPTO'],
	                "ID_MUNICIPIO" => $datos['ID_MUNICIPIO'],
	                "depto" => $datos['depto'],
	                "mpio" => $datos['mpio'],
	                "Convenio" => $datos['Convenio'],
	                "Estado" => $datos['Estado'],
	                "FechaSol" => $datos['FechaSol'],
	                "Materiales" => []
	            );
	            $ordenPedido["Materiales"] = CargarMaterialesOP($datos['Id']);
	            array_push($resultados, $ordenPedido);
	        }
	    }
        mysqli_close($con);
        echo json_encode($resultados);
    break;
	case 'CargarEditarOrdenPedido':
	    $sql = "SELECT a.Id,a.NumeroCotizacion , a.Id_Depto , a.Id_Mpio , a.Id_Contrato , a.FechaSol, a.Direccion , a.Solicitante , a.Cedula , a.Telefono,a.Cargo , b.nombre depto_Nombre , c.nombre Mpio_Nombre , d.CONTRATO_NUMERO_VIVA  FROM  pedidos_Cotizacion a , cfg_departamentos b , cfg_municipios c ,juridica_contrato d where a.Id_Depto = b.id and a.Id_Mpio = c.id and d.ID = a.Id_Contrato and a.Id = $OrdenPedidoEditar ";
	    //echo $sql;
	    $con = conectar();
	    $query = mysqli_query($con, $sql);
	    $resultados = [];
	    if (mysqli_num_rows($query) > 0) {
	        while ($datos = mysqli_fetch_assoc($query)) {
	            $ordenPedido = array(
	                "Id" => $datos['Id'],
	                "Cantidad" => $datos['NumeroCotizacion'],
	                "Id_Depto" => $datos['Id_Depto'],
	                "Id_Mpio" => $datos['Id_Mpio'],
	                "Id_Contrato" => $datos['Id_Contrato'],
	                "Direccion" => $datos['Direccion'],
	                "FechaSol" => $datos['FechaSol'],
	                "Solicitante" => $datos['Solicitante'],
	                "Cedula" => $datos['Cedula'],
	                "Telefono" => $datos['Telefono'],
	                "Cargo" => $datos['Cargo'],
	                "depto_Nombre" => $datos['depto_Nombre'],
	                "Mpio_Nombre" => $datos['Mpio_Nombre'],
	                "CONTRATO_NUMERO_VIVA" => $datos['CONTRATO_NUMERO_VIVA'],
	                "Materiales" => [],
	                "Adjuntos" => []
	            );
	            $ordenPedido["Materiales"] = CargarMaterialesOP($datos['Id']);
	            $ordenPedido["Adjuntos"] = CargarAdjuntosOP($datos['Id']);
	            array_push($resultados, $ordenPedido);
	        }
	        mysqli_close($con);
	        echo json_encode($resultados);
	    }
    break;
    case 'GuardarActualizarOrdenPedido':
//funciones_generales_BDActualizarDatos($ID,$Campos,$Valores,$Tabla,$MensajeLog1)
    	if($depto != "Ninguno" && $mpio != "Ninguno" && $contrato != "Ninguno" && $fechasol && $direccion && $solicitante && $cedula && $telefono && $cargo){

			$Campos = ["Id_Depto","Id_Mpio","Id_Contrato","FechaSol","Direccion","Solicitante","Cedula","Telefono","Cargo"];
			$Valores = [$depto, $mpio, $contrato , $fechasol ,$direccion , $solicitante , $cedula, $telefono, $cargo ];
			$Tabla = "Pedidos_Cotizacion";
			$MensajeLog1 = "Se Actualiza la orden de pedido del mpio ".$mpio." de fecha ".$fechasol;
			funciones_generales_BDActualizarDatos($OrdenPedidoEditar,$Campos,$Valores,$Tabla,$MensajeLog1);
				$sql = "DELETE from pedidos_Cotizacion_detalles where Id_Orden_Pedido = ".$OrdenPedidoEditar;
	    		$con = conectar();
				$query = mysqli_query($con,$sql);
				if(count($Material)>0){
					for ($i=0; $i <count($Material) ; $i++) { 
						$Campos = ["Id_Orden_Pedido","Material","Cantidad","Unidad","Precio","Id_Proveedor"];
						$Valores = [$OrdenPedidoEditar, $Material[$i]['Elemento'], $Material[$i]['Cantidad'] ,$Material[$i]['Unidad'],FormateoInversoMonto($Material[$i]['Precio']),$Material[$i]['IdProveedor'] ];
						$Tabla = "pedidos_Cotizacion_detalles";
						$MensajeLog1 = "Se registra elemento de la orden  $OrdenPedidoEditar con al descripción ".$Material[$i]['Elemento'];
						funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
					}
				}
				$sql = "DELETE from pedidos_Cotizacion_adjuntos where Id_Orden_Pedido = ".$OrdenPedidoEditar;
				$query = mysqli_query($con,$sql);
				if($PoseeAdjuntos=="SI"){
					for ($i=0; $i <count($ArchivosCargados) ; $i++) { 
						$Campos = ["Id_Orden_Pedido","NOMBRE_ARCHIVO","URL","SIZE"];
						$Valores = [$OrdenPedidoEditar, $ArchivosCargados[$i]['NombreArchivo'], $ArchivosCargados[$i]['Url'] ,$ArchivosCargados[$i]['size'] ];
						$Tabla = "pedidos_Cotizacion_adjuntos";
						$MensajeLog1 = "Se registra elemento de la orden  $OrdenPedidoEditar con al descripción ".$ArchivosCargados[$i]['NombreArchivo'];
						funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);
					}
				}

				echo "OK";
		}

    break;
}


function CargarAdjuntosOP($IdOP)
{
    $sql = "SELECT NOMBRE_ARCHIVO,URL,SIZE from pedidos_Cotizacion_adjuntos where Id_Orden_Pedido = $IdOP and ACTIVO = 1 order by NOMBRE_ARCHIVO";
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = [];
    if (mysqli_num_rows($query) > 0) {
        while ($datos = mysqli_fetch_assoc($query)) {
            $adjuntos = array(
                "NOMBRE_ARCHIVO" => $datos['NOMBRE_ARCHIVO'],
                "URL" => $datos['URL'],
                "SIZE" => $datos['SIZE']
            );
            array_push($resultados, $adjuntos);
        }
        mysqli_close($con);
    }
    return $resultados;
}

function CargarMaterialesOP($IdOP)
{
    $sql = "SELECT b.Material,b.Cantidad,b.Unidad,a.Id_Depto , d.nombre Depto ,a.Id_Mpio , c.nombre Mpio , b.Id_Proveedor , e.Nombre Proveedor ,b.Precio FROM pedidos_Cotizacion_detalles b , pedidos_Cotizacion a , cfg_municipios c , cfg_departamentos d , proveedor e WHERE a.Id = b.Id_Orden_Pedido and d.id = a.Id_Depto and c.id = a.Id_Mpio and e.Id = b.Id_Proveedor and b.Id_Orden_Pedido =  $IdOP ORDER BY Material";
    //echo $sql; 
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = [];
    if (mysqli_num_rows($query) > 0) {
        while ($datos = mysqli_fetch_assoc($query)) {
            $material = array(
                "Material" => $datos['Material'],
                "Cantidad" => $datos['Cantidad'],
                "Id_Depto" => $datos['Id_Depto'],
                "Precio" => $datos['Precio'],
                "Depto" => $datos['Depto'],
                "Id_Mpio" => $datos['Id_Mpio'],
                "Mpio" => $datos['Mpio'],
                "Proveedor" => $datos['Proveedor'],
                "Id_Proveedor" => $datos['Id_Proveedor'],
                "Unidad" => $datos['Unidad']
            );
            array_push($resultados, $material);
        }
        mysqli_close($con);
    }
    return $resultados;
}

function CargarMaterialesPlanilla($IdProveedor,$idMpio)
{
    $sql = "SELECT a.Elemento , a.Unidad , a.Precio FROM proveedor_precio a WHERE a.IdProveedor = $IdProveedor and a.mpio = $idMpio and a.FechaCambioPrecio = (SELECT max(a1.FechaCambioPrecio) FROM proveedor_precio a1 WHERE a1.IdProveedor =  $IdProveedor and a1.mpio = $idMpio ) ORDER BY a.Elemento";
    $con = conectar();
    $query = mysqli_query($con, $sql);
    $resultados = [];
    if (mysqli_num_rows($query) > 0) {
        while ($datos = mysqli_fetch_assoc($query)) {
            $material = array(
                "Elemento" => $datos['Elemento'],
                "Unidad" => $datos['Unidad'],
                "Precio" => $datos['Precio']
            );
            array_push($resultados, $material);
        }
        mysqli_close($con);
    }
    return $resultados;
}



function GenerarNuevoNumeroCotizacion($IdOrdenPedido){

	$con = conectar();
	$sql = "SELECT CONCAT(year(now()),'-',count(a.ID)) NUMERO FROM pedidos_Cotizacion a WHERE year(FechaSol) = year(now())";
	$query = mysqli_query($con,$sql);
	$datos = mysqli_fetch_assoc($query);
	mysqli_close($con);
	$numeropedido = "COT-".$datos['NUMERO'];
	$Campos = ["NumeroCotizacion"];
	$Valores = [$numeropedido];
	$Tabla = "Pedidos_Cotizacion";
	$MensajeLog1 = "Se registra el número de Cotización ".$numeropedido;
	funciones_generales_BDActualizarDatos($IdOrdenPedido,$Campos,$Valores,$Tabla,$MensajeLog1);
	return $numeropedido;
}


function GenerarNuevoNumeroOrdenPedido($IdOrdenPedido){

	$con = conectar();
	$sql = "SELECT CONCAT(year(now()),'-',count(a.ID)) NUMERO FROM pedidos_orden_pedido a WHERE year(FechaCreacion) = year(now())";
	$query = mysqli_query($con,$sql);
	$datos = mysqli_fetch_assoc($query);
	mysqli_close($con);
	$numeropedido = "OPP-".$datos['NUMERO'];
	$Campos = ["Numero_Orden_Pedido"];
	$Valores = [$numeropedido];
	$Tabla = "pedidos_orden_pedido";
	$MensajeLog1 = "Se registra el número de orden de pedido ".$numeropedido;
	funciones_generales_BDActualizarDatos($IdOrdenPedido,$Campos,$Valores,$Tabla,$MensajeLog1);
	return $numeropedido;
}


function GenerarNumeroFactura($ParIdFact){

	$con = conectar();
	$sql = "SELECT CONCAT(year(now()),'-',count(a.ID)) NUMERO FROM pedidos_Factura a WHERE year(FechaCreacion) = year(now())";
	$query = mysqli_query($con,$sql);
	$datos = mysqli_fetch_assoc($query);
	mysqli_close($con);
	$NumeroFactura = "FACT-".$datos['NUMERO'];
	$Campos = ["Nro_Factura"];
	$Valores = [$NumeroFactura];
	$Tabla = "pedidos_Factura";
	$MensajeLog1 = "Se registra el número de factura del id ".$ParIdFact;
	funciones_generales_BDActualizarDatos($ParIdFact,$Campos,$Valores,$Tabla,$MensajeLog1);
	return $NumeroFactura;
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
