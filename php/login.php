<?php
session_start();

include("conexion.php");


  $user=$_POST['usu']; //se obtiene el usuario escrito desde el login
  $contra=$_POST['pass'];
  $encriptado=MD5($contra);
  $c=0;
  
$consulta="SELECT * FROM usuarios WHERE username='$user' AND passwords='$encriptado'";
$resultado=mysqli_query($conexion,$consulta);
$filas=mysqli_num_rows($resultado);
//print_r($resultado);
//print_r($filas);
if($filas != 0)
  {  
    while($dato=mysqli_fetch_array($resultado))
    { 
        
              $_SESSION['usuario'] = $user; //se almacena sesion['usuario'] a $user
              $_SESSION['Nombres'] = $dato['nombres']; 
              $_SESSION['Paterno'] = $dato['appaterno']; 
              $_SESSION['Materno'] = $dato['apmaterno']; 
              $_SESSION['idUser'] = $dato['idUsuario']; 


              //print_r($dato['appaterno']);
              //print_r($_SESSION['Materno']);

              echo '<script>console.log("Usted ha ingresado exitosamente");</script>';
              header("HTTP/1.1 302 Moved Temporarily"); 
              header("Location: ../misRelevamientos.php"); 
            $c=1;
    }
        
    
}
else if($c==0)
    {
      echo 'El email o password es incorrecto, <a href="../index.html">vuelva a intenarlo</a>.<br/>';
    }
?>