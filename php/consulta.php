<?php
/////// CONEXIÓN A LA BASE DE DATOS /////////
include("conexion.php");

//////////////// VALORES INICIALES ///////////////////////

$tabla="";
//$query="SELECT cliente, lugar FROM relevamientos ORDER BY cliente";
$query="SELECT r.idRelev,
		c.cliente,
		c.direccion
		FROM relevamientos AS r 
		INNER JOIN clientes AS c 
		ON r.fk_idCliente=c.idCliente 
		ORDER BY idRelev DESC";

///////// LO QUE OCURRE AL TECLEAR SOBRE EL INPUT DE BUSQUEDA ////////////
if(isset($_POST['relevamientos']))
{
	$q=$conexion->real_escape_string($_POST['relevamientos']);
	$query="SELECT r.idRelev,
			c.cliente,
			c.direccion
			FROM relevamientos AS r 
			INNER JOIN clientes AS c 
			ON r.fk_idCliente=c.idCliente 
		
			c.cliente LIKE '%".$q."%' OR
			
			c.direccion LIKE '%".$q."%'" ;
}

$buscarRelevamientos=$conexion->query($query);
if ($buscarRelevamientos->num_rows > 0)
{
	$tabla.= 
	"<table class='table table-hover' id='tabla'>
		<tr class='bg-primary text-white'>
			
			<td>RELEVAMIENTOS</td>
			
            <td>ACCION</td>
		</tr>";

	while($filaRelevamientos= $buscarRelevamientos->fetch_assoc())
	{
		$tabla.=
		"<tr>
			
			<td>
			<span class='font-weight-bold'>".$filaRelevamientos['cliente']."</span><br>
			
			<span class='font-weight-light'>".$filaRelevamientos['direccion']."</span><br>
			
			</td>

			
			<td>
				<a href='php/reporte.php?id_rel=".$filaRelevamientos['idRelev']."'><button class='btn btn-info'>Ver</button></a>
				<a href='php/reporte_pdf.php?id_rel=".$filaRelevamientos['idRelev']."'><button class='btn btn-danger'>PDF</button></a>
			</td>

		 </tr>
		";
	}

	$tabla.="</table>";
} else
	{
		$tabla="No se encontraron coincidencias con sus criterios de búsqueda.";
	}


echo $tabla;
?>
