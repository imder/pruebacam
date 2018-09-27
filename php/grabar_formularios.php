<?php

session_start();
include("conexion.php");

$np_red = $_GET['p_red'];
$np_energia = $_GET['p_energia'];
$np_cctv = $_GET['p_cctv'];
$np_lumi = $_GET['p_lumi'];
//print_r($np_red);
//print_r($np_energia);
//print_r($np_cctv);
//print_r($np_lumi);

$c_insert = "SELECT MAX(idRelev) FROM relevamientos"; 
$c_resultado=mysqli_query($conexion,$c_insert)or die(mysqli_error());
$c_row = mysqli_fetch_row($c_resultado); 
$id_Relev = $c_row[0];
//print_r($ultimo_id); //sirve

if($np_red !=0){

    $c_p_red = $_POST["c_p_red"];
    $categoria = $_POST["categoria"];
    $marca = $_POST["marca"];
    $ent_facilidades = $_POST["ent_facilidades"];
    $inst_gabinete = $_POST["inst_gabinete"];
    $certificacion = $_POST["certificacion"];

    $insert1 = "INSERT INTO cableado_estructurado (cant_puntos, categoria, marca, ent_facilidades, inst_gabinete, certificacion, fk_idRelev) VALUES ('$c_p_red', '$categoria', '$marca', '$ent_facilidades', '$inst_gabinete','$certificacion','$id_Relev')"; //$id_Relev
    //Ejecutar consulta
    $re_result = mysqli_query($conexion,$insert1);

}

if($np_energia !=0){   
    
    $c_p_energia = $_POST["c_p_energia"];
    $se_tipo = $_POST["se_tipo"];
    $se_acometida = $_POST["se_acometida"];
    $se_puesta = $_POST["se_puesta"];
    $se_instTablero = $_POST["se_instTablero"];

    $insert2 = "INSERT INTO  sistema_electrico (p_energia, tipo, acometida, puesta_tierra, inst_tablero, fk_idRelev) VALUES ('$c_p_energia','$se_tipo', '$se_acometida', '$se_puesta', '$se_instTablero', '$id_Relev')";
    //Ejecutar consulta
    $se_result = mysqli_query($conexion,$insert2);

}
if($np_cctv !=0){

    $c_p_cctv = $_POST["c_p_cctv"];
    $cc_tipo = $_POST["cc_tipo"];

    $cc_insert = "INSERT INTO  cctv (cant_p_cam_sen, tipo, fk_idRelev) VALUES ('$c_p_cctv', '$cc_tipo', '$id_Relev')";
    //Ejecutar consulta
    $cc_result2 = mysqli_query($conexion,$cc_insert)or die(mysqli_error());

}
if($np_lumi !=0){

    $c_p_lumi = $_POST['c_p_lumi'];
    $c_inter = $_POST['c_p_inter'];

    $i_insert = "INSERT INTO  iluminacion (cant_luminarias, cant_lnterruptores, fk_idRelev) VALUES ('$c_p_lumi', '$c_inter', '$id_Relev')";
    //Ejecutar consulta
    $i_result2 = mysqli_query($conexion,$i_insert)or die(mysqli_error());

}

$md="UPDATE contador set cont=1";
$result = mysqli_query($conexion,$md);

echo "<head><meta http-equiv='refresh' content='0; url=../misRelevamientos.php'></head>";
?>












