<?php
include("conexion.php");

//Recibir los datos y almacenarlos en variables
$categoria = $_POST["categoria"];
$marca = $_POST["marca"];
$cant_puntos = $_POST["cant_puntos"];
$ent_facilidades = $_POST["ent_facilidades"];
$inst_gabinete = $_POST["inst_gabinete"];
$certificacion = $_POST["certificacion"];

$se_tipo = $_POST["se_tipo"];
$se_acometida = $_POST["se_acometida"];
$se_puesta = $_POST["se_puesta"];
$se_instTablero = $_POST["se_instTablero"];

$cc_cantidad = $_POST["cc_cantidad"];
$cc_tipo = $_POST["cc_tipo"];

$i_cantLumi = $_POST["i_cantLumi"];
$i_cantInte = $_POST["i_cantInte"];


//consulta para insertar
$pl_insert = "INSERT INTO  ambientes (nom_ambiente,ancho,largo,altura,datos_red, datos_energia, datos_cctv, datos_luminaria) VALUES ('$ambiente', '$ancho', '$largo', '$altura', '$puntos_red', '$puntos_energia', '$puntos_cctv', '$puntos_luminaria')";
//Ejecutar consulta
$pl_result = mysqli_query($conexion,$pl_insert);

if (!$pl_result){
    echo 'Error al registrarse';
}
 else {
    //printf ("Nuevo registro con el id %d.\n", mysqli_insert_id($conexion)); //sirve
    echo '<script>alert("Ambiente registrado");</script>';
    echo "<head><meta http-equiv='refresh' content='0; url=../formularios.php'></head>";
}



//Cerrar conexion
mysqli_close($conexion);