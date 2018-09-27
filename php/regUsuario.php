<?php

include("conexion.php");


$carnet = $_POST["carnet"];
$nombres = $_POST["nombres"];
$appaterno = $_POST["appaterno"];
$apmaterno = $_POST["apmaterno"];
$telefono = $_POST["telefono"];
$nivel = $_POST["nivel"];
$usuario = $_POST["usuario"];
$contraseña = $_POST["password"];
$encriptar = MD5($contraseña );
$contraseña2 = $_POST["password2"];
$encriptar2 = MD5($contraseña2 );

if ($encriptar == $encriptar2) {
    # code...
    $insertar = "INSERT INTO usuarios (cedula, nombres, appaterno, apmaterno, telefono, nivel, username, passwords) 
    VALUES ('$carnet', '$nombres', '$appaterno', '$apmaterno', '$telefono', '$nivel', '$usuario', '$encriptar')";
    $resultado = mysqli_query($conexion, $insertar);
    if (!$resultado){
        echo 'Error al registrarse';
    } else {
        echo '<script>alert("Usted se ha registrado exitosamente");</script>';
        echo "<head><meta http-equiv='refresh' content='0; url=/PROYMT/index.html'></head>";
    }
    //Cerrar conexion
    mysqli_close($conexion);
} else {
    # code...
    echo '<script>alert("Las contraseñas no son iguales");</script>';
    echo "<head><meta http-equiv='refresh' content='0; url=/PROYMT/regUsuario.html'></head>";
}





?>