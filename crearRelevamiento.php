<?php
session_start();
 if(isset($_SESSION['usuario'])){
    
  ?>
<!doctype html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mis_estilos.css" >
    <link rel="stylesheet" href="css/all.css">
    <!-- Bootstrap JS -->
   
      
    <!-- <script type="text/javascript" src="js/cordova-2.6.0.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://files.codepedia.info/files/uploads/iScripts/html2canvas.js"></script>
    <title>Crear Relevamiento</title>
  </head>
  <body>
     <!-- Navbar content ===============================================================-->
       <nav class="navbar navbar-dark bg-success sticky-top">
            <div class="d-flex justify-content-start">
                <a class="navbar-brand">
                    <img  class="profile-img-card" src="images/cuenta.png" width="30" height="30" />
                    <?php echo "<small style='color: #ffffff;'>".$_SESSION['Nombres']."</small>" ;?>
                </a>
            </div>
           <span class="navbar-brand">Crear relevamiento</span>
       </nav>
    <!-- FIN-Navbar content =========================================================-->

      <div class="container"> 

          <form id="form" action="php/regRelevamiento.php" class="formulario" name="formulario_registro" method="post">
                 <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Cliente</div>
                      </div>
                      <input type="text"  class="form-control" name="cliente" id="cli" required placeholder="Cliente">
                  </div>

                  <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Representante</div>
                      </div>
                      <input type="text" class="form-control" name="representante" id="repre" required placeholder="Representante" autocomplete="off">
                  </div>
                  
                  <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Correo</div>
                      </div>
                      <input type="email" class="form-control" name="correoR" id="correoR" placeholder="Correo" autocomplete="off">
                  </div>

                  <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Telefono</div>
                      </div>
                      <input type="number" class="form-control" name="telefono" id="telefono" placeholder="Telefono" autocomplete="off">
                  </div>

                  <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Direccion</div>
                      </div>
                      <input type="text" class="form-control" name="lugar" id="lugar" required placeholder="Direccion" autocomplete="off">
                      <a href="#" class="btn btn-outline-danger" onclick="findMe();"><i class="fas fa-map-marker-alt"></i>Ubicacion</a>
                  </div>

                   
                   
                   <div id="mapa"></div>
                                     



                            
                        
                   <!-- <div id="mapa3">
                    <iframe id="mapa2" style="width:100%; height=100%;" src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d1352.5329666979396!2d-68.13701938643942!3d-16.49876693850998!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2sbo!4v1532887879550" width="600" height="400" frameborder="0" style="border:0" allowfullscreen>MAPA</iframe>
                    </div> -->
                   
                   <button class="" id="botonSig" type="submit">Siguiente</button>
          </form>
          <!-- <input id="btn-Preview-Image" type="button" value="Preview"/>                 -->
            <div id="previewImage">
            </div>
          <br>
          <br>
        </div>
      </div>
    
    <script src="js/bootstrap.min.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzY8vlK85_lpTZMuuHNOSffBZizf_enUs"></script>
    
    <script>
        function findMe(){
            var output = document.getElementById('mapa');
            //Verificar  si soporta Geolocalizacion
            if (navigator.geolocation) {
                output.innerHTML = "<p>Tu navegador soporta Geolocalizacion</p>";
            }else{
                output.innerHTML = "<p>Tu navegador NO soporta Geolocalizacion</p>";
            }

            //obtenemos latitud y longitud 
            function localizacion(posicion){
                var latitude = posicion.coords.latitude;
                var longitude = posicion.coords.longitude;

                var imgURL = "https://maps.googleapis.com/maps/api/staticmap?center="+latitude+","+longitude+"&size=600x400&markers=color:red%7C"+latitude+","+longitude+"&key=AIzaSyDzY8vlK85_lpTZMuuHNOSffBZizf_enUs";
                  
                //output.innerHTML ="<p>Latitud: "+latitude+"<br>Logitud: "+longitude+"</p>";    
                output.innerHTML ="<img src='"+imgURL+"'>";
            }
            function error(){
                output.innerHTML = "<p>No se pudo obtener tu ubicacion</p>";
            }

            navigator.geolocation.getCurrentPosition(localizacion,error);
        }

    // var divMapa = document.getElementById('mapa');
    // navigator.geolocation.getCurrentPosition(fn_ok, fn_mal);
    // function fn_mal(){}
    // function fn_ok(){
    //     var lat = rta.coords.latitude;
    //     var lon = rta.coords.longitude;

    //     var gLatLon = new google.maps.LatLng(lat, lon);
    //     var objConfig ={
    //         zomm: 17,
    //         center: gLatLon
    //     }

    //     var = gMapa =new google.maps.Map(divMapa, objConfig)
    // }
    </script>
  </body>
    <script>
   $(function() { 
    $("#btn-Preview-Image").click(function() { 
        html2canvas($("#mapa2"), {
            onrendered: function(canvas) {
                theCanvas = canvas;
                document.body.appendChild(canvas);

                canvas.toBlob(function(blob) {
					saveAs(blob, "Dashboard.png"); 
				});
            }
        });
    });
}); 
   // $(document).ready(function(){

        
    // var element = $("#mapa"); // global variable
    // var getCanvas; // global variable
    
    //     $("#btn-Preview-Image").on('click', function// () {
    //         html2canvas(element, {
    //         onrendered: function (canvas) {
    //                 $("#previewImage").append(canvas);
    //                 getCanvas = canvas;
    //             }
    //         });
    //     });

    //     $("#").on('click', function () {
    //     var imgageData = getCanvas.toDataURL("images/");
    //     // Now browser starts downloading it instead of just showing it
    //     var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream");
    //     $("#btn-Convert-Html2Image").attr("download", "your_pic_name.png").attr("href", newData);
    //     });

    // });

    </script>
</html>
<?php
}
else{

 header("Location: ./index.html"); 
}


?>

