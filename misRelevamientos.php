<?php
session_start();
 if(isset($_SESSION['usuario'])){
  
    //print_r($_SESSION['idUsuario']);
?>
<!doctype html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/mis_estilos.css"/>
    <link rel="stylesheet" href="css/all.css">
    
    <!-- Bootstrap JS -->
    
    <script src="js/jquery.1.js"></script>
    <script src="js/peticion.js"></script>

    <title>Mis Relevamientos</title>
    
    <style type="text/css">
    #inferior{
      position:absolute;
      width: 100%;
      height:60px;
      bottom: 0;
      }
    </style>

  </head>
  
  <body>
      
    
    <div class="sticky-top">
      <!-- Menu Navbar  -->
      <nav class="navbar navbar-dark navbar-expand-lg " style="background-color: #1C2833;">
        <a class="navbar-brand" href="#">
        <img  class="profile-img-card" src="images/buscar.png" width="30" height="30" />
        <span >Multitarea S.R.L.</span>
        </a>
        <a class="">
            <?php echo "<small style='color: #ffffff;'>".$_SESSION['Nombres']."</small>" ;?>
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="#">Mis relevamientos<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a href="crearRelevamiento.php" class="nav-link" href="#">Crear relevamiento</a>
            </li>
            
              <?php
                include("php/conexion.php");
                $consu = "SELECT * FROM usuarios";
                $resi = mysqli_query($conexion, $consu)or die(mysqli_error());
                $fil = mysqli_num_rows($resi);

                  if($fil != 0){
                      while($dat=mysqli_fetch_array($resi)){

                        if($_SESSION['usuario']==$dat['username']){
                          if($dat['nivel'] == 3){

                            echo '<li class="nav-item"><a class="nav-link" href="modificar_servicios.php">Administrar</a></li>';
                            echo '<li class="nav-item"><a class="nav-link" href="genServicios.php">Gen. Servicios</a></li>';
                          }                    
                        } 
                    }  
                  }                    
              ?>
   
          </ul>
          
            <a href="php/cerrar_sesion.php" style="color: #ffffff;">Cerrar sesion</a>
          
        </div>
      </nav>

          <!-- Busqueda -->
          <div class="container" style="background: #ffffff;">
            <div style="padding:20px;">
              <form class="form-search form-inline">
                  <input id="busqueda" type="text" class="search-query" placeholder="Buscar relevamiento"/>
              </form>
            </div>
          </div>
    </div>

     <!-- Tabla mis relevamientos -->
      <div class="container" id="tabla_resultado">
            <table class="table table-hover" id="relv" >
            </table>
      </div>
    
    
    <!-- Boton crear relevamiento-->
      <div class="" id="inferior" style="position: fixed;">
       <div class="container text-center">
       <a href="crearRelevamiento.php" id="botonNuevo">
		   + Nuevo
       </a>     
       </div>       
      </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS-->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>


<?php
 }
 else{
  header("Location: ./index.html"); 
 }


?>


