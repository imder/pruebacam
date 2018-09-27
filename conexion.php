<?php
$host = "sql113.vzpla.net";
$basededatos = "user_22716552_bd_multi";
$usuario = "user_22716552";
$contraseña = "6030d3l1";

$conexion = mysqli_connect($host, $usuario, $contraseña, $basededatos) or die ("conexion fallida");;
mysqli_select_db($conexion,$basededatos) or die ("Error al conectarse con la Base de Datos".mysqli_error($conexion));

?>