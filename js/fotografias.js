// var img = $('<img>');

// // create a canvas to receive the image URL
// var canvas = $('<canvas>');
// var ctx = canvas[0].getContext("2d");

// $("#camera").on("change", function () {
//   var capturedImage = URL.createObjectURL(this.files[0]);

//   img.attr('src', capturedImage);
//   ctx.drawImage(img,0,0);

//   var imageData = canvas[0].toDataURL("image/png");

//   // do something with the image data    
// });


// var camera = document.getElementById('camera');
//  var $estado = document.getElementById("estado");
//  var $canvas = document.getElementById("canvas");

//   camera.addEventListener('change', function(e) {
//     var file = e.target.files[0]; 
// 	// Do something with the image file.
// 	//Haz algo con el archivo de imagen
// 	//frame.src = URL.createObjectURL(file);

// 				var contexto = $canvas.getContext("2d");
// 				contexto.drawImage(camera, 0, 0);
	
// 				var foto = $canvas.toDataURL(); //Esta es la foto, en base 64
// 				console.log('foto',foto);
// 				$estado.innerHTML = "Enviando foto. Por favor, espera...";
// 				var xhr = new XMLHttpRequest();
// 				xhr.open("POST", "php/guardar_foto.php", true);
// 				xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
// 				xhr.send(encodeURIComponent(foto)); //Codificar y enviar

// 				xhr.onreadystatechange = function() {
// 				    if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
// 				        console.log("La foto fue enviada correctamente");
// 				        console.log(xhr);
// 				        $estado.innerHTML = "Foto guardada con éxito. Puedes verla <a target='_blank' href='php/" + xhr.responseText + "'> aquí</a>";
// 				    }
// 				}
//   });

 


function tieneSoporteUserMedia() {
    return !!(navigator.getUserMedia || (navigator.mozGetUserMedia || navigator.mediaDevices.getUserMedia) || navigator.webkitGetUserMedia || navigator.msGetUserMedia)
}
function _getUserMedia() {
    return (navigator.getUserMedia || (navigator.mozGetUserMedia || navigator.mediaDevices.getUserMedia) || navigator.webkitGetUserMedia || navigator.msGetUserMedia).apply(navigator, arguments);
}

// Declaramos elementos del DOM
var $video = document.getElementById("video"),
	$canvas = document.getElementById("canvas"),
	$boton = document.getElementById("boton"),
	$estado = document.getElementById("estado");
if (tieneSoporteUserMedia()) {
    _getUserMedia(
		{video: { width: 1280, height: 720 }},
        function (stream) {
            console.log("Permiso concedido");
			$video.srcObject = stream;
			$video.play();

			//mas propiedades puede haber

			//Escuchar el click
			$boton.addEventListener("click", function(){

				//Pausar reproducción
				$video.pause();

				//Obtener contexto del canvas y dibujar sobre él
				var contexto = $canvas.getContext("2d");
				$canvas.width = $video.videoWidth;
				$canvas.height = $video.videoHeight;
				contexto.drawImage($video, 0, 0, $canvas.width, $canvas.height);

				var foto = $canvas.toDataURL('image/jpeg', 0.8); //Esta es la foto, en base 64
				$estado.innerHTML = "Enviando foto. Por favor, espera...";
				var xhr = new XMLHttpRequest();
				xhr.open("POST", "php/guardar_foto.php", true);
				xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xhr.send(encodeURIComponent(foto)); //Codificar y enviar

				xhr.onreadystatechange = function() {
				    if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
				        console.log("La foto fue enviada correctamente");
				        console.log(xhr);
				        $estado.innerHTML = "Foto guardada con éxito.";
				    }
				}

				//Reanudar reproducción
				$video.play();
			});
        }, function (error) {
            console.log("Permiso denegado o error: ", error);
            $estado.innerHTML = "No se puede acceder a la cámara, o no diste permiso.";
        });
} else {
    alert("Lo siento. Tu navegador no soporta esta característica");
    $estado.innerHTML = "Parece que tu navegador no soporta esta característica. Intenta actualizarlo.";
}
