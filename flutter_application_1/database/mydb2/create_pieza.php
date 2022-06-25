<?php
require_once ('connection.php');


$categoria=$_POST["categoria"];
$nombre=$_POST["nombre"];
$cantidad=$_POST["cantidad"];
$tiempo=$_POST["tiempo"];
$precio=$_POST["precio"];
$id_equipo=$_POST["id_equipo"];
intval();
intval();
floatval();
intval();

$msg="";


$sql ="INSERT INTO `piezas_desgaste` (`Id_Pieza`, `Id_Categoria`, `Nombre_Pieza`, `Cantidad_Piezas`, `Tiempo_Promedio`, `Precio_unidad`, `Id_Equipo`) VALUES 
(NULL, '$categoria', '$nombre', '$cantidad', '$tiempo', '$precio', '$id_equipo'); ";


$results = $connection->prepare($sql);
$results->execute();


?>