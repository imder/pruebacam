<?php
include("conexion.php");

$quer = "SELECT cont FROM contador"; 
$resultado5=mysqli_query($conexion,$quer)or die(mysqli_error());
$row = mysqli_fetch_row($resultado5); 
$cont = $row[0];

$fsql = "SELECT MAX(idRelev) FROM relevamientos"; 
$fresult=mysqli_query($conexion,$fsql)or die(mysqli_error());
$frow = mysqli_fetch_row($fresult); 
$fultimo = $frow[0];


$imagenCodificada = file_get_contents("php://input"); //Obtener la imagen
if(strlen($imagenCodificada) <= 0) exit("No se recibió ninguna imagen");
//La imagen traerá al inicio data:image/png;base64, cosa que debemos remover
$imagenCodificadaLimpia = str_replace("data:image/jpeg;base64,", "", urldecode($imagenCodificada));

/*Venía en base64 pero sólo la codificamos así para que viajara por la red, ahora la decodificamos y
todo el contenido lo guardamos en un archivo*/
$imagenDecodificada = base64_decode($imagenCodificadaLimpia);

/*Calcular un nombre único*/
$destino = "../fotografias/foto_" . uniqid() . ".jpg";

//Escribir el archivo
file_put_contents($destino, $imagenDecodificada);

//Terminar y regresar el nombre de la foto


$insert2 = "INSERT INTO fotografias (url_foto, fk_idAmbiente,fk_idRelev) VALUES ('$destino','$cont', '$fultimo')";// cambiar fk_idAmbiente
$result2 = mysqli_query($conexion,$insert2)or die(mysqli_error());

if (!$result2){
    echo 'Error al registrarse';
}
 else {
    //printf ("Nuevo registro con el id %d.\n", mysqli_insert_id($conexion)); //sirve
    //echo '<script>alert("El relevamiento se registro exitosamente");</script>';
    //echo "<head><meta http-equiv='refresh' content='0; url=../dibujo.php'></head>";
}



//Cerrar conexion
mysqli_close($conexion);
?>