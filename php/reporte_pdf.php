<?php 
    require_once('conexion.php');	

$id_relev = $_GET['id_rel'];

$consulta="SELECT r.idRelev,
r.fk_idUsuario,
c.cliente,
c.representante,
c.correoR,
c.telefono,
c.direccion
FROM relevamientos AS r 
INNER JOIN clientes AS c 
ON r.fk_idCliente=c.idCliente 
WHERE   r.idRelev= '$id_relev'";
                    
$resultado = mysqli_query($conexion,$consulta)or die(mysqli_error());
$fila = mysqli_fetch_array($resultado); 

$idUser = $fila['fk_idUsuario'];



$conUser = "SELECT Nombres, appaterno, apmaterno FROM usuarios WHERE idUsuario='$idUser'"; 
$resUser=mysqli_query($conexion,$conUser)or die(mysqli_error());
$filaUser = mysqli_fetch_array($resUser); 

$color='#E7E77';
$im="hola";

	require_once('../tcpdf/tcpdf.php');
	
	$pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8', false);
	
	$pdf->SetCreator(PDF_CREATOR);
	$pdf->SetAuthor('Miguel Caro');
	$pdf->SetTitle($id_relev);
	$pdf->setPrintHeader(false); 
	$pdf->setPrintFooter(false);
	$pdf->SetMargins(20, 20, 20, false); 
	$pdf->SetAutoPageBreak(true, 20); 
	$pdf->SetFont('Helvetica', '', 10);
	$pdf->addPage();
	// $pdf->Image('img/nuevo.png' , 130 ,11, 60 , 29,'PNG');

	$content = '';
	
	$content .= '
		

<table  cellspacing="0" style="width: 100%; border: solid 1px black; background: #E7E7E7; text-align: center; font-size: 10pt;padding:1mm; ">
        <tr>          
			<td style="width:100%; margin-bottom: 5px; text-align: center;  color:black; font-weight: bold;"><b>RELEVAMIENTO/SERVICIOS</b></td> 
		</tr>
</table>


<table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt; ">
   	<tr>
   		<td style="width:100% ; background-color: #336699;  color:white; font-size: 20px;"><b>DATOS GENERALES</b></td>
	</tr>
	
</table>

<!-- datos generales FIN-->
<table cellspacing="1px" style="width: 100%; font-size: 7pt;background: #E7E7E7; border: solid 1px black;">
         <tr>
            
            <td><b>CLIENTE:</b></td>
            <td>'.$fila['cliente'].' </td>
		
            <td><b>REPRESENTANTE:</b></td>
            <td>'.$fila['representante'].'</td>

		</tr>

		<tr style="border: solid 1px black;">
            
			<td><b>CORREO:</b></td>
			<td>'.$fila['correoR'].' </td>		

			<td><b>TELEFONO:</b></td>
			<td>'.$fila['telefono'].'</td>

		</tr>
		<tr style="border: solid 1px black;">
            
			<td><b>DIRECCION:</b></td>
			<td>'.$fila['direccion'].' </td>		
			
		</tr>
		
		<tr style="border: solid 1px black;">		
			<td><b>ELABORADO POR:</b></td>
			<td>'.$filaUser['Nombres'].' '.$filaUser['appaterno'].' '.$filaUser['apmaterno'].'</td>
			
		</tr>
		
        

</table><!-- datos generales FIN-->
<br>
<table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt; margin-top: 1em;">
   	<tr>
   		<td style="width:100% ; background-color: #336699;  color:white; font-size: 20px; text-align: center;"><b>SERVICIOS A REALIZAR</b></td>
	</tr>
