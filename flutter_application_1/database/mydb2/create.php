<?php
require_once ('connection.php');

$nombre=$_POST["nombre"];




$sql =" INSERT INTO `equipo` (`Id_Equipo`, `Nombre_Equipo`, `Imagen`) VALUES (NULL, '$nombre', ''); ";


$results = $connection->prepare($sql);
$results->execute();

?>