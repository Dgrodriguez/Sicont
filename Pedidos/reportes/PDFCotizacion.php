<?php
require_once("../../Seguridad/conex.php");
$con = conectar();
extract($_GET);

// Include the main TCPDF library (search for installation path).
require_once('../../librerias/tcpdf/TCPDF/examples/tcpdf_include.php');
require_once('../../funciones_generales.php');

// extend TCPF with custom functions
class MYPDF extends TCPDF {
    // Load table data from database
    public function LoadData() {
        global $con;

        // Query to retrieve the data from the table (replace with your own table name and columns)
        $query = "SELECT a.ID,b.nombre depto, c.nombre mpio , d.CONTRATO_NUMERO_VIVA, a.FechaSol,a.Direccion, a.Solicitante, a.Cedula , a.Telefono , a.Cargo FROM pedidos_cotizacion a , cfg_departamentos b , cfg_municipios c , juridica_contrato d where a.Id_Depto = b.id and a.Id_Mpio = c.id and a.Id_Contrato = d.ID and a.NumeroCotizacion = '".$_GET['NumeroCotizacion']."'";
        $result = mysqli_query($con, $query);

        // Fetch all rows from the result set
        $data = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }

        return $data;
    }

    // Colored table
    public function CargarCabecera($data) {
        // Colors, line width, and bold font
        $this->setFillColor(0, 0, 0);
        $this->setTextColor(255);
        $this->setDrawColor(128, 0, 0);
        $this->setLineWidth(0.3);
        $this->setFont('', 'B');
         global $con;

        // Añadir un salto de línea adicional para aumentar el espacio
        $this->Ln(10); // Ajusta el valor del salto de línea según tus necesidades

        // Color and font restoration
        $this->setFillColor(224, 235, 255);
        $this->setTextColor(0);
        $this->setFont('');
         $html = '<span style="color: #009246;">Departamento:</span> ' . $data[0]['depto'] . str_repeat('&nbsp;', 4) . '<span style="color: #009246;">Municipio:</span> ' . $data[0]['mpio'] . str_repeat('&nbsp;', 4) . '<span style="color: #009246;">Contrato/Convenio:</span> ' . $data[0]['CONTRATO_NUMERO_VIVA'];
        $this->writeHTML($html);
        $this->Ln();

        $html = '<span style="color: #009246;">Fecha de Solicitud:</span> ' . FormatatearFecha($data[0]['FechaSol']) . str_repeat('&nbsp;', 4) . '<span style="color: #009246;">Dirección de Entrega:</span> ' . $data[0]['Direccion'] . str_repeat('&nbsp;', 4) . '<span style="color: #009246;">Solicitante:</span> ' . $data[0]['Solicitante'];
        $this->writeHTML($html);
        $this->Ln();

        $html = '<span style="color: #009246;">Cédula de Solicitante:</span> ' .$data[0]['Cedula'] . str_repeat('&nbsp;', 4) . '<span style="color: #009246;">Teléfono de Solicitante:</span> ' . $data[0]['Telefono'] . str_repeat('&nbsp;', 4) . '<span style="color: #009246;">Cargo Solicitante:</span> ' . $data[0]['Cargo'];
        $this->writeHTML($html);
        $this->Ln();


        $html = '
            <style>
            /* Estilo para la tabla */
            .tcpdf-table {
              width: 100%;
              border-collapse: collapse;
              border: 1px solid #ddd;
              text-align:center;
            }

            /* Estilo para las celdas de encabezado */
            .tcpdf-table th {
              padding: 8px;
              border: 1px solid #ddd;
              background-color: #f5f5f5;
              font-weight: bold;
            }

            /* Estilo para las celdas de datos */
            .tcpdf-table td {
              padding: 8px;
              border: 1px solid #ddd;
            }

            /* Estilo para las filas alternas */
            .tcpdf-table-striped tbody tr:nth-child(odd) {
              background-color: #f9f9f9;
            }


            </style>';
        $sql_Material = "SELECT a.Material,a.Precio,a.Cantidad , b.Nombre Proveedor,a.Unidad FROM pedidos_cotizacion_detalles a , proveedor b WHERE a.Id_Proveedor = b.Id and a.Id_Orden_Pedido = ".$data[0]['ID']." ORDER BY a.Material";
        $query = mysqli_query($con,$sql_Material);
        if(mysqli_num_rows($query)>0){
            $html.= '<table class="tcpdf-table tcpdf-table-striped">
                <thead>
                    <tr style="background-color: #009246;">
                        <th>Proveedor</th>
                        <th>Material</th>
                        <th>Unidad</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>';
                while ($dato_elemento = mysqli_fetch_assoc($query)) {
                    $html.='<tr><td>'.$dato_elemento['Proveedor'].'</td><td>'.$dato_elemento['Material'].'</td><td>'.$dato_elemento['Unidad'].'</td><td>'.$dato_elemento['Cantidad'].'</td><td>'.$dato_elemento['Precio'].'</td></tr>';
                }
               $html.= '</tbody>
            </table><br><br>';
        }


        $sql_Adjuntos = "SELECT a.NOMBRE_ARCHIVO FROM pedidos_cotizacion_adjuntos a where a.Id_Orden_Pedido = ".$data[0]['ID']." ORDER BY a.NOMBRE_ARCHIVO ";
        $query_adjunto = mysqli_query($con,$sql_Adjuntos);
        if(mysqli_num_rows($query_adjunto)>0){
            $html.= '<table class="tcpdf-table tcpdf-table-striped">
                <thead>
                    <tr>
                        <th>Nombre de Archivo</th>
                    </tr>
                </thead>
                <tbody>';
                while ($dato_Adjunto = mysqli_fetch_assoc($query_adjunto)) {
                    $html.='<tr><td>'.$dato_Adjunto['NOMBRE_ARCHIVO'].'</td></tr>';
                }
               $html.= '</tbody>
            </table>';
        }
        $this->writeHTML($html);
        $this->Ln();

    }

   // Custom header
