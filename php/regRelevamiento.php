<?php
error_reporting(E_ALL);
session_start();
include("conexion.php");

$md="UPDATE contador set cont=1";
$result = mysqli_query($conexion,$md);
//Recibir los datos y almacenarlos en variables
$cliente = $_POST["cliente"];
$representante = $_POST["representante"];
$correoR = $_POST["correoR"];
$telefono = $_POST["telefono"];
$lugar = $_POST["lugar"];
//$servicio = $_POST["servicio"];
$idUser = $_SESSION["idUser"];
//consulta para insertar


$verificar_cliente = mysqli_query($conexion, "SELECT * FROM clientes WHERE cliente = '$cliente'");
$verificar_lugar = mysqli_query($conexion, "SELECT * FROM clientes WHERE direccion = '$lugar'");

if (mysqli_num_rows($verificar_cliente) > 0 && mysqli_num_rows($verificar_lugar) > 0){
    echo '<script>
            alert("El cliente ya existe");
            window.history.go(-1);
          </script>';
    
}

//Ejecutar consulta
$re_insertar = "INSERT INTO clientes (cliente, representante, correoR, telefono, direccion) VALUES ('$cliente', '$representante', '$correoR', '$telefono', '$lugar')";
$re_resultado = mysqli_query($conexion,$re_insertar)or die(mysqli_error());
if (!$re_resultado){
   echo 'Error al registrarse en clientes';
}
 else {
    
    $c_query = "SELECT MAX(idCliente) FROM clientes"; 
    $c_result=mysqli_query($conexion,$c_query)or die(mysqli_error());
    $c_row = mysqli_fetch_row($c_result); 
    $fk_cliente = $c_row[0];


    $r_insertar = "INSERT INTO relevamientos (fk_idUsuario, fk_idCliente) VALUES ('$idUser', '$fk_cliente')";
    
    $v_resultado = mysqli_query($conexion,$r_insertar)or die(mysqli_error());
    if (!$v_resultado){
        echo 'Error al registrarse en relevamientos';
    }
     else {
        
    header("HTTP/1.1 302 Moved Temporarily"); 
    header("Location: ../dibujo.php"); 
        
     }
    
}

//Cerrar conexion
mysqli_close($conexion);

?>

