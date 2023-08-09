<?php function mens(){
        
$text_body = " <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">
<html>
    <head>
        <title>Untitled Document</title>
        <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
        <meta http-equiv='content-type' content='text/html' charset='utf-8' />
        <meta http-equiv='Content-Language' content='es-es'>
        <META NAME='Language' CONTENT='Spanish'>
    </head>
    <body bgcolor='#D7F0E7'>
        <STYLE>
            body {font-family: 'Times New Roman', Times, serif;
            body a {text-decoration:none; }
            table a {color: #666666;
                  text-decoration: none;
                  font-family: 'Times New Roman', Times, serif; }
            table a:hover {color: #FF9900;
                    text-decoration: none; }
            tr {margin: 0px;
                  padding: 0px; }
            td {margin: 0px;
                  padding: 6px; }
            th {padding: 6px;
                  margin: 0px;
                  text-align: center;
                  color: #666666; }
        </STYLE>
<table font-family='Times New Roman' width='90%' border='0' align='center' cellpadding='0' cellspacing='0'>
        <tr>
            <th colspan='3'>CAVECERA DE LA TABLA</th>
        </tr>
        <tr>
            <th colspan='3'>MENSAJE AUTOMÁTICO</th>
        </tr>
        <tr>
            <td align='right'>ASUNTO:</td>
            <td width='12'>&nbsp;</td>
            <td align='left'>
                    ESTE ES MI ASUNTO.
            </td>
        </tr>
        <tr>
            <td align='right'>MENSAJE:</td>
            <td>&nbsp;</td>
            <td align='left'>ESTE ES EL MENSAJE QUE TE ENVÍO</td>
        </tr>
    </table>
</body>
</html>";
           
$headers = array ('From' => "daniel.rodriguez@viva.gov.co",
                'Subject' => "NOTIFICACION WEB CV GRATUITA");
                $destinatario= "daniel.rodriguez@viva.gov.co";
                $titulo= "NOTIFICACION WEB CV GRATUITA";
                $responder= "daniel.rodriguez@viva.gov.co";
                $remite= "daniel.rodriguez@viva.gov.co";
                $remitente= "MENSAJE GENERADO AUTOMATICAMENTE";
                $separador = "_separador".md5 (uniqid (rand()));
                $cabecera = "Date: ".date('l j F Y, G:i')."\n";
                $cabecera .="MIME-Version: 1.0\n";
                $cabecera .="From: ".$remitente."<".$remite.">\n";
                $cabecera .="Return-path: ". $remite."\n";
                $cabecera .= "Reply-To: ".$remite."\n";
                $cabecera .="X-Mailer: PHP/". phpversion()."\n";
                $cabecera .= "Content-Type: multipart/mixed;"."\n";
                $cabecera .= " boundary=$separador"."\r\n\r\n";    /**/
                $texto_html ="\n"."--$separador"."\n";            /**/
                $texto_html .="Content-Type:text/html; charset=\'utf-8\'"."\n";
                $texto_html .="Content-Transfer-Encoding: 7bit"."\r\n\r\n";
                $texto_html .= $text_body;
                $mensaje= $texto_html;

                echo mail($destinatario, $titulo, $mensaje, $cabecera);
// if( mail($destinatario, $titulo, $mensaje, $cabecera)){print("* MAIL ENVIADO OK 4");
//     }else{print("* MAIL NO ENVIADO");}

 } // Fin function mens()


echo mens();
?>