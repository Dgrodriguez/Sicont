<?php 
require_once("Seguridad/conex.php");

$con = conectar();

session_start();

$perfil_admin = mysqli_query($con,"SELECT c.PERFIL from  usuarios a , usuarios_perfiles b , usuarios_cfg_perfiles c WHERE b.ID_USUARIOS = a.ID and c.ID = b.ID_PERFIL and b.ACTIVO = 1 and a.USUARIO = '".$_SESSION['Usuario']."'");
$admin = "NO";
while($perfil = mysqli_fetch_assoc($perfil_admin )){
  if($perfil['PERFIL']=="Administrador" ){
    $admin = "SI";
  }
} 

$sql = "";

if($admin == "SI"){
  $sql = "SELECT ID,NOMBRE,URL,ICONO,TITULO,'NO' ID_PERFIL FROM MENU WHERE ID_PADRE is null ORDER BY ORDEN,NOMBRE";
}else{
  $sql = "SELECT a.ID,a.NOMBRE,a.URL,a.ICONO,a.TITULO , b.ID_PERFIL FROM MENU a , menu_perfil b , usuarios_perfiles c , usuarios d WHERE a.ID_PADRE is null and a.ID = b.ID_MENU and c.ID_PERFIL = b.ID_PERFIL and d.ID = c.ID_USUARIOS and c.ACTIVO = 1  and d.USUARIO = '".$_SESSION['Usuario']."' ORDER BY a.ORDEN,a.NOMBRE";
}

$query = mysqli_query($con,$sql);
$html = "<ul id='menu'>";
while ($datos = mysqli_fetch_assoc($query)) {
	
  $otro = "";
  if($datos['TITULO']){
    $otro= $datos['TITULO'];
  }

  $onclick = "";
  if($datos['URL']){
    $onclick= " onclick=\"cargarContenido('".$datos['URL']."','". $otro."')\" ";
  }

  $html.= "<li><a ".$onclick."><i class='".$datos['ICONO']."'></i> ".$datos['NOMBRE']."</a>";
  $html.=cargarhijos($con ,$datos['ID'], $datos['ID_PERFIL'] );
  $html.="</li>";
}
$html.="</ul>";
mysqli_close($con);
echo $html;


function cargarhijos($conex,$Id_Padre,$ID_PPL){

$sql = "";
if($ID_PPL!='NO'){
  $sql = "SELECT a.ID,NOMBRE,URL,ICONO,TITULO FROM menu a , menu_perfil b where a.ID_PADRE = ".$Id_Padre." and a.ID = b.ID_MENU and b.ID_PERFIL = ".$ID_PPL." order by ORDEN";
}else{
  $sql = "SELECT a.ID,NOMBRE,URL,ICONO,TITULO FROM menu a  where a.ID_PADRE = ".$Id_Padre."  order by ORDEN";
}
$query = mysqli_query($conex,$sql);
$html2 = "";

  if(mysqli_num_rows($query)>0){
    $html2 = "<ul class='sub-menu'>";
    while($dato = mysqli_fetch_assoc($query )){

      $otro = "NO";
      if($dato['TITULO']){
        $otro= $dato['TITULO'];
      }

      $onclick = "";
      if($dato['URL']){
        $onclick= " onclick=\"cargarContenido('".$dato['URL']."','".$otro."')\" ";
      }


      $html2.="<li><a ".$onclick."><i class='".$dato['ICONO']."'></i> ".$dato['NOMBRE']."</a>";
      $html2.=cargarhijos($conex,$dato['ID'],$ID_PPL);
      $html2.="</li>";

    }
    $html2.= "</ul>";
  }
  return $html2;
}

?>

