$('#crear').click(function(){
    
    var servicio = document.getElementById('servicio').value;
    var nivel = document.getElementById('nivel').value;
    
    
    var ruta = "serv="+servicio+"&niv="+nivel;
    
    $.ajax({
        url: 'php/guardar_servicio.php',
        type: 'POST',
        data: ruta,
        
    })
    .done(function(res){
          $('#respuesta').html(res)
          
    })
    .fail(function(){
        console.log('Error');
    })
    .always(function(){
        console.log('complete');
        
    });
});

// $('#guardar').click(function(){
    
//     var languages = document.getElementById('languages').value;
    
//     var ruta2 = "lan="+languages;
//     console.log('languages',languages);
//     $.ajax({
//         url: 'php/guardar_caracter.php',
//         type: 'POST',
//         data: languages
        
//     })
//     .done(function(res){
//           $('#respuesta').html(res)
          
//     })
//     .fail(function(){
//         console.log('Error');
//     })
//     .always(function(){
//         console.log('complete');
        
//     });
// });