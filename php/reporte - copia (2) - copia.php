<?php
session_start();
include("conexion.php");

$id_relev = $_GET['id_rel'];

// $re_query = "SELECT r.idRelev,c.cliente,c.representante,c.correoR,c.telefono,c.direccion FROM relevamientos AS r INNER JOIN clientes AS c ON r.fk_idCliente=c.idCliente WHERE   r.idRelev='$id_relev'";

$re_query="SELECT r.idRelev,
r.fk_idUsuario,
c.cliente,
c.representante,
c.correoR,
c.telefono,
c.direccion
FROM relevamientos AS r 
INNER JOIN clientes AS c 
ON r.fk_idCliente=c.idCliente 
WHERE   r.idRelev= '$id_relev'";
                    
$re_result = mysqli_query($conexion,$re_query)or die(mysqli_error());
$re_row = mysqli_fetch_array($re_result); 

$id_usermt = $re_row['fk_idUsuario'];
    
//print_r($id_usermt);  
 


$us_query = "SELECT Nombres, appaterno, apmaterno FROM usuarios WHERE idUsuario='$id_usermt'"; 
$us_result=mysqli_query($conexion,$us_query)or die(mysqli_error());
$us_row = mysqli_fetch_array($us_result); 


//echo '</pre>';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/mis_estilos.css">
    
    <link rel="stylesheet" href="../css/all.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <title>Relevamiento</title>