public function Header() {
$this->writeHTML('<link rel="stylesheet" type="text/css" href="../Pedidos.css">');

// Set left logo
$imageLeft = '../../img/BVM.png';
$this->Image($imageLeft, 10, 10, 30, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
$title = 'Cotización Nro.: '.$_GET['NumeroCotizacion'];
$this->SetFont('helvetica', 'B', 12);
$this->SetTextColor(0);
$html = '<span style="font-weight: bold; font-size: 16px; color: #009246;">'.$title.'</span>';

// Ajustar la posición x para mover horizontalmente el título
$x = 20; // Modifica este valor según tus necesidades

$this->Cell($x, 5, '', 0, false, 'C', 0, '', -115, false, 'M', false);
$this->writeHTML($html, true, false, false, false, '');


// Set right logo
$imageRight = '../../img/LOGO-VIVA.png';
$this->Image($imageRight, 170, 9, 30, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

// Line break
$this->Ln(15);

    }

}

// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->setCreator(PDF_CREATOR);
$pdf->setAuthor('VIVA');
$pdf->setTitle('Cotización');
$pdf->setSubject('COTIZACION');

// set default header data
$pdf->setHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, '', '');

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->setDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->setMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->setHeaderMargin(PDF_MARGIN_HEADER);
$pdf->setFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->setAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__) . '../../librerias/tcpdf/TCPDF/examples/lang/spa.php')) {
    require_once(dirname(__FILE__) . '../../librerias/tcpdf/TCPDF/examples/lang/spa.php');
    $pdf->setLanguageArray($l);
}

// ---------------------------------------------------------

// set font
$pdf->setFont('helvetica', '', 12);

// add a page
$pdf->AddPage();

// column titles
//$header = array( );

// data loading from the database
$data = $pdf->LoadData();
//$data = "";
// print colored table
$pdf->CargarCabecera( $data);

// ---------------------------------------------------------

// close and output PDF document
$pdf->Output('Cotizacion_'.$NumeroCotizacion.'.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+
?>
