<style type="text/css">
<!--
    table.page_header {width: 100%; border: none; background-color: #DDDDFF; border-bottom: solid 1mm #AAAADD; padding: 2mm }
    table.page_footer {width: 100%; border: none; background-color: #DDDDFF; border-top: solid 1mm #AAAADD; padding: 2mm}
    div.note {border: solid 1mm #DDDDDD;background-color: #EEEEEE; padding: 2mm; border-radius: 2mm; width: 100%; }
    ul.main { width: 95%; list-style-type: square; }
    ul.main li { padding-bottom: 2mm; }
    h1.titulo_1 { color: red; font-size: 5mm; text-align: center;}
    h3 { text-align: center; font-size: 14mm}
-->
</style>
<?php 
    require_once("../../funciones_generales.php");
    require_once("../../Seguridad/conex.php");
    $con = conectar();

    $sql = "SELECT a.Id,a.Numero_Orden_Pedido ,a.Observaciones,a.FechaCreacion, b.nombre depto, c.nombre mpio, d.CONTRATO_NUMERO_VIVA contrato FROM pedidos_orden_pedido a , cfg_departamentos b , cfg_municipios c , juridica_contrato d WHERE a.Id_Depto = b.id and a.Id_Mpio = c.id and d.ID = a.Id_Contrato and a.Id = ".$_GET['Id_orden'];

    $query = mysqli_query($con,$sql);
    $dato = mysqli_fetch_assoc($query);
?>
<page backtop="14mm" backbottom="14mm" backleft="10mm" backright="10mm" style="font-size: 12pt">
    <page_header>
        <table class="page_header">
            <tr>
                <td style="width: 50%; text-align: left">
                   Orden de Pedido de Materiales Nro. <?php echo $dato['Numero_Orden_Pedido']; ?>
                </td>
            </tr>
        </table>
    </page_header>
    <page_footer>
        <table class="page_footer">
            <tr>
                <td style="width: 33%; text-align: left;">
                    http://html2pdf.fr/
                </td>
                <td style="width: 34%; text-align: center">
                    page [[page_cu]]/[[page_nb]]
                </td>
                <td style="width: 33%; text-align: right">
                    &copy;Spipu 2008-<?php echo date('Y'); ?>
                </td>
            </tr>
        </table>
    </page_footer>
    <bookmark title="Présentation" level="0" ></bookmark>
    <h1 class="Titulo_1"> Orden de Pedido de Materiales Nro. <?php echo $dato['Numero_Orden_Pedido']; ?></h1>
    <br><br><br><br><br>
    <div style="text-align: center; width: 100%;">
        <br>
        <p>Este es un párrafo inicial.</p>
        <br>
        <table style="width: 100%;">
            <thead>
                <tr>
                    <th>Encabezado 1</th>
                    <th>Encabezado 2</th>
                    <th>Encabezado 3</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Dato 1</td>
                    <td>Dato 2</td>
                    <td>Dato 3</td>
                </tr>
                <tr>
                    <td>Dato 4</td>
                    <td>Dato 5</td>
                    <td>Dato 6</td>
                </tr>
            </tbody>
        </table>
        <br>
        <ul class="main">
            <li>Elemento 1</li>
            <li>Elemento 2</li>
            <li>Elemento 3</li>
        </ul>
        <br>
        <p>Este es el último elemento de la lista.</p>
    </div>
</page>

<?php
        for ($i = 1; $i <= 5; $i++) {
            echo '<page>';
           echo ' <page_header>
                <table class="page_header">
                    <tr>
                        <td style="width: 50%; text-align: left">
                            A propos de ...
                        </td>
                        <td style="width: 50%; text-align: right">
                            Html2Pdf v<?php echo $html2pdf->getVersion(); ?>
                        </td>
                    </tr>
                </table>
            </page_header>
            <page_footer>
                <table class="page_footer">
                    <tr>
                        <td style="width: 33%; text-align: left;">
                            http://html2pdf.fr/
                        </td>
                        <td style="width: 34%; text-align: center">
                            page [[page_cu]]/[[page_nb]]
                        </td>
                        <td style="width: 33%; text-align: right">
                            &copy;Spipu 2008-<?php echo date(\'Y\'); ?>
                        </td>
                    </tr>
                </table>
            </page_footer>';
            echo '<h1>Página '.$i.'</h1>';
            echo '<p>Contenido de la página '.$i.'</p>';
            echo '</page>';
        }
    ?>    

