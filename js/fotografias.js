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
		{video: { width: 1280, height: 720 },
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


// navigator.mediaDevices.enumerateDevices()
//         .then(devices => {
//           var videoDevices = [0,0];
//           var videoDeviceIndex = 0;
//           devices.forEach(function(device) {
//             console.log(device.kind + ": " + device.label +
//               " id = " + device.deviceId);
//             if (device.kind == "videoinput") {  
//               videoDevices[videoDeviceIndex++] =  device.deviceId;    
//             }
//           });


//           var constraints =  {width: { min: 1024, ideal: 1280, max: 1920 },
//           height: { min: 776, ideal: 720, max: 1080 },
//           deviceId: { exact: videoDevices[1]  } 
//         };
//         return navigator.mediaDevices.getUserMedia({ video: constraints });

//       })
//         .then(stream => {
//           if (window.webkitURL) {
//             video.src = window.webkitURL.createObjectURL(stream);
//             localMediaStream = stream;
//           } else if (video.mozSrcObject !== undefined) {
//             video.mozSrcObject = stream;
//           } else if (video.srcObject !== undefined) {
//             video.srcObject = stream;
//           } else {
//             video.src = stream;
//           }})
//         .catch(e => console.error(e));