';
$sql="SELECT SUM(datos_red) as S_RED ,SUM(datos_energia) as S_ENERGIA,SUM(datos_cctv) as S_CCTV,SUM(datos_luminaria) as S_LUMINARIA from ambientes where fk_idRelev='$id_relev'";
    $result=mysqli_query($conexion,$sql)or die(mysqli_error());
    $row = mysqli_fetch_array($result); 

    $s1=$row['S_RED'];
    $s2=$row['S_ENERGIA'];
    $s3=$row['S_CCTV'];
    $s4=$row['S_LUMINARIA'];
   
    if($s1 != 0)

    {

    $c_sql="SELECT categoria, marca, cant_puntos, ent_facilidades, inst_gabinete, certificacion FROM cableado_estructurado WHERE fk_idRelev='$id_relev'";

    $c_result=mysqli_query($conexion,$c_sql)or die(mysqli_error());
    $c_row = mysqli_fetch_array($c_result); 

$content .='
</table>
<br>
<table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
   	<tr>
   		<td style="width:100% ; background-color: #c2f3ff;  color:black; font-size: 20px; border: solid 1px black; font-weight: bold;"><b>CABLEADO ESTRUCRURADO</b></td>
	</tr>
	
	
</table>

<table  cellspacing="1px" style="width: 100%; font-size: 7pt;background: #E7E7E7; border: solid 1px black;">
<tr>

<td><b>CANTIDAD DE PUNTOS:</b></td>
<td>'. $c_row['cant_puntos'].'</td>

<td><b>CATEGORIA:</b></td>
<td>'. $c_row['categoria'].'</td>
</tr>
<tr>	
<td><b>MARCA:</b></td>
<td>'. $c_row['marca'].'</td>

<td><b>ENTRADA DE FACILIDADES:</b></td>
<td>'. $c_row['ent_facilidades'].'</td>
</tr>
<tr>
<td><b>INSTALACION DE GABINETE:</b></td>
<td>'. $c_row['inst_gabinete'].'</td>

<td><b>CERTIFICACION:</b></td>
<td>'. $c_row['certificacion'].'</td>
</tr>   
</table>
';
}

if($s2 != 0)

{

$s_sql="SELECT p_energia, tipo, acometida, puesta_tierra, inst_tablero FROM sistema_electrico WHERE fk_idRelev='$id_relev'";

$s_result=mysqli_query($conexion,$s_sql)or die(mysqli_error());
$s_row = mysqli_fetch_array($s_result);

$content .='


<table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
   	<tr>
   		<td style="width:100% ; background-color: #c2f3ff;  color:black; font-size: 20px; border: solid 1px black; font-weight: bold;"><b>SISTEMA ELECTRICO</b></td>
	</tr>
	
	
	</table>

	<table  cellspacing="1px" style="width: 100%; font-size: 7pt;background: #E7E7E7; border: solid 1px black;">
		<tr>

		<td><b>PUNTOS DE ENERGIA:</b></td>
		<td>'. $s_row['p_energia'].'</td>

		<td><b>TIPO:</b></td>
		<td>'. $s_row['tipo'].'</td>
		</tr>
		<tr>	
		<td><b>ACOMETIDA:</b></td>
		<td>'. $s_row['tipo'].'</td>

		<td><b>PUESTA TIERRA:</b></td>
		<td>'. $s_row['acometida'].'</td>
		</tr>
		<tr>
		<td><b>INSTALACION DE TABLERO: </b></td>
		<td>'. $s_row['inst_tablero'].'</td>

		</tr>
	</table>
';
}
if($s3 != 0){

 $cc_sql="SELECT cant_p_cam_sen, tipo FROM cctv WHERE fk_idRelev='$id_relev'";

 $cc_result=mysqli_query($conexion,$cc_sql)or die(mysqli_error());
 $cc_row = mysqli_fetch_array($cc_result);

$content .='
<table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
   	<tr>
   		<td style="width:100% ; background-color: #c2f3ff;  color:black; font-size: 20px; border: solid 1px black; font-weight: bold;"><b>CCTV</b></td>
	</tr>
	
	
</table>

<table  cellspacing="1px" style="width: 100%; font-size: 7pt;background: #E7E7E7; border: solid 1px black;">
<tr>

<td><b>PUNTOS DE CAMARAS Y SENSORES:</b></td>
<td>'. $cc_row['cant_p_cam_sen'].'</td>

<td><b>TIPO:</b></td>
<td>'. $cc_row['tipo'].'</td>
</tr>

</table>
';
}
if($s4 != 0){ 

 $l_sql="SELECT cant_luminarias, cant_lnterruptores FROM iluminacion WHERE fk_idRelev='$id_relev'";

 $l_result=mysqli_query($conexion,$l_sql)or die(mysqli_error());
 $l_row = mysqli_fetch_array($l_result); 

$content .='
<table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
   	<tr>
   		<td style="width:100% ; background-color: #c2f3ff;  color:black; font-size: 20px; border: solid 1px black; font-weight: bold;"><b>ILUMINACION</b></td>
	</tr>
	
	
</table>

<table  cellspacing="1px" style="width: 100%; font-size: 7pt;background: #E7E7E7; border: solid 1px black;">
<tr>

<td><b>CANTIDAD DE LUMINARIAS:</b></td>
<td>'. $l_row['cant_luminarias'].'</td>

<td><b>CANTIDAD DE INTERRUPTORES:</b></td>
<td>'. $l_row['cant_lnterruptores'].'</td>
</tr>
</table>

<BR>

<table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
   	<tr>
   		<td style="width:100% ; background-color: #336699;  color:white; font-size: 20px; border: solid 1px black; font-weight: bold;"><b>METRAJE TOTAL</b></td>
	</tr>
	
	
</table>

<table  cellspacing="1px" style="width: 100%; font-size: 7pt;background: #E7E7E7; border: solid 1px black;">
<tr>

<td>AMBIENTE</td>
<td>ANCHO</td>
<td>LARGO</td>
<td>ALTO</td>

</tr>
';
}
$m_sql="SELECT ROUND(SUM(ancho),2) as S_ANCHO ,ROUND(SUM(largo),2) as S_LARGO ,ROUND(SUM(altura),2) as S_ALTO from ambientes where fk_idRelev='$id_relev'";
$m_result=mysqli_query($conexion,$m_sql)or die(mysqli_error());
$m_row = mysqli_fetch_array($m_result); 

