<?php
session_start();
 if(isset($_SESSION['usuario']))
 {
?>

  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">

      <style>
      table,th,td
	{
		border:2px solid green;
		border-spacing: 20px;
	}
      </style>
      <title>Document</title>

  </head>
  <body>
        <?php
                 include("php/conexion.php");

                 $query4="SELECT * FROM servicios";
                 $resultado4=mysqli_query($conexion,$query4)or die(mysqli_error()); 
                 $rows = mysqli_num_rows($resultado4);   
                    if($rows != 0){

                            while($dats=mysqli_fetch_array($resultado4)){
                            
                            //echo $dats['idCaracteristicas'];
                            
                            $string = $dats['idCaracteristicas'];
                            $array = explode(";", $string);
                            $longitud=count($array);
        ?>
        <form action="">
        <?php  echo "<h3>".$dats['Descripcion']."</h3>"; ?>

        

                        <?php   
                            if($string==null){
                        ?>
    
                        <?php
                }else{


                            for($i=0; $i<$longitud; $i++){
                    
                                    $vr = $array[$i];
                                    $query3="SELECT * FROM Caracteristicas WHERE idCaracteristica = '$vr'";
                                    $resultado3=mysqli_query($conexion,$query3)or die(mysqli_error());
                                    $filas = mysqli_num_rows($resultado3);
                                    
                                    //print_r($vr);
                                 
                             if($filas != 0)
                                           {
                                           while($dat = mysqli_fetch_array($resultado3))
                                               { 
                                                $idcaracteristica= $dat['idCaracteristica'];
                                                $descripCaract=$dat['descripCaract']
                             ?>
                            
                                    <form method=post <?php echo "action=php/grabar.php?val=".$idcaracteristica."&val2=".$vr."";?> >
                                    <div id="<?php echo $dat['idCaracteristica'];?>" style=""><?php echo $descripCaract;?></div>
                                    <input type="text" class="form-control" name="$descripCaract;?>" id="" placeholder="<?php echo $descripCaract;?>">
                                    
                                    
                                               
                            
                    
                                        
                            <?php
                                                }
                                        }
                                }
                            ?>
            <button type="" id="">Guardar</button>
            </form>
            <?php
        }   
    } 

}
                                
        ?>
  </body>
  </html>

<?php
}
else{

 header("Location: ./index.html"); 
}
?>