</head>
<body>

    <div class="container">
        <div id="reporte" class="reporte">
    <div class="title">RELEVAMIENTO/SERVICIOS</div>
    <!-- <HR></HR>
    <label><strong>Trabajos a realizar:</strong></label><label><?php echo 'falta';?></label> -->
    <HR>
    <div id="d_cliente">

    <div class="input-group mb-2">
        <div class="input-group-prepend">
            <div class="input-group-text">Cliente: </div>
        </div>
        <input type="text"  class="form-control" name="c_p_red" id=""  value="<?php echo $re_row['cliente']; ?>" readonly>
    </div>
    
    <div class="input-group mb-2">
        <div class="input-group-prepend">
            <div class="input-group-text">Representante: </div>
        </div>
        <input type="text"  class="form-control" name="c_p_red" id=""  value="<?php echo $re_row['representante']; ?>" readonly>
    </div>

    <div class="input-group mb-2">
        <div class="input-group-prepend">
            <div class="input-group-text">Correo: </div>
        </div>
        <input type="text"  class="form-control" name="c_p_red" id=""  value="<?php echo $re_row['correoR']; ?>" readonly>
    </div>

    <div class="input-group mb-2">
        <div class="input-group-prepend">
            <div class="input-group-text">Telefono: </div>
        </div>
        <input type="text"  class="form-control" name="c_p_red" id=""  value="<?php echo $re_row['telefono']; ?>" readonly>
    </div>

    <div class="input-group mb-2">
        <div class="input-group-prepend">
            <div class="input-group-text">Direccion: </div>
        </div>
        <input type="text"  class="form-control" name="c_p_red" id=""  value="<?php echo $re_row['direccion']; ?>" readonly>
    </div>

    </div>

    <HR>
    <label><strong>Elaborado por:  </strong></label><label> <?php echo "&nbsp".$us_row['Nombres']."&nbsp".$us_row['appaterno']."&nbsp".$us_row['apmaterno'];?></label>
    <HR>

          <?php 

    $ambien="SELECT * FROM ambientes where fk_idRelev='$id_relev'";
    $res=mysqli_query($conexion,$ambien)or die(mysqli_error());
    while($amb=mysqli_fetch_array($res))
    {
        $dima=$amb['id'];
        $dima2=$amb['idAmbiente'];
            $pla="SELECT url_plano FROM planos where fk_idAmb='$dima'";
            $res_pla=mysqli_query($conexion,$pla)or die(mysqli_error());
            $row_pla = mysqli_fetch_array($res_pla);
            ?>
            
      <fieldset>     

            <label class="sub">Ambiente:<?php echo"&nbsp". $amb['nom_ambiente']; ?></label><br>
            
            <label class="sub">Fotografias de ambiente:</label><br>
            
        
        
            
                
                    <img aling="left" width="200" height="200" src="<?php echo $row_pla['url_plano'];?>" class="img-thumbnail"><br>
                
            
            <label><strong>Largo:</strong></label><label><?php echo "&nbsp". $amb['largo']; ?></label><br>
            <label><strong>Ancho:</strong></label><label><?php echo "&nbsp". $amb['ancho']; ?></label><br>
            <label><strong>Ancho:</strong></label><label><?php echo "&nbsp". $amb['ancho']; ?></label><br>
            
            
            
            

            
                 <?php 
                $fotos="SELECT * FROM fotografias where fk_idRelev='$id_relev' && fk_idAmbiente='$dima2'";
                 $res_fotos=mysqli_query($conexion,$fotos)or die(mysqli_error());
                 ?>
                 <table>
                        <tr>
                 <?php 
                    while($fot=mysqli_fetch_array($res_fotos))
                    { ?>
                        
                       <td> 
                        <img width="200" height="200" src="<?php echo $fot['url_foto'];?>" class="img-thumbnail"><br>
                        </td>
                         
                    <?php 
                    }
                    ?>
                     </tr>   
                     </table>

        </fieldset>       
    <?php 
    }



    $sql="SELECT SUM(datos_red) as S_RED ,SUM(datos_energia) as S_ENERGIA,SUM(datos_cctv) as S_CCTV,SUM(datos_luminaria) as S_LUMINARIA from ambientes where fk_idRelev='$id_relev'";
    $result=mysqli_query($conexion,$sql)or die(mysqli_error());
    $row = mysqli_fetch_array($result); 

    $s1=$row['S_RED'];
    $s2=$row['S_ENERGIA'];
    $s3=$row['S_CCTV'];
    $s4=$row['S_LUMINARIA'];
   
    if($s1 != 0)

    {

    $c_sql="SELECT categoria, marca, cant_puntos, ent_facilidades, inst_gabinete, certificacion FROM cableado_estructurado WHERE fk_idRelev='$id_relev'";

    $c_result=mysqli_query($conexion,$c_sql)or die(mysqli_error());
    $c_row = mysqli_fetch_array($c_result); 
     

    ?>

    <h3 class="title">CABLEADO ESTRUCTURADO</h3></label><br>
    <label><strong>categoria:  </strong></label></label><label><?php echo "&nbsp". $c_row['categoria']; ?></label><br>
    <label><strong>marca:  </strong></label></label><label><?php echo "&nbsp". $c_row['marca']; ?></label><br>
    <label><strong>cantidad de puntos:  </strong></label></label><label><?php echo "&nbsp". $c_row['cant_puntos']; ?></label><br>
    <label><strong>entrada de facilidades:  </strong></label></label><label><?php echo "&nbsp". $c_row['ent_facilidades']; ?></label><br>
    <label><strong>Instalacion de gabinete:  </strong></label></label><label><?php echo "&nbsp". $c_row['inst_gabinete']; ?></label><br>
    <label><strong>certificacion:  </strong></label></label><label><?php echo "&nbsp". $c_row['certificacion']; ?></label>

    <?php

        }

        if($s2 != 0)

        {

    $s_sql="SELECT p_energia, tipo, acometida, puesta_tierra, inst_tablero FROM sistema_electrico WHERE fk_idRelev='$id_relev'";

    $s_result=mysqli_query($conexion,$s_sql)or die(mysqli_error());
    $s_row = mysqli_fetch_array($s_result);
     

    ?>
    <h3 class="title"> SISTEMA ELECTRICO</h3></label><br>
    <label><strong>p_energia:</strong></label><label><?php echo "&nbsp". $s_row['p_energia']; ?></label><br>
    <label><strong>tipo:</strong></label><label><?php echo "&nbsp". $s_row['tipo']; ?></label><br>
    <label><strong>acometida:</strong></label><label><?php echo "&nbsp". $s_row['acometida']; ?></label><br>
    <label><strong>puesta_tierra:</strong></label><label><?php echo "&nbsp". $s_row['puesta_tierra']; ?></label><br>
    <label><strong>inst_tablero:</strong></label><label><?php echo "&nbsp". $s_row['inst_tablero']; ?></label><br>
   
<?php 

   }
   if($s3 != 0){

    $cc_sql="SELECT cant_p_cam_sen, tipo FROM cctv WHERE fk_idRelev='$id_relev'";

    $cc_result=mysqli_query($conexion,$cc_sql)or die(mysqli_error());
    $cc_row = mysqli_fetch_array($cc_result);

?>
    <h3 class="title">CCTV</h3></label><br>
    <label><strong>cant_p_cam_sen:</strong></label><label><?php echo "&nbsp". $cc_row['cant_p_cam_sen']; ?></label><br>
    <label><strong>tipo:</strong></label><label><?php echo "&nbsp". $cc_row['tipo']; ?></label><br>
<?php 
   }
   if($s4 != 0){ 

    $l_sql="SELECT cant_luminarias, cant_lnterruptores FROM iluminacion WHERE fk_idRelev='$id_relev'";

    $l_result=mysqli_query($conexion,$l_sql)or die(mysqli_error());
    $l_row = mysqli_fetch_array($l_result); 

?>    

<h3 class="title">ILUMINACION</h3></label><br>
    <label><strong>cant_luminarias:</strong></label><label><?php echo "&nbsp". $l_row['cant_luminarias']; ?></label><br>
    <label><strong>cant_lnterruptores:</strong></label><label><?php echo "&nbsp". $l_row['cant_lnterruptores']; ?></label><br>

<?php 
   }





   
?>  

<!-- <a href='php/reporte.php?id_rel=".$filaRelevamientos['idRelev']."'><button class='btn btn-info'>Ver</button></a> -->
</div>
</div>
<script src="../js/bootstrap.min.js"></script>  
</body>

</html>