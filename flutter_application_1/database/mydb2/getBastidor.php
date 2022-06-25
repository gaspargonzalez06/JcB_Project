<?php
require "connection.php";
$makeQuery = "SELECT `Id_Categoria`,`Nombre_Pieza`,`Cantidad_Piezas`,`Tiempo_Promedio`,`Precio_unidad` FROM `piezas_desgaste` where`Id_Categoria`=10 ";

$stamement = $connection->prepare($makeQuery);
$stamement->execute();
$myarray = array();
$inicio2 =$_POST["inicio"];
$final2=$_POST["final"];
$final=floatval($final2);
$inicio=floatval($inicio2);



while ($resultsFrom =$stamement ->fetch()){

    array_push(
        $myarray,array(
            
            "Id_Categoria"=>$resultsFrom["Id_Categoria"],
            "Nombre_Pieza"=>$resultsFrom["Nombre_Pieza"],
            "Cantidad_Piezas"=>$resultsFrom["Cantidad_Piezas"],
            "Tiempo_Promedio"=>$resultsFrom["Tiempo_Promedio"],
            "Precio_unidad"=>$resultsFrom["Precio_unidad"],
           
	"inicio"=>$inicio,
	"final"=>$final
            
            
        )
    
    
        );
       
}
function total($n){

	
$first_number = $n["Precio_unidad"];
$second_number = $n["Cantidad_Piezas"];
$tercer_numero =$n["Tiempo_Promedio"];
$inicio=$n["inicio"];
$final=$n["final"];



$count=0;
$count2=0;

	while ($count<6500){
		$count=$count+$tercer_numero;
		if($count >= $inicio and  $count <= $final){
			$count2=$count2+$second_number;
			
		}
	}

$total_final=$count2*$first_number;

    return[
	 
         "Id_Categoria"=>$n["Id_Categoria"],
         "Nombre_Pieza"=>$n["Nombre_Pieza"],
         "Cantidad_Piezas"=>intval($count2),
         
         "Precio_unidad"=>$n["Precio_unidad"],
        
	    "total"=>number_format($total_final,  2, '.', ''),
	

];
};

$a = $myarray;
$b = array_map("total", $a);

 echo json_encode($b);



?>