$m1=$m_row['S_ANCHO'];
$m2=$m_row['S_LARGO'];
$m3=$m_row['S_ALTO'];



$m = "mts.";

$t_ambien="SELECT * FROM ambientes where fk_idRelev='$id_relev'";
$t_res=mysqli_query($conexion,$t_ambien)or die(mysqli_error());
 while($t_amb=mysqli_fetch_array($t_res))
 {
	
$content .='
	<tr>
		<td>'. $t_amb['nom_ambiente'].'</td>
		<td>'. $t_amb['ancho'] .' '. $m .'</td>
		<td>'. $t_amb['largo'].' '. $m .'</td>
		<td>'. $t_amb['altura'].' '. $m .'</td>
	</tr>

	';
}
$content .='
	<tr>
		<td>TOTAL</td>
		<td>'.$m1.' '. $m .'</td>
		<td>'.$m2.' '. $m .'</td>
		<td>'.$m3.' '. $m .'</td>
	</tr> 
</table>
';

$ambien="SELECT * FROM ambientes where fk_idRelev='$id_relev'";
$res=mysqli_query($conexion,$ambien)or die(mysqli_error());

    while($amb=mysqli_fetch_array($res))
    {
        $dima=$amb['id'];
        $dima2=$amb['idAmbiente'];
            $pla="SELECT url_plano FROM planos where fk_idAmb='$dima'";
            $res_pla=mysqli_query($conexion,$pla)or die(mysqli_error());
			$row_pla = mysqli_fetch_array($res_pla);
		$content .='
		<br>			
		<table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
			<tr>
				<td style="width:100% ; background-color: #336699;  color:white; font-size: 20px; border: solid 1px black; font-weight: bold;"><b>AMBIENTE '. $amb['idAmbiente'].':'. $amb['nom_ambiente'].'</b></td>
			</tr>
			
		</table>
		<table  cellspacing="1px" style="width: 100%; font-size: 7pt;background: #E7E7E7; border: solid 1px black;">
		<tr>
		<td></td>
		<td><img src="'.$row_pla['url_plano'].'" width="100px" height="170px" ></td>
		<td><b>Medidas:</b><br>
			<ul style="list-style: none;">
				<li>Largo:'. $amb['largo'].'mts.</li>
				<li>Ancho:'. $amb['ancho'].'mts.</li>
				<li>Altura:'. $amb['altura'].' mts.</li>
			</ul> 
		</td>
		<td></td>
		</tr>
		</table>
		<table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
			<tr>
				<td style="width:100% ; background-color: #fff;  color:black; font-size: 20px; border: solid 1px black; font-weight: bold;"><b>FOTOGRAFIAS</b></td>
			</tr>		
		</table>
		';
$fotos="SELECT * FROM fotografias where fk_idRelev='$id_relev' && fk_idAmbiente='$dima2'";
$res_fotos=mysqli_query($conexion,$fotos)or die(mysqli_error());

		$content .='
		<table  cellspacing="1px" style="width: 100%; font-size: 7pt;background: #E7E7E7; border: solid 1px black;">
			<tr>
		';
			while($fot=mysqli_fetch_array($res_fotos))
				{ 
				$content .='	
				<td><img src="'.$fot['url_foto'].'" width="170px" height="100px" style="transform: rotate(90deg);"></td>
				';
				}	
		$content .='
			</tr>		
		</table>		

		';		
 	}
	$pdf->writeHTML($content, true, 0, true, 0);

	$pdf->lastPage();
	$pdf->output('Reporte.pdf', 'I');

?>
