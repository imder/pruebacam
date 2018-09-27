$(obtener_registros());

function obtener_registros(relevamientos)
{
	$.ajax({
		url : 'php/consulta.php',
		type : 'POST',
		dataType : 'html',
		data : { relevamientos: relevamientos },
		})

	.done(function(resultado){
		$("#tabla_resultado").html(resultado);
	})
}

$(document).on('keyup', '#busqueda', function()
{
	var valorBusqueda=$(this).val();
	if (valorBusqueda!="")
	{
		obtener_registros(valorBusqueda);
	}
	else
		{
			obtener_registros();
		}
});
