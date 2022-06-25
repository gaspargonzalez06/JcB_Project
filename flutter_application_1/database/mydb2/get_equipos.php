<?php
require_once ('connection.php');



$msg="";


$sql =" SELECT * FROM `equipo`";


$results = $connection->prepare($sql);
$results->execute();

echo($results);

?>