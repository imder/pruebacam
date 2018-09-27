<?php
include("conexion.php");

$caracteres = $_POST['languages'];
$separ = implode(";", $caracteres);

$servicio = $_POST['servicio'];
$nivel = $_POST['nivel'];

$insert = "INSERT INTO servicios (Descripcion, nivel, idCaracteristicas) VALUES ('$servicio', '$nivel', '$separ' )";
    $result = mysqli_query($conexion, $insert);
    if (!$result){
        echo 'Error al registrarse';
    } 

// $con ="UPDATE servicios SET idCaracteristicas='$separ' WHERE idServicio = 1";

// $query2 ="SELECT * FROM servicios ORDER BY idServicio ASC LIMIT 1";

// mysqli_query($conexion, $con)or die(mysqli_error());

header("Location: ../modificar_servicios.php");
?>







