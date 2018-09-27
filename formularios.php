<?php
session_start();
//$f_idRelev = $_GET['d_idRel'];
//print_r($f_idRelev);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mis_estilos.css">
    <link rel="stylesheet" href="css/panel.css">
    <link rel="stylesheet" href="css/all.css">
    <title>Formularios</title>
</head>
<body>
<div class="container">


<?php
include("php/conexion.php");
$s1=0;
$s2=0;
$s3=0;
$s4=0;
$r_consulta = "SELECT MAX(idRelev) FROM relevamientos";
$r_result=mysqli_query($conexion,$r_consulta)or die(mysqli_error());
$r_row = mysqli_fetch_row($r_result); 
$r_idRelev = $r_row[0];

//query para todos los puntos de CABLEADO ESTRUCURADO
$f_query = "SELECT datos_red, datos_energia, datos_cctv, datos_luminaria from ambientes where fk_idRelev='$r_idRelev'";//'$r_idRelev'
$f_result= mysqli_query($conexion,$f_query)or die(mysqli_error());
$filas=mysqli_num_rows($f_result);

if($filas!=0)
{
  while($dato=mysqli_fetch_array($f_result))
  {
    $s1=$s1+$dato['datos_red'];
    $s2=$s2+$dato['datos_energia'];
    $s3=$s3+$dato['datos_cctv'];
    $s4=$s4+$dato['datos_luminaria'];
  }
}

?>
<form action='php/grabar_formularios.php?p_red=<?php echo $s1;?>&p_energia=<?php echo $s2;?>&p_cctv=<?php echo $s3;?>&p_lumi=<?php echo $s4;?>' class="formulario" method="post" enctype="multipart/form-data" id="insertar-foto">

<?php
if($s1 != 0)

{


?>
                <h3>CABLEADO ESTRUCTURADO</h3>
                  <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">No de puntos</div>
                       </div>
                       <input type="text"  class="form-control" name="c_p_red" id=""  value="<?php echo $s1; ?> " placeholder="" readonly>
                   </div>
 
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Categoria</div>
                       </div>
                       <select class="form-control" name="categoria" type="text" placeholder="">
                          <option>5-E</option>
                          <option>6</option>
                          <option>6-A</option>
                        </select>
                   </div>
                   
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Marca</div>
                       </div>
                       <input type="text" class="form-control" name="marca" id="" placeholder="">
                   </div>
 
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Entrada de facilidades</div>
                       </div>
                          <select class="form-control" name="ent_facilidades" type="text" placeholder="">
                            <option>Si</option>
                          <option>No</option>
                        </select>
                   </div>
 
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Instalacion de gabinete</div>
                       </div>
                          <select class="form-control" name="inst_gabinete" type="text" placeholder="">
                            <option>Si</option>
                          <option>No</option>
                        </select>
                   </div>

                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Certificacion</div>
                       </div>
                          <select class="form-control" name="certificacion" type="text" placeholder="">
                            <option>Si</option>
                          <option>No</option>
                        </select>
                   </div>  
                      
<?php 
   }
  if($s2 != 0){
?>
              <h3>SISTEMA ELECTRICO</h3>
                    <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">No de puntos</div>
                       </div>
                       <input type="text"  class="form-control" name="c_p_energia" id=""  value="<?php echo $s2; ?> " placeholder="" readonly>
                   </div>                                            
                  <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Tipo</div>
                       </div>
                       <input type="text"  class="form-control" name="se_tipo" id=""  placeholder="">
                  </div>
                  <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Acometida</div>
                      </div>
                    
                      <select class="form-control" name="se_acometida" type="text" placeholder="">
                        <option>Si</option>
                        <option>No</option>
                      </select>
                 </div>
                 
               <div class="input-group mb-2">
                    <div class="input-group-prepend">
                      <div class="input-group-text">Puesta a tierra</div>
                    </div>                    
                    <select class="form-control" name="se_puesta" type="text" placeholder="">
                        <option>Si</option>
                        <option>No</option>
                    </select>
               </div>
               <div class="input-group mb-2">
                    <div class="input-group-prepend">
                      <div class="input-group-text">Instalacion de tablero</div>
                    </div>                    
                    <select class="form-control" name="se_instTablero" type="text" placeholder="">
                        <option>Si</option>
                        <option>No</option>
                    </select>
               </div>                 
                    
<?php 
   }
   if($s3 != 0){
?>
               <h1>CCTV</h1>
                  <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Puntos camaras/sensores</div>
                       </div>
                       <input type="text"  class="form-control" name="c_p_cctv"  value="<?php echo $s3; ?> " placeholder="" readonly>
                  </div>
                  <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Tipo</div>
                      </div>
                      <input type="text"  class="form-control" name="cc_tipo" id=""  placeholder="">
                 </div>                    
<?php 
   }
   if($s4 != 0){  
?>
                  <h1>ILUMINACION</h1>
                  <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Cantidad de luminarias</div>
                       </div>
                       <input type="text"  class="form-control" name="c_p_lumi"  value="<?php echo $s4; ?>"  readonly>
                  </div>
                  <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Cantidad de Interruptores</div>
                      </div>
                      <input type="text"  class="form-control" name="c_p_inter" id="">
                 </div>


<?php 
   }

?>
<button id="botonSig" class="" type="submit">
        Guardar Relevamiento
</button>
</form>
</div>
<script src="js/jquery.1.js"></script>
    <!-- <script src="js/fotografias.js"></script> -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/panel.js"></script>
</body>
</html>