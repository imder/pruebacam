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
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/reporte.css">

    <link rel="stylesheet" href="asset/css/viewer.css">
    <link rel="stylesheet" href="asset/css/main.css">

    <link rel="stylesheet" href="../css/styles.css"/>

    <style type="text/css">
        img{
            width: 200px;
            height: 125px;
            cursor: pointer;
        }
    </style>
      
    

    <title>Relevamiento</title>
</head>
<body>

    
<div class="reporte">
    <div class="title">RELEVAMIENTO/SERVICIOS</div>
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

    <div class="input-group mb-2">
        <div class="input-group-prepend">
            <div class="input-group-text">Elaborado por:</div>
        </div>
        <input type="text"  class="form-control" name="c_p_red" id=""  value="<?php echo ' '.$us_row['Nombres']." ".$us_row['appaterno']." ".$us_row['apmaterno'];?>" readonly>
    </div>
    
    <HR>
    <div class="especial">ESPECIFICACIONES</div>
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
       <div class="reg-amb">     
        <div class="t-amb"> <strong> AMBIENTE <?php echo"&nbsp". $amb['idAmbiente']; ?> :</strong><?php echo"&nbsp". $amb['nom_ambiente']; ?></div>
        <table class="ambiente">
            <tr class="fila">
            <td>             
            <div class="plano">
 
                <ul class="docs-pictures clearfix">
                    <li><img data-original="<?php echo $row_pla['url_plano'];?>" src="<?php echo $row_pla['url_plano'];?>" class="img-thumbnail"></li>
                </ul>
                
            </div>
            </td>      
            
            <td class="tm">                
            <div class="medidas">   
             <div class="titulo">Medidas</div>
            <ul class="med">
            <li>Largo:<?php echo "&nbsp". $amb['largo']; ?> mts.</li>
            <li>Ancho:<?php echo "&nbsp". $amb['ancho']; ?> mts.</li>
            <li>Altura:<?php echo "&nbsp". $amb['altura']; ?> mts.</li>
            </ul>            
            </div>
            </td>
            </tr>
        </table>    
            

            
                 <?php 
                $fotos="SELECT * FROM fotografias where fk_idRelev='$id_relev' && fk_idAmbiente='$dima2'";
                 $res_fotos=mysqli_query($conexion,$fotos)or die(mysqli_error());
                 ?>
                 <div class="c-fotos">
                 <div class="t-fotos">FOTOGRAFIAS</div>

                 <div class="fotos">
                    
                        <ul class="docs-pictures">  
                 <?php 
                    while($fot=mysqli_fetch_array($res_fotos))
                    { 
                    ?>
                    
                        <li class="photo"><img src="<?php echo $fot['url_foto'];?>"></li>
                   
                    <?php 
                    }
                    ?>
                        </ul>                    
                </div>
                </div>
        </div> 
        <br>       
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

    <div class="pricing-table">
        <div class="pricing-table__title">CABLEADO ESTRUCTURADO</div>
        <ul class="pricing-table__features">
          <li class="pricing-table__features__item">CATEGORIA: <label class="datos"><?php echo "&nbsp". $c_row['categoria']; ?></label></li>
          <li class="pricing-table__features__item">MARCA: <label class="datos"><?php echo "&nbsp". $c_row['marca']; ?></li>
          <li class="pricing-table__features__item">CANTIDAD DE PUNTOS: <label class="datos"><?php echo "&nbsp". $c_row['cant_puntos']; ?></li>
          <li class="pricing-table__features__item">ENTRADA DE FACILIDADES: <label class="datos"><?php echo "&nbsp". $c_row['ent_facilidades']; ?></li>
          <li class="pricing-table__features__item">INSTALACION DE GABINETE: <label class="datos"><?php echo "&nbsp". $c_row['inst_gabinete']; ?></li>
          <li class="pricing-table__features__item">CERTIFICACION: <label class="datos"><?php echo "&nbsp". $c_row['certificacion']; ?></li>
        </ul>
    </div>
    
    <?php

        }

        if($s2 != 0)

        {

    $s_sql="SELECT p_energia, tipo, acometida, puesta_tierra, inst_tablero FROM sistema_electrico WHERE fk_idRelev='$id_relev'";

    $s_result=mysqli_query($conexion,$s_sql)or die(mysqli_error());
    $s_row = mysqli_fetch_array($s_result);
     

    ?>
    <div class="pricing-table">
        <div class="pricing-table__title">SISTEMA ELECTRICO</div>
        <ul class="pricing-table__features">
          <li class="pricing-table__features__item">PUNTOS DE ENERGIA: <label class="datos"><?php echo "&nbsp". $s_row['p_energia']; ?></label></li>
          <li class="pricing-table__features__item">TIPO: <label class="datos"><?php echo "&nbsp". $s_row['tipo']; ?></li>
          <li class="pricing-table__features__item">ACOMETIDA: <label class="datos"><?php echo "&nbsp". $s_row['acometida']; ?></li>
          <li class="pricing-table__features__item">PUESTA TIERRA: <label class="datos"><?php echo "&nbsp". $s_row['puesta_tierra']; ?></li>
          <li class="pricing-table__features__item">INSTALACION DE TABLERO: <label class="datos"><?php echo "&nbsp". $s_row['inst_tablero']; ?></li>
          
        </ul>
    </div>

   
<?php 

   }
   if($s3 != 0){

    $cc_sql="SELECT cant_p_cam_sen, tipo FROM cctv WHERE fk_idRelev='$id_relev'";

    $cc_result=mysqli_query($conexion,$cc_sql)or die(mysqli_error());
    $cc_row = mysqli_fetch_array($cc_result);

?>  
    <div class="pricing-table">
        <div class="pricing-table__title">CCTV</div>
        <ul class="pricing-table__features">
          <li class="pricing-table__features__item">PUNTOS DE CAMARAS Y SENSORES: <label class="datos"><?php echo "&nbsp". $cc_row['cant_p_cam_sen']; ?></label></li>
          <li class="pricing-table__features__item">TIPO: <label class="datos"><?php echo "&nbsp". $cc_row['tipo']; ?></li>
                    
        </ul>
    </div>

   
<?php 
   }
   if($s4 != 0){ 

    $l_sql="SELECT cant_luminarias, cant_lnterruptores FROM iluminacion WHERE fk_idRelev='$id_relev'";

    $l_result=mysqli_query($conexion,$l_sql)or die(mysqli_error());
    $l_row = mysqli_fetch_array($l_result); 

?>    
    <div class="pricing-table">
        <div class="pricing-table__title">ILUMINACION</div>
        <ul class="pricing-table__features">
          <li class="pricing-table__features__item">CANTIDAD DE LUMINARIAS: <label class="datos"><?php echo "&nbsp". $l_row['cant_luminarias']; ?></label></li>
          <li class="pricing-table__features__item">CANTIDAD DE INTERRUPTORES: <label class="datos"><?php echo "&nbsp". $l_row['cant_lnterruptores']; ?></li>
                    
        </ul>
    </div>

    <div class="pricing-table">
        <div class="pricing-table__title">METRAJE TOTAL</div>
            <table class="table table-hover">
                <tr class="bg-primary text-white">
                    
                    <td>AMBIENTE</td>                    
                    <td>ANCHO</td>
                    <td>LARGO</td>
                    <td>ALTO</td>

                </tr>




<?php 
   }
   $m_sql="SELECT ROUND(SUM(ancho),2) as S_ANCHO ,ROUND(SUM(largo),2) as S_LARGO , ROUND(SUM(altura),2) as S_ALTO from ambientes where fk_idRelev='$id_relev'";
   $m_result=mysqli_query($conexion,$m_sql)or die(mysqli_error());
   $m_row = mysqli_fetch_array($m_result); 

   $m1=$m_row['S_ANCHO'];
   $m2=$m_row['S_LARGO'];
   $m3=$m_row['S_ALTO'];
   




$t_ambien="SELECT * FROM ambientes where fk_idRelev='$id_relev'";
$t_res=mysqli_query($conexion,$t_ambien)or die(mysqli_error());
    while($t_amb=mysqli_fetch_array($t_res))
    {
        $idAmbiente = $t_amb['idAmbiente'];
        $nomAmbiente = $t_amb['nom_ambiente'];
    ?>  
        <tr>
            <td><?php echo $nomAmbiente; ?></td>
            <td><?php echo $t_amb['ancho']." mts."; ?></td>
            <td><?php echo $t_amb['largo']." mts."; ?></td>
            <td><?php echo $t_amb['altura']." mts."; ?></td>
        </tr>

    
    <?php   
    }
?>  
       <tr>
            <td>TOTAL</td>
            <td><?php echo $m1." mts."; ?></td>
            <td><?php echo $m2." mts."; ?></td>
            <td><?php echo $m3." mts."; ?></td>
        </tr> 
        </table>
    </div>
<!-- <a href='php/reporte.php?id_rel=".$filaRelevamientos['idRelev']."'><button class='btn btn-info'>Ver</button></a> -->
</div>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="asset/js/viewer.js"></script>
<script src="asset/js/main.js"></script>
</body>

</html>