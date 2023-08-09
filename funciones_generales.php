<?php
require_once("Seguridad/conex.php");
  session_start();
require_once 'librerias/phpexcel/src/Spout/Autoloader/autoload.php'; // Ruta al archivo de autoloader de Spout
use Box\Spout\Writer\Common\Creator\WriterEntityFactory;
use Box\Spout\Common\Entity\Style\Color;
use Box\Spout\Common\Entity\Style\Border;
use Box\Spout\Writer\Common\Creator\StyleBuilder; // Importación adicional
use Box\Spout\Reader\Common\Creator\ReaderEntityFactory;




function leerExcel($rutaArchivo)
{
  $reader = ReaderEntityFactory::createReaderFromFile($rutaArchivo);
$reader->open($rutaArchivo);

$firstRow = true; // Variable para identificar la primera fila
$headers = array(); // Arreglo para almacenar las cabeceras
$rowIndex = 1; // Variable para el índice de fila

foreach ($reader->getSheetIterator() as $sheet) {
    foreach ($sheet->getRowIterator() as $row) {
        $cells = $row->getCells();

        if ($firstRow) {
            foreach ($cells as $cell) {
                $headers[] = $cell->getValue(); // Almacenar la cabecera en el arreglo
            }
            $firstRow = false;
        } else {
            $columnIndex = 1; // Variable para el índice de columna

            foreach ($cells as $cell) {
                $header = isset($headers[$columnIndex - 1]) ? $headers[$columnIndex - 1] : "Columna sin cabecera";
            	if($cell->getValue()){
                	echo "Cabecera: " . $header . ", Columna " . $columnIndex . ": " . $cell->getValue() . "     ";
            	}
                $columnIndex++;
            }
        }

        echo "<br>"; // Salto de línea después de cada fila
        $rowIndex++;
    }
}

$reader->close();



}

function CargaMasivaOrdenPedido($rutaArchivo){
	$reader = ReaderEntityFactory::createXLSXReader();
	$reader->open($rutaArchivo); // Ruta del archivo Excel a leer

	$data = array();
	$idProveedor = "";
	$IdMpio = "";
	$NombreProveedor = "";
	$NombreMpio = "";
	foreach ($reader->getSheetIterator() as $sheet) {
	    $rowNumber = 0;
	    foreach ($sheet->getRowIterator() as $row) {
	        $rowNumber++;
	        if ($rowNumber === 3) { // Fila 3 (B3)
	            $cellValue = $row->getCellAtIndex(1) ? $row->getCellAtIndex(1)->getValue() : null;
	            $idProveedor = $cellValue !== null ? $cellValue : "";
	        } elseif ($rowNumber === 6) { // Fila 6 (B6)
	            $cellValue = $row->getCellAtIndex(1) ? $row->getCellAtIndex(1)->getValue() : null;
	            $IdMpio = $cellValue !== null ? $cellValue : "";
	        } elseif($rowNumber === 2) { // Fila 3 (B3)
	            $cellValue = $row->getCellAtIndex(1) ? $row->getCellAtIndex(1)->getValue() : null;
	            $NombreProveedor = $cellValue !== null ? $cellValue : "";
	        } elseif ($rowNumber === 5) { // Fila 6 (B6)
	            $cellValue = $row->getCellAtIndex(1) ? $row->getCellAtIndex(1)->getValue() : null;
	            $NombreMpio = $cellValue !== null ? $cellValue : "";
	        } elseif ($rowNumber > 8) {
	            $rowData = $row->toArray();
	            $columnDData = isset($rowData[3]) ? $rowData[3] : ''; // Obtener el dato de la columna 'D'
	            if ($columnDData !== null && trim($columnDData) !== '' && is_numeric($columnDData)) {
	                array_push($rowData, $idProveedor); 
	                array_push($rowData, $IdMpio); 
	                array_push($rowData, $NombreProveedor); 
	                array_push($rowData, $NombreMpio); 
	                $data[] = $rowData;
	            }
	        }
	    }
	}

	echo json_encode($data);
}


