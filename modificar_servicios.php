<!DOCTYPE html>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <script src="js/ajax-jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.2/bootstrap3-typeahead.min.js"></script> 
    <!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">  -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <!-- <script src="js/bootstrap.min.js"></script> -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />
    
    <title>Modificacion de servicios</title>
</head>
<body>
<center>    
    <h3>Agregar caracteristicas</h3>
    <form action="php/agregar_caracter.php" method="post" id="">
        
        <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Caracateristica de servicio</div>
                      </div>
                      <input type="text"  class="form-control" name="caracter" id="" required placeholder="Caracteristica">
        </div>
        <button type="submit" id="">Agregar</button>

    </form>
    
    <h3>Agregar un nuevo servicio</h3>
    
    
        <form  action="php/agregar_servicio.php" method="post" id="">
                  <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Nombre de servicio</div>
                      </div>
                      <input type="text"  class="form-control" name="servicio" id="servicio" required placeholder="Servicio">
                  </div>

                  <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Nivel de usuario</div>
                      </div>
                        <select class="form-control" id="nivel" name="nivel" type="text" placeholder="Nivel de usuario">
                            <option value="3">Administrador</option>
                            <option value="2">Gerencia</option>
                            <option value="1">Usuario</option>
                        </select>
                  </div>
        
        
               
        <!-- //  $cadena = $datos['idCaracteristicas'];
        //  $array = explode(";", $cadena);
        //  $longitud=count($array);

        // // // for($i=0; $i<$longitud; $i++){

        // // //  $vr = $array[$i];
        // // //  $query3="SELECT * FROM Caracteristicas WHERE idCaracteristica = '$vr'";
        // // //  $resultado3=mysqli_query($conexion,$query3)or die(mysqli_error());
        // // //  $filas = mysqli_num_rows($resultado3);
        // // //  }
//            if($filas != 0)
//                {
//                while($dat = mysqli_fetch_array($resultado3))
//                    { -->
         
         
               
                 <?php
                 include("php/conexion.php");

                    $query="SELECT idCaracteristica, descripCaract FROM caracteristicas";
                    $resultado=mysqli_query($conexion,$query)or die(mysqli_error()); 
                 ?>

                    <select id="languages" name="languages[]" multiple="multiple" required>
                    <?php
                    while($lista=mysqli_fetch_array($resultado)){
                        echo "<option value='".$lista["idCaracteristica"]."'>".$lista["descripCaract"]."</option>";
                    }                
                    ?>
                    </select>
                    <br>    
                    <button type="submit" id="guardar">Crear servicio</button>    

        </form>
       
        
<!--   
        <div>
        
            <table>
                <tbody>
                <tr>
                <span id="" style="display:none;"></span>
                <span id="" style="display:none;"></span>
                <th><span id="" ></span></th>
                <th><button type="button" class="" value="">F</button></th>
                </tr>
                </tbody>
            </table>

     
      
        </div>  
-->  
      


    </center>
<script>
//   function mostrarMensaje() {
//     var popup = document.getElementById("alerta");
//     popup.classList.toggle("show");
// }
$(document).ready(function(){

    $('#languages').multiselect({
    nonSelectedText: 'Caracteristicas'
    });
    
});
</script>
<div id="respuesta">
    
</div>
</body>

</script>
</html>