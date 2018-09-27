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

//print_r($cont);
//print_r($fultimo);

for($i=0; $i < count($_FILES['file_img']['name']);$i++){

    $filetmp = $_FILES["file_img"]["tmp_name"][$i];
    $filepath = "../fotografias/foto_".uniqid()."_". $fultimo."_".$cont.".jpg";

    //-----
    $original = imagecreatefromjpeg($filetmp);
    
    $ancho_original = imagesx($original);
    $alto_original = imagesy($original);

   
    $ancho_nuevo = 700;
    $alto_nuevo = round($ancho_nuevo * $alto_original / $ancho_original);

    $copia = imagecreatetruecolor($ancho_nuevo, $alto_nuevo);

    imagecopyresampled($copia, $original, 0, 0, 0, 0, $ancho_nuevo, $alto_nuevo, $ancho_original, $alto_original);

    //$rotar = imagerotate($copia, -90, 0);

    imagejpeg($copia, $filepath,70);

    imagedestroy($filetmp);
    //-----

    //move_uploaded_file($filetmp,$filepath);
    
    $insert2 = "INSERT INTO fotografias (url_foto, fk_idAmbiente,fk_idRelev) VALUES ('$filepath','$cont', '$fultimo')";// cambiar fk_idAmbiente
    $result2 = mysqli_query($conexion,$insert2)or die(mysqli_error());

    // imagedestroy($original);
    // imagedestroy($copia);
    // imagedestroy($rotar);

}

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