function CargarMasivaPrecioProveedor($rutaArchivo, $IdProveedor,$FechaACtualizacion)
{
    $reader = ReaderEntityFactory::createReaderFromFile($rutaArchivo);
    $reader->open($rutaArchivo);

    $firstRow = true; // Variable para identificar la primera fila
    $headers = array(); // Arreglo para almacenar las cabeceras
    $rowIndex = 1; // Variable para el índice de fila
    $errores = array(); // Arreglo para almacenar los errores

    foreach ($reader->getSheetIterator() as $sheet) {
        foreach ($sheet->getRowIterator() as $row) {
            $cells = $row->getCells();

            if ($firstRow) {
                foreach ($cells as $cell) {
                    $headers[] = $cell->getValue(); // Almacenar la cabecera en el arreglo
                }
                $firstRow = false;
            } else {
                $columnIndex = 1; // Variable para el índice de columna

			$columnIndex = 0;
			$elemento = '';
			$Unidad = '';

			foreach ($cells as $cell) {
			    $header = isset($headers[$columnIndex]) ? $headers[$columnIndex] : "Columna sin cabecera";
			    $value = $cell->getValue();

			    if ($columnIndex == 0) {
			        $elemento = $value;
			    }

			    if ($columnIndex == 1) {
			        $Unidad = $value;
			    }
			    if($columnIndex>1){
				    if ($value) {
				    	if(validarFloat($value)){
					    	$con = conectar();
					    	$SQL = "SELECT id,departamento_id FROM cfg_municipios WHERE nombre = '".$header."' ";
					    	$QUERY = mysqli_query($con,$SQL);
					    	$dato = mysqli_fetch_assoc($QUERY);
					    	$Campos = ["Elemento","IdProveedor","Unidad","Precio","depto","mpio","FechaCambioPrecio"];
							$Valores = [$elemento, $IdProveedor, $Unidad, $value ,$dato['departamento_id'] , $dato['id'] , $FechaACtualizacion ];
							$Tabla = "proveedor_Precio";
							$MensajeLog1 = "Se registra precio del elemento ".$elemento." para el proveedor ".$IdProveedor;
							$IdServicio = funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1);

					        //echo "El precio del elemento $elemento de Und $Unidad para el mpio $header : $value <br>";
						}else{
							$errores[] = "Formato errado en el precio para el Municipio '{$header}', del elemento {$elemento}";
						}
				    } else if (empty($value)) {
				        $errores[] = "No se encontró precio para el Municipio '{$header}', del elemento {$elemento}";
				    }
				}
			    $columnIndex++;
			}
            }

            $rowIndex++;
        }
    }

    $reader->close();

    if(count($errores)>0){
	   // Generar el archivo de errores
	    $archivoErrores = 'errores.txt';
	    $contenidoArchivo = implode(PHP_EOL, $errores);
	    file_put_contents($archivoErrores, utf8_decode($contenidoArchivo)); // Establecer codificación UTF-8


	    // Generar el enlace de descarga del archivo de errores
	    $enlaceDescarga = '<a href="' . $archivoErrores . '" class="badge badge-danger" target="_blank">Descargar archivo de errores</a>';

	    return $enlaceDescarga;
	}else{
		return "OK";
	}
}



function validarFloat($variable) {
    // Verificar si la variable es un número
    if (is_numeric($variable)) {

            return true;

    }
    return false;
}




//echo CargarMasivaPrecioProveedor("Temp/PlantillaCarga.xlsx");




# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
function funciones_generales_BDInsertarDatos($Campos,$Valores,$Tabla,$MensajeLog1){
	$con=conectar();
	
	# Se arma el string de Campos
	$StringCampos='';
	for ($i=0;$i<count($Campos);$i++){
		$StringCampos.=$Campos[$i].",";
	}
	$StringCampos.="FechaCreacion,UsuarioCreacion,FechaActualizacion,UsuarioActualizacion";

	# Se arma el string de Valores
	$StringValores='';
	for ($i=0;$i<count($Valores);$i++){
		if($Valores[$i]!="NULL"){
			$StringValores.="'".$Valores[$i]."',";
		}else{
			$StringValores.=" ".$Valores[$i].",";
		}
		
	}
	if (isset($_SESSION['Usuario'])){
		$StringValores.="now(), '".$_SESSION['Usuario']."',now(), '".$_SESSION['Usuario']."'";
	}
	else{
		$StringValores.="now(), '',now(), ''";
	}

	# Se insertan datos en BD
	$query='INSERT INTO '.$Tabla.' ('.$StringCampos.') VALUES ('.$StringValores.')';
	#echo $query;
	$res=mysqli_query($con,$query);
	$last = mysqli_insert_id($con);
	if(!$res){
		echo 'Query Falló: '.mysqli_error($con)." con el query ".$query;
		die(funciones_generales_LogGuardar($MensajeLog1.'Query Falló: '. mysqli_error($con).', query: '.$query,'NO'));
	}
	else {
		funciones_generales_LogGuardar($MensajeLog1,'NO');
	}
	mysqli_close($con);
	return $last;
}

# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
function funciones_generales_LogGuardar($Mensaje,$Mostrar){
	$con=conectar();
	if (isset($_SESSION['Usuario'])){
		$query='INSERT INTO Log (Mensaje, FechaCreacion, UsuarioCreacion) VALUES ("'.$Mensaje.'", now(), "'.$_SESSION['Usuario'].'")';
	}
	else{
		$query='INSERT INTO Log (Mensaje, FechaCreacion, UsuarioCreacion) VALUES ("'.$Mensaje.'", now(), "")';
	}
	
	$res=mysqli_query($con,$query);
	if(!$res){
		#DEBUG echo "Registro en LOG Fallido. ".mysqli_error()."<br>";
	}
	else {
		#DEBUG echo "Registro en LOG OK. ".$Mensaje."<br>";
		if ($Mostrar=="SI"){
			echo $Mensaje."<br>";
		}
	}
	mysqli_close($con);

	return ($res);
}

# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
function funciones_generales_BDActualizarDatos($ID,$Campos,$Valores,$Tabla,$MensajeLog1){
	$con=conectar();
	# Se arma el string de Campos
	$StringCampos='';
	for ($i=0;$i<count($Campos);$i++){
		if($Valores[$i]=="NULL"){
			$StringCampos.=$Campos[$i]."=".$Valores[$i].",";
		}
		else{
			$StringCampos.=$Campos[$i]."='".$Valores[$i]."',";
		}
	}
	if (isset($_SESSION['Usuario'])) {
		$StringCampos.="FechaActualizacion=now(),UsuarioActualizacion='".$_SESSION['Usuario']."'";
	}else{
		$StringCampos.="FechaActualizacion=now(),UsuarioActualizacion='N/A'";
	}

	$query='UPDATE '.$Tabla.' SET '.$StringCampos.' WHERE ID="'.$ID.'"';

	//echo $query;
	$res=mysqli_query($con,$query);


	if(!$res){

		die(funciones_generales_LogGuardar($MensajeLog1.'Query Falló: '. mysqli_error($con).', query: '.$query,"SI"));
	}
	else {
		
		funciones_generales_LogGuardar($MensajeLog1,'NO');
	}
	mysqli_close($con);

}


function CargarArchivo($modulo,$NuevoNombreArchivo,$UrlTemp,$nombreOriginal,$IdContrato)
{
	switch ($modulo) {
		case 'Contrato':
			$rutadestino = "../Documentacion/Contrato/".$IdContrato."/";
			$nombre_fichero = $rutadestino.$NuevoNombreArchivo;
			
			if (is_dir($rutadestino)) {
			    rename("../Temp/".$nombreOriginal,$rutadestino.$NuevoNombreArchivo);	
			} else {
			    if(mkdir($rutadestino, 0777,true)) {
			        rename("../Temp/".$nombreOriginal , $rutadestino.$NuevoNombreArchivo);
			    }
			}
	        return $nombre_fichero;
		break;
		case 'CuentaCobro':
			//print "$modulo,$NuevoNombreArchivo,$UrlTemp,$nombreOriginal,$IdContrato";
			$base = explode("---", $IdContrato);
			$IdContrato = $base[0];
			$CuentaCobro = $base[1];
			$rutadestino = "../Documentacion/Contrato/".$IdContrato."/CuentaCobro/".$CuentaCobro."/";
			$nombre_fichero = $rutadestino.$NuevoNombreArchivo;

			if (is_dir($rutadestino)) {
			    rename("../Temp/".$nombreOriginal, $rutadestino.$NuevoNombreArchivo);
			} else {
			    if (mkdir($rutadestino, 0777, true)) {
			        rename("../Temp/".$nombreOriginal, $rutadestino.$NuevoNombreArchivo);
			    } else {
			        // Error al crear la carpeta
			        // Manejar el error según sea necesario
			    }
			}

			return $nombre_fichero;

		break;
		case 'CargaMaSiva':
			$rutadestino = "../Documentacion/Contrato/".$IdContrato."/";
			$nombre_fichero = $rutadestino.$NuevoNombreArchivo;
			
			if (is_dir($rutadestino)) {
			    rename("../Temp/".$nombreOriginal,$rutadestino.$NuevoNombreArchivo);	
			} else {
			    if(mkdir($rutadestino, 0777,true)) {
			        rename("../Temp/".$nombreOriginal , $rutadestino.$NuevoNombreArchivo);
			    }
			}
	        return $nombre_fichero;
		break;

	}
}

function FormateoInversoMonto($monto){

	if(strpos($monto,'$')!==false){	

	  // Eliminar el símbolo de moneda y los separadores de miles
	  $montoSinFormato = str_replace([',', '$'], '', $monto);

	  // Reemplazar el separador decimal por un punto
	  $montoSinFormato = str_replace('.', ',', $montoSinFormato);
	  return $montoSinFormato;
	}else{
		return $monto;
	}
}


function FormatatearFecha($fecha)
{
    // Divide la fecha en año, mes y día
    list($anio, $mes, $dia) = explode('-', $fecha);
    
    // Reordena la fecha en formato dd/mm/yyyy
    $nuevaFecha = $dia . '/' . $mes . '/' . $anio;
    
    return $nuevaFecha;
}


?>