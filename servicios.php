<?php
session_start();
 if(isset($_SESSION['password'])){
    
  ?>
<!doctype html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mis_estilos.css">
    <link rel="stylesheet" href="css/panel.css">
    <link rel="stylesheet" href="css/all.css">

    
  
      
    <title>Servicios</title>

    
  </head>
  <body>





      <!-- Navbar content =========================================================================-->
       <nav class="navbar navbar-dark bg-success sticky-top">

       <div class="d-flex justify-content-start">
           <a class="navbar-brand">
            <img  class="profile-img-card" src="images/cuenta.png" width="30" height="30" />
           <span class="navbar-brand"> Mi cuenta</span>
           </a>

       </div>
           <span class="navbar-brand">Servicios</span>
       </nav>
       <!-- FIN-Navbar content =====================================================================-->
       
       <br>
       <div class="container">
          <ul class="tabs">
              <li id="cableado"><a href="#tab1"><span class="fa fa-sitemap"></span><span class="tab-text"><br>Cableado estructurado</span></a></li>
              <li id="fibra"><a href="#tab2"><span class="fas fa-code-branch"></span><span class="tab-text"><br>Fibra <br>optica</span></a></li>
              <li id="electrico"><a href="#tab3"><span class="fas fa-plug"></span><span class="tab-text"><br>Sistema Electrico</span></a></li>
              <li id="soporte"><a href="#tab4"><span class="fa fa-briefcase"></span><span class="tab-text"><br>Soporte tecnico</span></a></li>
              <li id="otros"><a href="#tab5"><span class="fa fa-bookmark"></span><span class="tab-text"><br>Otros</span></a></li>
            </ul>
        
            <div class="secciones">
              <article id="tab1">
                <h4>Cableado estructurado</h4>
                <form action="php/regCableado.php" class="formulario" name="" method="post">
                  <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">No de puntos</div>
                       </div>
                       <input type="text"  class="form-control" name="cant_puntos" id=""  placeholder="Cantidad de puntos">
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
                       <input type="text" class="form-control" name="marca" id="" placeholder="Marca">
                   </div>
 
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Entrada de <br> facilidades</div>
                       </div>
                          <select class="form-control" name="ent_facilidades" type="text" placeholder="">
                            <option>Si</option>
                          <option>No</option>
                        </select>
                   </div>
 
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Instalacion <br> de gabinete</div>
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

                          


                   <div class="card-body d-flex justify-content-between align-items-center">
                      <a href="diagrama/diagrama.html" class="btn btn-secondary" id=""><i class="fas fa-pencil-alt"></i> Dibujar plano</a>
                      
                      <!-- <a href="fotografias.html" class="btn btn-success ml-auto"><i class="fas fa-camera"></i> Fotografias</a> -->
                     
                      <input type="file" name="file_array[]" accept="image/*" multiple="multiple" capture="camera" style="display: none;" id="camera">
                      
                             <input type="button" name="file_array[]" class="btn btn-primary" id="camara" value="Fotografias" onclick="document.getElementById('camera').click();" enctype="multipart/form-data">

                            
                  </div>

                  <div id="preview">

                    </div>
                    <input class="btn btn-warning btn-block" type="submit" value="Guardar relevamiento" id="">
           </form>


              </article>
              <article id="tab2">
                <h4>Fibra Optica</h4>
                <form action="" class="formulario" name="" method="post">

                  <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Pendiente</div>
                       </div>
                       <input type="text"  class="form-control" name="cPuntos" id=""  placeholder="Pendiente">
                  </div>
                  <div class="input-group mb-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">Pendiente</div>
                      </div>
                      <input type="text"  class="form-control" name="cPuntos" id=""  placeholder="Pendiente">
                 </div>
                 <div class="input-group mb-2">
                    <div class="input-group-prepend">
                      <div class="input-group-text">Pendiente</div>
                    </div>
                    <input type="text"  class="form-control" name="cPuntos" id=""  placeholder="Pendiente">
               </div>
 
   
                   <div class="card-body d-flex justify-content-between align-items-center">
                      <a href="diagrama/diagrama.html" class="btn btn-secondary" id="">Dibujar plano</a>
                      
                      <button class="btn btn-success ml-auto">Fotografias</button>
                  </div>
                    <input class="btn btn-warning" type="submit" value="Guardar" id="">
           </form>

              </article>
              <article id="tab3">
                <h4>Sistema electrico</h4>
                <form action="" class="formulario" name="" method="post">
                  <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Sistema de tierra</div>
                       </div>
                       <input type="text"  class="form-control" name="cPuntos" id="" required placeholder="Sistema de tierra">
                   </div>
 
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Circuitos de iluminacion</div>
                       </div>
                       <input type="text" class="form-control" name="categoria" id="" required placeholder="Circuitos de iluminacion">
                   </div>
                   
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">N° puntos de energia</div>
                       </div>
                       <input type="email" class="form-control" name="pvoz" id="" placeholder="Puntos de Voz">
                   </div>
 
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Acometidas</div>
                       </div>
                       <input type="text" class="form-control" name="eFacilidades" id="" placeholder="Acometidas">
                   </div>
 
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Otros</div>
                       </div>
                       <input type="text" class="form-control" name="otros" id="" required placeholder="Otros">
                   </div>
                   <div class="card-body d-flex justify-content-between align-items-center">
                      <a href="diagrama/diagrama.html" class="btn btn-secondary" id="">Dibujar plano</a>
                      
                      <button class="btn btn-success ml-auto">Fotografias</button>
                  </div>
                    <input class="btn btn-warning" type="submit" value="Guardar" id="">
           </form>
              </article>
              <article id="tab4">
                <h4>Soporte tecnico</h4>
                <form action="" class="formulario" name="" method="post">
                  <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Servicio realizado</div>
                       </div>
                       <input type="text"  class="form-control" name="cPuntos" id="" required placeholder="Servicio realizado">
                   </div>
 
                   <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Tiempo invertido</div>
                       </div>
                       <input type="text" class="form-control" name="categoria" id="" required placeholder="Tiempo invertido">
                   </div>
                   
                   
                   <div class="card-body d-flex justify-content-between align-items-center">
                      <a href="diagrama/diagrama.html" class="btn btn-secondary" id="">Dibujar plano</a>
                      
                      <button class="btn btn-success ml-auto">Fotografias</button>
                  </div>
                    <input class="btn btn-warning" type="submit" value="Guardar" id="">
           </form>
              </article>

              <article id="tab5">
                <h4>Otros</h4>
                <form action="" class="formulario" name="" method="post">
                  <div class="input-group mb-2">
                       <div class="input-group-prepend">
                         <div class="input-group-text">Otros</div>
                       </div>
                       <input type="text"  class="form-control" name="cPuntos" id="" required placeholder="Otros">
                   </div>
 
          
                   <div class="card-body d-flex justify-content-between align-items-center">
                      <a href="diagrama/diagrama.html" class="btn btn-secondary" id="">Dibujar plano</a>
                      
                      <button class="btn btn-success ml-auto">Fotografias</button>
                  </div>
                    <input class="btn btn-warning" type="submit" value="Guardar" id="">
           </form>
              </article>
            </div>

      </div>
    
     




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS-->
    
    <script src="js/jquery.1.js"></script>
    <!-- <script src="js/fotografias.js"></script> -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/panel.js"></script>
  </body>

  <script>
  $(document).ready(function(){
            $('#img_select').change(function(){
                $('#upload_form').submit();
            });
            $('#upload_form').on('submit', function(e){
                e.preventDefault();
                        $.ajax({
                    url : "upload.php",
                    method : "POST",
                    data: new FormData(this),
                    contentType:false,
                    processData:false,
                        success: function(data){
                        $('#img_select').val('');  
                                        $('#src_img_upload').modal('hide');  
                                        $('#image_gallery').html(data); 
                    }
                })
            });
        });
    /*$(document).on('change','#camera',function(){
      if(this.files && this.files[0]){   */
        /* Creamos la Imagen*/
        /*var img = $('<img style=" width:100px; height: 100px; margin: 10px;">');  */
        /* Asignamos el atributo source , haciendo uso del método createObjectURL*/
        /*img.attr('src', URL.createObjectURL(this.files[0]));  */
        /* Añadimos al Div*/
        /*$('#preview').append(img);*/
     /* }
    });*/
  </script>
  
</html>
<?php
}
else{

 header("Location: ./index.html"); 
}


?>