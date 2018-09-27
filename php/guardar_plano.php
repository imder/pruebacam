<?php

include("conexion.php");///*

$data = $_REQUEST['base64data']; 
$imagen = explode('base64,',$data);
$imagendata = base64_decode($imagen[1]);
//$source = imagecreatefromstring($imagendata);
//$rotate = imagerotate($source, 90, 0); 
$nombreImagenGuardada = "../planos/plano_" . uniqid().".jpg";


//$imagenjpg = imagejpeg($rotate,$nombreImagenGuardada,100);
//Calcular un nombre único
//$nombreImagenGuardada = "../planos/plano_" . uniqid() . ".png";

print_r($nombreImagenGuardada );
//Escribir el archivo
file_put_contents($nombreImagenGuardada, $imagendata); 


$p_sql = "SELECT MAX(id) FROM ambientes"; 
$p_resultado=mysqli_query($conexion,$p_sql)or die(mysqli_error());
$p_row = mysqli_fetch_row($p_resultado); 
$p_idAmb = $p_row[0];

 //consulta para insertar
 $p_insert = "INSERT INTO  planos (url_plano, fk_idAmb) VALUES ('$nombreImagenGuardada', '$p_idAmb')";
 //Ejecutar consulta
 $p_result = mysqli_query($conexion,$p_insert);



 if (!$p_result){
     echo 'Error al registrarse';
 }
  else {
     //printf ("Nuevo registro con el id %d.\n", mysqli_insert_id($conexion)); //sirve
     //echo '<script>alert("Ambiente registrado");</script>';
     echo "<head><meta http-equiv='refresh' content='0; url=../misRelevamientos.php'></head>";

 }



 //Cerrar conexion
 mysqli_close($conexion);
?>