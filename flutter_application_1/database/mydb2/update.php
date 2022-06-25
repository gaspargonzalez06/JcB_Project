<?php
require_once ('connection.php');

$precio=$_POST["precio"];
$id_equipo=$_POST["id_equipo"];

$msg="";


$sql =" UPDATE `piezas_desgaste` SET `Precio_unidad` = '$precio' WHERE `piezas_desgaste`.`Id_Pieza` = $id_equipo; ";


$results = $connection->prepare($sql);
$results->execute();

?>