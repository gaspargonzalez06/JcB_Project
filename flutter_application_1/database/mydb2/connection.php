<?php
try{
$connection = new PDO(
'mysql:host=localhost;dbname=jcb_database2','root','');
$connection ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);



}catch(PDOException $exc){
echo $exc ->getMessage();
die("could not connect");
}
?>