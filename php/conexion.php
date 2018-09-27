<?php
$host = "localhost";
$basededatos = "bd_multi";
$usuario = "root";
$contraseña = "";

$conexion = mysqli_connect($host, $usuario, $contraseña, $basededatos) or die ("conexion fallida");;
mysqli_select_db($conexion,$basededatos) or die ("Error al conectarse con la Base de Datos".mysqli_error($conexion));

?>